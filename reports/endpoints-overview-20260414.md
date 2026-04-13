# Endpoint Overview (Endpoints-First Audit)

Date: 2026-04-14
Scope: Express routes under /API/HARRY-CLINTON

## Global Route Mounts

- Base API mount: /API/HARRY-CLINTON (app.js)
- Router entry: routes/HARRY_CLINTON/index.js

## Summary

- Mounted route modules: 65
- Route files with HTTP handlers: 62
- Total endpoints: 317
- GET: 150
- POST: 92
- PUT: 51
- DELETE: 24

## Core Endpoint Pattern

Most modules follow a 5-endpoint CRUD structure:

- GET /
- GET /:id
- POST /
- PUT /
- DELETE /

Full path format:

/API/HARRY-CLINTON/<Module-Mount>/<subpath>

Examples:

- /API/HARRY-CLINTON/Products
- /API/HARRY-CLINTON/Products/:id
- /API/HARRY-CLINTON/Orders
- /API/HARRY-CLINTON/Auth/Password-Login

## Domain Coverage

- Auth
- User and role management
- Menu and running bar
- Product catalog and configuration
- Customer management
- Wishlist and cart
- Order management
- Payments
- Coupons and discounts
- Shipping and delivery
- Returns and refunds
- Support/content/system settings
- Home visuals and spotlight
- Style by HC
- Appointments
- Ratings and reviews
- File upload and mail

## Special (Non-CRUD) Endpoints

- POST /API/HARRY-CLINTON/Auth/Register
- POST /API/HARRY-CLINTON/Auth/Password-Login
- POST /API/HARRY-CLINTON/Auth/OTP-Login
- POST /API/HARRY-CLINTON/Auth/Verify-Login-OTP
- POST /API/HARRY-CLINTON/Auth/Forgot-Password
- POST /API/HARRY-CLINTON/Auth/Reset-Password
- POST /API/HARRY-CLINTON/Auth/Forgot-Password-Confirm
- POST /API/HARRY-CLINTON/Mail/SendMail
- POST /API/HARRY-CLINTON/Mail/SendOTPEmail
- GET /API/HARRY-CLINTON/User-Roles/user/:user_id
- POST /API/HARRY-CLINTON/User-Roles/add
- DELETE /API/HARRY-CLINTON/User-Roles/remove
- GET /API/HARRY-CLINTON/Appointment-Time-Slots/by-date/:appointment_date_slot_id
- POST /API/HARRY-CLINTON/FileUpload

## Routing and API Behavior Notes

1) Response style is mixed across modules.
- Auth routes return fields like Status, Message, Response, ResponseCode.
- Many CRUD routes return success/data/message style JSON.

2) Update/delete conventions are mostly body-driven.
- Many routes use PUT / and DELETE / with IDs in request body rather than path.

3) Soft-delete and active flags are common.
- Many list/read routes filter on isdeleted and isactive with optional query toggles.

4) SQL Server stored procedures + direct SQL are both used.
- Auth module is SP-heavy.
- Many CRUD modules query dbo tables directly.

## Risks and Inconsistencies Found

1) Folder naming risk: routes/HARRY_CLINTON/I_ Shipping_&_Delivery has a space in folder name.
2) Path style inconsistency: mixed singular/plural and mixed hyphen conventions are manageable but require strict docs.
3) Route pattern inconsistency: User-Roles has both /:id and /user/:user_id patterns.
4) No PATCH usage observed; partial updates are handled through PUT.

## Endpoints-First Understanding Status

Completed:
- Full route tree and mount map
- Endpoint count and method distribution
- Identification of custom flow endpoints
- Initial routing risk scan

Next recommended pass:
- Build request and response contract docs per endpoint using HTTPie collections
- Add auth requirements and example payloads for each domain
- Add error code table and validation rule matrix
