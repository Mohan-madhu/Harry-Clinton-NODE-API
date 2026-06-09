# API Level 1 Document (User-Friendly)

Audience: Business users, QA, support teams, product managers.
Source: route files only.
Base URL: /API/HARRY-CLINTON

## Module Group: A_Auth_Mail_FileUpload

### Module: /Auth
Table/Schema Reference: auth_sp_flows
Module Purpose: Support registration, login, OTP, and password recovery flows.

- Endpoint: POST /API/HARRY-CLINTON/Auth/Register
  Short Description: Register a new user
  Long Description: Useful for onboarding a new customer account so they can sign in and place orders. Support registration, login, OTP, and password recovery flows.
- Endpoint: POST /API/HARRY-CLINTON/Auth/Password-Login
  Short Description: Login with password
  Long Description: Useful for authenticating existing users using email and password. Support registration, login, OTP, and password recovery flows.
- Endpoint: POST /API/HARRY-CLINTON/Auth/OTP-Login
  Short Description: Start OTP login
  Long Description: Useful for sending a one-time code to user email for secure sign-in. Support registration, login, OTP, and password recovery flows.
- Endpoint: POST /API/HARRY-CLINTON/Auth/Verify-Login-OTP
  Short Description: Verify OTP code
  Long Description: Useful for completing OTP login after user enters the received code. Support registration, login, OTP, and password recovery flows.
- Endpoint: POST /API/HARRY-CLINTON/Auth/Forgot-Password
  Short Description: Start password reset
  Long Description: Useful when users forget password and need reset initiation. Support registration, login, OTP, and password recovery flows.
- Endpoint: POST /API/HARRY-CLINTON/Auth/Reset-Password
  Short Description: Set new password
  Long Description: Useful for saving a new password after reset validation. Support registration, login, OTP, and password recovery flows.
- Endpoint: POST /API/HARRY-CLINTON/Auth/Forgot-Password-Confirm
  Short Description: Confirm reset process
  Long Description: Useful for final verification step in password recovery workflow. Support registration, login, OTP, and password recovery flows.

### Module: /FileUpload
Table/Schema Reference: file_storage
Module Purpose: Upload and store files/media for modules that need attachments.

- Endpoint: POST /API/HARRY-CLINTON/FileUpload
  Short Description: Upload file
  Long Description: Useful for uploading images or documents used by product/content modules. Upload and store files/media for modules that need attachments.

### Module: /Mail
Table/Schema Reference: mail_service
Module Purpose: Send transactional and OTP emails to customers.

- Endpoint: POST /API/HARRY-CLINTON/Mail/SendMail
  Short Description: Send custom email
  Long Description: Useful for sending transactional or support emails to customers. Send transactional and OTP emails to customers.
- Endpoint: POST /API/HARRY-CLINTON/Mail/SendOTPEmail
  Short Description: Send OTP email
  Long Description: Useful for delivering one-time verification codes to user inbox. Send transactional and OTP emails to customers.

## Module Group: A_User_Access_Management

### Module: /Roles
Table/Schema Reference: tbl_roles
Module Purpose: Define role types used for permission control across the platform.

- Endpoint: GET /API/HARRY-CLINTON/Roles
  Short Description: View records list
  Long Description: Useful for listing and browsing records in admin/customer interfaces. Define role types used for permission control across the platform.
- Endpoint: GET /API/HARRY-CLINTON/Roles/:id
  Short Description: View one record
  Long Description: Useful for opening one specific record in detail view screens. Define role types used for permission control across the platform.
- Endpoint: POST /API/HARRY-CLINTON/Roles
  Short Description: Create new record
  Long Description: Useful when business users add new data needed for operations and customer experience. Define role types used for permission control across the platform.
- Endpoint: PUT /API/HARRY-CLINTON/Roles
  Short Description: Update existing record
  Long Description: Useful for correcting details, status changes, and keeping live data accurate. Define role types used for permission control across the platform.
- Endpoint: DELETE /API/HARRY-CLINTON/Roles
  Short Description: Delete/disable record
  Long Description: Useful for removing inactive data from active flows while maintaining data hygiene. Define role types used for permission control across the platform.

### Module: /User-Roles
Table/Schema Reference: tbl_user_roles
Module Purpose: Assign roles to users so the right people can access the right features.

- Endpoint: GET /API/HARRY-CLINTON/User-Roles
  Short Description: View records list
  Long Description: Useful for listing and browsing records in admin/customer interfaces. Assign roles to users so the right people can access the right features.
- Endpoint: GET /API/HARRY-CLINTON/User-Roles/:id
  Short Description: View one record
  Long Description: Useful for opening one specific record in detail view screens. Assign roles to users so the right people can access the right features.
- Endpoint: GET /API/HARRY-CLINTON/User-Roles/user/:user_id
  Short Description: View roles for one user
  Long Description: Useful for checking access roles currently mapped to a specific user. Assign roles to users so the right people can access the right features.
- Endpoint: POST /API/HARRY-CLINTON/User-Roles
  Short Description: Create new record
  Long Description: Useful when business users add new data needed for operations and customer experience. Assign roles to users so the right people can access the right features.
- Endpoint: PUT /API/HARRY-CLINTON/User-Roles
  Short Description: Update existing record
  Long Description: Useful for correcting details, status changes, and keeping live data accurate. Assign roles to users so the right people can access the right features.
- Endpoint: DELETE /API/HARRY-CLINTON/User-Roles
  Short Description: Delete/disable record
  Long Description: Useful for removing inactive data from active flows while maintaining data hygiene. Assign roles to users so the right people can access the right features.
- Endpoint: POST /API/HARRY-CLINTON/User-Roles/add
  Short Description: Assign role to user
  Long Description: Useful for granting additional permissions to an existing user. Assign roles to users so the right people can access the right features.
- Endpoint: DELETE /API/HARRY-CLINTON/User-Roles/remove
  Short Description: Remove role from user
  Long Description: Useful for revoking permissions from a user account. Assign roles to users so the right people can access the right features.

### Module: /Users
Table/Schema Reference: tbl_users
Module Purpose: Manage user accounts, profile identity details, and account lifecycle actions.

- Endpoint: GET /API/HARRY-CLINTON/Users
  Short Description: View records list
  Long Description: Useful for listing and browsing records in admin/customer interfaces. Manage user accounts, profile identity details, and account lifecycle actions.
- Endpoint: GET /API/HARRY-CLINTON/Users/:id
  Short Description: View one record
  Long Description: Useful for opening one specific record in detail view screens. Manage user accounts, profile identity details, and account lifecycle actions.
- Endpoint: POST /API/HARRY-CLINTON/Users
  Short Description: Create new record
  Long Description: Useful when business users add new data needed for operations and customer experience. Manage user accounts, profile identity details, and account lifecycle actions.
- Endpoint: PUT /API/HARRY-CLINTON/Users
  Short Description: Update existing record
  Long Description: Useful for correcting details, status changes, and keeping live data accurate. Manage user accounts, profile identity details, and account lifecycle actions.
- Endpoint: DELETE /API/HARRY-CLINTON/Users
  Short Description: Delete/disable record
  Long Description: Useful for removing inactive data from active flows while maintaining data hygiene. Manage user accounts, profile identity details, and account lifecycle actions.

## Module Group: B_Customer_Management

### Module: /Addresses
Table/Schema Reference: tbl_addresses
Module Purpose: Manage saved customer addresses used for shipping and billing.

- Endpoint: GET /API/HARRY-CLINTON/Addresses
  Short Description: View records list
  Long Description: Useful for listing and browsing records in admin/customer interfaces. Manage saved customer addresses used for shipping and billing.
- Endpoint: GET /API/HARRY-CLINTON/Addresses/:id
  Short Description: View one record
  Long Description: Useful for opening one specific record in detail view screens. Manage saved customer addresses used for shipping and billing.
- Endpoint: POST /API/HARRY-CLINTON/Addresses
  Short Description: Create new record
  Long Description: Useful when business users add new data needed for operations and customer experience. Manage saved customer addresses used for shipping and billing.
- Endpoint: PUT /API/HARRY-CLINTON/Addresses
  Short Description: Update existing record
  Long Description: Useful for correcting details, status changes, and keeping live data accurate. Manage saved customer addresses used for shipping and billing.
- Endpoint: DELETE /API/HARRY-CLINTON/Addresses
  Short Description: Delete/disable record
  Long Description: Useful for removing inactive data from active flows while maintaining data hygiene. Manage saved customer addresses used for shipping and billing.

### Module: /Profiles
Table/Schema Reference: tbl_profiles
Module Purpose: Store customer profile information used across shopping and checkout journeys.

- Endpoint: GET /API/HARRY-CLINTON/Profiles
  Short Description: View records list
  Long Description: Useful for listing and browsing records in admin/customer interfaces. Store customer profile information used across shopping and checkout journeys.
- Endpoint: GET /API/HARRY-CLINTON/Profiles/:id
  Short Description: View one record
  Long Description: Useful for opening one specific record in detail view screens. Store customer profile information used across shopping and checkout journeys.
- Endpoint: POST /API/HARRY-CLINTON/Profiles
  Short Description: Create new record
  Long Description: Useful when business users add new data needed for operations and customer experience. Store customer profile information used across shopping and checkout journeys.
- Endpoint: PUT /API/HARRY-CLINTON/Profiles
  Short Description: Update existing record
  Long Description: Useful for correcting details, status changes, and keeping live data accurate. Store customer profile information used across shopping and checkout journeys.
- Endpoint: DELETE /API/HARRY-CLINTON/Profiles
  Short Description: Delete/disable record
  Long Description: Useful for removing inactive data from active flows while maintaining data hygiene. Store customer profile information used across shopping and checkout journeys.

## Module Group: C_Product_Catalog_&_Configuration

### Module: /Products
Table/Schema Reference: tbl_products
Module Purpose: Manage core product records shown in catalog and product listing pages.

- Endpoint: GET /API/HARRY-CLINTON/Products
  Short Description: View records list
  Long Description: Useful for listing and browsing records in admin/customer interfaces. Manage core product records shown in catalog and product listing pages.
- Endpoint: GET /API/HARRY-CLINTON/Products/:id
  Short Description: View one record
  Long Description: Useful for opening one specific record in detail view screens. Manage core product records shown in catalog and product listing pages.
