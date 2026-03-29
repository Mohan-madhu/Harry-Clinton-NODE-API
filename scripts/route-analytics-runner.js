#!/usr/bin/env node

const fs = require("fs");
const path = require("path");

const SAFE_METHODS = new Set(["GET", "HEAD", "OPTIONS"]);
const DEFAULT_TIMEOUT_MS = 20000;
const DEFAULT_CONCURRENCY = 5;

function parseArgs(argv) {
  const args = {
    mode: "safe",
    source: "js",
    rootDir: path.join(process.cwd(), "routes", "HARRY_CLINTON"),
    timeoutMs: DEFAULT_TIMEOUT_MS,
    concurrency: DEFAULT_CONCURRENCY,
    maxRequests: null,
    baseUrl:
      process.env.API_BASE_URL ||
      "http://localhost:15000/API/HARRY-CLINTON",
    vars: {}
  };

  for (let i = 2; i < argv.length; i += 1) {
    const current = argv[i];
    const next = argv[i + 1];

    if (current === "--help" || current === "-h") {
      args.help = true;
      continue;
    }
    if (current === "--mode" && next) {
      args.mode = next.toLowerCase();
      i += 1;
      continue;
    }
    if (current === "--source" && next) {
      args.source = next.toLowerCase();
      i += 1;
      continue;
    }
    if (current === "--rootDir" && next) {
      args.rootDir = path.resolve(next);
      i += 1;
      continue;
    }
    if (current === "--baseUrl" && next) {
      args.baseUrl = next;
      i += 1;
      continue;
    }
    if (current === "--timeoutMs" && next) {
      args.timeoutMs = Number(next) || DEFAULT_TIMEOUT_MS;
      i += 1;
      continue;
    }
    if (current === "--concurrency" && next) {
      args.concurrency = Number(next) || DEFAULT_CONCURRENCY;
      i += 1;
      continue;
    }
    if (current === "--maxRequests" && next) {
      args.maxRequests = Number(next) || null;
      i += 1;
      continue;
    }
    if (current === "--var" && next) {
      const [k, ...v] = next.split("=");
      if (k && v.length > 0) args.vars[k.trim()] = v.join("=").trim();
      i += 1;
      continue;
    }
  }

  return args;
}

function printHelp() {
  console.log(`
Route Analytics Runner

Usage:
  node scripts/route-analytics-runner.js [options]

Options:
  --source js|json        request source type (default: js)
  --mode safe|full        safe = only GET/HEAD/OPTIONS (default), full = all methods
  --baseUrl URL           API base URL (default: API_BASE_URL env or local server URL)
  --rootDir PATH          Folder to scan for route JSON files
  --concurrency N         Parallel requests (default: 5)
  --timeoutMs N           Request timeout in ms (default: 20000)
  --maxRequests N         Run only first N discovered requests
  --var KEY=VALUE         Replace template vars like {{KEY}} in URLs (repeatable)
  --help                  Show this help

Examples:
  node scripts/route-analytics-runner.js --mode safe
  node scripts/route-analytics-runner.js --mode full --var P=http://localhost:15000/API/HARRY-CLINTON
  `.trim());
}

function walkJsonFiles(dirPath) {
  const out = [];
  if (!fs.existsSync(dirPath)) return out;
  const entries = fs.readdirSync(dirPath, { withFileTypes: true });

  for (const entry of entries) {
    const fullPath = path.join(dirPath, entry.name);
    if (entry.isDirectory()) {
      out.push(...walkJsonFiles(fullPath));
      continue;
    }
    if (entry.isFile() && entry.name.toLowerCase().endsWith(".json")) {
      out.push(fullPath);
    }
  }
  return out;
}

function normalizeRoutePath(p) {
  if (!p) return "/";
  let out = p.trim();
  if (!out.startsWith("/")) out = "/" + out;
  out = out.replace(/\/{2,}/g, "/");
  return out;
}

function normalizeJoinedPath(a, b) {
  const left = normalizeRoutePath(a).replace(/\/$/, "");
  const right = normalizeRoutePath(b);
  const out = `${left}${right}`.replace(/\/{2,}/g, "/");
  return out || "/";
}

function stripTrailingSlash(s) {
  return String(s || "").replace(/\/+$/, "");
}

