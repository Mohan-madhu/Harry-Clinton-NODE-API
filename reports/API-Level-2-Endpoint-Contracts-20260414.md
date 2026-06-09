# API Level 2 Document (Endpoint Contracts)

Source: route files only.
Base URL: /API/HARRY-CLINTON

## Module: /Addresses
Route File: routes/HARRY_CLINTON/B_Customer_Management/Addresses.js
CRUD-5 Complete: Yes

### GET /API/HARRY-CLINTON/Addresses
Description: Fetch list records
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### GET /API/HARRY-CLINTON/Addresses/:id
Description: Fetch one record by id
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### POST /API/HARRY-CLINTON/Addresses
Description: Create a new record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 201 Created: record created successfully (for many CRUD modules)
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### PUT /API/HARRY-CLINTON/Addresses
Description: Update an existing record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### DELETE /API/HARRY-CLINTON/Addresses
Description: Delete or soft-delete a record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

## Module: /Appointment-Date-Slots
Route File: routes/HARRY_CLINTON/HC_F_Appointments/AppointmentDateSlots.js
CRUD-5 Complete: Yes

### GET /API/HARRY-CLINTON/Appointment-Date-Slots
Description: Fetch list records
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### GET /API/HARRY-CLINTON/Appointment-Date-Slots/:id
Description: Fetch one record by id
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### POST /API/HARRY-CLINTON/Appointment-Date-Slots
Description: Create a new record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 201 Created: record created successfully (for many CRUD modules)
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### PUT /API/HARRY-CLINTON/Appointment-Date-Slots
Description: Update an existing record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### DELETE /API/HARRY-CLINTON/Appointment-Date-Slots
Description: Delete or soft-delete a record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

## Module: /Appointment-Slot-Blocks
Route File: routes/HARRY_CLINTON/HC_F_Appointments/AppointmentSlotBlocks.js
CRUD-5 Complete: Yes

### GET /API/HARRY-CLINTON/Appointment-Slot-Blocks
Description: Fetch list records
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### GET /API/HARRY-CLINTON/Appointment-Slot-Blocks/:id
Description: Fetch one record by id
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### POST /API/HARRY-CLINTON/Appointment-Slot-Blocks
Description: Create a new record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 201 Created: record created successfully (for many CRUD modules)
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### PUT /API/HARRY-CLINTON/Appointment-Slot-Blocks
Description: Update an existing record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### DELETE /API/HARRY-CLINTON/Appointment-Slot-Blocks
Description: Delete or soft-delete a record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

## Module: /Appointment-Time-Slots
Route File: routes/HARRY_CLINTON/HC_F_Appointments/AppointmentTimeSlots.js
CRUD-5 Complete: Yes

### GET /API/HARRY-CLINTON/Appointment-Time-Slots
Description: Fetch list records
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### GET /API/HARRY-CLINTON/Appointment-Time-Slots/:id
Description: Fetch one record by id
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### POST /API/HARRY-CLINTON/Appointment-Time-Slots
Description: Create a new record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 201 Created: record created successfully (for many CRUD modules)
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### PUT /API/HARRY-CLINTON/Appointment-Time-Slots
Description: Update an existing record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### DELETE /API/HARRY-CLINTON/Appointment-Time-Slots
Description: Delete or soft-delete a record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### GET /API/HARRY-CLINTON/Appointment-Time-Slots/by-date/:appointment_date_slot_id
Description: Fetch one record by id
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

## Module: /Auth
Route File: routes/HARRY_CLINTON/A_Auth_Mail_FileUpload/Auth.js
CRUD-5 Complete: No

### POST /API/HARRY-CLINTON/Auth/Register
Description: Create a new record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 201 Created: record created successfully (for many CRUD modules)
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### POST /API/HARRY-CLINTON/Auth/Password-Login
Description: Create a new record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 201 Created: record created successfully (for many CRUD modules)
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### POST /API/HARRY-CLINTON/Auth/OTP-Login
Description: Create a new record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 201 Created: record created successfully (for many CRUD modules)
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### POST /API/HARRY-CLINTON/Auth/Verify-Login-OTP
Description: Create a new record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 201 Created: record created successfully (for many CRUD modules)
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### POST /API/HARRY-CLINTON/Auth/Forgot-Password
Description: Create a new record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 201 Created: record created successfully (for many CRUD modules)
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### POST /API/HARRY-CLINTON/Auth/Reset-Password
Description: Create a new record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 201 Created: record created successfully (for many CRUD modules)
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### POST /API/HARRY-CLINTON/Auth/Forgot-Password-Confirm
Description: Create a new record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 201 Created: record created successfully (for many CRUD modules)
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

## Module: /Cart-Items
Route File: routes/HARRY_CLINTON/E_Cart_Management/Cart_Items.js
CRUD-5 Complete: Yes

### GET /API/HARRY-CLINTON/Cart-Items
Description: Fetch list records
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### GET /API/HARRY-CLINTON/Cart-Items/:id
Description: Fetch one record by id
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### POST /API/HARRY-CLINTON/Cart-Items
Description: Create a new record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 201 Created: record created successfully (for many CRUD modules)
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### PUT /API/HARRY-CLINTON/Cart-Items
Description: Update an existing record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### DELETE /API/HARRY-CLINTON/Cart-Items
Description: Delete or soft-delete a record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

## Module: /Carts
Route File: routes/HARRY_CLINTON/E_Cart_Management/Carts.js
CRUD-5 Complete: Yes

### GET /API/HARRY-CLINTON/Carts
Description: Fetch list records
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### GET /API/HARRY-CLINTON/Carts/:id
Description: Fetch one record by id
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### POST /API/HARRY-CLINTON/Carts
Description: Create a new record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 201 Created: record created successfully (for many CRUD modules)
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### PUT /API/HARRY-CLINTON/Carts
Description: Update an existing record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### DELETE /API/HARRY-CLINTON/Carts
Description: Delete or soft-delete a record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

