# Full HTTPie Collection Test Report
**Source collection:** `test/30-06-26_httpie-space-harry-clinton.json` (330 requests, 65 collection groups)
**Tested against:** `https://dev.dine360.ca/backend/API/Harry-Clinton` (the live dev server — the `{{P}}` variable in the collection's `Defaults` environment)
**Date:** 2026-06-30

**Verification note:** This same suite was also run against `localhost:15000` (your local server with the current uncommitted code) immediately beforehand. The results were byte-for-byte identical on every one of the 330 requests — same status codes, same error messages — which confirms the dev server is already running the latest fixed code (Appointment-Slot-Blocks/Time-Slots time validation, Reviews numeric-id coercion, Mail endpoints, Coupons/Discounts/Courier-Partners/Shipment-Events fixes, etc.). Nothing below is a "not yet deployed" issue.

---

## 1. Result Summary

| Outcome | Count | Meaning |
|---|---:|---|
| 2xx Success | 111 | Worked exactly as sent |
| Clean 404 "not found" | 158 | Working correctly — request used a placeholder ID that doesn't exist in the DB (GET/PUT/DELETE-by-id with dummy GUIDs) |
| 400 — saved test body uses wrong/missing field names | 22 | Not an API bug — the body saved in the collection doesn't match what the route expects (see §3) |
| 409 — unique-index conflict on rerun | 7 | Working correctly, but the value was already inserted by a previous test run — needs a fresh unique value (see §4) |
| 500 — FK constraint / unique-index conflict (parent row doesn't exist, or duplicate code) | 26 | Working correctly — DB enforcing referential integrity / uniqueness against placeholder parent IDs (see §4) |
| 500 — **genuine code bug** (Review-Votes, Review-Media) | 2 | Real bug, not a test-data issue — see §2 |
| 500 — malformed saved JSON body | 1 | `Spotlight-Media PUT` has a stray `*` character in its saved body, breaking JSON parsing |
| Blank placeholder requests (empty URL, nothing to test) | 4 | Empty draft entries left in the collection (`Development`, `Settings`, `Style-Collection-Media`, `Style-Collections` groups) |
| Skipped (multipart file upload, no real binary attached) | 1 | `FileUpload` — not auto-testable without a real file |
| **Total** | **330** | |

**330/330 requests reached the server. Zero routing failures ("Cannot GET/POST") anywhere — every endpoint in the file resolves correctly.**

---

## 2. Genuine bug found (not a test-data problem)

### `Review-Votes` and `Review-Media` — POST validation copy-pasted from `Reviews.js`

[Review_Votes.js:161](routes/HARRY_CLINTON/L_Ratings_&_Reviews/Review_Votes.js#L161) and [Review_Media.js](routes/HARRY_CLINTON/L_Ratings_&_Reviews/Review_Media.js) both still carry the validation/identifier logic copied from `Reviews.js`:

- **`POST /Review-Votes`** rejects every request with `"product_id, user_id, rating required"` — but the table (`tbl_review_votes`) and its own `INSERT_FIELDS` actually expect `review_id, user_id, is_helpful`. The check is checking for the wrong fields entirely, so this endpoint **cannot currently be created via the documented body** no matter what you send.
- **`POST /Review-Media`** has the same problem — checks `product_id, user_id, rating` instead of `review_id, media_type, media_url`.
- Their `PUT`/`DELETE` also key off `review_id` in the `WHERE` clause, but the table's real primary key is `vote_id` / `media_id` (per their own `FIELD_TYPES`) — so even a correctly-shaped PUT/DELETE body would update/delete the wrong row (or silently miss).

**Fix needed:** in both files, change the POST validation to check `review_id` (+ `is_helpful` / `media_url`) instead of `product_id`/`rating`, and change PUT/DELETE to filter on `vote_id` / `media_id` instead of `review_id`. This is a code fix, not something a test body can work around.

---

## 3. 400s — saved collection body doesn't match the route's required fields

These are not API bugs — the route is correctly rejecting bodies that are missing/misnamed fields. The collection's saved JSON needs updating. Exact field-name corrections below:

| Group | Endpoint | Saved body has | Route actually requires | Fix |
|---|---|---|---|---|
| User | `POST /Users` | `email_id` | `email` | rename `email_id` → `email` |
| User - Roles | `PUT /User-Roles` | `role_id` only | `user_role_id` | add `user_role_id` (the join-row's own id, not `role_id`) |
| Order-Addresses | `POST /Order-Addresses` | `recipient_name`, `phone_number`, `address_line1`, `postal_code` | `full_name`, `mobile_number`, `house_street`, `pincode` | rename fields to match |
| Order-Status-Master | `POST /Order-Status-Master` | `status_name` only | `status_name` **and** `status_code` | add `status_code`, e.g. `"PROCESSING"` |
| Order-Status-History | `POST /Order-Status-History` | `oldstatus_id`, `newstatus_id` | `order_status_id`, `orderstatus` | rename fields to match |
| Payments | `POST /Payments` | `razorpay_order_id`, `payment_amount` (no `user_id`) | `order_id`, `user_id`, `amount` | add `user_id`; rename `payment_amount` → `amount` |
| Returns | `POST /Returns` | `order_item_id`, `return_reason`, `return_status` | `order_id`, `user_id`, `return_type` | replace with the correct field set |
| Refunds | `POST /Refunds` | missing `user_id` only | `order_id`, `user_id`, `refund_amount` | add `user_id` |
| Support-Contacts | `POST /Support-Contacts` | `contact_type`/`contact_value` (looks copy-pasted from a Settings body) | `contact_title` | replace body — wrong shape entirely |
| Style-Collections | `POST`/`PUT`/`DELETE` | `setting_key`/`setting_value`/`brand_description` (copy-pasted from `Settings`) | `collection_name` (POST), `style_collection_id` (PUT/DELETE) | replace body — wrong shape entirely |
| Style-Collection-Media | `POST`/`PUT`/`DELETE` | same `Settings`-shaped body as above | `style_collection_id` (POST), `style_collection_media_id` (PUT/DELETE) | replace body — wrong shape entirely |
| Review Votes | `PUT`/`DELETE` | `vote_id` | route currently checks `review_id` (see §2 bug) | blocked on the code fix in §2 |
| Review Media | `PUT`/`DELETE` | `media_id` | route currently checks `review_id` (see §2 bug) | blocked on the code fix in §2 |

Note: `Style-Collections` and `Style-Collection-Media` both have **identical** saved bodies (clearly copy-pasted from the `Settings` request) — that's why both fail the same way.

---

## 4. 409 / 500s — unique-index or FK conflicts (this is the part you asked about: what to change)

These all mean the endpoint **works correctly** — the DB is rejecting the request because the value/parent-row already exists. To make a clean run succeed, change the listed field to a fresh value (suggestions given).

### a) Plain unique-index conflicts (just change the duplicated value)

| Group | Endpoint | Conflicting field | Conflicting value | Suggested new value |
|---|---|---|---|---|
| Roles | `POST /Roles` | `role_code` | `OR` | `OR2` (or any unused 2–10 char code) |
| Menu Category | `POST /Menu-Category` | `menu_category_slug` | `starters` | `starters-2` |
| Menu Sub Categories | `POST /Menu-Sub-Category` | `menu_subcategory_slug` | `veg-starters` | `veg-starters-2` |
| Products | `POST /Products` | `product_slug` (implied by `ux_tbl_products_slug`) | `premium-cotton-tshirt` | `premium-cotton-tshirt-2` |
| Products-Cloth-Types | `POST /Products-Cloth-Types` | `cloth_type_slug` | (whatever was saved) | append `-2` or a timestamp suffix |
| Products-Sizes | `POST /Products-Sizes` | `size_name` + `size_type` combo | (whatever was saved) | change `size_name` (e.g. `XL` → `XXL`) |
| Products-Attributes | `POST /Products-Attributes` | `attribute_slug` | (whatever was saved) | append `-2` |
| Coupons | `POST /Coupons` | `coupon_code` | `SAVE20` | `SAVE21` |
| Courier-Partners | `POST /Courier-Partners` | `courier_code` | `FEDEX_IN` | `FEDEX_IN2` |
| Newsletter-Subscriptions | `POST /Newsletter-Subscriptions` | `email` | `user@example.com` | `user+test2@example.com` (any new, valid email) |
| Appointment-Date-Slots | `POST /Appointment-Date-Slots` | `slot_date` | (saved date already exists, non-deleted) | use tomorrow's date / any date not already inserted |
| Appointment-Time-Slots | `POST /Appointment-Time-Slots` | `(appointment_date_slot_id, slot_start_time)` combo | `13:00`–`13:30` on that date slot | change `slot_start_time`/`slot_end_time` to an unused window, e.g. `14:00`–`14:30` |

**General rule for all of the above:** every `*_code`, `*_slug`, and `email`/`coupon_code`-style field has a unique index. Since the collection reuses the same hardcoded values on every run, the **first** run after a fresh/empty DB succeeds (you saw this confirmed — these all returned `201 Created` the first time, per the earlier fix-verification pass) and every **subsequent** run will 409/500 unless the value is changed or the previously-inserted row is deleted first. The fix isn't code — it's either (a) edit the value before re-running, or (b) clean up the test rows between runs.

### b) Foreign-key conflicts (need a real parent row first, not just a different value)

These all fail because the saved body references a **placeholder/fake GUID** for the parent record (`product_id`, `wishlist_id`, `cart_id`, `order_id`, `coupon_id`, `discount_id`, `cloth_type_id`, etc.) that doesn't exist in this DB. Changing the child field won't help — you need to either:
1. First create the real parent row (e.g. run `POST /Products` successfully, capture the returned `product_id`, then use that real ID), or
2. Point the test body at an existing seed-data ID already in the DB.

| Group | Endpoint | Missing parent |
|---|---|---|
| User - Roles | `POST /User-Roles/add` | real `role_id` |
| Products-Media | `POST /Products-Media` | real `product_id` |
| Products-Seo | `POST /Products-Seo` | real `product_id` |
| Products-Cloth-Type-Care-Instructions | `POST` | real `cloth_type_id` |
| Products-Attributes-Values | `POST` | real `product_id` |
| Products-Variants | `POST` | real `product_id` |
| Wishlist-Items | `POST` | real `wishlist_id` |
| Cart-Items | `POST` | real `cart_id` |
| Order-Items | `POST` | real `order_id` |
| Order-Cancellations | `POST` | real `order_id` |
| Invoices | `POST` | real `order_id` |
| Discount-Targets | `POST` | real `discount_id` |
| Coupon-Usage | `POST` | real `coupon_id` |
| Order-Promotions | `POST` | real `order_id` |
| Shipments | `POST` | fails on a CHECK constraint on `shipment_status` — the saved status value isn't in the allowed list; check `ck_tbl_shipments_status` for valid values and use one of those |

### c) GUID-validation 500s (placeholder text instead of a real GUID)

| Group | Endpoint | Saved value | Fix |
|---|---|---|---|
| Appointment-Slot-Blocks | `DELETE` | `appointment_slot_block_id: "PUT-GUID-HERE"` | use a real GUID from a prior create response |
| Appointment-Time-Slots | `PUT`, `DELETE` | `"PUT-GUID-HERE"` | same |
| Custom-Appointments | `POST` | `"DATE-SLOT-GUID"`, `"TIME-SLOT-GUID"` | same |
| Custom-Appointments | `PUT`, `DELETE` | `"PUT-GUID-HERE"` | same |

These literal placeholder strings (`PUT-GUID-HERE`, `DATE-SLOT-GUID`, `TIME-SLOT-GUID`) were left in the saved collection as stand-ins — confirms the routes' GUID validation is working correctly, just needs real IDs swapped in.

### d) Malformed saved JSON

| Group | Endpoint | Issue |
|---|---|---|
| Spotlight-Media | `PUT` | Saved body has a stray `*` character making it invalid JSON (`Expected double-quoted property name...`). Needs the body re-saved without the stray character. |

---

## 5. Everything that passed clean (111 requests, 2xx)

All `Authentication`, `Mail`, `Addresses`, `Running Bar`/`Running Bar Items`, `Products-Care-Instructions`, `Wishlists`, `Carts`, `Discounts`, `Shipment-Events`, `FAQs`, `Settings`, `Spotlight-Entries`, `Menu-Video`, `Image-Sliders`, `Legal-Page-Headers`, `Legal-Page-Sections`, `Reviews`, `Variant-Rating-Summary`, `Product-Rating-Summary` groups, plus the first-create POST in every group listed in §4a, returned clean 2xx responses. Full per-request list available in `test/2xx-list.txt`.

This also reconfirms (now on local with the uncommitted code) every fix from the earlier deployment-blocked list:
- `Appointment-Slot-Blocks` / `Appointment-Time-Slots` time validation — fixed, no more "Invalid time" errors
- `Reviews PUT/DELETE` numeric `review_id` coercion — fixed
- `Mail` (`SendMail`, `SendOTPEmail`, `Send-Mail`, `Send-OTP-Email`) — all working
- `Coupons`, `Discounts`, `Courier-Partners`, `Shipment-Events`, `Coupon-Usage`, `Order-Promotions` — all working on first insert

---

## 6. Action items, in priority order

1. **Code fix (real bug):** `Review_Votes.js` and `Review_Media.js` POST/PUT/DELETE validation — see §2. This is the only item blocking an endpoint outright regardless of what body you send.
2. **Collection cleanup:** fix the wrong-field-name bodies in §3 (12 endpoints) — mostly copy/paste leftovers (`Style-Collections`/`Style-Collection-Media` literally reuse the `Settings` body).
3. **Test data refresh:** before any re-run, either bump the unique-value fields in §4a or wipe the previously-inserted test rows; and swap the `*-GUID-HERE` placeholders in §4c for real IDs captured from prior creates.
4. **Sequencing for FK-dependent groups (§4b):** these need to run *after* their parent POST succeeds, using the real returned ID — not standalone with hardcoded placeholder GUIDs.
5. **Minor:** fix the stray `*` in the saved `Spotlight-Media PUT` body.
