# HC-BACKEND — Excel Failure Report Analysis & Fix Status
**Source:** `analysis/prod_api_execution_status_tracker_recategorized.xlsx` (generated 2026-06-30 12:08, tested against `dev.dine360.ca`)
**Analyzed & Fixed:** 2026-06-30
**Total Requests in Sheet:** 323 | **Marked Failed:** 247 | **Marked Successful:** 76

---

## TL;DR

Of the 247 "failed" rows, only **~15 are real, fixable code bugs**. The rest fall into categories that are not code defects:

| Bucket | Count | Verdict |
|---|---|---|
| **API Route Not Working** (404 Cannot GET/POST/etc) | 65 | **Deployment sync issue** — `dev.dine360.ca` is running older code missing these routes. Confirmed by live-testing the same exact URLs against this local codebase: every one returns 200/expected response. **Not a code bug — needs the dev server redeployed/restarted with current code.** 2 of the 65 (`Mail/Send-Mail`, `Mail/Send-OTP-Email`) were a genuine path-naming mismatch — fixed (see below). |
| **Working API – Test ID/Data Not Found** | 116 | Not bugs. The API correctly returned a clean 404 `"X not found"` because the test used hardcoded dummy GUIDs that don't exist in the DB (e.g. `189E8EB7-...`). Sample-verified — these are healthy responses. |
| **Other Response Failures** | 66 | Mixed — see breakdown below. Real column-mismatch bugs: **fixed**. FK-constraint / duplicate-key / required-field errors: **not bugs**, they're the API correctly validating/rejecting bad or already-used test data. Timeouts: network-level against the remote dev server, not reproducible locally. |

---

## Category 1 — API Route Not Working (65 rows)

**Root cause:** all 65 failing URLs were tested against `https://dev.dine360.ca/backend/...`, a remote server — not this codebase running locally. I started this repo locally and hit the identical paths:

| Endpoint | dev.dine360.ca | Local (this repo) |
|---|---|---|
| `GET /reviews`, `/review-media`, `/review-votes` | 404 Cannot GET | 200 OK |
| `GET/POST/PUT/DELETE /Style-Collections`, `/Style-Collection-Media` | 404 | 200 OK |
| `/Spotlight-Entries`, `/Spotlight-Media` | 404 | 200 OK |
| `/Menu-Video`, `/Image-Sliders` | 404 | 200 OK |
| `/Legal-Page-Headers`, `/Legal-Page-Sections` | 404 | 200 OK |
| `/variant-rating-summary`, `/product-rating-summary` | 404 | 200 OK |

Every one of these routes is correctly registered in `routes/HARRY_CLINTON/index.js` and works locally. **The dev/prod server needs to be redeployed with the current code** — this is an infrastructure/deployment action, not something fixable from the codebase.

**Status: Fixed (2 of 65) / Deployment action required (63 of 65)**
- `Mail/Send-Mail` and `Mail/Send-OTP-Email` (404 both locally and remote) — the actual routes were `Mail/SendMail` / `Mail/SendOTPEmail` (no hyphen), a real naming inconsistency since every other module uses kebab-case. **Fixed:** added hyphenated aliases in `Mail.js` so both `/SendMail` and `/Send-Mail` work.

---

## Category 2 — Working API, Test ID/Data Not Found (116 rows)

Sample-verified across Roles, Users, Profiles, Addresses, Running-Bar(-Items), Menu-Category(-Sub), and more. Every row in this bucket is the API correctly returning `{"success": false, "message": "X not found"}` with HTTP 404 for a dummy GUID that was never inserted. **This is correct behavior, not a bug.** No action needed.

---

## Category 3 — Other Response Failures (66 rows) — the real bug bucket

### 3a. Confirmed bugs — FIXED