- Endpoint: POST /API/HARRY-CLINTON/Products
  Short Description: Create new record
  Long Description: Useful when business users add new data needed for operations and customer experience. Manage core product records shown in catalog and product listing pages.
- Endpoint: PUT /API/HARRY-CLINTON/Products
  Short Description: Update existing record
  Long Description: Useful for correcting details, status changes, and keeping live data accurate. Manage core product records shown in catalog and product listing pages.
- Endpoint: DELETE /API/HARRY-CLINTON/Products
  Short Description: Delete/disable record
  Long Description: Useful for removing inactive data from active flows while maintaining data hygiene. Manage core product records shown in catalog and product listing pages.

### Module: /Products-Attributes
Table/Schema Reference: tbl_attributes
Module Purpose: Define product attribute types used for filtering and merchandising.

- Endpoint: GET /API/HARRY-CLINTON/Products-Attributes
  Short Description: View records list
  Long Description: Useful for listing and browsing records in admin/customer interfaces. Define product attribute types used for filtering and merchandising.
- Endpoint: GET /API/HARRY-CLINTON/Products-Attributes/:id
  Short Description: View one record
  Long Description: Useful for opening one specific record in detail view screens. Define product attribute types used for filtering and merchandising.
- Endpoint: POST /API/HARRY-CLINTON/Products-Attributes
  Short Description: Create new record
  Long Description: Useful when business users add new data needed for operations and customer experience. Define product attribute types used for filtering and merchandising.
- Endpoint: PUT /API/HARRY-CLINTON/Products-Attributes
  Short Description: Update existing record
  Long Description: Useful for correcting details, status changes, and keeping live data accurate. Define product attribute types used for filtering and merchandising.
- Endpoint: DELETE /API/HARRY-CLINTON/Products-Attributes
  Short Description: Delete/disable record
  Long Description: Useful for removing inactive data from active flows while maintaining data hygiene. Define product attribute types used for filtering and merchandising.

### Module: /Products-Attributes-Values
Table/Schema Reference: tbl_product_attribute_values
Module Purpose: Store allowed values for product attributes such as pattern, fabric, or occasion.

- Endpoint: GET /API/HARRY-CLINTON/Products-Attributes-Values
  Short Description: View records list
  Long Description: Useful for listing and browsing records in admin/customer interfaces. Store allowed values for product attributes such as pattern, fabric, or occasion.
- Endpoint: GET /API/HARRY-CLINTON/Products-Attributes-Values/:id
  Short Description: View one record
  Long Description: Useful for opening one specific record in detail view screens. Store allowed values for product attributes such as pattern, fabric, or occasion.
- Endpoint: POST /API/HARRY-CLINTON/Products-Attributes-Values
  Short Description: Create new record
  Long Description: Useful when business users add new data needed for operations and customer experience. Store allowed values for product attributes such as pattern, fabric, or occasion.
- Endpoint: PUT /API/HARRY-CLINTON/Products-Attributes-Values
  Short Description: Update existing record
  Long Description: Useful for correcting details, status changes, and keeping live data accurate. Store allowed values for product attributes such as pattern, fabric, or occasion.
- Endpoint: DELETE /API/HARRY-CLINTON/Products-Attributes-Values
  Short Description: Delete/disable record
  Long Description: Useful for removing inactive data from active flows while maintaining data hygiene. Store allowed values for product attributes such as pattern, fabric, or occasion.

### Module: /Products-Care-Instructions
Table/Schema Reference: tbl_care_instructions
Module Purpose: Manage care instruction entries displayed to customers after purchase consideration.

- Endpoint: GET /API/HARRY-CLINTON/Products-Care-Instructions
  Short Description: View records list
  Long Description: Useful for listing and browsing records in admin/customer interfaces. Manage care instruction entries displayed to customers after purchase consideration.
- Endpoint: GET /API/HARRY-CLINTON/Products-Care-Instructions/:id
  Short Description: View one record
  Long Description: Useful for opening one specific record in detail view screens. Manage care instruction entries displayed to customers after purchase consideration.
- Endpoint: POST /API/HARRY-CLINTON/Products-Care-Instructions
  Short Description: Create new record
  Long Description: Useful when business users add new data needed for operations and customer experience. Manage care instruction entries displayed to customers after purchase consideration.
- Endpoint: PUT /API/HARRY-CLINTON/Products-Care-Instructions
  Short Description: Update existing record
  Long Description: Useful for correcting details, status changes, and keeping live data accurate. Manage care instruction entries displayed to customers after purchase consideration.
- Endpoint: DELETE /API/HARRY-CLINTON/Products-Care-Instructions
  Short Description: Delete/disable record
  Long Description: Useful for removing inactive data from active flows while maintaining data hygiene. Manage care instruction entries displayed to customers after purchase consideration.

### Module: /Products-Cloth-Type-Care-Instructions
Table/Schema Reference: tbl_cloth_type_care_instructions
Module Purpose: Map fabrics to recommended care guidance for consistency and customer trust.

- Endpoint: GET /API/HARRY-CLINTON/Products-Cloth-Type-Care-Instructions
  Short Description: View records list
  Long Description: Useful for listing and browsing records in admin/customer interfaces. Map fabrics to recommended care guidance for consistency and customer trust.
- Endpoint: GET /API/HARRY-CLINTON/Products-Cloth-Type-Care-Instructions/:id
  Short Description: View one record
  Long Description: Useful for opening one specific record in detail view screens. Map fabrics to recommended care guidance for consistency and customer trust.
- Endpoint: POST /API/HARRY-CLINTON/Products-Cloth-Type-Care-Instructions
  Short Description: Create new record
  Long Description: Useful when business users add new data needed for operations and customer experience. Map fabrics to recommended care guidance for consistency and customer trust.
- Endpoint: PUT /API/HARRY-CLINTON/Products-Cloth-Type-Care-Instructions
  Short Description: Update existing record
  Long Description: Useful for correcting details, status changes, and keeping live data accurate. Map fabrics to recommended care guidance for consistency and customer trust.
- Endpoint: DELETE /API/HARRY-CLINTON/Products-Cloth-Type-Care-Instructions
  Short Description: Delete/disable record
  Long Description: Useful for removing inactive data from active flows while maintaining data hygiene. Map fabrics to recommended care guidance for consistency and customer trust.

### Module: /Products-Cloth-Types
Table/Schema Reference: tbl_cloth_types
Module Purpose: Manage cloth/fabric categories used in product metadata and filtering.

- Endpoint: GET /API/HARRY-CLINTON/Products-Cloth-Types
  Short Description: View records list
  Long Description: Useful for listing and browsing records in admin/customer interfaces. Manage cloth/fabric categories used in product metadata and filtering.
- Endpoint: GET /API/HARRY-CLINTON/Products-Cloth-Types/:id
  Short Description: View one record
  Long Description: Useful for opening one specific record in detail view screens. Manage cloth/fabric categories used in product metadata and filtering.
- Endpoint: POST /API/HARRY-CLINTON/Products-Cloth-Types
  Short Description: Create new record
  Long Description: Useful when business users add new data needed for operations and customer experience. Manage cloth/fabric categories used in product metadata and filtering.
- Endpoint: PUT /API/HARRY-CLINTON/Products-Cloth-Types
  Short Description: Update existing record
  Long Description: Useful for correcting details, status changes, and keeping live data accurate. Manage cloth/fabric categories used in product metadata and filtering.
- Endpoint: DELETE /API/HARRY-CLINTON/Products-Cloth-Types
  Short Description: Delete/disable record
  Long Description: Useful for removing inactive data from active flows while maintaining data hygiene. Manage cloth/fabric categories used in product metadata and filtering.

### Module: /Products-Media
Table/Schema Reference: tbl_product_media
Module Purpose: Manage product images/videos used in product detail pages.

- Endpoint: GET /API/HARRY-CLINTON/Products-Media
  Short Description: View records list
  Long Description: Useful for listing and browsing records in admin/customer interfaces. Manage product images/videos used in product detail pages.
- Endpoint: GET /API/HARRY-CLINTON/Products-Media/:id
  Short Description: View one record
  Long Description: Useful for opening one specific record in detail view screens. Manage product images/videos used in product detail pages.
- Endpoint: POST /API/HARRY-CLINTON/Products-Media
  Short Description: Create new record
  Long Description: Useful when business users add new data needed for operations and customer experience. Manage product images/videos used in product detail pages.
- Endpoint: PUT /API/HARRY-CLINTON/Products-Media
  Short Description: Update existing record
  Long Description: Useful for correcting details, status changes, and keeping live data accurate. Manage product images/videos used in product detail pages.
- Endpoint: DELETE /API/HARRY-CLINTON/Products-Media
  Short Description: Delete/disable record
  Long Description: Useful for removing inactive data from active flows while maintaining data hygiene. Manage product images/videos used in product detail pages.

### Module: /Products-Seo
Table/Schema Reference: tbl_product_seo
Module Purpose: Manage SEO metadata so product pages are discoverable in search engines.

- Endpoint: GET /API/HARRY-CLINTON/Products-Seo
  Short Description: View records list
  Long Description: Useful for listing and browsing records in admin/customer interfaces. Manage SEO metadata so product pages are discoverable in search engines.
- Endpoint: GET /API/HARRY-CLINTON/Products-Seo/:id
  Short Description: View one record
  Long Description: Useful for opening one specific record in detail view screens. Manage SEO metadata so product pages are discoverable in search engines.
- Endpoint: POST /API/HARRY-CLINTON/Products-Seo
  Short Description: Create new record
  Long Description: Useful when business users add new data needed for operations and customer experience. Manage SEO metadata so product pages are discoverable in search engines.
- Endpoint: PUT /API/HARRY-CLINTON/Products-Seo
  Short Description: Update existing record
  Long Description: Useful for correcting details, status changes, and keeping live data accurate. Manage SEO metadata so product pages are discoverable in search engines.
- Endpoint: DELETE /API/HARRY-CLINTON/Products-Seo
  Short Description: Delete/disable record
  Long Description: Useful for removing inactive data from active flows while maintaining data hygiene. Manage SEO metadata so product pages are discoverable in search engines.

### Module: /Products-Sizes
Table/Schema Reference: tbl_sizes
Module Purpose: Manage size master data used while creating variants and size selection options.