function toSamplePath(p, paramVars) {
  return p.replace(/:([A-Za-z0-9_]+)/g, (_m, key) => {
    if (Object.prototype.hasOwnProperty.call(paramVars, key)) {
      return encodeURIComponent(String(paramVars[key]));
    }
    return `${key}_sample`;
  });
}

function readJson(filePath) {
  try {
    return JSON.parse(fs.readFileSync(filePath, "utf8"));
  } catch (_err) {
    return null;
  }
}

function flattenCollections(collection, sourceFile, parentName = "") {
  const out = [];
  const collectionName = [parentName, collection.name].filter(Boolean).join(" / ");
  const requests = Array.isArray(collection.requests) ? collection.requests : [];
  for (const req of requests) {
    out.push({
      sourceFile,
      collectionName,
      requestName: req.name || "(unnamed)",
      method: String(req.method || "GET").toUpperCase(),
      url: req.url || "",
      headers: Array.isArray(req.headers) ? req.headers : [],
      body: req.body || { type: "none" }
    });
  }

  const children = Array.isArray(collection.collections) ? collection.collections : [];
  for (const child of children) {
    out.push(...flattenCollections(child, sourceFile, collectionName));
  }
  return out;
}

function extractHttpieRequests(doc, sourceFile) {
  if (!doc || typeof doc !== "object" || !doc.entry) return [];
  const entry = doc.entry;

  if (Array.isArray(entry.requests)) {
    return flattenCollections(
      { name: entry.name || "Collection", requests: entry.requests },
      sourceFile
    );
  }
  if (Array.isArray(entry.collections)) {
    const out = [];
    for (const collection of entry.collections) {
      out.push(...flattenCollections(collection, sourceFile, entry.name || "Workspace"));
    }
    return out;
  }
  return [];
}