## Module: /Coupons
Route File: routes/HARRY_CLINTON/H_Coupons_&_Discounts/Coupons.js
CRUD-5 Complete: Yes

### GET /API/HARRY-CLINTON/Coupons
Description: Fetch list records
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### GET /API/HARRY-CLINTON/Coupons/:id
Description: Fetch one record by id
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### POST /API/HARRY-CLINTON/Coupons
Description: Create a new record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 201 Created: record created successfully (for many CRUD modules)
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### PUT /API/HARRY-CLINTON/Coupons
Description: Update an existing record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### DELETE /API/HARRY-CLINTON/Coupons
Description: Delete or soft-delete a record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

## Module: /Coupon-Usage
Route File: routes/HARRY_CLINTON/H_Coupons_&_Discounts/Coupon_Usage.js
CRUD-5 Complete: Yes

### GET /API/HARRY-CLINTON/Coupon-Usage
Description: Fetch list records
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### GET /API/HARRY-CLINTON/Coupon-Usage/:id
Description: Fetch one record by id
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### POST /API/HARRY-CLINTON/Coupon-Usage
Description: Create a new record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 201 Created: record created successfully (for many CRUD modules)
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### PUT /API/HARRY-CLINTON/Coupon-Usage
Description: Update an existing record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### DELETE /API/HARRY-CLINTON/Coupon-Usage
Description: Delete or soft-delete a record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

## Module: /Courier-Partners
Route File: routes/HARRY_CLINTON/I_ Shipping_&_Delivery/Courier_Partners.js
CRUD-5 Complete: Yes

### GET /API/HARRY-CLINTON/Courier-Partners
Description: Fetch list records
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### GET /API/HARRY-CLINTON/Courier-Partners/:id
Description: Fetch one record by id
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### POST /API/HARRY-CLINTON/Courier-Partners
Description: Create a new record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 201 Created: record created successfully (for many CRUD modules)
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### PUT /API/HARRY-CLINTON/Courier-Partners
Description: Update an existing record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### DELETE /API/HARRY-CLINTON/Courier-Partners
Description: Delete or soft-delete a record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

## Module: /Custom-Appointments
Route File: routes/HARRY_CLINTON/HC_F_Appointments/CustomAppointments.js
CRUD-5 Complete: Yes

### GET /API/HARRY-CLINTON/Custom-Appointments
Description: Fetch list records
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### GET /API/HARRY-CLINTON/Custom-Appointments/:id
Description: Fetch one record by id
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### POST /API/HARRY-CLINTON/Custom-Appointments
Description: Create a new record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 201 Created: record created successfully (for many CRUD modules)
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### PUT /API/HARRY-CLINTON/Custom-Appointments
Description: Update an existing record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### DELETE /API/HARRY-CLINTON/Custom-Appointments
Description: Delete or soft-delete a record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

## Module: /Discounts
Route File: routes/HARRY_CLINTON/H_Coupons_&_Discounts/Discounts.js
CRUD-5 Complete: Yes

### GET /API/HARRY-CLINTON/Discounts
Description: Fetch list records
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### GET /API/HARRY-CLINTON/Discounts/:id
Description: Fetch one record by id
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### POST /API/HARRY-CLINTON/Discounts
Description: Create a new record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 201 Created: record created successfully (for many CRUD modules)
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### PUT /API/HARRY-CLINTON/Discounts
Description: Update an existing record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### DELETE /API/HARRY-CLINTON/Discounts
Description: Delete or soft-delete a record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

## Module: /Discount-Targets
Route File: routes/HARRY_CLINTON/H_Coupons_&_Discounts/Discount_Targets.js
CRUD-5 Complete: Yes

### GET /API/HARRY-CLINTON/Discount-Targets
Description: Fetch list records
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### GET /API/HARRY-CLINTON/Discount-Targets/:id
Description: Fetch one record by id
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### POST /API/HARRY-CLINTON/Discount-Targets
Description: Create a new record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 201 Created: record created successfully (for many CRUD modules)
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### PUT /API/HARRY-CLINTON/Discount-Targets
Description: Update an existing record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### DELETE /API/HARRY-CLINTON/Discount-Targets
Description: Delete or soft-delete a record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

## Module: /FAQs
Route File: routes/HARRY_CLINTON/K_Support_Content_&_System_Configuration/FAQs.js
CRUD-5 Complete: Yes

### GET /API/HARRY-CLINTON/FAQs
Description: Fetch list records
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### GET /API/HARRY-CLINTON/FAQs/:id
Description: Fetch one record by id
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### POST /API/HARRY-CLINTON/FAQs
Description: Create a new record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 201 Created: record created successfully (for many CRUD modules)
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### PUT /API/HARRY-CLINTON/FAQs
Description: Update an existing record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### DELETE /API/HARRY-CLINTON/FAQs
Description: Delete or soft-delete a record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

## Module: /FileUpload
Route File: routes/HARRY_CLINTON/A_Auth_Mail_FileUpload/FileUpload.js
CRUD-5 Complete: No

### POST /API/HARRY-CLINTON/FileUpload
Description: Create a new record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 201 Created: record created successfully (for many CRUD modules)
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

## Module: /Image-Sliders
Route File: routes/HARRY_CLINTON/HC_C_Home_Visuals/Image_Sliders.js
CRUD-5 Complete: Yes

### GET /API/HARRY-CLINTON/Image-Sliders
Description: Fetch list records
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### GET /API/HARRY-CLINTON/Image-Sliders/:id
Description: Fetch one record by id
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### POST /API/HARRY-CLINTON/Image-Sliders
Description: Create a new record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 201 Created: record created successfully (for many CRUD modules)
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### PUT /API/HARRY-CLINTON/Image-Sliders
Description: Update an existing record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### DELETE /API/HARRY-CLINTON/Image-Sliders
Description: Delete or soft-delete a record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