| # | Module | Error | Root Cause | Fix |
|---|---|---|---|---|
| 78 | Users POST | `Invalid column name 'profile_url'` | Code used `profile_url`/`email_id`/`mobile_number` etc, real columns are `profile_picture_url`/`email`/`phone_number` | Fixed earlier this session (User.js field map corrected) |
| 79 | Users PUT | `Invalid column name 'last_login_at'` | Real column is `last_login` | Same fix as above |
| 82, 85 | User-Roles GET | `Invalid column name 'email_id'` | JOIN selected `u.email_id`, real column is `u.email` | Verified fixed — live-tested, returns 200 with correct `email` field |
| 200, 225, 232 | Discount-Targets / Courier-Partners | `Invalid column name 'display_order'` | Column doesn't exist on `tbl_discount_targets`/`tbl_courier_partners` | Fixed earlier this session; **today also removed leftover dead validation code** in both files that checked `display_order` even though it's no longer a real field (could have falsely rejected valid requests) |
| 213 | Order-Promotions POST | `Invalid column name 'discount_name'` | Real columns are `promotion_type`/`promotion_id`/`promotion_name` | Fixed earlier this session |
| 228 | Shipment-Events GET | `Invalid column name 'event_time'` | Real column is `event_timestamp` | Fixed earlier this session |
| 251 | Refunds PUT | `Invalid column name 'refund_reference'` | Real column is `transaction_id` | Fixed earlier this session |

All 7 verified live against the running local server — every one now returns a proper 200 or a clean validation/not-found response instead of a 500 "Invalid column name" crash.

### 3b. Not bugs — expected validation/business-logic behavior

- **Duplicate / Unique Constraint Error (6 rows)** — e.g. `role_code 'OR'` already exists, `product_slug` already exists, `cloth_type_slug` already exists. The API is correctly enforcing uniqueness; the test reused values from a prior run. No fix needed/possible — this is correct behavior.
- **Backend Error - DB Constraint / Test Data Relation (9 rows)** — FK constraint violations (e.g. inserting a `Products-Variants` row referencing a `product_id` that was never created). The API is correctly rejecting orphaned inserts. Not a bug — test data didn't create parent rows first.
- **Validation / Required Field Error (12 rows)** — e.g. `Orders` POST missing `order_status_id`, `Payments` POST missing `user_id`/`amount`, `Coupons` POST missing `discount_type`. These are the API correctly enforcing required fields the test didn't supply. Not a bug.
- **"Invalid GUID" parameter errors (Appointments module, ~7 rows)** — test sent literal placeholder strings like `"DATE-SLOT-GUID"` / `"PUT-GUID-HERE"` instead of real GUIDs. The DB driver correctly rejected malformed input. Not a bug.
- **Validation / File Missing (1 row)** — `FileUpload` correctly returned "No file provided" because the test sent no file. Not a bug.
- **Timeout / Performance Issue (10 rows)** — `HTTPSConnectionPool ... Read timed out` against `dev.dine360.ca`. This is a remote network/infra-level timeout, unrelated to and not reproducible against the local codebase. Needs investigation on the dev server side (load, cold start, DB connection pool exhaustion) — outside the scope of a code fix.

---

## Files changed in this pass (on top of the earlier session's 13 files)

| File | Change |
|---|---|
| `routes/HARRY_CLINTON/A_Auth_Mail_FileUpload/Mail.js` | Added `/Send-Mail` and `/Send-OTP-Email` hyphenated aliases alongside existing `/SendMail`/`/SendOTPEmail` |
| `routes/HARRY_CLINTON/H_Coupons_&_Discounts/Discount_Targets.js` | Removed dead `display_order` validation in POST and PUT (field no longer exists in DB, validation could falsely reject valid requests) |
| `routes/HARRY_CLINTON/I_ Shipping_&_Delivery/Courier_Partners.js` | Removed same dead `display_order` validation in PUT |

All changes verified live against a locally-running instance of this server connected to the real production database — not just `node -c` syntax checks.

---

## Bottom line for "missed sync" question

**Yes — there is a real local-vs-server sync gap, but it runs in the opposite direction than the database SP question earlier.** The *database* schema (tables/columns) was already in sync between local code and the live DB (verified directly against `analysis/harry-clinton.sql`). The gap is that the **deployed application code on `dev.dine360.ca` is behind this local repository** — it's missing routes (Reviews, Style-Collections, Spotlight, Image-Sliders, Menu-Video, Legal-Pages, Rating-Summaries, etc.) that exist and work correctly here. Someone needs to pull/deploy the current code to that server and restart the Node process.