function parseMountsFromIndex(indexPath) {
  const mounts = [];
  if (!fs.existsSync(indexPath)) return mounts;
  const text = fs.readFileSync(indexPath, "utf8");
  const rx =
    /router\.use\(\s*['"`]([^'"`]+)['"`]\s*,\s*require\(\s*['"`](\.\/[^'"`]+)['"`]\s*\)\s*\)/g;
  let match = rx.exec(text);
  while (match) {
    mounts.push({
      mountPath: normalizeRoutePath(match[1]),
      requirePath: match[2]
    });
    match = rx.exec(text);
  }
  return mounts;
}

function resolveRouteFile(rootDir, requirePath) {
  const noDot = requirePath.replace(/^\.\//, "");
  const asJs = path.join(rootDir, `${noDot}.js`);
  if (fs.existsSync(asJs)) return asJs;
  const asIndex = path.join(rootDir, noDot, "index.js");
  if (fs.existsSync(asIndex)) return asIndex;
  const asRaw = path.join(rootDir, noDot);
  if (fs.existsSync(asRaw)) return asRaw;
  return null;
}

function extractRequestsFromRouteJs(routeFile, mountPath) {
  const out = [];
  if (!fs.existsSync(routeFile)) return out;
  const text = fs.readFileSync(routeFile, "utf8");
  const rx =
    /router\.(get|post|put|delete|patch|head|options)\s*\(\s*(['"`])([^'"`]+)\2/gi;
  let match = rx.exec(text);
  while (match) {
    const method = String(match[1] || "").toUpperCase();
    const localPath = normalizeRoutePath(match[3]);
    const urlPath = normalizeJoinedPath(mountPath, localPath);
    out.push({
      sourceFile: routeFile,
      collectionName: mountPath,
      requestName: `${method} ${urlPath}`,
      method,
      urlPath,
      headers: [],
      body: { type: "none" }
    });
    match = rx.exec(text);
  }
  return out;
}

function discoverJsRequests(rootDir) {
  const indexPath = path.join(rootDir, "index.js");
  const mounts = parseMountsFromIndex(indexPath);
  const all = [];
  for (const m of mounts) {
    const routeFile = resolveRouteFile(rootDir, m.requirePath);
    if (!routeFile) continue;
    all.push(...extractRequestsFromRouteJs(routeFile, m.mountPath));
  }
  return all;
}

function replaceTemplateVars(input, vars) {
  if (!input) return input;
  return input.replace(/{{\s*([A-Za-z0-9_]+)\s*}}/g, (match, key) => {
    if (Object.prototype.hasOwnProperty.call(vars, key)) return String(vars[key]);
    return match;
  });
}

function hasUnresolvedVars(input) {
  return /{{\s*[A-Za-z0-9_]+\s*}}/.test(input || "");
}

function headersToObject(headers) {
  const out = {};
  for (const h of headers) {
    if (h && h.enabled !== false && h.name) out[h.name] = String(h.value || "");
  }
  return out;
}

function buildRequestPayload(item) {
  const body = item.body || {};
  if (!body.type || body.type === "none") return { skip: false, payload: null, headers: {} };

  if (body.type === "text") {
    const textValue = body.text && typeof body.text.value === "string" ? body.text.value : "";
    const format = body.text && body.text.format ? String(body.text.format).toLowerCase() : "";
    const headers = {};
    if (format.includes("json")) headers["content-type"] = "application/json";
    else if (format) headers["content-type"] = format;
    return { skip: false, payload: textValue, headers };
  }

  if (body.type === "form") {
    const form = body.form || {};
    if (form.isMultipart) {
      return { skip: true, reason: "multipart form-data is not supported by runner" };
    }
    const fields = Array.isArray(form.fields) ? form.fields : [];
    const params = new URLSearchParams();
    for (const f of fields) {
      if (!f || f.enabled === false || !f.name) continue;
      if (f.type === "file") {
        return { skip: true, reason: "file uploads are not supported by runner" };
      }
      params.append(f.name, f.value == null ? "" : String(f.value));
    }
    return {
      skip: false,
      payload: params.toString(),
      headers: { "content-type": "application/x-www-form-urlencoded" }
    };
  }

  if (body.type === "file") {
    return { skip: true, reason: "raw file body is not supported by runner" };
  }

  return { skip: true, reason: `unsupported body type: ${body.type}` };
}

function nowTs() {
  const d = new Date();
  const yyyy = d.getFullYear();
  const mm = String(d.getMonth() + 1).padStart(2, "0");
  const dd = String(d.getDate()).padStart(2, "0");
  const hh = String(d.getHours()).padStart(2, "0");
  const mi = String(d.getMinutes()).padStart(2, "0");
  const ss = String(d.getSeconds()).padStart(2, "0");
  return `${yyyy}${mm}${dd}-${hh}${mi}${ss}`;
}

function percentile(values, p) {
  if (!values.length) return 0;
  const sorted = [...values].sort((a, b) => a - b);
  const idx = Math.ceil((p / 100) * sorted.length) - 1;
  return sorted[Math.max(0, Math.min(sorted.length - 1, idx))];
}

async function runPool(items, worker, concurrency) {
  const out = [];
  let index = 0;
  const runners = Array.from({ length: Math.max(1, concurrency) }, async () => {
    while (index < items.length) {
      const i = index;
      index += 1;
      out[i] = await worker(items[i], i);
    }
  });
  await Promise.all(runners);
  return out;
}

async function executeRequest(item, opts) {
  const method = item.method.toUpperCase();
  if (opts.mode !== "full" && !SAFE_METHODS.has(method)) {
    return {
      ...item,
      skipped: true,
      skipReason: `blocked by mode=safe (${method})`
    };
  }

  const payloadMeta = buildRequestPayload(item);
  if (payloadMeta.skip) {
    return {
      ...item,
      skipped: true,
      skipReason: payloadMeta.reason
    };
  }

  const rawUrl = item.url ? item.url : `${opts.baseUrl}${toSamplePath(item.urlPath || "/", opts.vars)}`;
  const fullUrl = replaceTemplateVars(rawUrl, opts.vars);
  if (hasUnresolvedVars(fullUrl)) {
    return {
      ...item,
      skipped: true,
      skipReason: `unresolved URL template in ${fullUrl}`
    };
  }

  const mergedHeaders = {
    ...headersToObject(item.headers),
    ...payloadMeta.headers
  };

  const controller = new AbortController();
  const timeout = setTimeout(() => controller.abort(), opts.timeoutMs);
  const start = process.hrtime.bigint();

  try {
    const response = await fetch(fullUrl, {
      method,
      headers: mergedHeaders,
      body: method === "GET" || method === "HEAD" ? undefined : payloadMeta.payload,
      signal: controller.signal
    });
    const bodyText = await response.text();
    const end = process.hrtime.bigint();
    const durationMs = Number(end - start) / 1e6;

    return {
      ...item,
      skipped: false,
      urlResolved: fullUrl,
      status: response.status,
      ok: response.ok,
      durationMs: Number(durationMs.toFixed(2)),
      responseSample: bodyText.slice(0, 500),
      responseBytes: Buffer.byteLength(bodyText, "utf8")
    };
  } catch (err) {
    const end = process.hrtime.bigint();
    const durationMs = Number(end - start) / 1e6;
    return {
      ...item,
      skipped: false,
      urlResolved: fullUrl,
      ok: false,
      status: 0,
      durationMs: Number(durationMs.toFixed(2)),
      error: err && err.message ? err.message : String(err)
    };
  } finally {
    clearTimeout(timeout);
  }
}

function summarize(results, inputMeta) {
  const summary = {
    generatedAt: new Date().toISOString(),
    mode: inputMeta.mode,
    baseUrl: inputMeta.baseUrl,
    totals: {
      discovered: results.length,
      executed: 0,
      skipped: 0,
      passed: 0,
      failed: 0
    },
    byMethod: {},
    byStatus: {},
    latencyMs: {
      average: 0,
      p50: 0,
      p95: 0,
      max: 0
    },
    slowest: [],
    failures: [],
    skipped: []
  };

  const durations = [];

  for (const r of results) {
    const method = r.method || "UNKNOWN";
    if (!summary.byMethod[method]) {
      summary.byMethod[method] = { total: 0, passed: 0, failed: 0, skipped: 0 };
    }
    summary.byMethod[method].total += 1;

    if (r.skipped) {
      summary.totals.skipped += 1;
      summary.byMethod[method].skipped += 1;
      summary.skipped.push({
        method,
        requestName: r.requestName,
        sourceFile: r.sourceFile,
        reason: r.skipReason || "unknown"
      });
      continue;
    }

    summary.totals.executed += 1;
    durations.push(r.durationMs || 0);
    const statusKey = String(r.status || 0);
    summary.byStatus[statusKey] = (summary.byStatus[statusKey] || 0) + 1;

    if (r.ok) {
      summary.totals.passed += 1;
      summary.byMethod[method].passed += 1;
    } else {
      summary.totals.failed += 1;
      summary.byMethod[method].failed += 1;
      summary.failures.push({
        method,
        requestName: r.requestName,
        sourceFile: r.sourceFile,
        status: r.status || 0,
        url: r.urlResolved || r.url,
        error: r.error || null
      });
    }
  }

  if (durations.length) {
    const avg = durations.reduce((a, b) => a + b, 0) / durations.length;
    summary.latencyMs.average = Number(avg.toFixed(2));
    summary.latencyMs.p50 = Number(percentile(durations, 50).toFixed(2));
    summary.latencyMs.p95 = Number(percentile(durations, 95).toFixed(2));
    summary.latencyMs.max = Number(Math.max(...durations).toFixed(2));
  }

  summary.slowest = results
    .filter((r) => !r.skipped)
    .sort((a, b) => (b.durationMs || 0) - (a.durationMs || 0))
    .slice(0, 10)
    .map((r) => ({
      method: r.method,
      requestName: r.requestName,
      sourceFile: r.sourceFile,
      status: r.status,
      durationMs: r.durationMs,
      url: r.urlResolved || r.url
    }));

  return summary;
}

function buildMarkdown(summary) {
  const lines = [];
  lines.push(`# API Analytics Report`);
  lines.push(``);
  lines.push(`Generated: ${summary.generatedAt}`);
  lines.push(`Mode: ${summary.mode}`);
  lines.push(`Base URL: ${summary.baseUrl}`);
  lines.push(``);
  lines.push(`## Totals`);
  lines.push(`- Discovered: ${summary.totals.discovered}`);
  lines.push(`- Executed: ${summary.totals.executed}`);
  lines.push(`- Passed: ${summary.totals.passed}`);
  lines.push(`- Failed: ${summary.totals.failed}`);
  lines.push(`- Skipped: ${summary.totals.skipped}`);
  lines.push(``);
  lines.push(`## Latency (ms)`);
  lines.push(`- Average: ${summary.latencyMs.average}`);
  lines.push(`- P50: ${summary.latencyMs.p50}`);
  lines.push(`- P95: ${summary.latencyMs.p95}`);
  lines.push(`- Max: ${summary.latencyMs.max}`);
  lines.push(``);
  lines.push(`## By Status`);
  Object.keys(summary.byStatus)
    .sort((a, b) => Number(a) - Number(b))
    .forEach((status) => {
      lines.push(`- ${status}: ${summary.byStatus[status]}`);
    });
  lines.push(``);
  lines.push(`## Slowest Requests`);
  if (!summary.slowest.length) {
    lines.push(`- none`);
  } else {
    summary.slowest.forEach((s) => {
      lines.push(
        `- ${s.durationMs}ms | ${s.method} | ${s.status} | ${s.requestName} | ${s.sourceFile}`
      );
    });
  }
  lines.push(``);
  lines.push(`## Failures`);
  if (!summary.failures.length) {
    lines.push(`- none`);
  } else {
    summary.failures.slice(0, 50).forEach((f) => {
      lines.push(
        `- ${f.status} | ${f.method} | ${f.requestName} | ${f.sourceFile} | ${f.error || "http error"}`
      );
    });
  }
  return lines.join("\n");
}

async function main() {
  const args = parseArgs(process.argv);
  if (args.help) {
    printHelp();
    return;
  }

  if (!["safe", "full"].includes(args.mode)) {
    console.error(`Invalid --mode "${args.mode}". Use safe or full.`);
    process.exit(1);
  }
  if (!["js", "json"].includes(args.source)) {
    console.error(`Invalid --source "${args.source}". Use js or json.`);
    process.exit(1);
  }

  const vars = { ...args.vars, P: args.baseUrl };
  let requests = [];

  if (args.source === "js") {
    const base = stripTrailingSlash(args.baseUrl);
    requests = discoverJsRequests(args.rootDir);
    requests = requests.map((r) => ({
      ...r,
      url: `${base}${toSamplePath(r.urlPath, vars)}`
    }));
  } else {
    const files = walkJsonFiles(args.rootDir);
    if (!files.length) {
      console.error(`No JSON files found under: ${args.rootDir}`);
      process.exit(1);
    }
    for (const file of files) {
      const doc = readJson(file);
      if (!doc || !doc.meta || doc.meta.format !== "httpie") continue;
      requests.push(...extractHttpieRequests(doc, file));
    }
  }

  if (!requests.length) {
    if (args.source === "js") {
      console.error(`No router requests found in JS files under: ${args.rootDir}`);
    } else {
      console.error(`No HTTPie requests found in JSON files under: ${args.rootDir}`);
    }
    process.exit(1);
  }

  const queue = args.maxRequests ? requests.slice(0, args.maxRequests) : requests;
  console.log(
    `Discovered ${requests.length} requests (${queue.length} selected), mode=${args.mode}, baseUrl=${args.baseUrl}`
  );

  const results = await runPool(
    queue,
    (item) =>
      executeRequest(item, {
        mode: args.mode,
        timeoutMs: args.timeoutMs,
        baseUrl: args.baseUrl,
        vars
      }),
    args.concurrency
  );

  const summary = summarize(results, {
    mode: args.mode,
    baseUrl: args.baseUrl
  });

  const reportDir = path.join(process.cwd(), "reports");
  fs.mkdirSync(reportDir, { recursive: true });
  const stamp = nowTs();
  const jsonPath = path.join(reportDir, `api-analytics-${stamp}.json`);
  const mdPath = path.join(reportDir, `api-analytics-${stamp}.md`);

  fs.writeFileSync(
    jsonPath,
    JSON.stringify(
      {
        summary,
        results
      },
      null,
      2
    ),
    "utf8"
  );
  fs.writeFileSync(mdPath, buildMarkdown(summary), "utf8");

  console.log(`\nReport written:`);
  console.log(`- ${jsonPath}`);
  console.log(`- ${mdPath}`);
  console.log(
    `\nExecuted ${summary.totals.executed}, passed ${summary.totals.passed}, failed ${summary.totals.failed}, skipped ${summary.totals.skipped}`
  );
}

main().catch((err) => {
  console.error("Runner crashed:", err);
  process.exit(1);
});