## Module: /Invoices
Route File: routes/HARRY_CLINTON/F_Order_Management/Invoices.js
CRUD-5 Complete: Yes

### GET /API/HARRY-CLINTON/Invoices
Description: Fetch list records
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### GET /API/HARRY-CLINTON/Invoices/:id
Description: Fetch one record by id
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### POST /API/HARRY-CLINTON/Invoices
Description: Create a new record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 201 Created: record created successfully (for many CRUD modules)
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### PUT /API/HARRY-CLINTON/Invoices
Description: Update an existing record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### DELETE /API/HARRY-CLINTON/Invoices
Description: Delete or soft-delete a record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

## Module: /Legal-Page-Headers
Route File: routes/HARRY_CLINTON/K_Support_Content_&_System_Configuration/Legal_Page_Headers.js
CRUD-5 Complete: Yes

### GET /API/HARRY-CLINTON/Legal-Page-Headers
Description: Fetch list records
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### GET /API/HARRY-CLINTON/Legal-Page-Headers/:id
Description: Fetch one record by id
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### POST /API/HARRY-CLINTON/Legal-Page-Headers
Description: Create a new record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 201 Created: record created successfully (for many CRUD modules)
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### PUT /API/HARRY-CLINTON/Legal-Page-Headers
Description: Update an existing record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### DELETE /API/HARRY-CLINTON/Legal-Page-Headers
Description: Delete or soft-delete a record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

## Module: /Legal-Page-Sections
Route File: routes/HARRY_CLINTON/K_Support_Content_&_System_Configuration/Legal_Page_Sections.js
CRUD-5 Complete: Yes

### GET /API/HARRY-CLINTON/Legal-Page-Sections
Description: Fetch list records
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### GET /API/HARRY-CLINTON/Legal-Page-Sections/:id
Description: Fetch one record by id
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### POST /API/HARRY-CLINTON/Legal-Page-Sections
Description: Create a new record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 201 Created: record created successfully (for many CRUD modules)
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### PUT /API/HARRY-CLINTON/Legal-Page-Sections
Description: Update an existing record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### DELETE /API/HARRY-CLINTON/Legal-Page-Sections
Description: Delete or soft-delete a record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

## Module: /Mail
Route File: routes/HARRY_CLINTON/A_Auth_Mail_FileUpload/Mail.js
CRUD-5 Complete: No

### POST /API/HARRY-CLINTON/Mail/SendMail
Description: Create a new record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 201 Created: record created successfully (for many CRUD modules)
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### POST /API/HARRY-CLINTON/Mail/SendOTPEmail
Description: Create a new record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 201 Created: record created successfully (for many CRUD modules)
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

## Module: /Menu-Category
Route File: routes/HARRY_CLINTON/HC_B_Menu_Navigation/MenuCategory.js
CRUD-5 Complete: Yes

### GET /API/HARRY-CLINTON/Menu-Category
Description: Fetch list records
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### GET /API/HARRY-CLINTON/Menu-Category/:id
Description: Fetch one record by id
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### POST /API/HARRY-CLINTON/Menu-Category
Description: Create a new record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 201 Created: record created successfully (for many CRUD modules)
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### PUT /API/HARRY-CLINTON/Menu-Category
Description: Update an existing record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### DELETE /API/HARRY-CLINTON/Menu-Category
Description: Delete or soft-delete a record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

## Module: /Menu-Sub-Category
Route File: routes/HARRY_CLINTON/HC_B_Menu_Navigation/MenuSubCategory.js
CRUD-5 Complete: Yes

### GET /API/HARRY-CLINTON/Menu-Sub-Category
Description: Fetch list records
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### GET /API/HARRY-CLINTON/Menu-Sub-Category/:id
Description: Fetch one record by id
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### POST /API/HARRY-CLINTON/Menu-Sub-Category
Description: Create a new record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 201 Created: record created successfully (for many CRUD modules)
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### PUT /API/HARRY-CLINTON/Menu-Sub-Category
Description: Update an existing record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### DELETE /API/HARRY-CLINTON/Menu-Sub-Category
Description: Delete or soft-delete a record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

## Module: /Menu-Video
Route File: routes/HARRY_CLINTON/HC_C_Home_Visuals/Menu_Video.js
CRUD-5 Complete: Yes

### GET /API/HARRY-CLINTON/Menu-Video
Description: Fetch list records
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### GET /API/HARRY-CLINTON/Menu-Video/:id
Description: Fetch one record by id
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### POST /API/HARRY-CLINTON/Menu-Video
Description: Create a new record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 201 Created: record created successfully (for many CRUD modules)
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### PUT /API/HARRY-CLINTON/Menu-Video
Description: Update an existing record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### DELETE /API/HARRY-CLINTON/Menu-Video
Description: Delete or soft-delete a record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

## Module: /Newsletter-Subscriptions
Route File: routes/HARRY_CLINTON/K_Support_Content_&_System_Configuration/Newsletter_Subscriptions.js
CRUD-5 Complete: Yes

### GET /API/HARRY-CLINTON/Newsletter-Subscriptions
Description: Fetch list records
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### GET /API/HARRY-CLINTON/Newsletter-Subscriptions/:id
Description: Fetch one record by id
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### POST /API/HARRY-CLINTON/Newsletter-Subscriptions
Description: Create a new record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 201 Created: record created successfully (for many CRUD modules)
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### PUT /API/HARRY-CLINTON/Newsletter-Subscriptions
Description: Update an existing record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### DELETE /API/HARRY-CLINTON/Newsletter-Subscriptions
Description: Delete or soft-delete a record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

## Module: /Order-Addresses
Route File: routes/HARRY_CLINTON/F_Order_Management/Order_Addresses.js
CRUD-5 Complete: Yes

