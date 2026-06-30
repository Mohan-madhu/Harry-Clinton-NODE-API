# HTTPie Collection Audit — `30-06-26_httpie-space-harry-clinton.json`
**Backend endpoints inventoried:** 326 (parsed from `routes/HARRY_CLINTON/index.js` + each route file)
**Collection requests inventoried:** 327 across 65 collection groups (one group missing in count: "Development" is a placeholder/scratch entry, not a real endpoint)

---

## 1. Endpoint Coverage — Missing/Incomplete in the Collection

| Group | Method | Endpoint | Issue |
|---|---|---|---|
| Mail | POST | `/Mail/SendMail`, `/Mail/SendOTPEmail` (non-hyphen) | Collection only has the hyphenated `/Send-Mail`/`/Send-OTP-Email` variants. Not a blocker (both work on the backend now), but the original camelCase routes aren't documented. |
| Products-Media, Products-Seo, Products-Cloth-Type-Care-Instructions, Products-Care-Instructions, Products-Cloth-Types, Products-Sizes, Products-Attributes-Values, Products-Attributes, Products-Variants | GET | `/{module}/:id` | **All 9 of these collections have a "GET by ID" request saved with no ID** — the URL is just `{{P}}/Products-Media/` with a trailing slash and nothing after it. The GET-all and GET-by-ID requests are effectively duplicates; the by-ID variant was never actually filled in with a test ID. |
| Image-Sliders | POST | `/Image-Sliders` | **Broken URL** — saved as `f{{P}}/Image-Sliders` (stray `f` before the `{{P}}` variable). This breaks variable substitution entirely; running this request will hit a literal invalid host. This is the same bug that caused the "Cannot POST f.../Image-Sliders" 404 in your earlier Excel test. |
| Products-Cloth-Types | DELETE | `/Products-Cloth-Types` | **Broken URL** — saved as literally `Products-Cloth-Types` with no `{{P}}` variable prefix at all. Will fail to resolve to any host when run. |
| Legal-Page-Sections | PUT | `/Legal-Page-Sections` | **Wrong URL** — saved as `{{P}}/Legal-Page-Headers` (points at the wrong collection's endpoint). |
| Legal-Page-Sections | DELETE | `/Legal-Page-Sections` | Same bug — saved as `{{P}}/Legal-Page-Headers` instead of `/Legal-Page-Sections`. |
| Appointment-Time-Slots | GET | `/Appointment-Time-Slots/by-date/:appointment_date_slot_id` | Backend has this extra lookup-by-date endpoint; no request for it exists anywhere in the collection. |

Everything else — all CRUD endpoints for Auth, Users, Roles, User-Roles, Profiles, Addresses, Products core, Wishlists, Carts, Orders (+ all sub-tables), Payments, Coupons/Discounts family, Shipping/Returns/Refunds, Support/Content, Reviews/Ratings family, HC_A–HC_F modules — **is present and URL-correct** in the collection.

---

## 2. Request Body Audit — Stale Bodies (captured before this session's fixes)

These collections have saved request bodies that **will fail** if run as-is, because they still reference field names/values from before the column-mismatch fixes earlier in this conversation. The endpoint URLs themselves are correct — only the bodies are out of date.

| Group | Request | Problem | Correct body needs |
|---|---|---|---|
| **Coupons** | POST | Missing required `coupon_name`, `discount_type`, `discount_value`. Has no such fields at all. | Add `coupon_name`, `discount_type` (`fixed`/`percentage`), `discount_value`. Also `min_order_amount` was never a valid field name (real: `min_purchase_amount`) but isn't in this body anyway. |
| **Discounts** | POST/PUT | `discount_type: "percent"` — invalid value. Valid values are `fixed`/`percentage` only. | Change `"percent"` → `"percentage"`. POST also needs `start_date`/`end_date` (both NOT NULL on the table) which aren't in the saved body. |
| **Coupon-Usage** | POST | Missing required `discount_amount` (NOT NULL column). | Add `discount_amount`. |
| **Order-Promotions** | POST/PUT | Uses `coupon_code`, `discount_name`, `discount_type`, `discount_value`, `order_promotion_id` — **none of these columns exist** on `tbl_order_promotions`. | Real fields: `promotion_type` (`coupon`/`discount`/`automatic`/`referral`), `promotion_id`, `promotion_name`, `discount_amount`. PUT key is `order_promotion_id` — confirm this matches the real PK name in your schema (`promotion_id` per the route fix, double check). |
| **Courier-Partners** | POST | `tracking_api_url` doesn't exist (real: `api_base_url`); `display_order` was removed entirely (not a real column); missing required `courier_code`. | Replace `tracking_api_url` → `api_base_url`, drop `display_order`, add `courier_code`. |
| **Shipment-Events** | POST | `event_status: "picked_up"` — not a valid value. | Valid values: `pickup_scheduled`, `dispatched`, `in_transit`, `out_for_delivery`, `delivered`, `failed`, `returned`, `exception`. |
| **Refunds** | PUT | `refund_reference` field doesn't exist (real column: `transaction_id`). | Rename `refund_reference` → `transaction_id`. |

These exactly match the bugs your original Excel test report surfaced — the httpie collection was the source of those test bodies, so it inherited the same stale field names. Now that the backend code is fixed, the collection itself still needs updating to match, or every future test run through this collection will keep failing on these 7 groups even though the backend is correct.

---

## Bottom line

- **Endpoint coverage: ~98% complete.** 326 backend endpoints, all but the `by-date` lookup and the 9 incomplete GET-by-ID placeholders are represented.
- **4 broken/wrong URLs** need fixing in the collection (Image-Sliders POST, Products-Cloth-Types DELETE, Legal-Page-Sections PUT & DELETE).
- **7 collections have stale request bodies** that don't match the current (correct) backend schema — these will produce validation errors or 500s if run today, even though the backend itself is fine.

Want me to go ahead and fix the JSON file directly (correct the 4 broken URLs, fill in the 9 missing GET-by-ID test values, add the `by-date` request, and update the 7 stale bodies), or would you rather make those edits yourself in HTTPie?