- Endpoint: GET /API/HARRY-CLINTON/Products-Sizes
  Short Description: View records list
  Long Description: Useful for listing and browsing records in admin/customer interfaces. Manage size master data used while creating variants and size selection options.
- Endpoint: GET /API/HARRY-CLINTON/Products-Sizes/:id
  Short Description: View one record
  Long Description: Useful for opening one specific record in detail view screens. Manage size master data used while creating variants and size selection options.
- Endpoint: POST /API/HARRY-CLINTON/Products-Sizes
  Short Description: Create new record
  Long Description: Useful when business users add new data needed for operations and customer experience. Manage size master data used while creating variants and size selection options.
- Endpoint: PUT /API/HARRY-CLINTON/Products-Sizes
  Short Description: Update existing record
  Long Description: Useful for correcting details, status changes, and keeping live data accurate. Manage size master data used while creating variants and size selection options.
- Endpoint: DELETE /API/HARRY-CLINTON/Products-Sizes
  Short Description: Delete/disable record
  Long Description: Useful for removing inactive data from active flows while maintaining data hygiene. Manage size master data used while creating variants and size selection options.

### Module: /Products-Variants
Table/Schema Reference: tbl_product_variants
Module Purpose: Manage purchasable product variants such as color, fit, or style options.

- Endpoint: GET /API/HARRY-CLINTON/Products-Variants
  Short Description: View records list
  Long Description: Useful for listing and browsing records in admin/customer interfaces. Manage purchasable product variants such as color, fit, or style options.
- Endpoint: GET /API/HARRY-CLINTON/Products-Variants/:id
  Short Description: View one record
  Long Description: Useful for opening one specific record in detail view screens. Manage purchasable product variants such as color, fit, or style options.
- Endpoint: POST /API/HARRY-CLINTON/Products-Variants
  Short Description: Create new record
  Long Description: Useful when business users add new data needed for operations and customer experience. Manage purchasable product variants such as color, fit, or style options.
- Endpoint: PUT /API/HARRY-CLINTON/Products-Variants
  Short Description: Update existing record
  Long Description: Useful for correcting details, status changes, and keeping live data accurate. Manage purchasable product variants such as color, fit, or style options.
- Endpoint: DELETE /API/HARRY-CLINTON/Products-Variants
  Short Description: Delete/disable record
  Long Description: Useful for removing inactive data from active flows while maintaining data hygiene. Manage purchasable product variants such as color, fit, or style options.

## Module Group: D_Wishlist_Management

### Module: /Wishlist-Items
Table/Schema Reference: tbl_wishlist_items
Module Purpose: Add or remove products in customer wishlists.

- Endpoint: GET /API/HARRY-CLINTON/Wishlist-Items
  Short Description: View records list
  Long Description: Useful for listing and browsing records in admin/customer interfaces. Add or remove products in customer wishlists.
- Endpoint: GET /API/HARRY-CLINTON/Wishlist-Items/:id
  Short Description: View one record
  Long Description: Useful for opening one specific record in detail view screens. Add or remove products in customer wishlists.
- Endpoint: POST /API/HARRY-CLINTON/Wishlist-Items
  Short Description: Create new record
  Long Description: Useful when business users add new data needed for operations and customer experience. Add or remove products in customer wishlists.
- Endpoint: PUT /API/HARRY-CLINTON/Wishlist-Items
  Short Description: Update existing record
  Long Description: Useful for correcting details, status changes, and keeping live data accurate. Add or remove products in customer wishlists.
- Endpoint: DELETE /API/HARRY-CLINTON/Wishlist-Items
  Short Description: Delete/disable record
  Long Description: Useful for removing inactive data from active flows while maintaining data hygiene. Add or remove products in customer wishlists.

### Module: /Wishlists
Table/Schema Reference: tbl_wishlists
Module Purpose: Manage customer wishlist containers for save-for-later behavior.

- Endpoint: GET /API/HARRY-CLINTON/Wishlists
  Short Description: View records list
  Long Description: Useful for listing and browsing records in admin/customer interfaces. Manage customer wishlist containers for save-for-later behavior.
- Endpoint: GET /API/HARRY-CLINTON/Wishlists/:id
  Short Description: View one record
  Long Description: Useful for opening one specific record in detail view screens. Manage customer wishlist containers for save-for-later behavior.
- Endpoint: POST /API/HARRY-CLINTON/Wishlists
  Short Description: Create new record
  Long Description: Useful when business users add new data needed for operations and customer experience. Manage customer wishlist containers for save-for-later behavior.
- Endpoint: PUT /API/HARRY-CLINTON/Wishlists
  Short Description: Update existing record
  Long Description: Useful for correcting details, status changes, and keeping live data accurate. Manage customer wishlist containers for save-for-later behavior.
- Endpoint: DELETE /API/HARRY-CLINTON/Wishlists
  Short Description: Delete/disable record
  Long Description: Useful for removing inactive data from active flows while maintaining data hygiene. Manage customer wishlist containers for save-for-later behavior.

## Module Group: E_Cart_Management

### Module: /Cart-Items
Table/Schema Reference: tbl_cart_items
Module Purpose: Manage products, quantities, and prices inside carts.

- Endpoint: GET /API/HARRY-CLINTON/Cart-Items
  Short Description: View records list
  Long Description: Useful for listing and browsing records in admin/customer interfaces. Manage products, quantities, and prices inside carts.
- Endpoint: GET /API/HARRY-CLINTON/Cart-Items/:id
  Short Description: View one record
  Long Description: Useful for opening one specific record in detail view screens. Manage products, quantities, and prices inside carts.
- Endpoint: POST /API/HARRY-CLINTON/Cart-Items
  Short Description: Create new record
  Long Description: Useful when business users add new data needed for operations and customer experience. Manage products, quantities, and prices inside carts.
- Endpoint: PUT /API/HARRY-CLINTON/Cart-Items
  Short Description: Update existing record
  Long Description: Useful for correcting details, status changes, and keeping live data accurate. Manage products, quantities, and prices inside carts.
- Endpoint: DELETE /API/HARRY-CLINTON/Cart-Items
  Short Description: Delete/disable record
  Long Description: Useful for removing inactive data from active flows while maintaining data hygiene. Manage products, quantities, and prices inside carts.

### Module: /Carts
Table/Schema Reference: tbl_carts
Module Purpose: Manage active shopping carts before order placement.

- Endpoint: GET /API/HARRY-CLINTON/Carts
  Short Description: View records list
  Long Description: Useful for listing and browsing records in admin/customer interfaces. Manage active shopping carts before order placement.
- Endpoint: GET /API/HARRY-CLINTON/Carts/:id
  Short Description: View one record
  Long Description: Useful for opening one specific record in detail view screens. Manage active shopping carts before order placement.
- Endpoint: POST /API/HARRY-CLINTON/Carts
  Short Description: Create new record
  Long Description: Useful when business users add new data needed for operations and customer experience. Manage active shopping carts before order placement.
- Endpoint: PUT /API/HARRY-CLINTON/Carts
  Short Description: Update existing record
  Long Description: Useful for correcting details, status changes, and keeping live data accurate. Manage active shopping carts before order placement.
- Endpoint: DELETE /API/HARRY-CLINTON/Carts
  Short Description: Delete/disable record
  Long Description: Useful for removing inactive data from active flows while maintaining data hygiene. Manage active shopping carts before order placement.

## Module Group: F_Order_Management

### Module: /Invoices
Table/Schema Reference: tbl_invoices
Module Purpose: Manage invoice records generated for completed or billable orders.

- Endpoint: GET /API/HARRY-CLINTON/Invoices
  Short Description: View records list
  Long Description: Useful for listing and browsing records in admin/customer interfaces. Manage invoice records generated for completed or billable orders.
- Endpoint: GET /API/HARRY-CLINTON/Invoices/:id
  Short Description: View one record
  Long Description: Useful for opening one specific record in detail view screens. Manage invoice records generated for completed or billable orders.
- Endpoint: POST /API/HARRY-CLINTON/Invoices
  Short Description: Create new record
  Long Description: Useful when business users add new data needed for operations and customer experience. Manage invoice records generated for completed or billable orders.
- Endpoint: PUT /API/HARRY-CLINTON/Invoices
  Short Description: Update existing record
  Long Description: Useful for correcting details, status changes, and keeping live data accurate. Manage invoice records generated for completed or billable orders.
- Endpoint: DELETE /API/HARRY-CLINTON/Invoices
  Short Description: Delete/disable record
  Long Description: Useful for removing inactive data from active flows while maintaining data hygiene. Manage invoice records generated for completed or billable orders.

### Module: /Order-Addresses
Table/Schema Reference: tbl_order_addresses
Module Purpose: Store delivery and billing address snapshots for each order.

- Endpoint: GET /API/HARRY-CLINTON/Order-Addresses
  Short Description: View records list
  Long Description: Useful for listing and browsing records in admin/customer interfaces. Store delivery and billing address snapshots for each order.
- Endpoint: GET /API/HARRY-CLINTON/Order-Addresses/:id
  Short Description: View one record
  Long Description: Useful for opening one specific record in detail view screens. Store delivery and billing address snapshots for each order.
- Endpoint: POST /API/HARRY-CLINTON/Order-Addresses
  Short Description: Create new record
  Long Description: Useful when business users add new data needed for operations and customer experience. Store delivery and billing address snapshots for each order.
- Endpoint: PUT /API/HARRY-CLINTON/Order-Addresses
  Short Description: Update existing record
  Long Description: Useful for correcting details, status changes, and keeping live data accurate. Store delivery and billing address snapshots for each order.
- Endpoint: DELETE /API/HARRY-CLINTON/Order-Addresses
  Short Description: Delete/disable record
  Long Description: Useful for removing inactive data from active flows while maintaining data hygiene. Store delivery and billing address snapshots for each order.

### Module: /Order-Cancellations
Table/Schema Reference: tbl_order_cancellations
Module Purpose: Capture cancellation requests, reasons, and outcomes.

- Endpoint: GET /API/HARRY-CLINTON/Order-Cancellations
  Short Description: View records list
  Long Description: Useful for listing and browsing records in admin/customer interfaces. Capture cancellation requests, reasons, and outcomes.