### GET /API/HARRY-CLINTON/Order-Addresses
Description: Fetch list records
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### GET /API/HARRY-CLINTON/Order-Addresses/:id
Description: Fetch one record by id
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### POST /API/HARRY-CLINTON/Order-Addresses
Description: Create a new record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 201 Created: record created successfully (for many CRUD modules)
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### PUT /API/HARRY-CLINTON/Order-Addresses
Description: Update an existing record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### DELETE /API/HARRY-CLINTON/Order-Addresses
Description: Delete or soft-delete a record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

## Module: /Order-Cancellations
Route File: routes/HARRY_CLINTON/F_Order_Management/Order_Cancellations.js
CRUD-5 Complete: Yes

### GET /API/HARRY-CLINTON/Order-Cancellations
Description: Fetch list records
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### GET /API/HARRY-CLINTON/Order-Cancellations/:id
Description: Fetch one record by id
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### POST /API/HARRY-CLINTON/Order-Cancellations
Description: Create a new record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 201 Created: record created successfully (for many CRUD modules)
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### PUT /API/HARRY-CLINTON/Order-Cancellations
Description: Update an existing record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### DELETE /API/HARRY-CLINTON/Order-Cancellations
Description: Delete or soft-delete a record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

## Module: /Order-Items
Route File: routes/HARRY_CLINTON/F_Order_Management/Order_Items.js
CRUD-5 Complete: Yes

### GET /API/HARRY-CLINTON/Order-Items
Description: Fetch list records
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### GET /API/HARRY-CLINTON/Order-Items/:id
Description: Fetch one record by id
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### POST /API/HARRY-CLINTON/Order-Items
Description: Create a new record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 201 Created: record created successfully (for many CRUD modules)
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### PUT /API/HARRY-CLINTON/Order-Items
Description: Update an existing record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### DELETE /API/HARRY-CLINTON/Order-Items
Description: Delete or soft-delete a record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

## Module: /Order-Promotions
Route File: routes/HARRY_CLINTON/H_Coupons_&_Discounts/Order_Promotions.js
CRUD-5 Complete: Yes

### GET /API/HARRY-CLINTON/Order-Promotions
Description: Fetch list records
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### GET /API/HARRY-CLINTON/Order-Promotions/:id
Description: Fetch one record by id
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### POST /API/HARRY-CLINTON/Order-Promotions
Description: Create a new record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 201 Created: record created successfully (for many CRUD modules)
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### PUT /API/HARRY-CLINTON/Order-Promotions
Description: Update an existing record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### DELETE /API/HARRY-CLINTON/Order-Promotions
Description: Delete or soft-delete a record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

## Module: /Orders
Route File: routes/HARRY_CLINTON/F_Order_Management/Orders.js
CRUD-5 Complete: Yes

### GET /API/HARRY-CLINTON/Orders
Description: Fetch list records
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### GET /API/HARRY-CLINTON/Orders/:id
Description: Fetch one record by id
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### POST /API/HARRY-CLINTON/Orders
Description: Create a new record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 201 Created: record created successfully (for many CRUD modules)
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### PUT /API/HARRY-CLINTON/Orders
Description: Update an existing record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### DELETE /API/HARRY-CLINTON/Orders
Description: Delete or soft-delete a record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

## Module: /Order-Status-History
Route File: routes/HARRY_CLINTON/F_Order_Management/Order_Status_History.js
CRUD-5 Complete: Yes

### GET /API/HARRY-CLINTON/Order-Status-History
Description: Fetch list records
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### GET /API/HARRY-CLINTON/Order-Status-History/:id
Description: Fetch one record by id
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### POST /API/HARRY-CLINTON/Order-Status-History
Description: Create a new record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 201 Created: record created successfully (for many CRUD modules)
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### PUT /API/HARRY-CLINTON/Order-Status-History
Description: Update an existing record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### DELETE /API/HARRY-CLINTON/Order-Status-History
Description: Delete or soft-delete a record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

## Module: /Order-Status-Master
Route File: routes/HARRY_CLINTON/F_Order_Management/Order_Status_Master.js
CRUD-5 Complete: Yes

### GET /API/HARRY-CLINTON/Order-Status-Master
Description: Fetch list records
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### GET /API/HARRY-CLINTON/Order-Status-Master/:id
Description: Fetch one record by id
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### POST /API/HARRY-CLINTON/Order-Status-Master
Description: Create a new record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 201 Created: record created successfully (for many CRUD modules)
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### PUT /API/HARRY-CLINTON/Order-Status-Master
Description: Update an existing record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### DELETE /API/HARRY-CLINTON/Order-Status-Master
Description: Delete or soft-delete a record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

## Module: /Payments
Route File: routes/HARRY_CLINTON/G_Payments/Payments.js
CRUD-5 Complete: Yes

### GET /API/HARRY-CLINTON/Payments
Description: Fetch list records
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### GET /API/HARRY-CLINTON/Payments/:id
Description: Fetch one record by id
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### POST /API/HARRY-CLINTON/Payments
Description: Create a new record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 201 Created: record created successfully (for many CRUD modules)
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### PUT /API/HARRY-CLINTON/Payments
Description: Update an existing record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### DELETE /API/HARRY-CLINTON/Payments
Description: Delete or soft-delete a record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

## Module: /Product-Rating-Summary
Route File: routes/HARRY_CLINTON/L_Ratings_&_Reviews/Product_Rating_Summary.js
CRUD-5 Complete: Yes

### GET /API/HARRY-CLINTON/Product-Rating-Summary
Description: Fetch list records
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### GET /API/HARRY-CLINTON/Product-Rating-Summary/:id
Description: Fetch one record by id
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### POST /API/HARRY-CLINTON/Product-Rating-Summary
Description: Create a new record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 201 Created: record created successfully (for many CRUD modules)
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### PUT /API/HARRY-CLINTON/Product-Rating-Summary
Description: Update an existing record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### DELETE /API/HARRY-CLINTON/Product-Rating-Summary
Description: Delete or soft-delete a record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

## Module: /Products
Route File: routes/HARRY_CLINTON/C_Product_Catalog_&_Configuration/Products.js
CRUD-5 Complete: Yes

### GET /API/HARRY-CLINTON/Products
Description: Fetch list records
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### GET /API/HARRY-CLINTON/Products/:id
Description: Fetch one record by id
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### POST /API/HARRY-CLINTON/Products
Description: Create a new record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 201 Created: record created successfully (for many CRUD modules)
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### PUT /API/HARRY-CLINTON/Products
Description: Update an existing record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### DELETE /API/HARRY-CLINTON/Products
Description: Delete or soft-delete a record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

## Module: /Products-Attributes
Route File: routes/HARRY_CLINTON/C_Product_Catalog_&_Configuration/Products_Attributes.js
CRUD-5 Complete: Yes

### GET /API/HARRY-CLINTON/Products-Attributes
Description: Fetch list records
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### GET /API/HARRY-CLINTON/Products-Attributes/:id
Description: Fetch one record by id
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### POST /API/HARRY-CLINTON/Products-Attributes
Description: Create a new record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 201 Created: record created successfully (for many CRUD modules)
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### PUT /API/HARRY-CLINTON/Products-Attributes
Description: Update an existing record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### DELETE /API/HARRY-CLINTON/Products-Attributes
Description: Delete or soft-delete a record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

## Module: /Products-Attributes-Values
Route File: routes/HARRY_CLINTON/C_Product_Catalog_&_Configuration/Products_Attributes_Values.js
CRUD-5 Complete: Yes

### GET /API/HARRY-CLINTON/Products-Attributes-Values
Description: Fetch list records
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### GET /API/HARRY-CLINTON/Products-Attributes-Values/:id
Description: Fetch one record by id
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### POST /API/HARRY-CLINTON/Products-Attributes-Values
Description: Create a new record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 201 Created: record created successfully (for many CRUD modules)
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### PUT /API/HARRY-CLINTON/Products-Attributes-Values
Description: Update an existing record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### DELETE /API/HARRY-CLINTON/Products-Attributes-Values
Description: Delete or soft-delete a record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

## Module: /Products-Care-Instructions
Route File: routes/HARRY_CLINTON/C_Product_Catalog_&_Configuration/Products_Care_Instructions.js
CRUD-5 Complete: Yes

### GET /API/HARRY-CLINTON/Products-Care-Instructions
Description: Fetch list records
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### GET /API/HARRY-CLINTON/Products-Care-Instructions/:id
Description: Fetch one record by id
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### POST /API/HARRY-CLINTON/Products-Care-Instructions
Description: Create a new record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 201 Created: record created successfully (for many CRUD modules)
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### PUT /API/HARRY-CLINTON/Products-Care-Instructions
Description: Update an existing record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### DELETE /API/HARRY-CLINTON/Products-Care-Instructions
Description: Delete or soft-delete a record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

## Module: /Products-Cloth-Type-Care-Instructions
Route File: routes/HARRY_CLINTON/C_Product_Catalog_&_Configuration/Products_Cloth_Type_Care_Instructions.js
CRUD-5 Complete: Yes

### GET /API/HARRY-CLINTON/Products-Cloth-Type-Care-Instructions
Description: Fetch list records
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### GET /API/HARRY-CLINTON/Products-Cloth-Type-Care-Instructions/:id
Description: Fetch one record by id
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### POST /API/HARRY-CLINTON/Products-Cloth-Type-Care-Instructions
Description: Create a new record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 201 Created: record created successfully (for many CRUD modules)
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### PUT /API/HARRY-CLINTON/Products-Cloth-Type-Care-Instructions
Description: Update an existing record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### DELETE /API/HARRY-CLINTON/Products-Cloth-Type-Care-Instructions
Description: Delete or soft-delete a record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

## Module: /Products-Cloth-Types
Route File: routes/HARRY_CLINTON/C_Product_Catalog_&_Configuration/Products_Cloth_Types.js
CRUD-5 Complete: Yes

### GET /API/HARRY-CLINTON/Products-Cloth-Types
Description: Fetch list records
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### GET /API/HARRY-CLINTON/Products-Cloth-Types/:id
Description: Fetch one record by id
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### POST /API/HARRY-CLINTON/Products-Cloth-Types
Description: Create a new record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 201 Created: record created successfully (for many CRUD modules)
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### PUT /API/HARRY-CLINTON/Products-Cloth-Types
Description: Update an existing record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### DELETE /API/HARRY-CLINTON/Products-Cloth-Types
Description: Delete or soft-delete a record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

## Module: /Products-Media
Route File: routes/HARRY_CLINTON/C_Product_Catalog_&_Configuration/Products_Media.js
CRUD-5 Complete: Yes

### GET /API/HARRY-CLINTON/Products-Media
Description: Fetch list records
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### GET /API/HARRY-CLINTON/Products-Media/:id
Description: Fetch one record by id
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### POST /API/HARRY-CLINTON/Products-Media
Description: Create a new record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 201 Created: record created successfully (for many CRUD modules)
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### PUT /API/HARRY-CLINTON/Products-Media
Description: Update an existing record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### DELETE /API/HARRY-CLINTON/Products-Media
Description: Delete or soft-delete a record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

## Module: /Products-Seo
Route File: routes/HARRY_CLINTON/C_Product_Catalog_&_Configuration/Products_Seo.js
CRUD-5 Complete: Yes

### GET /API/HARRY-CLINTON/Products-Seo
Description: Fetch list records
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### GET /API/HARRY-CLINTON/Products-Seo/:id
Description: Fetch one record by id
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### POST /API/HARRY-CLINTON/Products-Seo
Description: Create a new record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 201 Created: record created successfully (for many CRUD modules)
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### PUT /API/HARRY-CLINTON/Products-Seo
Description: Update an existing record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### DELETE /API/HARRY-CLINTON/Products-Seo
Description: Delete or soft-delete a record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