- Endpoint: GET /API/HARRY-CLINTON/Order-Cancellations/:id
  Short Description: View one record
  Long Description: Useful for opening one specific record in detail view screens. Capture cancellation requests, reasons, and outcomes.
- Endpoint: POST /API/HARRY-CLINTON/Order-Cancellations
  Short Description: Create new record
  Long Description: Useful when business users add new data needed for operations and customer experience. Capture cancellation requests, reasons, and outcomes.
- Endpoint: PUT /API/HARRY-CLINTON/Order-Cancellations
  Short Description: Update existing record
  Long Description: Useful for correcting details, status changes, and keeping live data accurate. Capture cancellation requests, reasons, and outcomes.
- Endpoint: DELETE /API/HARRY-CLINTON/Order-Cancellations
  Short Description: Delete/disable record
  Long Description: Useful for removing inactive data from active flows while maintaining data hygiene. Capture cancellation requests, reasons, and outcomes.

### Module: /Order-Items
Table/Schema Reference: tbl_order_items
Module Purpose: Manage line items that belong to each order.

- Endpoint: GET /API/HARRY-CLINTON/Order-Items
  Short Description: View records list
  Long Description: Useful for listing and browsing records in admin/customer interfaces. Manage line items that belong to each order.
- Endpoint: GET /API/HARRY-CLINTON/Order-Items/:id
  Short Description: View one record
  Long Description: Useful for opening one specific record in detail view screens. Manage line items that belong to each order.
- Endpoint: POST /API/HARRY-CLINTON/Order-Items
  Short Description: Create new record
  Long Description: Useful when business users add new data needed for operations and customer experience. Manage line items that belong to each order.
- Endpoint: PUT /API/HARRY-CLINTON/Order-Items
  Short Description: Update existing record
  Long Description: Useful for correcting details, status changes, and keeping live data accurate. Manage line items that belong to each order.
- Endpoint: DELETE /API/HARRY-CLINTON/Order-Items
  Short Description: Delete/disable record
  Long Description: Useful for removing inactive data from active flows while maintaining data hygiene. Manage line items that belong to each order.

### Module: /Orders
Table/Schema Reference: tbl_orders
Module Purpose: Manage order headers representing customer purchases.

- Endpoint: GET /API/HARRY-CLINTON/Orders
  Short Description: View records list
  Long Description: Useful for listing and browsing records in admin/customer interfaces. Manage order headers representing customer purchases.
- Endpoint: GET /API/HARRY-CLINTON/Orders/:id
  Short Description: View one record
  Long Description: Useful for opening one specific record in detail view screens. Manage order headers representing customer purchases.
- Endpoint: POST /API/HARRY-CLINTON/Orders
  Short Description: Create new record
  Long Description: Useful when business users add new data needed for operations and customer experience. Manage order headers representing customer purchases.
- Endpoint: PUT /API/HARRY-CLINTON/Orders
  Short Description: Update existing record
  Long Description: Useful for correcting details, status changes, and keeping live data accurate. Manage order headers representing customer purchases.
- Endpoint: DELETE /API/HARRY-CLINTON/Orders
  Short Description: Delete/disable record
  Long Description: Useful for removing inactive data from active flows while maintaining data hygiene. Manage order headers representing customer purchases.

### Module: /Order-Status-History
Table/Schema Reference: tbl_order_status_history
Module Purpose: Track every order status transition over time.

- Endpoint: GET /API/HARRY-CLINTON/Order-Status-History
  Short Description: View records list
  Long Description: Useful for listing and browsing records in admin/customer interfaces. Track every order status transition over time.
- Endpoint: GET /API/HARRY-CLINTON/Order-Status-History/:id
  Short Description: View one record
  Long Description: Useful for opening one specific record in detail view screens. Track every order status transition over time.
- Endpoint: POST /API/HARRY-CLINTON/Order-Status-History
  Short Description: Create new record
  Long Description: Useful when business users add new data needed for operations and customer experience. Track every order status transition over time.
- Endpoint: PUT /API/HARRY-CLINTON/Order-Status-History
  Short Description: Update existing record
  Long Description: Useful for correcting details, status changes, and keeping live data accurate. Track every order status transition over time.
- Endpoint: DELETE /API/HARRY-CLINTON/Order-Status-History
  Short Description: Delete/disable record
  Long Description: Useful for removing inactive data from active flows while maintaining data hygiene. Track every order status transition over time.

### Module: /Order-Status-Master
Table/Schema Reference: tbl_order_status_master
Module Purpose: Manage valid order statuses used in lifecycle tracking.

- Endpoint: GET /API/HARRY-CLINTON/Order-Status-Master
  Short Description: View records list
  Long Description: Useful for listing and browsing records in admin/customer interfaces. Manage valid order statuses used in lifecycle tracking.
- Endpoint: GET /API/HARRY-CLINTON/Order-Status-Master/:id
  Short Description: View one record
  Long Description: Useful for opening one specific record in detail view screens. Manage valid order statuses used in lifecycle tracking.
- Endpoint: POST /API/HARRY-CLINTON/Order-Status-Master
  Short Description: Create new record
  Long Description: Useful when business users add new data needed for operations and customer experience. Manage valid order statuses used in lifecycle tracking.
- Endpoint: PUT /API/HARRY-CLINTON/Order-Status-Master
  Short Description: Update existing record
  Long Description: Useful for correcting details, status changes, and keeping live data accurate. Manage valid order statuses used in lifecycle tracking.
- Endpoint: DELETE /API/HARRY-CLINTON/Order-Status-Master
  Short Description: Delete/disable record
  Long Description: Useful for removing inactive data from active flows while maintaining data hygiene. Manage valid order statuses used in lifecycle tracking.

## Module Group: G_Payments

### Module: /Payments
Table/Schema Reference: tbl_payments
Module Purpose: Record payment transactions, status, and reconciliation fields.

- Endpoint: GET /API/HARRY-CLINTON/Payments
  Short Description: View records list
  Long Description: Useful for listing and browsing records in admin/customer interfaces. Record payment transactions, status, and reconciliation fields.
- Endpoint: GET /API/HARRY-CLINTON/Payments/:id
  Short Description: View one record
  Long Description: Useful for opening one specific record in detail view screens. Record payment transactions, status, and reconciliation fields.
- Endpoint: POST /API/HARRY-CLINTON/Payments
  Short Description: Create new record
  Long Description: Useful when business users add new data needed for operations and customer experience. Record payment transactions, status, and reconciliation fields.
- Endpoint: PUT /API/HARRY-CLINTON/Payments
  Short Description: Update existing record
  Long Description: Useful for correcting details, status changes, and keeping live data accurate. Record payment transactions, status, and reconciliation fields.
- Endpoint: DELETE /API/HARRY-CLINTON/Payments
  Short Description: Delete/disable record
  Long Description: Useful for removing inactive data from active flows while maintaining data hygiene. Record payment transactions, status, and reconciliation fields.

## Module Group: H_Coupons_&_Discounts

### Module: /Coupons
Table/Schema Reference: tbl_coupons
Module Purpose: Manage coupon definitions and eligibility settings.

- Endpoint: GET /API/HARRY-CLINTON/Coupons
  Short Description: View records list
  Long Description: Useful for listing and browsing records in admin/customer interfaces. Manage coupon definitions and eligibility settings.
- Endpoint: GET /API/HARRY-CLINTON/Coupons/:id
  Short Description: View one record
  Long Description: Useful for opening one specific record in detail view screens. Manage coupon definitions and eligibility settings.
- Endpoint: POST /API/HARRY-CLINTON/Coupons
  Short Description: Create new record
  Long Description: Useful when business users add new data needed for operations and customer experience. Manage coupon definitions and eligibility settings.
- Endpoint: PUT /API/HARRY-CLINTON/Coupons
  Short Description: Update existing record
  Long Description: Useful for correcting details, status changes, and keeping live data accurate. Manage coupon definitions and eligibility settings.
- Endpoint: DELETE /API/HARRY-CLINTON/Coupons
  Short Description: Delete/disable record
  Long Description: Useful for removing inactive data from active flows while maintaining data hygiene. Manage coupon definitions and eligibility settings.

### Module: /Coupon-Usage
Table/Schema Reference: tbl_coupon_usage
Module Purpose: Track coupon consumption by users and orders to control misuse.

- Endpoint: GET /API/HARRY-CLINTON/Coupon-Usage
  Short Description: View records list
  Long Description: Useful for listing and browsing records in admin/customer interfaces. Track coupon consumption by users and orders to control misuse.
- Endpoint: GET /API/HARRY-CLINTON/Coupon-Usage/:id
  Short Description: View one record
  Long Description: Useful for opening one specific record in detail view screens. Track coupon consumption by users and orders to control misuse.
- Endpoint: POST /API/HARRY-CLINTON/Coupon-Usage
  Short Description: Create new record
  Long Description: Useful when business users add new data needed for operations and customer experience. Track coupon consumption by users and orders to control misuse.
- Endpoint: PUT /API/HARRY-CLINTON/Coupon-Usage
  Short Description: Update existing record
  Long Description: Useful for correcting details, status changes, and keeping live data accurate. Track coupon consumption by users and orders to control misuse.
- Endpoint: DELETE /API/HARRY-CLINTON/Coupon-Usage
  Short Description: Delete/disable record
  Long Description: Useful for removing inactive data from active flows while maintaining data hygiene. Track coupon consumption by users and orders to control misuse.

### Module: /Discounts
Table/Schema Reference: tbl_discounts
Module Purpose: Manage discount rules that can apply across product/order contexts.

- Endpoint: GET /API/HARRY-CLINTON/Discounts
  Short Description: View records list
  Long Description: Useful for listing and browsing records in admin/customer interfaces. Manage discount rules that can apply across product/order contexts.
- Endpoint: GET /API/HARRY-CLINTON/Discounts/:id
  Short Description: View one record
  Long Description: Useful for opening one specific record in detail view screens. Manage discount rules that can apply across product/order contexts.
- Endpoint: POST /API/HARRY-CLINTON/Discounts
  Short Description: Create new record
  Long Description: Useful when business users add new data needed for operations and customer experience. Manage discount rules that can apply across product/order contexts.
- Endpoint: PUT /API/HARRY-CLINTON/Discounts
  Short Description: Update existing record
  Long Description: Useful for correcting details, status changes, and keeping live data accurate. Manage discount rules that can apply across product/order contexts.
- Endpoint: DELETE /API/HARRY-CLINTON/Discounts
  Short Description: Delete/disable record
  Long Description: Useful for removing inactive data from active flows while maintaining data hygiene. Manage discount rules that can apply across product/order contexts.

### Module: /Discount-Targets
Table/Schema Reference: tbl_discount_targets
Module Purpose: Map discounts to applicable targets such as products or collections.

- Endpoint: GET /API/HARRY-CLINTON/Discount-Targets
  Short Description: View records list
  Long Description: Useful for listing and browsing records in admin/customer interfaces. Map discounts to applicable targets such as products or collections.
- Endpoint: GET /API/HARRY-CLINTON/Discount-Targets/:id
  Short Description: View one record
  Long Description: Useful for opening one specific record in detail view screens. Map discounts to applicable targets such as products or collections.
- Endpoint: POST /API/HARRY-CLINTON/Discount-Targets
  Short Description: Create new record
  Long Description: Useful when business users add new data needed for operations and customer experience. Map discounts to applicable targets such as products or collections.
- Endpoint: PUT /API/HARRY-CLINTON/Discount-Targets
  Short Description: Update existing record
  Long Description: Useful for correcting details, status changes, and keeping live data accurate. Map discounts to applicable targets such as products or collections.
- Endpoint: DELETE /API/HARRY-CLINTON/Discount-Targets
  Short Description: Delete/disable record
  Long Description: Useful for removing inactive data from active flows while maintaining data hygiene. Map discounts to applicable targets such as products or collections.

### Module: /Order-Promotions
Table/Schema Reference: tbl_order_promotions
Module Purpose: Store promotion benefits actually applied to placed orders.

- Endpoint: GET /API/HARRY-CLINTON/Order-Promotions
  Short Description: View records list
  Long Description: Useful for listing and browsing records in admin/customer interfaces. Store promotion benefits actually applied to placed orders.
- Endpoint: GET /API/HARRY-CLINTON/Order-Promotions/:id
  Short Description: View one record
  Long Description: Useful for opening one specific record in detail view screens. Store promotion benefits actually applied to placed orders.
- Endpoint: POST /API/HARRY-CLINTON/Order-Promotions
  Short Description: Create new record
  Long Description: Useful when business users add new data needed for operations and customer experience. Store promotion benefits actually applied to placed orders.
- Endpoint: PUT /API/HARRY-CLINTON/Order-Promotions
  Short Description: Update existing record
  Long Description: Useful for correcting details, status changes, and keeping live data accurate. Store promotion benefits actually applied to placed orders.
- Endpoint: DELETE /API/HARRY-CLINTON/Order-Promotions
  Short Description: Delete/disable record
  Long Description: Useful for removing inactive data from active flows while maintaining data hygiene. Store promotion benefits actually applied to placed orders.

## Module Group: HC_A_Header_Running_Bars

### Module: /Running-Bar
Table/Schema Reference: tbl_running_bars
Module Purpose: Manage running information bars used for high-visibility announcements.

- Endpoint: GET /API/HARRY-CLINTON/Running-Bar
  Short Description: View records list
  Long Description: Useful for listing and browsing records in admin/customer interfaces. Manage running information bars used for high-visibility announcements.
- Endpoint: GET /API/HARRY-CLINTON/Running-Bar/:id
  Short Description: View one record
  Long Description: Useful for opening one specific record in detail view screens. Manage running information bars used for high-visibility announcements.
- Endpoint: POST /API/HARRY-CLINTON/Running-Bar
  Short Description: Create new record
  Long Description: Useful when business users add new data needed for operations and customer experience. Manage running information bars used for high-visibility announcements.
- Endpoint: PUT /API/HARRY-CLINTON/Running-Bar
  Short Description: Update existing record
  Long Description: Useful for correcting details, status changes, and keeping live data accurate. Manage running information bars used for high-visibility announcements.
- Endpoint: DELETE /API/HARRY-CLINTON/Running-Bar
  Short Description: Delete/disable record
  Long Description: Useful for removing inactive data from active flows while maintaining data hygiene. Manage running information bars used for high-visibility announcements.

### Module: /Running-Bar-Items
Table/Schema Reference: tbl_running_bar_items
Module Purpose: Manage items/messages shown inside each running bar.

- Endpoint: GET /API/HARRY-CLINTON/Running-Bar-Items
  Short Description: View records list
  Long Description: Useful for listing and browsing records in admin/customer interfaces. Manage items/messages shown inside each running bar.
- Endpoint: GET /API/HARRY-CLINTON/Running-Bar-Items/:id
  Short Description: View one record
  Long Description: Useful for opening one specific record in detail view screens. Manage items/messages shown inside each running bar.
- Endpoint: POST /API/HARRY-CLINTON/Running-Bar-Items
  Short Description: Create new record
  Long Description: Useful when business users add new data needed for operations and customer experience. Manage items/messages shown inside each running bar.
- Endpoint: PUT /API/HARRY-CLINTON/Running-Bar-Items
  Short Description: Update existing record
  Long Description: Useful for correcting details, status changes, and keeping live data accurate. Manage items/messages shown inside each running bar.
- Endpoint: DELETE /API/HARRY-CLINTON/Running-Bar-Items
  Short Description: Delete/disable record
  Long Description: Useful for removing inactive data from active flows while maintaining data hygiene. Manage items/messages shown inside each running bar.

## Module Group: HC_B_Menu_Navigation

### Module: /Menu-Category
Table/Schema Reference: tbl_menu_categories
Module Purpose: Manage top-level menu categories used for site navigation.

- Endpoint: GET /API/HARRY-CLINTON/Menu-Category
  Short Description: View records list
  Long Description: Useful for listing and browsing records in admin/customer interfaces. Manage top-level menu categories used for site navigation.
- Endpoint: GET /API/HARRY-CLINTON/Menu-Category/:id
  Short Description: View one record
  Long Description: Useful for opening one specific record in detail view screens. Manage top-level menu categories used for site navigation.
- Endpoint: POST /API/HARRY-CLINTON/Menu-Category
  Short Description: Create new record
  Long Description: Useful when business users add new data needed for operations and customer experience. Manage top-level menu categories used for site navigation.
- Endpoint: PUT /API/HARRY-CLINTON/Menu-Category
  Short Description: Update existing record
  Long Description: Useful for correcting details, status changes, and keeping live data accurate. Manage top-level menu categories used for site navigation.
- Endpoint: DELETE /API/HARRY-CLINTON/Menu-Category
  Short Description: Delete/disable record
  Long Description: Useful for removing inactive data from active flows while maintaining data hygiene. Manage top-level menu categories used for site navigation.

### Module: /Menu-Sub-Category
Table/Schema Reference: tbl_menu_subcategories
Module Purpose: Manage sub-categories under top-level navigation.

- Endpoint: GET /API/HARRY-CLINTON/Menu-Sub-Category
  Short Description: View records list
  Long Description: Useful for listing and browsing records in admin/customer interfaces. Manage sub-categories under top-level navigation.
- Endpoint: GET /API/HARRY-CLINTON/Menu-Sub-Category/:id
  Short Description: View one record
  Long Description: Useful for opening one specific record in detail view screens. Manage sub-categories under top-level navigation.
- Endpoint: POST /API/HARRY-CLINTON/Menu-Sub-Category
  Short Description: Create new record
  Long Description: Useful when business users add new data needed for operations and customer experience. Manage sub-categories under top-level navigation.
- Endpoint: PUT /API/HARRY-CLINTON/Menu-Sub-Category
  Short Description: Update existing record
  Long Description: Useful for correcting details, status changes, and keeping live data accurate. Manage sub-categories under top-level navigation.
- Endpoint: DELETE /API/HARRY-CLINTON/Menu-Sub-Category
  Short Description: Delete/disable record
  Long Description: Useful for removing inactive data from active flows while maintaining data hygiene. Manage sub-categories under top-level navigation.

## Module Group: HC_C_Home_Visuals

### Module: /Image-Sliders
Table/Schema Reference: tbl_image_sliders
Module Purpose: Manage homepage slider visuals and ordering.

- Endpoint: GET /API/HARRY-CLINTON/Image-Sliders
  Short Description: View records list
  Long Description: Useful for listing and browsing records in admin/customer interfaces. Manage homepage slider visuals and ordering.
- Endpoint: GET /API/HARRY-CLINTON/Image-Sliders/:id
  Short Description: View one record
  Long Description: Useful for opening one specific record in detail view screens. Manage homepage slider visuals and ordering.
- Endpoint: POST /API/HARRY-CLINTON/Image-Sliders
  Short Description: Create new record
  Long Description: Useful when business users add new data needed for operations and customer experience. Manage homepage slider visuals and ordering.
- Endpoint: PUT /API/HARRY-CLINTON/Image-Sliders
  Short Description: Update existing record
  Long Description: Useful for correcting details, status changes, and keeping live data accurate. Manage homepage slider visuals and ordering.
- Endpoint: DELETE /API/HARRY-CLINTON/Image-Sliders
  Short Description: Delete/disable record
  Long Description: Useful for removing inactive data from active flows while maintaining data hygiene. Manage homepage slider visuals and ordering.

### Module: /Menu-Video
Table/Schema Reference: tbl_menu_videos
Module Purpose: Manage menu/hero videos used in visual merchandising.

- Endpoint: GET /API/HARRY-CLINTON/Menu-Video
  Short Description: View records list
  Long Description: Useful for listing and browsing records in admin/customer interfaces. Manage menu/hero videos used in visual merchandising.
- Endpoint: GET /API/HARRY-CLINTON/Menu-Video/:id
  Short Description: View one record
  Long Description: Useful for opening one specific record in detail view screens. Manage menu/hero videos used in visual merchandising.
- Endpoint: POST /API/HARRY-CLINTON/Menu-Video
  Short Description: Create new record
  Long Description: Useful when business users add new data needed for operations and customer experience. Manage menu/hero videos used in visual merchandising.
- Endpoint: PUT /API/HARRY-CLINTON/Menu-Video
  Short Description: Update existing record
  Long Description: Useful for correcting details, status changes, and keeping live data accurate. Manage menu/hero videos used in visual merchandising.