## Module: /Products-Sizes
Route File: routes/HARRY_CLINTON/C_Product_Catalog_&_Configuration/Products_Sizes.js
CRUD-5 Complete: Yes

### GET /API/HARRY-CLINTON/Products-Sizes
Description: Fetch list records
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### GET /API/HARRY-CLINTON/Products-Sizes/:id
Description: Fetch one record by id
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### POST /API/HARRY-CLINTON/Products-Sizes
Description: Create a new record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 201 Created: record created successfully (for many CRUD modules)
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### PUT /API/HARRY-CLINTON/Products-Sizes
Description: Update an existing record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### DELETE /API/HARRY-CLINTON/Products-Sizes
Description: Delete or soft-delete a record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

## Module: /Products-Variants
Route File: routes/HARRY_CLINTON/C_Product_Catalog_&_Configuration/Products_Variants.js
CRUD-5 Complete: Yes

### GET /API/HARRY-CLINTON/Products-Variants
Description: Fetch list records
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### GET /API/HARRY-CLINTON/Products-Variants/:id
Description: Fetch one record by id
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### POST /API/HARRY-CLINTON/Products-Variants
Description: Create a new record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 201 Created: record created successfully (for many CRUD modules)
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### PUT /API/HARRY-CLINTON/Products-Variants
Description: Update an existing record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### DELETE /API/HARRY-CLINTON/Products-Variants
Description: Delete or soft-delete a record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

## Module: /Profiles
Route File: routes/HARRY_CLINTON/B_Customer_Management/Profiles.js
CRUD-5 Complete: Yes

### GET /API/HARRY-CLINTON/Profiles
Description: Fetch list records
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### GET /API/HARRY-CLINTON/Profiles/:id
Description: Fetch one record by id
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### POST /API/HARRY-CLINTON/Profiles
Description: Create a new record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 201 Created: record created successfully (for many CRUD modules)
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### PUT /API/HARRY-CLINTON/Profiles
Description: Update an existing record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### DELETE /API/HARRY-CLINTON/Profiles
Description: Delete or soft-delete a record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

## Module: /Refunds
Route File: routes/HARRY_CLINTON/J_Returns_&_Refunds/Refunds.js
CRUD-5 Complete: Yes

### GET /API/HARRY-CLINTON/Refunds
Description: Fetch list records
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### GET /API/HARRY-CLINTON/Refunds/:id
Description: Fetch one record by id
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### POST /API/HARRY-CLINTON/Refunds
Description: Create a new record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 201 Created: record created successfully (for many CRUD modules)
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### PUT /API/HARRY-CLINTON/Refunds
Description: Update an existing record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### DELETE /API/HARRY-CLINTON/Refunds
Description: Delete or soft-delete a record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

## Module: /Returns
Route File: routes/HARRY_CLINTON/J_Returns_&_Refunds/Returns.js
CRUD-5 Complete: Yes

### GET /API/HARRY-CLINTON/Returns
Description: Fetch list records
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### GET /API/HARRY-CLINTON/Returns/:id
Description: Fetch one record by id
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### POST /API/HARRY-CLINTON/Returns
Description: Create a new record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 201 Created: record created successfully (for many CRUD modules)
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### PUT /API/HARRY-CLINTON/Returns
Description: Update an existing record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### DELETE /API/HARRY-CLINTON/Returns
Description: Delete or soft-delete a record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

## Module: /Review-Media
Route File: routes/HARRY_CLINTON/L_Ratings_&_Reviews/Review_Media.js
CRUD-5 Complete: Yes

### GET /API/HARRY-CLINTON/Review-Media
Description: Fetch list records
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### GET /API/HARRY-CLINTON/Review-Media/:id
Description: Fetch one record by id
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### POST /API/HARRY-CLINTON/Review-Media
Description: Create a new record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 201 Created: record created successfully (for many CRUD modules)
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### PUT /API/HARRY-CLINTON/Review-Media
Description: Update an existing record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### DELETE /API/HARRY-CLINTON/Review-Media
Description: Delete or soft-delete a record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

## Module: /Reviews
Route File: routes/HARRY_CLINTON/L_Ratings_&_Reviews/Reviews.js
CRUD-5 Complete: Yes

### GET /API/HARRY-CLINTON/Reviews
Description: Fetch list records
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### GET /API/HARRY-CLINTON/Reviews/:id
Description: Fetch one record by id
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### POST /API/HARRY-CLINTON/Reviews
Description: Create a new record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 201 Created: record created successfully (for many CRUD modules)
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### PUT /API/HARRY-CLINTON/Reviews
Description: Update an existing record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### DELETE /API/HARRY-CLINTON/Reviews
Description: Delete or soft-delete a record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

## Module: /Review-Votes
Route File: routes/HARRY_CLINTON/L_Ratings_&_Reviews/Review_Votes.js
CRUD-5 Complete: Yes

### GET /API/HARRY-CLINTON/Review-Votes
Description: Fetch list records
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### GET /API/HARRY-CLINTON/Review-Votes/:id
Description: Fetch one record by id
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### POST /API/HARRY-CLINTON/Review-Votes
Description: Create a new record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 201 Created: record created successfully (for many CRUD modules)
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### PUT /API/HARRY-CLINTON/Review-Votes
Description: Update an existing record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### DELETE /API/HARRY-CLINTON/Review-Votes
Description: Delete or soft-delete a record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

## Module: /Roles
Route File: routes/HARRY_CLINTON/A_User_Access_Management/Roles.js
CRUD-5 Complete: Yes

### GET /API/HARRY-CLINTON/Roles
Description: Fetch list records
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### GET /API/HARRY-CLINTON/Roles/:id
Description: Fetch one record by id
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### POST /API/HARRY-CLINTON/Roles
Description: Create a new record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 201 Created: record created successfully (for many CRUD modules)
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### PUT /API/HARRY-CLINTON/Roles
Description: Update an existing record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### DELETE /API/HARRY-CLINTON/Roles
Description: Delete or soft-delete a record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