- Endpoint: DELETE /API/HARRY-CLINTON/Menu-Video
  Short Description: Delete/disable record
  Long Description: Useful for removing inactive data from active flows while maintaining data hygiene. Manage menu/hero videos used in visual merchandising.

## Module Group: HC_D_Spotlight

### Module: /Spotlight-Entries
Table/Schema Reference: tbl_spotlight_entries
Module Purpose: Manage spotlight stories or featured blocks.

- Endpoint: GET /API/HARRY-CLINTON/Spotlight-Entries
  Short Description: View records list
  Long Description: Useful for listing and browsing records in admin/customer interfaces. Manage spotlight stories or featured blocks.
- Endpoint: GET /API/HARRY-CLINTON/Spotlight-Entries/:id
  Short Description: View one record
  Long Description: Useful for opening one specific record in detail view screens. Manage spotlight stories or featured blocks.
- Endpoint: POST /API/HARRY-CLINTON/Spotlight-Entries
  Short Description: Create new record
  Long Description: Useful when business users add new data needed for operations and customer experience. Manage spotlight stories or featured blocks.
- Endpoint: PUT /API/HARRY-CLINTON/Spotlight-Entries
  Short Description: Update existing record
  Long Description: Useful for correcting details, status changes, and keeping live data accurate. Manage spotlight stories or featured blocks.
- Endpoint: DELETE /API/HARRY-CLINTON/Spotlight-Entries
  Short Description: Delete/disable record
  Long Description: Useful for removing inactive data from active flows while maintaining data hygiene. Manage spotlight stories or featured blocks.

### Module: /Spotlight-Media
Table/Schema Reference: tbl_spotlight_media
Module Purpose: Manage media assets for spotlight entries.

- Endpoint: GET /API/HARRY-CLINTON/Spotlight-Media
  Short Description: View records list
  Long Description: Useful for listing and browsing records in admin/customer interfaces. Manage media assets for spotlight entries.
- Endpoint: GET /API/HARRY-CLINTON/Spotlight-Media/:id
  Short Description: View one record
  Long Description: Useful for opening one specific record in detail view screens. Manage media assets for spotlight entries.
- Endpoint: POST /API/HARRY-CLINTON/Spotlight-Media
  Short Description: Create new record
  Long Description: Useful when business users add new data needed for operations and customer experience. Manage media assets for spotlight entries.
- Endpoint: PUT /API/HARRY-CLINTON/Spotlight-Media
  Short Description: Update existing record
  Long Description: Useful for correcting details, status changes, and keeping live data accurate. Manage media assets for spotlight entries.
- Endpoint: DELETE /API/HARRY-CLINTON/Spotlight-Media
  Short Description: Delete/disable record
  Long Description: Useful for removing inactive data from active flows while maintaining data hygiene. Manage media assets for spotlight entries.

## Module Group: HC_E_Style_by_HC

### Module: /Style-Collection-Media
Table/Schema Reference: tbl_style_collection_media
Module Purpose: Manage media items attached to style collections.

- Endpoint: GET /API/HARRY-CLINTON/Style-Collection-Media
  Short Description: View records list
  Long Description: Useful for listing and browsing records in admin/customer interfaces. Manage media items attached to style collections.
- Endpoint: GET /API/HARRY-CLINTON/Style-Collection-Media/:id
  Short Description: View one record
  Long Description: Useful for opening one specific record in detail view screens. Manage media items attached to style collections.
- Endpoint: POST /API/HARRY-CLINTON/Style-Collection-Media
  Short Description: Create new record
  Long Description: Useful when business users add new data needed for operations and customer experience. Manage media items attached to style collections.
- Endpoint: PUT /API/HARRY-CLINTON/Style-Collection-Media
  Short Description: Update existing record
  Long Description: Useful for correcting details, status changes, and keeping live data accurate. Manage media items attached to style collections.
- Endpoint: DELETE /API/HARRY-CLINTON/Style-Collection-Media
  Short Description: Delete/disable record
  Long Description: Useful for removing inactive data from active flows while maintaining data hygiene. Manage media items attached to style collections.

### Module: /Style-Collections
Table/Schema Reference: tbl_style_collections
Module Purpose: Manage style collections for lookbook-like discovery.

- Endpoint: GET /API/HARRY-CLINTON/Style-Collections
  Short Description: View records list
  Long Description: Useful for listing and browsing records in admin/customer interfaces. Manage style collections for lookbook-like discovery.
- Endpoint: GET /API/HARRY-CLINTON/Style-Collections/:id
  Short Description: View one record
  Long Description: Useful for opening one specific record in detail view screens. Manage style collections for lookbook-like discovery.
- Endpoint: POST /API/HARRY-CLINTON/Style-Collections
  Short Description: Create new record
  Long Description: Useful when business users add new data needed for operations and customer experience. Manage style collections for lookbook-like discovery.
- Endpoint: PUT /API/HARRY-CLINTON/Style-Collections
  Short Description: Update existing record
  Long Description: Useful for correcting details, status changes, and keeping live data accurate. Manage style collections for lookbook-like discovery.
- Endpoint: DELETE /API/HARRY-CLINTON/Style-Collections
  Short Description: Delete/disable record
  Long Description: Useful for removing inactive data from active flows while maintaining data hygiene. Manage style collections for lookbook-like discovery.

## Module Group: HC_F_Appointments

### Module: /Appointment-Date-Slots
Table/Schema Reference: tbl_appointment_date_slots
Module Purpose: Manage available appointment dates.

- Endpoint: GET /API/HARRY-CLINTON/Appointment-Date-Slots
  Short Description: View records list
  Long Description: Useful for listing and browsing records in admin/customer interfaces. Manage available appointment dates.
- Endpoint: GET /API/HARRY-CLINTON/Appointment-Date-Slots/:id
  Short Description: View one record
  Long Description: Useful for opening one specific record in detail view screens. Manage available appointment dates.
- Endpoint: POST /API/HARRY-CLINTON/Appointment-Date-Slots
  Short Description: Create new record
  Long Description: Useful when business users add new data needed for operations and customer experience. Manage available appointment dates.
- Endpoint: PUT /API/HARRY-CLINTON/Appointment-Date-Slots
  Short Description: Update existing record
  Long Description: Useful for correcting details, status changes, and keeping live data accurate. Manage available appointment dates.
- Endpoint: DELETE /API/HARRY-CLINTON/Appointment-Date-Slots
  Short Description: Delete/disable record
  Long Description: Useful for removing inactive data from active flows while maintaining data hygiene. Manage available appointment dates.

### Module: /Appointment-Slot-Blocks
Table/Schema Reference: tbl_appointment_slot_blocks
Module Purpose: Block date/time windows to prevent booking in unavailable periods.

- Endpoint: GET /API/HARRY-CLINTON/Appointment-Slot-Blocks
  Short Description: View records list
  Long Description: Useful for listing and browsing records in admin/customer interfaces. Block date/time windows to prevent booking in unavailable periods.
- Endpoint: GET /API/HARRY-CLINTON/Appointment-Slot-Blocks/:id
  Short Description: View one record
  Long Description: Useful for opening one specific record in detail view screens. Block date/time windows to prevent booking in unavailable periods.
- Endpoint: POST /API/HARRY-CLINTON/Appointment-Slot-Blocks
  Short Description: Create new record
  Long Description: Useful when business users add new data needed for operations and customer experience. Block date/time windows to prevent booking in unavailable periods.
- Endpoint: PUT /API/HARRY-CLINTON/Appointment-Slot-Blocks
  Short Description: Update existing record
  Long Description: Useful for correcting details, status changes, and keeping live data accurate. Block date/time windows to prevent booking in unavailable periods.
- Endpoint: DELETE /API/HARRY-CLINTON/Appointment-Slot-Blocks
  Short Description: Delete/disable record
  Long Description: Useful for removing inactive data from active flows while maintaining data hygiene. Block date/time windows to prevent booking in unavailable periods.

### Module: /Appointment-Time-Slots
Table/Schema Reference: tbl_appointment_time_slots
Module Purpose: Manage available appointment times under date slots.

- Endpoint: GET /API/HARRY-CLINTON/Appointment-Time-Slots
  Short Description: View records list
  Long Description: Useful for listing and browsing records in admin/customer interfaces. Manage available appointment times under date slots.
- Endpoint: GET /API/HARRY-CLINTON/Appointment-Time-Slots/:id
  Short Description: View one record
  Long Description: Useful for opening one specific record in detail view screens. Manage available appointment times under date slots.
- Endpoint: POST /API/HARRY-CLINTON/Appointment-Time-Slots
  Short Description: Create new record
  Long Description: Useful when business users add new data needed for operations and customer experience. Manage available appointment times under date slots.
- Endpoint: PUT /API/HARRY-CLINTON/Appointment-Time-Slots
  Short Description: Update existing record
  Long Description: Useful for correcting details, status changes, and keeping live data accurate. Manage available appointment times under date slots.
- Endpoint: DELETE /API/HARRY-CLINTON/Appointment-Time-Slots
  Short Description: Delete/disable record
  Long Description: Useful for removing inactive data from active flows while maintaining data hygiene. Manage available appointment times under date slots.
- Endpoint: GET /API/HARRY-CLINTON/Appointment-Time-Slots/by-date/:appointment_date_slot_id
  Short Description: View time slots by date
  Long Description: Useful for showing available appointment times for a selected date. Manage available appointment times under date slots.

### Module: /Custom-Appointments
Table/Schema Reference: tbl_custom_appointments
Module Purpose: Manage appointment bookings submitted by customers.

- Endpoint: GET /API/HARRY-CLINTON/Custom-Appointments
  Short Description: View records list
  Long Description: Useful for listing and browsing records in admin/customer interfaces. Manage appointment bookings submitted by customers.
- Endpoint: GET /API/HARRY-CLINTON/Custom-Appointments/:id
  Short Description: View one record
  Long Description: Useful for opening one specific record in detail view screens. Manage appointment bookings submitted by customers.
- Endpoint: POST /API/HARRY-CLINTON/Custom-Appointments
  Short Description: Create new record
  Long Description: Useful when business users add new data needed for operations and customer experience. Manage appointment bookings submitted by customers.