## Module: /Running-Bar
Route File: routes/HARRY_CLINTON/HC_A_Header_Running_Bars/RunningBar.js
CRUD-5 Complete: Yes

### GET /API/HARRY-CLINTON/Running-Bar
Description: Fetch list records
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### GET /API/HARRY-CLINTON/Running-Bar/:id
Description: Fetch one record by id
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### POST /API/HARRY-CLINTON/Running-Bar
Description: Create a new record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 201 Created: record created successfully (for many CRUD modules)
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### PUT /API/HARRY-CLINTON/Running-Bar
Description: Update an existing record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### DELETE /API/HARRY-CLINTON/Running-Bar
Description: Delete or soft-delete a record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

## Module: /Running-Bar-Items
Route File: routes/HARRY_CLINTON/HC_A_Header_Running_Bars/RunningBarItems.js
CRUD-5 Complete: Yes

### GET /API/HARRY-CLINTON/Running-Bar-Items
Description: Fetch list records
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### GET /API/HARRY-CLINTON/Running-Bar-Items/:id
Description: Fetch one record by id
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### POST /API/HARRY-CLINTON/Running-Bar-Items
Description: Create a new record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 201 Created: record created successfully (for many CRUD modules)
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### PUT /API/HARRY-CLINTON/Running-Bar-Items
Description: Update an existing record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### DELETE /API/HARRY-CLINTON/Running-Bar-Items
Description: Delete or soft-delete a record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

## Module: /Settings
Route File: routes/HARRY_CLINTON/K_Support_Content_&_System_Configuration/Settings.js
CRUD-5 Complete: Yes

### GET /API/HARRY-CLINTON/Settings
Description: Fetch list records
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### GET /API/HARRY-CLINTON/Settings/:id
Description: Fetch one record by id
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### POST /API/HARRY-CLINTON/Settings
Description: Create a new record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 201 Created: record created successfully (for many CRUD modules)
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### PUT /API/HARRY-CLINTON/Settings
Description: Update an existing record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### DELETE /API/HARRY-CLINTON/Settings
Description: Delete or soft-delete a record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

## Module: /Shipment-Events
Route File: routes/HARRY_CLINTON/I_ Shipping_&_Delivery/Shipment_Events.js
CRUD-5 Complete: Yes

### GET /API/HARRY-CLINTON/Shipment-Events
Description: Fetch list records
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### GET /API/HARRY-CLINTON/Shipment-Events/:id
Description: Fetch one record by id
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### POST /API/HARRY-CLINTON/Shipment-Events
Description: Create a new record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 201 Created: record created successfully (for many CRUD modules)
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### PUT /API/HARRY-CLINTON/Shipment-Events
Description: Update an existing record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### DELETE /API/HARRY-CLINTON/Shipment-Events
Description: Delete or soft-delete a record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

## Module: /Shipments
Route File: routes/HARRY_CLINTON/I_ Shipping_&_Delivery/Shipments.js
CRUD-5 Complete: Yes

### GET /API/HARRY-CLINTON/Shipments
Description: Fetch list records
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### GET /API/HARRY-CLINTON/Shipments/:id
Description: Fetch one record by id
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### POST /API/HARRY-CLINTON/Shipments
Description: Create a new record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 201 Created: record created successfully (for many CRUD modules)
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### PUT /API/HARRY-CLINTON/Shipments
Description: Update an existing record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### DELETE /API/HARRY-CLINTON/Shipments
Description: Delete or soft-delete a record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

## Module: /Spotlight-Entries
Route File: routes/HARRY_CLINTON/HC_D_Spotlight/Spotlight_Entries.js
CRUD-5 Complete: Yes

### GET /API/HARRY-CLINTON/Spotlight-Entries
Description: Fetch list records
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### GET /API/HARRY-CLINTON/Spotlight-Entries/:id
Description: Fetch one record by id
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### POST /API/HARRY-CLINTON/Spotlight-Entries
Description: Create a new record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 201 Created: record created successfully (for many CRUD modules)
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### PUT /API/HARRY-CLINTON/Spotlight-Entries
Description: Update an existing record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### DELETE /API/HARRY-CLINTON/Spotlight-Entries
Description: Delete or soft-delete a record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

## Module: /Spotlight-Media
Route File: routes/HARRY_CLINTON/HC_D_Spotlight/Spotlight_Media.js
CRUD-5 Complete: Yes

### GET /API/HARRY-CLINTON/Spotlight-Media
Description: Fetch list records
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### GET /API/HARRY-CLINTON/Spotlight-Media/:id
Description: Fetch one record by id
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### POST /API/HARRY-CLINTON/Spotlight-Media
Description: Create a new record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 201 Created: record created successfully (for many CRUD modules)
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### PUT /API/HARRY-CLINTON/Spotlight-Media
Description: Update an existing record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### DELETE /API/HARRY-CLINTON/Spotlight-Media
Description: Delete or soft-delete a record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

## Module: /Style-Collection-Media
Route File: routes/HARRY_CLINTON/HC_E_Style_by_HC/Style_Collection_Media.js
CRUD-5 Complete: Yes

### GET /API/HARRY-CLINTON/Style-Collection-Media
Description: Fetch list records
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### GET /API/HARRY-CLINTON/Style-Collection-Media/:id
Description: Fetch one record by id
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### POST /API/HARRY-CLINTON/Style-Collection-Media
Description: Create a new record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 201 Created: record created successfully (for many CRUD modules)
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### PUT /API/HARRY-CLINTON/Style-Collection-Media
Description: Update an existing record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### DELETE /API/HARRY-CLINTON/Style-Collection-Media
Description: Delete or soft-delete a record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

## Module: /Style-Collections
Route File: routes/HARRY_CLINTON/HC_E_Style_by_HC/Style_Collections.js
CRUD-5 Complete: Yes

### GET /API/HARRY-CLINTON/Style-Collections
Description: Fetch list records
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### GET /API/HARRY-CLINTON/Style-Collections/:id
Description: Fetch one record by id
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### POST /API/HARRY-CLINTON/Style-Collections
Description: Create a new record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 201 Created: record created successfully (for many CRUD modules)
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### PUT /API/HARRY-CLINTON/Style-Collections
Description: Update an existing record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### DELETE /API/HARRY-CLINTON/Style-Collections
Description: Delete or soft-delete a record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

## Module: /Support-Contacts
Route File: routes/HARRY_CLINTON/K_Support_Content_&_System_Configuration/Support_Contacts.js
CRUD-5 Complete: Yes

### GET /API/HARRY-CLINTON/Support-Contacts
Description: Fetch list records
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### GET /API/HARRY-CLINTON/Support-Contacts/:id
Description: Fetch one record by id
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### POST /API/HARRY-CLINTON/Support-Contacts
Description: Create a new record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 201 Created: record created successfully (for many CRUD modules)
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### PUT /API/HARRY-CLINTON/Support-Contacts
Description: Update an existing record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### DELETE /API/HARRY-CLINTON/Support-Contacts
Description: Delete or soft-delete a record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

## Module: /User-Roles
Route File: routes/HARRY_CLINTON/A_User_Access_Management/UserRoles.js
CRUD-5 Complete: Yes

### GET /API/HARRY-CLINTON/User-Roles
Description: Fetch list records
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### GET /API/HARRY-CLINTON/User-Roles/:id
Description: Fetch one record by id
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### GET /API/HARRY-CLINTON/User-Roles/user/:user_id
Description: Fetch one record by id
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### POST /API/HARRY-CLINTON/User-Roles
Description: Create a new record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 201 Created: record created successfully (for many CRUD modules)
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### PUT /API/HARRY-CLINTON/User-Roles
Description: Update an existing record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### DELETE /API/HARRY-CLINTON/User-Roles
Description: Delete or soft-delete a record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### POST /API/HARRY-CLINTON/User-Roles/add
Description: Create a new record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 201 Created: record created successfully (for many CRUD modules)
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### DELETE /API/HARRY-CLINTON/User-Roles/remove
Description: Delete or soft-delete a record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

## Module: /Users
Route File: routes/HARRY_CLINTON/A_User_Access_Management/User.js
CRUD-5 Complete: Yes

### GET /API/HARRY-CLINTON/Users
Description: Fetch list records
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### GET /API/HARRY-CLINTON/Users/:id
Description: Fetch one record by id
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### POST /API/HARRY-CLINTON/Users
Description: Create a new record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 201 Created: record created successfully (for many CRUD modules)
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### PUT /API/HARRY-CLINTON/Users
Description: Update an existing record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### DELETE /API/HARRY-CLINTON/Users
Description: Delete or soft-delete a record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

## Module: /Variant-Rating-Summary
Route File: routes/HARRY_CLINTON/L_Ratings_&_Reviews/Variant_Rating_Summary.js
CRUD-5 Complete: Yes

### GET /API/HARRY-CLINTON/Variant-Rating-Summary
Description: Fetch list records
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### GET /API/HARRY-CLINTON/Variant-Rating-Summary/:id
Description: Fetch one record by id
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### POST /API/HARRY-CLINTON/Variant-Rating-Summary
Description: Create a new record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 201 Created: record created successfully (for many CRUD modules)
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### PUT /API/HARRY-CLINTON/Variant-Rating-Summary
Description: Update an existing record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### DELETE /API/HARRY-CLINTON/Variant-Rating-Summary
Description: Delete or soft-delete a record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

## Module: /Wishlist-Items
Route File: routes/HARRY_CLINTON/D_Wishlist_Management/Wishlist_Items.js
CRUD-5 Complete: Yes

### GET /API/HARRY-CLINTON/Wishlist-Items
Description: Fetch list records
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### GET /API/HARRY-CLINTON/Wishlist-Items/:id
Description: Fetch one record by id
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### POST /API/HARRY-CLINTON/Wishlist-Items
Description: Create a new record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 201 Created: record created successfully (for many CRUD modules)
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### PUT /API/HARRY-CLINTON/Wishlist-Items
Description: Update an existing record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### DELETE /API/HARRY-CLINTON/Wishlist-Items
Description: Delete or soft-delete a record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

## Module: /Wishlists
Route File: routes/HARRY_CLINTON/D_Wishlist_Management/Wishlists.js
CRUD-5 Complete: Yes

### GET /API/HARRY-CLINTON/Wishlists
Description: Fetch list records
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### GET /API/HARRY-CLINTON/Wishlists/:id
Description: Fetch one record by id
Payload Contract:
- Path params: if endpoint includes /:id then id is required
- Query params: optional includeDeleted/includeInactive or module-specific filters where available
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### POST /API/HARRY-CLINTON/Wishlists
Description: Create a new record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 201 Created: record created successfully (for many CRUD modules)
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### PUT /API/HARRY-CLINTON/Wishlists
Description: Update an existing record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

### DELETE /API/HARRY-CLINTON/Wishlists
Description: Delete or soft-delete a record
Payload Contract:
- Content-Type: application/json
- Body: module-specific fields defined in route validation and SQL bindings
- Common pattern in this codebase: PUT/DELETE often expect identifier in request body
Response Types:
- 200 OK: success response with data/message/count depending on module
- 400/405: missing or invalid required input
- 404: entity not found for id-based operations
- 409: conflict/unique constraint in some modules
- 500: internal server/database error

## Missing Table-wise Endpoints (as of now)
- tbl_about_us_pages
- tbl_privacy_policy_pages
- tbl_terms_conditions_pages
- tbl_notification_bars
- tbl_menu_section_images
- tbl_subcategory_sections