- Endpoint: PUT /API/HARRY-CLINTON/Custom-Appointments
  Short Description: Update existing record
  Long Description: Useful for correcting details, status changes, and keeping live data accurate. Manage appointment bookings submitted by customers.
- Endpoint: DELETE /API/HARRY-CLINTON/Custom-Appointments
  Short Description: Delete/disable record
  Long Description: Useful for removing inactive data from active flows while maintaining data hygiene. Manage appointment bookings submitted by customers.

## Module Group: I_ Shipping_&_Delivery

### Module: /Courier-Partners
Table/Schema Reference: tbl_courier_partners
Module Purpose: Manage courier providers and their operational profile data.

- Endpoint: GET /API/HARRY-CLINTON/Courier-Partners
  Short Description: View records list
  Long Description: Useful for listing and browsing records in admin/customer interfaces. Manage courier providers and their operational profile data.
- Endpoint: GET /API/HARRY-CLINTON/Courier-Partners/:id
  Short Description: View one record
  Long Description: Useful for opening one specific record in detail view screens. Manage courier providers and their operational profile data.
- Endpoint: POST /API/HARRY-CLINTON/Courier-Partners
  Short Description: Create new record
  Long Description: Useful when business users add new data needed for operations and customer experience. Manage courier providers and their operational profile data.
- Endpoint: PUT /API/HARRY-CLINTON/Courier-Partners
  Short Description: Update existing record
  Long Description: Useful for correcting details, status changes, and keeping live data accurate. Manage courier providers and their operational profile data.
- Endpoint: DELETE /API/HARRY-CLINTON/Courier-Partners
  Short Description: Delete/disable record
  Long Description: Useful for removing inactive data from active flows while maintaining data hygiene. Manage courier providers and their operational profile data.

### Module: /Shipment-Events
Table/Schema Reference: tbl_shipment_events
Module Purpose: Track shipment movement events for customer tracking visibility.

- Endpoint: GET /API/HARRY-CLINTON/Shipment-Events
  Short Description: View records list
  Long Description: Useful for listing and browsing records in admin/customer interfaces. Track shipment movement events for customer tracking visibility.
- Endpoint: GET /API/HARRY-CLINTON/Shipment-Events/:id
  Short Description: View one record
  Long Description: Useful for opening one specific record in detail view screens. Track shipment movement events for customer tracking visibility.
- Endpoint: POST /API/HARRY-CLINTON/Shipment-Events
  Short Description: Create new record
  Long Description: Useful when business users add new data needed for operations and customer experience. Track shipment movement events for customer tracking visibility.
- Endpoint: PUT /API/HARRY-CLINTON/Shipment-Events
  Short Description: Update existing record
  Long Description: Useful for correcting details, status changes, and keeping live data accurate. Track shipment movement events for customer tracking visibility.
- Endpoint: DELETE /API/HARRY-CLINTON/Shipment-Events
  Short Description: Delete/disable record
  Long Description: Useful for removing inactive data from active flows while maintaining data hygiene. Track shipment movement events for customer tracking visibility.

### Module: /Shipments
Table/Schema Reference: tbl_shipments
Module Purpose: Manage shipment records linked to orders and couriers.

- Endpoint: GET /API/HARRY-CLINTON/Shipments
  Short Description: View records list
  Long Description: Useful for listing and browsing records in admin/customer interfaces. Manage shipment records linked to orders and couriers.
- Endpoint: GET /API/HARRY-CLINTON/Shipments/:id
  Short Description: View one record
  Long Description: Useful for opening one specific record in detail view screens. Manage shipment records linked to orders and couriers.
- Endpoint: POST /API/HARRY-CLINTON/Shipments
  Short Description: Create new record
  Long Description: Useful when business users add new data needed for operations and customer experience. Manage shipment records linked to orders and couriers.
- Endpoint: PUT /API/HARRY-CLINTON/Shipments
  Short Description: Update existing record
  Long Description: Useful for correcting details, status changes, and keeping live data accurate. Manage shipment records linked to orders and couriers.
- Endpoint: DELETE /API/HARRY-CLINTON/Shipments
  Short Description: Delete/disable record
  Long Description: Useful for removing inactive data from active flows while maintaining data hygiene. Manage shipment records linked to orders and couriers.

## Module Group: J_Returns_&_Refunds

### Module: /Refunds
Table/Schema Reference: tbl_refunds
Module Purpose: Manage refund records linked to approved return/payment flows.

- Endpoint: GET /API/HARRY-CLINTON/Refunds
  Short Description: View records list
  Long Description: Useful for listing and browsing records in admin/customer interfaces. Manage refund records linked to approved return/payment flows.
- Endpoint: GET /API/HARRY-CLINTON/Refunds/:id
  Short Description: View one record
  Long Description: Useful for opening one specific record in detail view screens. Manage refund records linked to approved return/payment flows.
- Endpoint: POST /API/HARRY-CLINTON/Refunds
  Short Description: Create new record
  Long Description: Useful when business users add new data needed for operations and customer experience. Manage refund records linked to approved return/payment flows.
- Endpoint: PUT /API/HARRY-CLINTON/Refunds
  Short Description: Update existing record
  Long Description: Useful for correcting details, status changes, and keeping live data accurate. Manage refund records linked to approved return/payment flows.
- Endpoint: DELETE /API/HARRY-CLINTON/Refunds
  Short Description: Delete/disable record
  Long Description: Useful for removing inactive data from active flows while maintaining data hygiene. Manage refund records linked to approved return/payment flows.

### Module: /Returns
Table/Schema Reference: tbl_returns
Module Purpose: Manage customer return requests and their processing state.

- Endpoint: GET /API/HARRY-CLINTON/Returns
  Short Description: View records list
  Long Description: Useful for listing and browsing records in admin/customer interfaces. Manage customer return requests and their processing state.
- Endpoint: GET /API/HARRY-CLINTON/Returns/:id
  Short Description: View one record
  Long Description: Useful for opening one specific record in detail view screens. Manage customer return requests and their processing state.
- Endpoint: POST /API/HARRY-CLINTON/Returns
  Short Description: Create new record
  Long Description: Useful when business users add new data needed for operations and customer experience. Manage customer return requests and their processing state.
- Endpoint: PUT /API/HARRY-CLINTON/Returns
  Short Description: Update existing record
  Long Description: Useful for correcting details, status changes, and keeping live data accurate. Manage customer return requests and their processing state.
- Endpoint: DELETE /API/HARRY-CLINTON/Returns
  Short Description: Delete/disable record
  Long Description: Useful for removing inactive data from active flows while maintaining data hygiene. Manage customer return requests and their processing state.

## Module Group: K_Support_Content_&_System_Configuration

### Module: /FAQs
Table/Schema Reference: tbl_faqs
Module Purpose: Manage frequently asked questions displayed on help pages.

- Endpoint: GET /API/HARRY-CLINTON/FAQs
  Short Description: View records list
  Long Description: Useful for listing and browsing records in admin/customer interfaces. Manage frequently asked questions displayed on help pages.
- Endpoint: GET /API/HARRY-CLINTON/FAQs/:id
  Short Description: View one record
  Long Description: Useful for opening one specific record in detail view screens. Manage frequently asked questions displayed on help pages.
- Endpoint: POST /API/HARRY-CLINTON/FAQs
  Short Description: Create new record
  Long Description: Useful when business users add new data needed for operations and customer experience. Manage frequently asked questions displayed on help pages.
- Endpoint: PUT /API/HARRY-CLINTON/FAQs
  Short Description: Update existing record
  Long Description: Useful for correcting details, status changes, and keeping live data accurate. Manage frequently asked questions displayed on help pages.
- Endpoint: DELETE /API/HARRY-CLINTON/FAQs
  Short Description: Delete/disable record
  Long Description: Useful for removing inactive data from active flows while maintaining data hygiene. Manage frequently asked questions displayed on help pages.

### Module: /Legal-Page-Headers
Table/Schema Reference: tbl_legal_page_header
Module Purpose: Manage legal page header content such as page title and intro metadata.

- Endpoint: GET /API/HARRY-CLINTON/Legal-Page-Headers
  Short Description: View records list
  Long Description: Useful for listing and browsing records in admin/customer interfaces. Manage legal page header content such as page title and intro metadata.
- Endpoint: GET /API/HARRY-CLINTON/Legal-Page-Headers/:id
  Short Description: View one record
  Long Description: Useful for opening one specific record in detail view screens. Manage legal page header content such as page title and intro metadata.
- Endpoint: POST /API/HARRY-CLINTON/Legal-Page-Headers
  Short Description: Create new record
  Long Description: Useful when business users add new data needed for operations and customer experience. Manage legal page header content such as page title and intro metadata.
- Endpoint: PUT /API/HARRY-CLINTON/Legal-Page-Headers
  Short Description: Update existing record
  Long Description: Useful for correcting details, status changes, and keeping live data accurate. Manage legal page header content such as page title and intro metadata.
- Endpoint: DELETE /API/HARRY-CLINTON/Legal-Page-Headers
  Short Description: Delete/disable record
  Long Description: Useful for removing inactive data from active flows while maintaining data hygiene. Manage legal page header content such as page title and intro metadata.

### Module: /Legal-Page-Sections
Table/Schema Reference: tbl_legal_page_sections
Module Purpose: Manage legal content sections displayed on policy/terms pages.

- Endpoint: GET /API/HARRY-CLINTON/Legal-Page-Sections
  Short Description: View records list
  Long Description: Useful for listing and browsing records in admin/customer interfaces. Manage legal content sections displayed on policy/terms pages.
- Endpoint: GET /API/HARRY-CLINTON/Legal-Page-Sections/:id
  Short Description: View one record
  Long Description: Useful for opening one specific record in detail view screens. Manage legal content sections displayed on policy/terms pages.
- Endpoint: POST /API/HARRY-CLINTON/Legal-Page-Sections
  Short Description: Create new record
  Long Description: Useful when business users add new data needed for operations and customer experience. Manage legal content sections displayed on policy/terms pages.
- Endpoint: PUT /API/HARRY-CLINTON/Legal-Page-Sections
  Short Description: Update existing record
  Long Description: Useful for correcting details, status changes, and keeping live data accurate. Manage legal content sections displayed on policy/terms pages.
- Endpoint: DELETE /API/HARRY-CLINTON/Legal-Page-Sections
  Short Description: Delete/disable record
  Long Description: Useful for removing inactive data from active flows while maintaining data hygiene. Manage legal content sections displayed on policy/terms pages.

### Module: /Newsletter-Subscriptions
Table/Schema Reference: tbl_newsletter_subscriptions
Module Purpose: Manage newsletter opt-ins and audience records.

- Endpoint: GET /API/HARRY-CLINTON/Newsletter-Subscriptions
  Short Description: View records list
  Long Description: Useful for listing and browsing records in admin/customer interfaces. Manage newsletter opt-ins and audience records.
- Endpoint: GET /API/HARRY-CLINTON/Newsletter-Subscriptions/:id
  Short Description: View one record
  Long Description: Useful for opening one specific record in detail view screens. Manage newsletter opt-ins and audience records.
- Endpoint: POST /API/HARRY-CLINTON/Newsletter-Subscriptions
  Short Description: Create new record
  Long Description: Useful when business users add new data needed for operations and customer experience. Manage newsletter opt-ins and audience records.
- Endpoint: PUT /API/HARRY-CLINTON/Newsletter-Subscriptions
  Short Description: Update existing record
  Long Description: Useful for correcting details, status changes, and keeping live data accurate. Manage newsletter opt-ins and audience records.
- Endpoint: DELETE /API/HARRY-CLINTON/Newsletter-Subscriptions
  Short Description: Delete/disable record
  Long Description: Useful for removing inactive data from active flows while maintaining data hygiene. Manage newsletter opt-ins and audience records.

### Module: /Settings
Table/Schema Reference: tbl_settings
Module Purpose: Manage system-level configuration values used by business flows.

- Endpoint: GET /API/HARRY-CLINTON/Settings
  Short Description: View records list
  Long Description: Useful for listing and browsing records in admin/customer interfaces. Manage system-level configuration values used by business flows.
- Endpoint: GET /API/HARRY-CLINTON/Settings/:id
  Short Description: View one record
  Long Description: Useful for opening one specific record in detail view screens. Manage system-level configuration values used by business flows.
- Endpoint: POST /API/HARRY-CLINTON/Settings
  Short Description: Create new record
  Long Description: Useful when business users add new data needed for operations and customer experience. Manage system-level configuration values used by business flows.
- Endpoint: PUT /API/HARRY-CLINTON/Settings
  Short Description: Update existing record
  Long Description: Useful for correcting details, status changes, and keeping live data accurate. Manage system-level configuration values used by business flows.
- Endpoint: DELETE /API/HARRY-CLINTON/Settings
  Short Description: Delete/disable record
  Long Description: Useful for removing inactive data from active flows while maintaining data hygiene. Manage system-level configuration values used by business flows.

### Module: /Support-Contacts
Table/Schema Reference: tbl_support_contacts
Module Purpose: Manage support channels shown to customers.

- Endpoint: GET /API/HARRY-CLINTON/Support-Contacts
  Short Description: View records list
  Long Description: Useful for listing and browsing records in admin/customer interfaces. Manage support channels shown to customers.
- Endpoint: GET /API/HARRY-CLINTON/Support-Contacts/:id
  Short Description: View one record
  Long Description: Useful for opening one specific record in detail view screens. Manage support channels shown to customers.
- Endpoint: POST /API/HARRY-CLINTON/Support-Contacts
  Short Description: Create new record
  Long Description: Useful when business users add new data needed for operations and customer experience. Manage support channels shown to customers.
- Endpoint: PUT /API/HARRY-CLINTON/Support-Contacts
  Short Description: Update existing record
  Long Description: Useful for correcting details, status changes, and keeping live data accurate. Manage support channels shown to customers.
- Endpoint: DELETE /API/HARRY-CLINTON/Support-Contacts
  Short Description: Delete/disable record
  Long Description: Useful for removing inactive data from active flows while maintaining data hygiene. Manage support channels shown to customers.

## Module Group: L_Ratings_&_Reviews

### Module: /Product-Rating-Summary
Table/Schema Reference: tbl_product_rating_summary
Module Purpose: Store aggregate rating values for product-level display.

- Endpoint: GET /API/HARRY-CLINTON/Product-Rating-Summary
  Short Description: View records list
  Long Description: Useful for listing and browsing records in admin/customer interfaces. Store aggregate rating values for product-level display.
- Endpoint: GET /API/HARRY-CLINTON/Product-Rating-Summary/:id
  Short Description: View one record
  Long Description: Useful for opening one specific record in detail view screens. Store aggregate rating values for product-level display.
- Endpoint: POST /API/HARRY-CLINTON/Product-Rating-Summary
  Short Description: Create new record
  Long Description: Useful when business users add new data needed for operations and customer experience. Store aggregate rating values for product-level display.
- Endpoint: PUT /API/HARRY-CLINTON/Product-Rating-Summary
  Short Description: Update existing record
  Long Description: Useful for correcting details, status changes, and keeping live data accurate. Store aggregate rating values for product-level display.
- Endpoint: DELETE /API/HARRY-CLINTON/Product-Rating-Summary
  Short Description: Delete/disable record
  Long Description: Useful for removing inactive data from active flows while maintaining data hygiene. Store aggregate rating values for product-level display.

### Module: /Review-Media
Table/Schema Reference: tbl_review_media
Module Purpose: Manage photos/videos attached to customer reviews.

- Endpoint: GET /API/HARRY-CLINTON/Review-Media
  Short Description: View records list
  Long Description: Useful for listing and browsing records in admin/customer interfaces. Manage photos/videos attached to customer reviews.
- Endpoint: GET /API/HARRY-CLINTON/Review-Media/:id
  Short Description: View one record
  Long Description: Useful for opening one specific record in detail view screens. Manage photos/videos attached to customer reviews.
- Endpoint: POST /API/HARRY-CLINTON/Review-Media
  Short Description: Create new record
  Long Description: Useful when business users add new data needed for operations and customer experience. Manage photos/videos attached to customer reviews.
- Endpoint: PUT /API/HARRY-CLINTON/Review-Media
  Short Description: Update existing record
  Long Description: Useful for correcting details, status changes, and keeping live data accurate. Manage photos/videos attached to customer reviews.
- Endpoint: DELETE /API/HARRY-CLINTON/Review-Media
  Short Description: Delete/disable record
  Long Description: Useful for removing inactive data from active flows while maintaining data hygiene. Manage photos/videos attached to customer reviews.

### Module: /Reviews
Table/Schema Reference: tbl_product_reviews
Module Purpose: Manage customer product reviews and moderation state.

- Endpoint: GET /API/HARRY-CLINTON/Reviews
  Short Description: View records list
  Long Description: Useful for listing and browsing records in admin/customer interfaces. Manage customer product reviews and moderation state.
- Endpoint: GET /API/HARRY-CLINTON/Reviews/:id
  Short Description: View one record
  Long Description: Useful for opening one specific record in detail view screens. Manage customer product reviews and moderation state.
- Endpoint: POST /API/HARRY-CLINTON/Reviews
  Short Description: Create new record
  Long Description: Useful when business users add new data needed for operations and customer experience. Manage customer product reviews and moderation state.
- Endpoint: PUT /API/HARRY-CLINTON/Reviews
  Short Description: Update existing record
  Long Description: Useful for correcting details, status changes, and keeping live data accurate. Manage customer product reviews and moderation state.
- Endpoint: DELETE /API/HARRY-CLINTON/Reviews
  Short Description: Delete/disable record
  Long Description: Useful for removing inactive data from active flows while maintaining data hygiene. Manage customer product reviews and moderation state.

### Module: /Review-Votes
Table/Schema Reference: tbl_review_votes
Module Purpose: Track helpfulness votes on reviews.

- Endpoint: GET /API/HARRY-CLINTON/Review-Votes
  Short Description: View records list
  Long Description: Useful for listing and browsing records in admin/customer interfaces. Track helpfulness votes on reviews.
- Endpoint: GET /API/HARRY-CLINTON/Review-Votes/:id
  Short Description: View one record
  Long Description: Useful for opening one specific record in detail view screens. Track helpfulness votes on reviews.
- Endpoint: POST /API/HARRY-CLINTON/Review-Votes
  Short Description: Create new record
  Long Description: Useful when business users add new data needed for operations and customer experience. Track helpfulness votes on reviews.
- Endpoint: PUT /API/HARRY-CLINTON/Review-Votes
  Short Description: Update existing record
  Long Description: Useful for correcting details, status changes, and keeping live data accurate. Track helpfulness votes on reviews.
- Endpoint: DELETE /API/HARRY-CLINTON/Review-Votes
  Short Description: Delete/disable record
  Long Description: Useful for removing inactive data from active flows while maintaining data hygiene. Track helpfulness votes on reviews.

### Module: /Variant-Rating-Summary
Table/Schema Reference: tbl_variant_rating_summary
Module Purpose: Store aggregate rating values for variant-level display.

- Endpoint: GET /API/HARRY-CLINTON/Variant-Rating-Summary
  Short Description: View records list
  Long Description: Useful for listing and browsing records in admin/customer interfaces. Store aggregate rating values for variant-level display.
- Endpoint: GET /API/HARRY-CLINTON/Variant-Rating-Summary/:id
  Short Description: View one record
  Long Description: Useful for opening one specific record in detail view screens. Store aggregate rating values for variant-level display.
- Endpoint: POST /API/HARRY-CLINTON/Variant-Rating-Summary
  Short Description: Create new record
  Long Description: Useful when business users add new data needed for operations and customer experience. Store aggregate rating values for variant-level display.
- Endpoint: PUT /API/HARRY-CLINTON/Variant-Rating-Summary
  Short Description: Update existing record
  Long Description: Useful for correcting details, status changes, and keeping live data accurate. Store aggregate rating values for variant-level display.
- Endpoint: DELETE /API/HARRY-CLINTON/Variant-Rating-Summary
  Short Description: Delete/disable record
  Long Description: Useful for removing inactive data from active flows while maintaining data hygiene. Store aggregate rating values for variant-level display.

## Not Yet Created Endpoints (Current Gap)
- tbl_about_us_pages
- tbl_privacy_policy_pages
- tbl_terms_conditions_pages
- tbl_notification_bars
- tbl_menu_section_images
- tbl_subcategory_sections
