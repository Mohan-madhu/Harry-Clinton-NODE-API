# Live MSSQL Object Snapshot

Generated: 2026-07-27T03:51:11.606Z
Database: db_harry_clinton

## Summary

- Schemas: 11
- Views: 0
- Stored procedures: 6
- Scalar functions: 0
- Inline table functions: 0
- Table functions: 0
- Triggers: 6
- Tables: 65
- Column rows: 870
- Key constraint rows: 65
- Index column rows: 256
- Foreign key column rows: 55

## Schemas

- db_accessadmin
- db_backupoperator
- db_datareader
- db_datawriter
- db_ddladmin
- db_denydatareader
- db_denydatawriter
- db_owner
- db_securityadmin
- dbo
- guest

## Row Counts

| Table | Rows |
|---|---:|
| dbo.tbl_addresses | 8 |
| dbo.tbl_appointment_date_slots | 2 |
| dbo.tbl_appointment_slot_blocks | 4 |
| dbo.tbl_appointment_time_slots | 1 |
| dbo.tbl_attributes | 1 |
| dbo.tbl_care_instructions | 7 |
| dbo.tbl_cart_items | 0 |
| dbo.tbl_carts | 7 |
| dbo.tbl_cloth_type_care_instructions | 0 |
| dbo.tbl_cloth_types | 1 |
| dbo.tbl_coupon_usage | 0 |
| dbo.tbl_coupons | 2 |
| dbo.tbl_courier_partners | 3 |
| dbo.tbl_custom_appointments | 0 |
| dbo.tbl_customer_profiles | 0 |
| dbo.tbl_discount_targets | 0 |
| dbo.tbl_discounts | 6 |
| dbo.tbl_faqs | 6 |
| dbo.tbl_image_sliders | 5 |
| dbo.tbl_invoices | 0 |
| dbo.tbl_legal_page_header | 7 |
| dbo.tbl_legal_page_sections | 15 |
| dbo.tbl_menu_categories | 9 |
| dbo.tbl_menu_subcategories | 32 |
| dbo.tbl_menu_video | 6 |
| dbo.tbl_newsletter_subscriptions | 2 |
| dbo.tbl_order_addresses | 2 |
| dbo.tbl_order_cancellations | 0 |
| dbo.tbl_order_items | 2 |
| dbo.tbl_order_promotions | 0 |
| dbo.tbl_order_status_history | 2 |
| dbo.tbl_order_status_master | 1 |
| dbo.tbl_orders | 2 |
| dbo.tbl_payments | 2 |
| dbo.tbl_product_attribute_values | 0 |
| dbo.tbl_product_media | 0 |
| dbo.tbl_product_rating_summary | 0 |
| dbo.tbl_product_reviews | 0 |
| dbo.tbl_product_seo | 0 |
| dbo.tbl_product_variants | 0 |
| dbo.tbl_products | 3 |
| dbo.tbl_profiles | 9 |
| dbo.tbl_refunds | 0 |
| dbo.tbl_returns | 0 |
| dbo.tbl_review_media | 1 |
| dbo.tbl_review_responses | 0 |
| dbo.tbl_review_votes | 1 |
| dbo.tbl_reviews | 7 |
| dbo.tbl_roles | 8 |
| dbo.tbl_running_bar_items | 11 |
| dbo.tbl_running_bars | 11 |
| dbo.tbl_settings | 6 |
| dbo.tbl_shipment_events | 6 |
| dbo.tbl_shipments | 0 |
| dbo.tbl_sizes | 1 |
| dbo.tbl_spotlight_entries | 6 |
| dbo.tbl_spotlight_media | 6 |
| dbo.tbl_style_collection_media | 0 |
| dbo.tbl_style_collections | 0 |
| dbo.tbl_support_contacts | 0 |
| dbo.tbl_user_roles | 11 |
| dbo.tbl_users | 11 |
| dbo.tbl_variant_rating_summary | 0 |
| dbo.tbl_wishlist_items | 0 |
| dbo.tbl_wishlists | 7 |

## Tables and Columns

### dbo.tbl_addresses

| Column | Type | Nullable | Identity | Default |
|---|---|---:|---:|---|
| address_id | varchar(36) | no | no | (CONVERT([varchar](36),newid())) |
| user_id | varchar(36) | no | no |  |
| full_name | varchar(255) | no | no |  |
| mobile_number | varchar(50) | no | no |  |
| house_street | varchar(500) | no | no |  |
| city | varchar(150) | no | no |  |
| state | varchar(150) | no | no |  |
| pincode | varchar(20) | no | no |  |
| landmark | varchar(255) | yes | no |  |
| isdefault | bit | no | no | ((0)) |
| isactive | bit | no | no | ((1)) |
| isdeleted | bit | no | no | ((0)) |
| rcu | varchar(100) | yes | no |  |
| rcm | datetime | no | no | (getdate()) |
| luu | varchar(100) | yes | no |  |
| lcm | datetime | yes | no |  |

| Constraint | Type | Columns |
|---|---|---|
| pk_tbl_addresses | PRIMARY_KEY_CONSTRAINT | address_id |

### dbo.tbl_appointment_date_slots

| Column | Type | Nullable | Identity | Default |
|---|---|---:|---:|---|
| appointment_date_slot_id | uniqueidentifier | no | no | (newid()) |
| slot_date | date | no | no |  |
| slot_duration_minutes | int | no | no | ((30)) |
| isavailable | bit | no | no | ((1)) |
| notes | varchar(500) | yes | no |  |
| isactive | bit | no | no | ((1)) |
| isdeleted | bit | no | no | ((0)) |
| rcu | varchar(100) | yes | no |  |
| rcm | datetime | no | no | (getdate()) |
| luu | varchar(100) | yes | no |  |
| lcm | datetime | yes | no |  |

| Constraint | Type | Columns |
|---|---|---|
| PK_tbl_appointment_date_slots | PRIMARY_KEY_CONSTRAINT | appointment_date_slot_id |

### dbo.tbl_appointment_slot_blocks

| Column | Type | Nullable | Identity | Default |
|---|---|---:|---:|---|
| appointment_slot_block_id | uniqueidentifier | no | no | (newid()) |
| appointment_date_slot_id | uniqueidentifier | no | no |  |
| block_start_time | time | no | no |  |
| block_end_time | time | no | no |  |
| block_reason | varchar(255) | yes | no |  |
| blocked_by | varchar(100) | yes | no |  |
| isactive | bit | no | no | ((1)) |
| isdeleted | bit | no | no | ((0)) |
| rcu | varchar(100) | yes | no |  |
| rcm | datetime | no | no | (getdate()) |
| luu | varchar(100) | yes | no |  |
| lcm | datetime | yes | no |  |

| Constraint | Type | Columns |
|---|---|---|
| PK_tbl_appointment_slot_blocks | PRIMARY_KEY_CONSTRAINT | appointment_slot_block_id |

### dbo.tbl_appointment_time_slots

| Column | Type | Nullable | Identity | Default |
|---|---|---:|---:|---|
| appointment_time_slot_id | uniqueidentifier | no | no | (newid()) |
| appointment_date_slot_id | uniqueidentifier | no | no |  |
| slot_start_time | time | no | no |  |
| slot_end_time | time | no | no |  |
| isavailable | bit | no | no | ((1)) |
| isbooked | bit | no | no | ((0)) |
| booked_at | datetime | yes | no |  |
| appointment_id | uniqueidentifier | yes | no |  |
| notes | varchar(500) | yes | no |  |
| display_order | int | no | no | ((1)) |
| isactive | bit | no | no | ((1)) |
| isdeleted | bit | no | no | ((0)) |
| rcu | varchar(100) | yes | no |  |
| rcm | datetime | no | no | (getdate()) |
| luu | varchar(100) | yes | no |  |
| lcm | datetime | yes | no |  |

| Constraint | Type | Columns |
|---|---|---|
| PK_tbl_appointment_time_slots | PRIMARY_KEY_CONSTRAINT | appointment_time_slot_id |

### dbo.tbl_attributes

| Column | Type | Nullable | Identity | Default |
|---|---|---:|---:|---|
| attribute_id | varchar(36) | no | no | (CONVERT([varchar](36),newid())) |
| attribute_name | varchar(255) | no | no |  |
| attribute_slug | varchar(255) | no | no |  |
| attribute_type | varchar(50) | no | no |  |
| display_order | int | no | no | ((1)) |
| isactive | bit | no | no | ((1)) |
| isdeleted | bit | no | no | ((0)) |
| rcu | varchar(100) | yes | no |  |
| rcm | datetime | no | no | (getdate()) |
| luu | varchar(100) | yes | no |  |
| lcm | datetime | yes | no |  |

| Constraint | Type | Columns |
|---|---|---|
| pk_tbl_attributes | PRIMARY_KEY_CONSTRAINT | attribute_id |

### dbo.tbl_care_instructions

| Column | Type | Nullable | Identity | Default |
|---|---|---:|---:|---|
| care_instruction_id | varchar(36) | no | no | (CONVERT([varchar](36),newid())) |
| instruction_text | varchar(max) | no | no |  |
| display_order | int | no | no | ((1)) |
| isactive | bit | no | no | ((1)) |
| isdeleted | bit | no | no | ((0)) |
| rcu | varchar(100) | yes | no |  |
| rcm | datetime | no | no | (getdate()) |
| luu | varchar(100) | yes | no |  |
| lcm | datetime | yes | no |  |

| Constraint | Type | Columns |
|---|---|---|
| pk_tbl_care_instructions | PRIMARY_KEY_CONSTRAINT | care_instruction_id |

### dbo.tbl_cart_items

| Column | Type | Nullable | Identity | Default |
|---|---|---:|---:|---|
| cart_item_id | varchar(36) | no | no | (CONVERT([varchar](36),newid())) |
| cart_id | varchar(36) | no | no |  |
| product_id | varchar(36) | no | no |  |
| product_variant_id | varchar(36) | yes | no |  |
| qty | int | no | no | ((1)) |
| unit_price | decimal(18,2) | yes | no |  |
| total_price | decimal(18,2) | yes | no |  |
| added_at | datetime | no | no | (getdate()) |
| isactive | bit | no | no | ((1)) |
| isdeleted | bit | no | no | ((0)) |
| rcu | varchar(100) | yes | no |  |
| rcm | datetime | no | no | (getdate()) |
| luu | varchar(100) | yes | no |  |
| lcm | datetime | yes | no |  |

| Constraint | Type | Columns |
|---|---|---|
| PK__tbl_cart__5D9A6C6E7AD4DA40 | PRIMARY_KEY_CONSTRAINT | cart_item_id |

### dbo.tbl_carts

| Column | Type | Nullable | Identity | Default |
|---|---|---:|---:|---|
| cart_id | varchar(36) | no | no | (CONVERT([varchar](36),newid())) |
| user_id | varchar(36) | no | no |  |
| cart_status | varchar(20) | no | no | ('active') |
| isactive | bit | no | no | ((1)) |
| isdeleted | bit | no | no | ((0)) |
| rcu | varchar(100) | yes | no |  |
| rcm | datetime | no | no | (getdate()) |
| luu | varchar(100) | yes | no |  |
| lcm | datetime | yes | no |  |

| Constraint | Type | Columns |
|---|---|---|
| PK__tbl_cart__2EF52A27F0DAE529 | PRIMARY_KEY_CONSTRAINT | cart_id |

### dbo.tbl_cloth_type_care_instructions

| Column | Type | Nullable | Identity | Default |
|---|---|---:|---:|---|
| cloth_type_care_instruction_id | varchar(36) | no | no | (CONVERT([varchar](36),newid())) |
| cloth_type_id | varchar(36) | no | no |  |
| care_instruction_id | varchar(36) | no | no |  |
| display_order | int | no | no | ((1)) |
| isactive | bit | no | no | ((1)) |
| isdeleted | bit | no | no | ((0)) |
| rcu | varchar(100) | yes | no |  |
| rcm | datetime | no | no | (getdate()) |
| luu | varchar(100) | yes | no |  |
| lcm | datetime | yes | no |  |

| Constraint | Type | Columns |
|---|---|---|
| pk_tbl_cloth_type_care_instructions | PRIMARY_KEY_CONSTRAINT | cloth_type_care_instruction_id |

### dbo.tbl_cloth_types

| Column | Type | Nullable | Identity | Default |
|---|---|---:|---:|---|
| cloth_type_id | varchar(36) | no | no | (CONVERT([varchar](36),newid())) |
| cloth_type_name | varchar(255) | no | no |  |
| cloth_type_slug | varchar(255) | no | no |  |
| description | varchar(500) | yes | no |  |
| display_order | int | no | no | ((1)) |
| isactive | bit | no | no | ((1)) |
| isdeleted | bit | no | no | ((0)) |
| rcu | varchar(100) | yes | no |  |
| rcm | datetime | no | no | (getdate()) |
| luu | varchar(100) | yes | no |  |
| lcm | datetime | yes | no |  |

| Constraint | Type | Columns |
|---|---|---|
| pk_tbl_cloth_types | PRIMARY_KEY_CONSTRAINT | cloth_type_id |

### dbo.tbl_coupon_usage

| Column | Type | Nullable | Identity | Default |
|---|---|---:|---:|---|
| coupon_usage_id | varchar(36) | no | no | (CONVERT([varchar](36),newid())) |
| coupon_id | varchar(36) | no | no |  |
| user_id | varchar(36) | no | no |  |
| order_id | varchar(36) | yes | no |  |
| discount_amount | decimal(18,2) | no | no |  |
| used_at | datetime | no | no | (getdate()) |
| isactive | bit | no | no | ((1)) |
| isdeleted | bit | no | no | ((0)) |
| rcu | varchar(100) | yes | no |  |
| rcm | datetime | no | no | (getdate()) |
| luu | varchar(100) | yes | no |  |
| lcm | datetime | yes | no |  |

| Constraint | Type | Columns |
|---|---|---|
| PK__tbl_coup__1B44EFEBCD0F9DBD | PRIMARY_KEY_CONSTRAINT | coupon_usage_id |

### dbo.tbl_coupons

| Column | Type | Nullable | Identity | Default |
|---|---|---:|---:|---|
| coupon_id | varchar(36) | no | no | (CONVERT([varchar](36),newid())) |
| coupon_code | varchar(100) | no | no |  |
| coupon_name | varchar(255) | yes | no |  |
| description | varchar(500) | yes | no |  |
| discount_type | varchar(20) | no | no |  |
| discount_value | decimal(18,2) | no | no |  |
| min_purchase_amount | decimal(18,2) | yes | no |  |
| max_discount_amount | decimal(18,2) | yes | no |  |
| usage_limit | int | yes | no |  |
| usage_count | int | no | no | ((0)) |
| per_user_limit | int | yes | no | ((1)) |
| start_date | datetime | no | no |  |
| end_date | datetime | yes | no |  |
| isactive | bit | no | no | ((1)) |
| isdeleted | bit | no | no | ((0)) |
| rcu | varchar(100) | yes | no |  |
| rcm | datetime | no | no | (getdate()) |
| luu | varchar(100) | yes | no |  |
| lcm | datetime | yes | no |  |

| Constraint | Type | Columns |
|---|---|---|
| PK__tbl_coup__58CF63898F14BC10 | PRIMARY_KEY_CONSTRAINT | coupon_id |

### dbo.tbl_courier_partners

| Column | Type | Nullable | Identity | Default |
|---|---|---:|---:|---|
| courier_partner_id | varchar(36) | no | no | (CONVERT([varchar](36),newid())) |
| courier_name | varchar(255) | no | no |  |
| courier_code | varchar(50) | no | no |  |
| contact_email | varchar(255) | yes | no |  |
| contact_phone | varchar(50) | yes | no |  |
| base_rate | decimal(18,2) | yes | no |  |
| rate_per_kg | decimal(18,2) | yes | no |  |
| api_base_url | varchar(500) | yes | no |  |
| api_key | varchar(255) | yes | no |  |
| integration_status | varchar(50) | yes | no |  |
| isactive | bit | no | no | ((1)) |
| isdeleted | bit | no | no | ((0)) |
| rcu | varchar(100) | yes | no |  |
| rcm | datetime | no | no | (getdate()) |
| luu | varchar(100) | yes | no |  |
| lcm | datetime | yes | no |  |

| Constraint | Type | Columns |
|---|---|---|
| PK__tbl_cour__39BCF39E2230EA0B | PRIMARY_KEY_CONSTRAINT | courier_partner_id |
| ux_tbl_courier_partners_code | UNIQUE_CONSTRAINT | courier_code |

### dbo.tbl_custom_appointments

| Column | Type | Nullable | Identity | Default |
|---|---|---:|---:|---|
| appointment_id | uniqueidentifier | no | no | (newid()) |
| user_id | uniqueidentifier | yes | no |  |
| appointment_date_slot_id | uniqueidentifier | no | no |  |
| appointment_time_slot_id | uniqueidentifier | no | no |  |
| name | varchar(255) | no | no |  |
| city | varchar(150) | yes | no |  |
| preferred_delivery_date | date | yes | no |  |
| occasion | varchar(255) | yes | no |  |
| appointment_status | varchar(30) | no | no | ('requested') |
| isrejected | bit | no | no | ((0)) |
| appointment_notes | varchar(500) | yes | no |  |
| requested_at | datetime | no | no | (getdate()) |
| approved_at | datetime | yes | no |  |
| rejected_at | datetime | yes | no |  |
| cancelled_at | datetime | yes | no |  |
| isactive | bit | no | no | ((1)) |
| isdeleted | bit | no | no | ((0)) |
| rcu | varchar(100) | yes | no |  |
| rcm | datetime | no | no | (getdate()) |
| luu | varchar(100) | yes | no |  |
| lcm | datetime | yes | no |  |

| Constraint | Type | Columns |
|---|---|---|
| PK_tbl_custom_appointments | PRIMARY_KEY_CONSTRAINT | appointment_id |

### dbo.tbl_customer_profiles

| Column | Type | Nullable | Identity | Default |
|---|---|---:|---:|---|
| profile_id | varchar(36) | no | no | (CONVERT([varchar](36),newid())) |
| user_id | varchar(36) | no | no |  |
| date_of_birth | date | yes | no |  |
| gender | varchar(20) | yes | no |  |
| gstin | varchar(20) | yes | no |  |
| company_name | varchar(255) | yes | no |  |
| preferred_language | varchar(20) | yes | no |  |
| preferred_currency | varchar(10) | yes | no |  |
| newsletter_subscription | bit | no | no | ((0)) |
| sms_notifications | bit | no | no | ((1)) |
| email_notifications | bit | no | no | ((1)) |
| push_notifications | bit | no | no | ((1)) |
| loyalty_points | int | no | no | ((0)) |
| isactive | bit | no | no | ((1)) |
| isdeleted | bit | no | no | ((0)) |
| rcu | varchar(100) | yes | no |  |
| rcm | datetime | no | no | (getdate()) |
| luu | varchar(100) | yes | no |  |
| lcm | datetime | yes | no |  |

| Constraint | Type | Columns |
|---|---|---|
| PK__tbl_cust__AEBB701F922A2DF3 | PRIMARY_KEY_CONSTRAINT | profile_id |
| ux_tbl_customer_profiles_user | UNIQUE_CONSTRAINT | user_id |

### dbo.tbl_discount_targets

| Column | Type | Nullable | Identity | Default |
|---|---|---:|---:|---|
| discount_target_id | varchar(36) | no | no | (CONVERT([varchar](36),newid())) |
| discount_id | varchar(36) | no | no |  |
| target_type | varchar(50) | no | no |  |
| target_id | varchar(36) | yes | no |  |
| isactive | bit | no | no | ((1)) |
| isdeleted | bit | no | no | ((0)) |
| rcu | varchar(100) | yes | no |  |
| rcm | datetime | no | no | (getdate()) |
| luu | varchar(100) | yes | no |  |
| lcm | datetime | yes | no |  |

| Constraint | Type | Columns |
|---|---|---|
| PK__tbl_disc__B422BF010289AE72 | PRIMARY_KEY_CONSTRAINT | discount_target_id |

### dbo.tbl_discounts

| Column | Type | Nullable | Identity | Default |
|---|---|---:|---:|---|
| discount_id | varchar(36) | no | no | (CONVERT([varchar](36),newid())) |
| discount_name | varchar(255) | no | no |  |
| description | varchar(500) | yes | no |  |
| discount_type | varchar(20) | no | no |  |
| discount_value | decimal(18,2) | no | no |  |
| max_discount_amount | decimal(18,2) | yes | no |  |
| usage_limit | int | yes | no |  |
| usage_count | int | no | no | ((0)) |
| start_date | datetime | no | no |  |
| end_date | datetime | yes | no |  |
| discount_priority | int | no | no | ((1)) |
| isactive | bit | no | no | ((1)) |
| isdeleted | bit | no | no | ((0)) |
| rcu | varchar(100) | yes | no |  |
| rcm | datetime | no | no | (getdate()) |
| luu | varchar(100) | yes | no |  |
| lcm | datetime | yes | no |  |

| Constraint | Type | Columns |
|---|---|---|
| PK__tbl_disc__BDBE9EF9D720D481 | PRIMARY_KEY_CONSTRAINT | discount_id |

### dbo.tbl_faqs

| Column | Type | Nullable | Identity | Default |
|---|---|---:|---:|---|
| faq_id | varchar(36) | no | no | (CONVERT([varchar](36),newid())) |
| question | varchar(1000) | no | no |  |
| answer | varchar(max) | no | no |  |
| display_order | int | no | no | ((1)) |
| isactive | bit | no | no | ((1)) |
| isdeleted | bit | no | no | ((0)) |
| rcu | varchar(100) | yes | no |  |
| rcm | datetime | no | no | (getdate()) |
| luu | varchar(100) | yes | no |  |
| lcm | datetime | yes | no |  |

| Constraint | Type | Columns |
|---|---|---|
| PK_tbl_faqs | PRIMARY_KEY_CONSTRAINT | faq_id |

### dbo.tbl_image_sliders

| Column | Type | Nullable | Identity | Default |
|---|---|---:|---:|---|
| image_slider_id | varchar(36) | yes | no | (newid()) |
| image_url | varchar(max) | yes | no |  |
| title | varchar(max) | yes | no |  |
| subtitle | varchar(max) | yes | no |  |
| button_text | varchar(max) | yes | no | ('shop now') |
| redirect_link | varchar(max) | yes | no |  |
| display_order | int | yes | no | ((1)) |
| auto_slide_interval_seconds | int | yes | no | ((5)) |
| isactive | bit | yes | no | ((1)) |
| isdeleted | bit | yes | no | ((0)) |
| rcu | varchar(max) | yes | no |  |
| rcm | datetime | yes | no | (getdate()) |
| luu | varchar(max) | yes | no |  |
| lcm | datetime | yes | no |  |

### dbo.tbl_invoices

| Column | Type | Nullable | Identity | Default |
|---|---|---:|---:|---|
| invoice_id | varchar(36) | no | no | (CONVERT([varchar](36),newid())) |
| order_id | varchar(36) | no | no |  |
| invoice_number | varchar(50) | no | no |  |
| invoice_date | datetime | no | no | (getdate()) |
| invoice_url | varchar(1000) | yes | no |  |
| notes | varchar(500) | yes | no |  |
| isactive | bit | no | no | ((1)) |
| isdeleted | bit | no | no | ((0)) |
| rcu | varchar(100) | yes | no |  |
| rcm | datetime | no | no | (getdate()) |
| luu | varchar(100) | yes | no |  |
| lcm | datetime | yes | no |  |

| Constraint | Type | Columns |
|---|---|---|
| PK__tbl_invo__F58DFD4968E79D18 | PRIMARY_KEY_CONSTRAINT | invoice_id |

### dbo.tbl_legal_page_header

| Column | Type | Nullable | Identity | Default |
|---|---|---:|---:|---|
| id | int | no | yes |  |
| page_type | nvarchar(100) | no | no |  |
| page_title | nvarchar(510) | no | no |  |
| intro_text | nvarchar(max) | no | no |  |
| effective_date | date | yes | no |  |
| version_number | nvarchar(40) | yes | no |  |
| is_active | bit | no | no | ((1)) |
| updated_by | nvarchar(200) | yes | no |  |
| updated_at | datetime | no | no | (getdate()) |

| Constraint | Type | Columns |
|---|---|---|
| PK__tbl_lega__3213E83FEB7C5468 | PRIMARY_KEY_CONSTRAINT | id |

### dbo.tbl_legal_page_sections

| Column | Type | Nullable | Identity | Default |
|---|---|---:|---:|---|
| id | int | no | yes |  |
| page_type | nvarchar(100) | no | no |  |
| section_title | nvarchar(510) | no | no |  |
| section_order | int | no | no | ((0)) |
| content | nvarchar(max) | no | no |  |
| is_active | bit | no | no | ((1)) |
| created_by | nvarchar(200) | yes | no |  |
| created_at | datetime | no | no | (getdate()) |
| updated_by | nvarchar(200) | yes | no |  |
| updated_at | datetime | yes | no |  |

| Constraint | Type | Columns |
|---|---|---|
| PK__tbl_lega__3213E83F774BB419 | PRIMARY_KEY_CONSTRAINT | id |

### dbo.tbl_menu_categories

| Column | Type | Nullable | Identity | Default |
|---|---|---:|---:|---|
| menu_category_id | varchar(36) | no | no | (CONVERT([varchar](36),newid())) |
| menu_category_name | varchar(255) | no | no |  |
| menu_category_slug | varchar(255) | no | no |  |
| display_order | int | no | no | ((1)) |
| isactive | bit | no | no | ((1)) |
| isdeleted | bit | no | no | ((0)) |
| rcu | varchar(100) | yes | no |  |
| rcm | datetime | no | no | (getdate()) |
| luu | varchar(100) | yes | no |  |
| lcm | datetime | yes | no |  |

| Constraint | Type | Columns |
|---|---|---|
| pk_tbl_menu_categories | PRIMARY_KEY_CONSTRAINT | menu_category_id |

### dbo.tbl_menu_subcategories

| Column | Type | Nullable | Identity | Default |
|---|---|---:|---:|---|
| menu_subcategory_id | varchar(36) | no | no | (CONVERT([varchar](36),newid())) |
| menu_category_id | varchar(36) | no | no |  |
| menu_subcategory_name | varchar(255) | no | no |  |
| menu_subcategory_slug | varchar(255) | no | no |  |
| redirect_link | varchar(1000) | yes | no |  |
| display_order | int | no | no | ((1)) |
| isactive | bit | no | no | ((1)) |
| isdeleted | bit | no | no | ((0)) |
| rcu | varchar(100) | yes | no |  |
| rcm | datetime | no | no | (getdate()) |
| luu | varchar(100) | yes | no |  |
| lcm | datetime | yes | no |  |

| Constraint | Type | Columns |
|---|---|---|
| pk_tbl_menu_subcategories | PRIMARY_KEY_CONSTRAINT | menu_subcategory_id |

### dbo.tbl_menu_video

| Column | Type | Nullable | Identity | Default |
|---|---|---:|---:|---|
| menu_video_id | varchar(36) | yes | no | (newid()) |
| video_type | varchar(36) | yes | no | ('youtube') |
| video_url | varchar(max) | yes | no |  |
| poster_image_url | varchar(max) | yes | no |  |
| autoplay | bit | yes | no | ((1)) |
| loop_video | bit | yes | no | ((1)) |
| mute_default | bit | yes | no | ((1)) |
| display_order | int | yes | no | ((1)) |
| isactive | bit | yes | no | ((1)) |
| isdeleted | bit | yes | no | ((0)) |
| rcu | varchar(max) | yes | no |  |
| rcm | datetime | yes | no | (getdate()) |
| luu | varchar(max) | yes | no |  |
| lcm | datetime | yes | no |  |

### dbo.tbl_newsletter_subscriptions

| Column | Type | Nullable | Identity | Default |
|---|---|---:|---:|---|
| newsletter_subscription_id | varchar(36) | no | no | (CONVERT([varchar](36),newid())) |
| emailid | varchar(255) | no | no |  |
| user_id | varchar(36) | yes | no |  |
| subscribed_at | datetime | no | no | (getdate()) |
| unsubscribed_at | datetime | yes | no |  |
| subscription_status | varchar(20) | no | no | ('subscribed') |
| isactive | bit | no | no | ((1)) |
| isdeleted | bit | no | no | ((0)) |
| rcu | varchar(100) | yes | no |  |
| rcm | datetime | no | no | (getdate()) |
| luu | varchar(100) | yes | no |  |
| lcm | datetime | yes | no |  |

| Constraint | Type | Columns |
|---|---|---|
| PK_tbl_newsletter_subscriptions | PRIMARY_KEY_CONSTRAINT | newsletter_subscription_id |

### dbo.tbl_order_addresses

| Column | Type | Nullable | Identity | Default |
|---|---|---:|---:|---|
| order_address_id | varchar(36) | no | no | (CONVERT([varchar](36),newid())) |
| order_id | varchar(36) | no | no |  |
| address_type | varchar(20) | no | no |  |
| full_name | varchar(255) | no | no |  |
| mobile_number | varchar(50) | no | no |  |
| house_street | varchar(500) | no | no |  |
| city | varchar(150) | no | no |  |
| state | varchar(150) | no | no |  |
| pincode | varchar(20) | no | no |  |
| landmark | varchar(255) | yes | no |  |
| isactive | bit | no | no | ((1)) |
| isdeleted | bit | no | no | ((0)) |
| rcu | varchar(100) | yes | no |  |
| rcm | datetime | no | no | (getdate()) |
| luu | varchar(100) | yes | no |  |
| lcm | datetime | yes | no |  |

| Constraint | Type | Columns |
|---|---|---|
| PK__tbl_orde__9A9DCB571DED03B7 | PRIMARY_KEY_CONSTRAINT | order_address_id |

### dbo.tbl_order_cancellations

| Column | Type | Nullable | Identity | Default |
|---|---|---:|---:|---|
| order_cancellation_id | varchar(36) | no | no | (CONVERT([varchar](36),newid())) |
| order_id | varchar(36) | no | no |  |
| cancelled_by | varchar(50) | yes | no |  |
| cancelled_reason | varchar(500) | yes | no |  |
| cancelled_at | datetime | no | no | (getdate()) |
| isactive | bit | no | no | ((1)) |
| isdeleted | bit | no | no | ((0)) |
| rcu | varchar(100) | yes | no |  |
| rcm | datetime | no | no | (getdate()) |
| luu | varchar(100) | yes | no |  |
| lcm | datetime | yes | no |  |

| Constraint | Type | Columns |
|---|---|---|
| PK__tbl_orde__C033AB8710CC116B | PRIMARY_KEY_CONSTRAINT | order_cancellation_id |

### dbo.tbl_order_items

| Column | Type | Nullable | Identity | Default |
|---|---|---:|---:|---|
| order_item_id | varchar(36) | no | no | (CONVERT([varchar](36),newid())) |
| order_id | varchar(36) | no | no |  |
| product_id | varchar(36) | no | no |  |
| product_variant_id | varchar(36) | yes | no |  |
| product_name | varchar(255) | no | no |  |
| sku | varchar(100) | yes | no |  |
| qty | int | no | no | ((1)) |
| unit_price | decimal(18,2) | yes | no |  |
| total_price | decimal(18,2) | yes | no |  |
| isactive | bit | no | no | ((1)) |
| isdeleted | bit | no | no | ((0)) |
| rcu | varchar(100) | yes | no |  |
| rcm | datetime | no | no | (getdate()) |
| luu | varchar(100) | yes | no |  |
| lcm | datetime | yes | no |  |

| Constraint | Type | Columns |
|---|---|---|
| PK__tbl_orde__3764B6BCA13309CF | PRIMARY_KEY_CONSTRAINT | order_item_id |

### dbo.tbl_order_promotions

| Column | Type | Nullable | Identity | Default |
|---|---|---:|---:|---|
| order_promotion_id | varchar(36) | no | no | (CONVERT([varchar](36),newid())) |
| order_id | varchar(36) | no | no |  |
| promotion_type | varchar(50) | no | no |  |
| promotion_id | varchar(36) | yes | no |  |
| promotion_name | varchar(255) | yes | no |  |
| discount_amount | decimal(18,2) | no | no |  |
| discount_type | varchar(20) | yes | no |  |
| discount_value | decimal(18,2) | yes | no |  |
| applied_at | datetime | no | no | (getdate()) |
| isactive | bit | no | no | ((1)) |
| isdeleted | bit | no | no | ((0)) |
| rcu | varchar(100) | yes | no |  |
| rcm | datetime | no | no | (getdate()) |
| luu | varchar(100) | yes | no |  |
| lcm | datetime | yes | no |  |

| Constraint | Type | Columns |
|---|---|---|
| PK__tbl_orde__0A2A9E0E1EDCE3E3 | PRIMARY_KEY_CONSTRAINT | order_promotion_id |

### dbo.tbl_order_status_history

| Column | Type | Nullable | Identity | Default |
|---|---|---:|---:|---|
| order_status_history_id | varchar(36) | no | no | (CONVERT([varchar](36),newid())) |
| order_id | varchar(36) | no | no |  |
| order_status_id | varchar(36) | no | no |  |
| orderstatus | varchar(50) | no | no |  |
| orderstatusby | varchar(255) | yes | no |  |
| orderstatustime | datetime | no | no | (getdate()) |
| remarks | varchar(500) | yes | no |  |
| isactive | bit | no | no | ((1)) |
| isdeleted | bit | no | no | ((0)) |
| rcu | varchar(100) | yes | no |  |
| rcm | datetime | no | no | (getdate()) |
| luu | varchar(100) | yes | no |  |
| lcm | datetime | yes | no |  |

| Constraint | Type | Columns |
|---|---|---|
| PK__tbl_orde__0AEF0D355F8E1176 | PRIMARY_KEY_CONSTRAINT | order_status_history_id |

### dbo.tbl_order_status_master

| Column | Type | Nullable | Identity | Default |
|---|---|---:|---:|---|
| order_status_id | varchar(36) | no | no | (CONVERT([varchar](36),newid())) |
| status_name | varchar(100) | no | no |  |
| status_code | varchar(50) | no | no |  |
| display_order | int | no | no | ((1)) |
| iscancelled_status | bit | no | no | ((0)) |
| isactive | bit | no | no | ((1)) |
| isdeleted | bit | no | no | ((0)) |
| rcu | varchar(100) | yes | no |  |
| rcm | datetime | no | no | (getdate()) |
| luu | varchar(100) | yes | no |  |
| lcm | datetime | yes | no |  |

| Constraint | Type | Columns |
|---|---|---|
| PK__tbl_orde__A499CF231C312767 | PRIMARY_KEY_CONSTRAINT | order_status_id |
| ux_tbl_order_status_master_status_code | UNIQUE_CONSTRAINT | status_code |

### dbo.tbl_orders

| Column | Type | Nullable | Identity | Default |
|---|---|---:|---:|---|
| order_id | varchar(36) | no | no | (CONVERT([varchar](36),newid())) |
| user_id | varchar(36) | no | no |  |
| cart_id | varchar(36) | yes | no |  |
| order_number | varchar(50) | no | no |  |
| order_status_id | varchar(36) | no | no |  |
| orderstatus | varchar(50) | yes | no |  |
| subtotal | decimal(18,2) | yes | no |  |
| discount_amount | decimal(18,2) | yes | no |  |
| shipping_amount | decimal(18,2) | yes | no |  |
| tax_amount | decimal(18,2) | yes | no |  |
| total_amount | decimal(18,2) | yes | no |  |
| payment_status | varchar(50) | yes | no |  |
| notes | varchar(500) | yes | no |  |
| placed_at | datetime | no | no | (getdate()) |
| cancelled_at | datetime | yes | no |  |
| isactive | bit | no | no | ((1)) |
| isdeleted | bit | no | no | ((0)) |
| rcu | varchar(100) | yes | no |  |
| rcm | datetime | no | no | (getdate()) |
| luu | varchar(100) | yes | no |  |
| lcm | datetime | yes | no |  |

| Constraint | Type | Columns |
|---|---|---|
| PK__tbl_orde__46596229D70FFA50 | PRIMARY_KEY_CONSTRAINT | order_id |

### dbo.tbl_payments

| Column | Type | Nullable | Identity | Default |
|---|---|---:|---:|---|
| payment_id | varchar(36) | no | no | (CONVERT([varchar](36),newid())) |
| order_id | varchar(36) | no | no |  |
| user_id | varchar(36) | no | no |  |
| payment_provider | varchar(50) | no | no | ('razorpay') |
| payment_method_type | varchar(20) | yes | no |  |
| payment_status | varchar(50) | no | no | ('pending') |
| amount | decimal(18,2) | no | no |  |
| currency_code | varchar(10) | no | no | ('inr') |
| razorpay_order_id | varchar(100) | yes | no |  |
| razorpay_payment_id | varchar(100) | yes | no |  |
| razorpay_signature | varchar(255) | yes | no |  |
| paid_at | datetime | yes | no |  |
| failed_at | datetime | yes | no |  |
| refund_amount | decimal(18,2) | yes | no |  |
| refunded_at | datetime | yes | no |  |
| notes | varchar(500) | yes | no |  |
| isactive | bit | no | no | ((1)) |
| isdeleted | bit | no | no | ((0)) |
| rcu | varchar(100) | yes | no |  |
| rcm | datetime | no | no | (getdate()) |
| luu | varchar(100) | yes | no |  |
| lcm | datetime | yes | no |  |

| Constraint | Type | Columns |
|---|---|---|
| PK__tbl_paym__ED1FC9EA9578C69D | PRIMARY_KEY_CONSTRAINT | payment_id |

### dbo.tbl_product_attribute_values

| Column | Type | Nullable | Identity | Default |
|---|---|---:|---:|---|
| product_attribute_value_id | varchar(36) | no | no | (CONVERT([varchar](36),newid())) |
| product_id | varchar(36) | no | no |  |
| product_variant_id | varchar(36) | yes | no |  |
| attribute_id | varchar(36) | no | no |  |
| attribute_value | varchar(1000) | no | no |  |
| isactive | bit | no | no | ((1)) |
| isdeleted | bit | no | no | ((0)) |
| rcu | varchar(100) | yes | no |  |
| rcm | datetime | no | no | (getdate()) |
| luu | varchar(100) | yes | no |  |
| lcm | datetime | yes | no |  |

| Constraint | Type | Columns |
|---|---|---|
| pk_tbl_product_attribute_values | PRIMARY_KEY_CONSTRAINT | product_attribute_value_id |

### dbo.tbl_product_media

| Column | Type | Nullable | Identity | Default |
|---|---|---:|---:|---|
| product_media_id | varchar(36) | no | no | (CONVERT([varchar](36),newid())) |
| product_id | varchar(36) | no | no |  |
| product_variant_id | varchar(36) | yes | no |  |
| media_type | varchar(20) | no | no |  |
| media_url | varchar(1000) | no | no |  |
| alt_text | varchar(255) | yes | no |  |
| display_order | int | no | no | ((1)) |
| isprimary | bit | no | no | ((0)) |
| isactive | bit | no | no | ((1)) |
| isdeleted | bit | no | no | ((0)) |
| rcu | varchar(100) | yes | no |  |
| rcm | datetime | no | no | (getdate()) |
| luu | varchar(100) | yes | no |  |
| lcm | datetime | yes | no |  |

| Constraint | Type | Columns |
|---|---|---|
| pk_tbl_product_media | PRIMARY_KEY_CONSTRAINT | product_media_id |

### dbo.tbl_product_rating_summary

| Column | Type | Nullable | Identity | Default |
|---|---|---:|---:|---|
| product_id | varchar(36) | no | no |  |
| avg_rating | decimal(3,2) | yes | no | ((0)) |
| total_reviews | int | yes | no | ((0)) |
| rating_1_count | int | yes | no | ((0)) |
| rating_2_count | int | yes | no | ((0)) |
| rating_3_count | int | yes | no | ((0)) |
| rating_4_count | int | yes | no | ((0)) |
| rating_5_count | int | yes | no | ((0)) |
| rcu | varchar(100) | yes | no |  |
| rcm | datetime | yes | no | (getdate()) |
| luu | varchar(100) | yes | no |  |
| lcm | datetime | yes | no |  |

| Constraint | Type | Columns |
|---|---|---|
| PK__tbl_prod__47027DF5F127799D | PRIMARY_KEY_CONSTRAINT | product_id |

### dbo.tbl_product_reviews

| Column | Type | Nullable | Identity | Default |
|---|---|---:|---:|---|
| product_review_id | varchar(36) | no | no | (CONVERT([varchar](36),newid())) |
| product_id | varchar(36) | no | no |  |
| user_id | varchar(36) | no | no |  |
| order_item_id | varchar(36) | yes | no |  |
| rating | int | no | no |  |
| review_title | varchar(255) | yes | no |  |
| review_text | varchar(max) | yes | no |  |
| helpful_count | int | no | no | ((0)) |
| unhelpful_count | int | no | no | ((0)) |
| is_verified_purchase | bit | no | no | ((0)) |
| review_status | varchar(50) | no | no | ('pending') |
| reviewed_date | datetime | no | no | (getdate()) |
| approved_date | datetime | yes | no |  |
| isactive | bit | no | no | ((1)) |
| isdeleted | bit | no | no | ((0)) |
| rcu | varchar(100) | yes | no |  |
| rcm | datetime | no | no | (getdate()) |
| luu | varchar(100) | yes | no |  |
| lcm | datetime | yes | no |  |

| Constraint | Type | Columns |
|---|---|---|
| PK__tbl_prod__8440EB03F3CD2A45 | PRIMARY_KEY_CONSTRAINT | product_review_id |

### dbo.tbl_product_seo

| Column | Type | Nullable | Identity | Default |
|---|---|---:|---:|---|
| product_seo_id | varchar(36) | no | no | (CONVERT([varchar](36),newid())) |
| product_id | varchar(36) | no | no |  |
| seo_title | varchar(255) | yes | no |  |
| seo_description | varchar(500) | yes | no |  |
| seo_keywords | varchar(500) | yes | no |  |
| og_image_url | varchar(1000) | yes | no |  |
| isactive | bit | no | no | ((1)) |
| isdeleted | bit | no | no | ((0)) |
| rcu | varchar(100) | yes | no |  |
| rcm | datetime | no | no | (getdate()) |
| luu | varchar(100) | yes | no |  |
| lcm | datetime | yes | no |  |

| Constraint | Type | Columns |
|---|---|---|
| pk_tbl_product_seo | PRIMARY_KEY_CONSTRAINT | product_seo_id |

### dbo.tbl_product_variants

| Column | Type | Nullable | Identity | Default |
|---|---|---:|---:|---|
| product_variant_id | varchar(36) | no | no | (CONVERT([varchar](36),newid())) |
| product_id | varchar(36) | no | no |  |
| sku | varchar(100) | no | no |  |
| variant_name | varchar(255) | yes | no |  |
| price | decimal(18,2) | yes | no |  |
| stock_qty | int | no | no | ((0)) |
| size_id | varchar(36) | yes | no |  |
| cloth_type_id | varchar(36) | yes | no |  |
| isdefault | bit | no | no | ((0)) |
| isactive | bit | no | no | ((1)) |
| isdeleted | bit | no | no | ((0)) |
| rcu | varchar(100) | yes | no |  |
| rcm | datetime | no | no | (getdate()) |
| luu | varchar(100) | yes | no |  |
| lcm | datetime | yes | no |  |

| Constraint | Type | Columns |
|---|---|---|
| pk_tbl_product_variants | PRIMARY_KEY_CONSTRAINT | product_variant_id |

### dbo.tbl_products

| Column | Type | Nullable | Identity | Default |
|---|---|---:|---:|---|
| product_id | varchar(36) | no | no | (CONVERT([varchar](36),newid())) |
| product_name | varchar(255) | no | no |  |
| product_slug | varchar(255) | no | no |  |
| short_description | varchar(500) | yes | no |  |
| description | varchar(max) | yes | no |  |
| base_price | decimal(18,2) | yes | no |  |
| currency_code | varchar(10) | no | no | ('inr') |
| isactive | bit | no | no | ((1)) |
| isdeleted | bit | no | no | ((0)) |
| rcu | varchar(100) | yes | no |  |
| rcm | datetime | no | no | (getdate()) |
| luu | varchar(100) | yes | no |  |
| lcm | datetime | yes | no |  |

| Constraint | Type | Columns |
|---|---|---|
| pk_tbl_products | PRIMARY_KEY_CONSTRAINT | product_id |

### dbo.tbl_profiles

| Column | Type | Nullable | Identity | Default |
|---|---|---:|---:|---|
| profile_id | varchar(36) | no | no | (CONVERT([varchar](36),newid())) |
| user_id | varchar(36) | no | no |  |
| fullname | varchar(255) | no | no |  |
| emailid | varchar(255) | no | no |  |
| mobile_number | varchar(50) | yes | no |  |
| gender | varchar(20) | yes | no |  |
| dateofbirth | date | yes | no |  |
| profile_url | varchar(1000) | yes | no |  |
| lastloginat | datetime | yes | no |  |
| isactive | bit | no | no | ((1)) |
| isdeleted | bit | no | no | ((0)) |
| rcu | varchar(100) | yes | no |  |
| rcm | datetime | no | no | (getdate()) |
| luu | varchar(100) | yes | no |  |
| lcm | datetime | yes | no |  |

| Constraint | Type | Columns |
|---|---|---|
| pk_tbl_profiles | PRIMARY_KEY_CONSTRAINT | profile_id |

### dbo.tbl_refunds

| Column | Type | Nullable | Identity | Default |
|---|---|---:|---:|---|
| refund_id | varchar(36) | no | no | (CONVERT([varchar](36),newid())) |
| return_id | varchar(36) | no | no |  |
| payment_id | varchar(36) | yes | no |  |
| order_id | varchar(36) | no | no |  |
| user_id | varchar(36) | no | no |  |
| refund_type | varchar(50) | no | no |  |
| refund_status | varchar(50) | no | no | ('initiated') |
| refund_amount | decimal(18,2) | no | no |  |
| refund_method | varchar(50) | no | no |  |
| transaction_id | varchar(100) | yes | no |  |
| initiated_date | datetime | no | no | (getdate()) |
| processed_date | datetime | yes | no |  |
| completed_date | datetime | yes | no |  |
| failure_reason | varchar(500) | yes | no |  |
| notes | varchar(500) | yes | no |  |
| isactive | bit | no | no | ((1)) |
| isdeleted | bit | no | no | ((0)) |
| rcu | varchar(100) | yes | no |  |
| rcm | datetime | no | no | (getdate()) |
| luu | varchar(100) | yes | no |  |
| lcm | datetime | yes | no |  |

| Constraint | Type | Columns |
|---|---|---|
| PK__tbl_refu__897E9EA3847B7BED | PRIMARY_KEY_CONSTRAINT | refund_id |

### dbo.tbl_returns

| Column | Type | Nullable | Identity | Default |
|---|---|---:|---:|---|
| return_id | varchar(36) | no | no | (CONVERT([varchar](36),newid())) |
| order_id | varchar(36) | no | no |  |
| user_id | varchar(36) | no | no |  |
| return_type | varchar(50) | no | no |  |
| return_status | varchar(50) | no | no | ('requested') |
| return_reason | varchar(500) | yes | no |  |
| return_reason_code | varchar(50) | yes | no |  |
| return_items_count | int | no | no | ((1)) |
| return_amount | decimal(18,2) | yes | no |  |
| requested_date | datetime | no | no | (getdate()) |
| approved_date | datetime | yes | no |  |
| received_date | datetime | yes | no |  |
| completed_date | datetime | yes | no |  |
| rma_number | varchar(100) | yes | no |  |
| notes | varchar(500) | yes | no |  |
| isactive | bit | no | no | ((1)) |
| isdeleted | bit | no | no | ((0)) |
| rcu | varchar(100) | yes | no |  |
| rcm | datetime | no | no | (getdate()) |
| luu | varchar(100) | yes | no |  |
| lcm | datetime | yes | no |  |

| Constraint | Type | Columns |
|---|---|---|
| PK__tbl_retu__35C234739C6BA681 | PRIMARY_KEY_CONSTRAINT | return_id |

### dbo.tbl_review_media

| Column | Type | Nullable | Identity | Default |
|---|---|---:|---:|---|
| media_id | varchar(36) | no | no | (newid()) |
| review_id | varchar(36) | no | no |  |
| media_type | varchar(20) | no | no |  |
| media_url | varchar(500) | no | no |  |
| isactive | bit | yes | no | ((1)) |
| isdeleted | bit | yes | no | ((0)) |
| rcu | varchar(100) | yes | no |  |
| rcm | datetime | yes | no | (getdate()) |
| luu | varchar(100) | yes | no |  |
| lcm | datetime | yes | no |  |

| Constraint | Type | Columns |
|---|---|---|
| PK__tbl_revi__D0A840F4C3D443EE | PRIMARY_KEY_CONSTRAINT | media_id |

### dbo.tbl_review_responses

| Column | Type | Nullable | Identity | Default |
|---|---|---:|---:|---|
| review_response_id | varchar(36) | no | no | (CONVERT([varchar](36),newid())) |
| product_review_id | varchar(36) | no | no |  |
| responder_user_id | varchar(36) | no | no |  |
| response_text | varchar(max) | yes | no |  |
| response_date | datetime | no | no | (getdate()) |
| isactive | bit | no | no | ((1)) |
| isdeleted | bit | no | no | ((0)) |
| rcu | varchar(100) | yes | no |  |
| rcm | datetime | no | no | (getdate()) |
| luu | varchar(100) | yes | no |  |
| lcm | datetime | yes | no |  |

| Constraint | Type | Columns |
|---|---|---|
| PK__tbl_revi__D317A8EB7825EAA6 | PRIMARY_KEY_CONSTRAINT | review_response_id |

### dbo.tbl_review_votes

| Column | Type | Nullable | Identity | Default |
|---|---|---:|---:|---|
| vote_id | varchar(36) | no | no | (newid()) |
| review_id | varchar(36) | no | no |  |
| user_id | varchar(36) | no | no |  |
| is_helpful | bit | no | no |  |
| isactive | bit | yes | no | ((1)) |
| isdeleted | bit | yes | no | ((0)) |
| rcu | varchar(100) | yes | no |  |
| rcm | datetime | yes | no | (getdate()) |
| luu | varchar(100) | yes | no |  |
| lcm | datetime | yes | no |  |

| Constraint | Type | Columns |
|---|---|---|
| PK__tbl_revi__9F5405AE6C590472 | PRIMARY_KEY_CONSTRAINT | vote_id |
| UQ_review_vote | UNIQUE_CONSTRAINT | review_id, user_id |

### dbo.tbl_reviews

| Column | Type | Nullable | Identity | Default |
|---|---|---:|---:|---|
| review_id | varchar(36) | no | no | (newid()) |
| product_id | varchar(36) | no | no |  |
| variant_id | varchar(36) | yes | no |  |
| user_id | varchar(36) | no | no |  |
| rating | int | no | no |  |
| review_title | varchar(255) | yes | no |  |
| review_text | varchar(max) | yes | no |  |
| is_verified | bit | yes | no | ((0)) |
| is_approved | bit | yes | no | ((1)) |
| isactive | bit | yes | no | ((1)) |
| isdeleted | bit | yes | no | ((0)) |
| rcu | varchar(100) | yes | no |  |
| rcm | datetime | yes | no | (getdate()) |
| luu | varchar(100) | yes | no |  |
| lcm | datetime | yes | no |  |

| Constraint | Type | Columns |
|---|---|---|
| PK__tbl_revi__60883D905A08A3A7 | PRIMARY_KEY_CONSTRAINT | review_id |

### dbo.tbl_roles

| Column | Type | Nullable | Identity | Default |
|---|---|---:|---:|---|
| role_id | varchar(36) | no | no | (CONVERT([varchar](36),newid())) |
| role_name | varchar(100) | no | no |  |
| role_code | varchar(50) | no | no |  |
| description | varchar(255) | yes | no |  |
| isactive | bit | no | no | ((1)) |
| isdeleted | bit | no | no | ((0)) |
| rcu | varchar(100) | yes | no |  |
| rcm | datetime | no | no | (getdate()) |
| luu | varchar(100) | yes | no |  |
| lcm | datetime | yes | no |  |

| Constraint | Type | Columns |
|---|---|---|
| pk_tbl_roles | PRIMARY_KEY_CONSTRAINT | role_id |

### dbo.tbl_running_bar_items

| Column | Type | Nullable | Identity | Default |
|---|---|---:|---:|---|
| running_bar_item_id | varchar(36) | no | no | (CONVERT([varchar](36),newid())) |
| running_bar_id | varchar(36) | no | no |  |
| itemsdata | varchar(max) | no | no |  |
| duration_seconds | int | no | no | ((5)) |
| display_order | int | no | no | ((1)) |
| isactive | bit | no | no | ((1)) |
| isdeleted | bit | no | no | ((0)) |
| rcu | varchar(100) | yes | no |  |
| rcm | datetime | no | no | (getdate()) |
| luu | varchar(100) | yes | no |  |
| lcm | datetime | yes | no |  |

| Constraint | Type | Columns |
|---|---|---|
| pk_tbl_running_bar_items | PRIMARY_KEY_CONSTRAINT | running_bar_item_id |

### dbo.tbl_running_bars

| Column | Type | Nullable | Identity | Default |
|---|---|---:|---:|---|
| running_bar_id | varchar(36) | no | no | (CONVERT([varchar](36),newid())) |
| running_bar_name | varchar(255) | no | no |  |
| isactive | bit | no | no | ((1)) |
| isdeleted | bit | no | no | ((0)) |
| rcu | varchar(100) | yes | no |  |
| rcm | datetime | no | no | (getdate()) |
| luu | varchar(100) | yes | no |  |
| lcm | datetime | yes | no |  |

| Constraint | Type | Columns |
|---|---|---|
| pk_tbl_running_bars | PRIMARY_KEY_CONSTRAINT | running_bar_id |

### dbo.tbl_settings

| Column | Type | Nullable | Identity | Default |
|---|---|---:|---:|---|
| setting_id | varchar(36) | no | no | (CONVERT([varchar](36),newid())) |
| site_name | varchar(255) | yes | no |  |
| header_logo_url | varchar(1000) | yes | no |  |
| brand_logo_url | varchar(1000) | yes | no |  |
| footer_logo_url | varchar(1000) | yes | no |  |
| brand_description | varchar(max) | yes | no |  |
| newsletter_title | varchar(255) | yes | no |  |
| newsletter_description | varchar(max) | yes | no |  |
| ismaintenance_mode | bit | no | no | ((0)) |
| isactive | bit | no | no | ((1)) |
| isdeleted | bit | no | no | ((0)) |
| rcu | varchar(100) | yes | no |  |
| rcm | datetime | no | no | (getdate()) |
| luu | varchar(100) | yes | no |  |
| lcm | datetime | yes | no |  |

| Constraint | Type | Columns |
|---|---|---|
| PK_tbl_settings | PRIMARY_KEY_CONSTRAINT | setting_id |

### dbo.tbl_shipment_events

| Column | Type | Nullable | Identity | Default |
|---|---|---:|---:|---|
| shipment_event_id | varchar(36) | no | no | (CONVERT([varchar](36),newid())) |
| shipment_id | varchar(36) | no | no |  |
| event_status | varchar(50) | no | no |  |
| event_location | varchar(255) | yes | no |  |
| event_description | varchar(500) | yes | no |  |
| event_timestamp | datetime | no | no | (getdate()) |
| event_source | varchar(50) | yes | no |  |
| isactive | bit | no | no | ((1)) |
| isdeleted | bit | no | no | ((0)) |
| rcu | varchar(100) | yes | no |  |
| rcm | datetime | no | no | (getdate()) |
| luu | varchar(100) | yes | no |  |
| lcm | datetime | yes | no |  |

| Constraint | Type | Columns |
|---|---|---|
| PK__tbl_ship__1F365B12A23DBBBE | PRIMARY_KEY_CONSTRAINT | shipment_event_id |

### dbo.tbl_shipments

| Column | Type | Nullable | Identity | Default |
|---|---|---:|---:|---|
| shipment_id | varchar(36) | no | no | (CONVERT([varchar](36),newid())) |
| order_id | varchar(36) | no | no |  |
| courier_partner_id | varchar(36) | no | no |  |
| tracking_number | varchar(100) | yes | no |  |
| awb_number | varchar(100) | yes | no |  |
| shipment_status | varchar(50) | no | no | ('pending') |
| weight | decimal(18,2) | yes | no |  |
| dimensions | varchar(100) | yes | no |  |
| shipped_date | datetime | yes | no |  |
| estimated_delivery | datetime | yes | no |  |
| actual_delivery_date | datetime | yes | no |  |
| pickup_address_id | varchar(36) | yes | no |  |
| drop_address_id | varchar(36) | yes | no |  |
| shipping_cost | decimal(18,2) | yes | no |  |
| notes | varchar(500) | yes | no |  |
| isactive | bit | no | no | ((1)) |
| isdeleted | bit | no | no | ((0)) |
| rcu | varchar(100) | yes | no |  |
| rcm | datetime | no | no | (getdate()) |
| luu | varchar(100) | yes | no |  |
| lcm | datetime | yes | no |  |

| Constraint | Type | Columns |
|---|---|---|
| PK__tbl_ship__41466E593D1A3ABF | PRIMARY_KEY_CONSTRAINT | shipment_id |

### dbo.tbl_sizes

| Column | Type | Nullable | Identity | Default |
|---|---|---:|---:|---|
| size_id | varchar(36) | no | no | (CONVERT([varchar](36),newid())) |
| size_name | varchar(50) | no | no |  |
| size_type | varchar(20) | no | no |  |
| display_order | int | no | no | ((1)) |
| isactive | bit | no | no | ((1)) |
| isdeleted | bit | no | no | ((0)) |
| rcu | varchar(100) | yes | no |  |
| rcm | datetime | no | no | (getdate()) |
| luu | varchar(100) | yes | no |  |
| lcm | datetime | yes | no |  |

| Constraint | Type | Columns |
|---|---|---|
| pk_tbl_sizes | PRIMARY_KEY_CONSTRAINT | size_id |

### dbo.tbl_spotlight_entries

| Column | Type | Nullable | Identity | Default |
|---|---|---:|---:|---|
| spotlight_entry_id | varchar(36) | yes | no | (newid()) |
| title | varchar(max) | yes | no |  |
| subtitle | varchar(max) | yes | no |  |
| description | varchar(max) | yes | no |  |
| redirect_link | varchar(max) | yes | no |  |
| cta_text | varchar(100) | yes | no | ('shop now/explore') |
| display_order | int | yes | no | ((1)) |
| isactive | bit | yes | no | ((1)) |
| isdeleted | bit | yes | no | ((0)) |
| rcu | varchar(100) | yes | no |  |
| rcm | datetime | yes | no | (getdate()) |
| luu | varchar(100) | yes | no |  |
| lcm | datetime | yes | no |  |

### dbo.tbl_spotlight_media

| Column | Type | Nullable | Identity | Default |
|---|---|---:|---:|---|
| spotlight_media_id | varchar(36) | yes | no | (newid()) |
| spotlight_entry_id | varchar(36) | yes | no |  |
| media_type | varchar(20) | yes | no |  |
| media_url | varchar(max) | yes | no |  |
| alt_text | varchar(max) | yes | no |  |
| display_order | int | yes | no | ((1)) |
| isprimary | bit | yes | no | ((0)) |
| isactive | bit | yes | no | ((1)) |
| isdeleted | bit | yes | no | ((0)) |
| rcu | varchar(max) | yes | no |  |
| rcm | datetime | yes | no | (getdate()) |
| luu | varchar(max) | yes | no |  |
| lcm | datetime | yes | no |  |

### dbo.tbl_style_collection_media

| Column | Type | Nullable | Identity | Default |
|---|---|---:|---:|---|
| style_collection_media_id | varchar(36) | yes | no | (newid()) |
| style_collection_id | varchar(36) | yes | no |  |
| media_type | varchar(20) | yes | no |  |
| media_url | varchar(max) | yes | no |  |
| alt_text | varchar(max) | yes | no |  |
| display_order | int | yes | no | ((1)) |
| isprimary | bit | yes | no | ((0)) |
| isactive | bit | yes | no | ((1)) |
| isdeleted | bit | yes | no | ((0)) |
| rcu | varchar(max) | yes | no |  |
| rcm | datetime | yes | no | (getdate()) |
| luu | varchar(max) | yes | no |  |
| lcm | datetime | yes | no |  |

### dbo.tbl_style_collections

| Column | Type | Nullable | Identity | Default |
|---|---|---:|---:|---|
| style_collection_id | varchar(36) | yes | no | (newid()) |
| collection_name | varchar(max) | yes | no |  |
| collection_slug | varchar(max) | yes | no |  |
| description | varchar(max) | yes | no |  |
| redirect_link | varchar(max) | yes | no |  |
| cta_text | varchar(max) | yes | no |  |
| display_order | int | yes | no | ((1)) |
| isactive | bit | yes | no | ((1)) |
| isdeleted | bit | yes | no | ((0)) |
| rcu | varchar(max) | yes | no |  |
| rcm | datetime | yes | no | (getdate()) |
| luu | varchar(max) | yes | no |  |
| lcm | datetime | yes | no |  |

### dbo.tbl_support_contacts

| Column | Type | Nullable | Identity | Default |
|---|---|---:|---:|---|
| support_contact_id | varchar(36) | no | no | (CONVERT([varchar](36),newid())) |
| contact_title | varchar(255) | yes | no |  |
| contact_name | varchar(255) | yes | no |  |
| contact_email | varchar(255) | yes | no |  |
| contact_number | varchar(50) | yes | no |  |
| whatsapp_number | varchar(50) | yes | no |  |
| address_text | varchar(500) | yes | no |  |
| working_hours | varchar(255) | yes | no |  |
| isactive | bit | no | no | ((1)) |
| isdeleted | bit | no | no | ((0)) |
| rcu | varchar(100) | yes | no |  |
| rcm | datetime | no | no | (getdate()) |
| luu | varchar(100) | yes | no |  |
| lcm | datetime | yes | no |  |

| Constraint | Type | Columns |
|---|---|---|
| PK_tbl_support_contacts | PRIMARY_KEY_CONSTRAINT | support_contact_id |

### dbo.tbl_user_roles

| Column | Type | Nullable | Identity | Default |
|---|---|---:|---:|---|
| user_role_id | varchar(36) | no | no | (CONVERT([varchar](36),newid())) |
| user_id | varchar(36) | no | no |  |
| role_id | varchar(36) | no | no |  |
| assigned_at | datetime | no | no | (getdate()) |
| isactive | bit | no | no | ((1)) |
| isdeleted | bit | no | no | ((0)) |
| rcu | varchar(100) | yes | no |  |
| rcm | datetime | no | no | (getdate()) |
| luu | varchar(100) | yes | no |  |
| lcm | datetime | yes | no |  |

| Constraint | Type | Columns |
|---|---|---|
| pk_tbl_user_roles | PRIMARY_KEY_CONSTRAINT | user_role_id |

### dbo.tbl_users

| Column | Type | Nullable | Identity | Default |
|---|---|---:|---:|---|
| user_id | varchar(36) | no | no | (CONVERT([varchar](36),newid())) |
| email | varchar(255) | no | no |  |
| phone_number | varchar(20) | yes | no |  |
| first_name | varchar(100) | yes | no |  |
| last_name | varchar(100) | yes | no |  |
| full_name | varchar(255) | yes | no |  |
| password_hash | varchar(500) | yes | no |  |
| password_salt | varchar(500) | yes | no |  |
| profile_picture_url | varchar(1000) | yes | no |  |
| email_verified | bit | no | no | ((0)) |
| email_verified_at | datetime | yes | no |  |
| phone_verified | bit | no | no | ((0)) |
| phone_verified_at | datetime | yes | no |  |
| last_login | datetime | yes | no |  |
| isactive | bit | no | no | ((1)) |
| isdeleted | bit | no | no | ((0)) |
| rcu | varchar(100) | yes | no |  |
| rcm | datetime | no | no | (getdate()) |
| luu | varchar(100) | yes | no |  |
| lcm | datetime | yes | no |  |

| Constraint | Type | Columns |
|---|---|---|
| PK__tbl_user__B9BE370F0E7453B1 | PRIMARY_KEY_CONSTRAINT | user_id |
| ux_tbl_users_email | UNIQUE_CONSTRAINT | email |

### dbo.tbl_variant_rating_summary

| Column | Type | Nullable | Identity | Default |
|---|---|---:|---:|---|
| variant_id | varchar(36) | no | no |  |
| avg_rating | decimal(3,2) | yes | no | ((0)) |
| total_reviews | int | yes | no | ((0)) |
| rcu | varchar(100) | yes | no |  |
| rcm | datetime | yes | no | (getdate()) |
| luu | varchar(100) | yes | no |  |
| lcm | datetime | yes | no |  |

| Constraint | Type | Columns |
|---|---|---|
| PK__tbl_vari__EACC68B779E7C5F9 | PRIMARY_KEY_CONSTRAINT | variant_id |

### dbo.tbl_wishlist_items

| Column | Type | Nullable | Identity | Default |
|---|---|---:|---:|---|
| wishlist_item_id | varchar(36) | no | no | (CONVERT([varchar](36),newid())) |
| wishlist_id | varchar(36) | no | no |  |
| product_id | varchar(36) | no | no |  |
| product_variant_id | varchar(36) | yes | no |  |
| added_at | datetime | no | no | (getdate()) |
| isactive | bit | no | no | ((1)) |
| isdeleted | bit | no | no | ((0)) |
| rcu | varchar(100) | yes | no |  |
| rcm | datetime | no | no | (getdate()) |
| luu | varchar(100) | yes | no |  |
| lcm | datetime | yes | no |  |

| Constraint | Type | Columns |
|---|---|---|
| PK__tbl_wish__190EBE2840AB6F5C | PRIMARY_KEY_CONSTRAINT | wishlist_item_id |

### dbo.tbl_wishlists

| Column | Type | Nullable | Identity | Default |
|---|---|---:|---:|---|
| wishlist_id | varchar(36) | no | no | (CONVERT([varchar](36),newid())) |
| user_id | varchar(36) | no | no |  |
| wishlist_name | varchar(255) | no | no | ('my wishlist') |
| isactive | bit | no | no | ((1)) |
| isdeleted | bit | no | no | ((0)) |
| rcu | varchar(100) | yes | no |  |
| rcm | datetime | no | no | (getdate()) |
| luu | varchar(100) | yes | no |  |
| lcm | datetime | yes | no |  |

| Constraint | Type | Columns |
|---|---|---|
| PK__tbl_wish__6151514E28648F38 | PRIMARY_KEY_CONSTRAINT | wishlist_id |

## Indexes

### dbo.tbl_addresses

| Index | Type | Unique | Primary | Columns | Included |
|---|---|---:|---:|---|---|
| ix_tbl_addresses_user | NONCLUSTERED | no | no | user_id, isdefault |  |
| pk_tbl_addresses | CLUSTERED | yes | yes | address_id |  |

### dbo.tbl_appointment_date_slots

| Index | Type | Unique | Primary | Columns | Included |
|---|---|---:|---:|---|---|
| PK_tbl_appointment_date_slots | CLUSTERED | yes | yes | appointment_date_slot_id |  |
| UX_tbl_appointment_date_slots_slot_date | NONCLUSTERED | yes | no | slot_date |  |

### dbo.tbl_appointment_slot_blocks

| Index | Type | Unique | Primary | Columns | Included |
|---|---|---:|---:|---|---|
| IX_tbl_appointment_slot_blocks_date | NONCLUSTERED | no | no | appointment_date_slot_id, isdeleted | block_start_time, block_end_time, block_reason, blocked_by |
| PK_tbl_appointment_slot_blocks | CLUSTERED | yes | yes | appointment_slot_block_id |  |

### dbo.tbl_appointment_time_slots

| Index | Type | Unique | Primary | Columns | Included |
|---|---|---:|---:|---|---|
| IX_tbl_appointment_time_slots_date_fetch | NONCLUSTERED | no | no | appointment_date_slot_id, isavailable, isbooked, isdeleted | slot_start_time, slot_end_time, display_order, appointment_id, booked_at |
| PK_tbl_appointment_time_slots | CLUSTERED | yes | yes | appointment_time_slot_id |  |
| UX_tbl_appointment_time_slots_unique | NONCLUSTERED | yes | no | appointment_date_slot_id, slot_start_time, slot_end_time |  |

### dbo.tbl_attributes

| Index | Type | Unique | Primary | Columns | Included |
|---|---|---:|---:|---|---|
| ix_tbl_attributes_active_order | NONCLUSTERED | no | no | isactive, isdeleted, display_order |  |
| pk_tbl_attributes | CLUSTERED | yes | yes | attribute_id |  |
| ux_tbl_attributes_slug | NONCLUSTERED | yes | no | attribute_slug |  |

### dbo.tbl_care_instructions

| Index | Type | Unique | Primary | Columns | Included |
|---|---|---:|---:|---|---|
| ix_tbl_care_instructions_active_order | NONCLUSTERED | no | no | isactive, isdeleted, display_order |  |
| pk_tbl_care_instructions | CLUSTERED | yes | yes | care_instruction_id |  |

### dbo.tbl_cart_items

| Index | Type | Unique | Primary | Columns | Included |
|---|---|---:|---:|---|---|
| ix_tbl_cart_items_cart | NONCLUSTERED | no | no | cart_id |  |
| ix_tbl_cart_items_product | NONCLUSTERED | no | no | product_id |  |
| ix_tbl_cart_items_variant | NONCLUSTERED | no | no | product_variant_id |  |
| PK__tbl_cart__5D9A6C6E7AD4DA40 | CLUSTERED | yes | yes | cart_item_id |  |
| ux_tbl_cart_items_unique | NONCLUSTERED | yes | no | cart_id, product_id, product_variant_id |  |

### dbo.tbl_carts

| Index | Type | Unique | Primary | Columns | Included |
|---|---|---:|---:|---|---|
| ix_tbl_carts_user | NONCLUSTERED | no | no | user_id |  |
| ix_tbl_carts_user_status | NONCLUSTERED | no | no | user_id, cart_status |  |
| PK__tbl_cart__2EF52A27F0DAE529 | CLUSTERED | yes | yes | cart_id |  |

### dbo.tbl_cloth_type_care_instructions

| Index | Type | Unique | Primary | Columns | Included |
|---|---|---:|---:|---|---|
| ix_tbl_ctci_type_order | NONCLUSTERED | no | no | cloth_type_id, display_order |  |
| pk_tbl_cloth_type_care_instructions | CLUSTERED | yes | yes | cloth_type_care_instruction_id |  |
| ux_tbl_ctci_unique | NONCLUSTERED | yes | no | cloth_type_id, care_instruction_id |  |

### dbo.tbl_cloth_types

| Index | Type | Unique | Primary | Columns | Included |
|---|---|---:|---:|---|---|
| ix_tbl_cloth_types_active_order | NONCLUSTERED | no | no | isactive, isdeleted, display_order |  |
| pk_tbl_cloth_types | CLUSTERED | yes | yes | cloth_type_id |  |
| ux_tbl_cloth_types_slug | NONCLUSTERED | yes | no | cloth_type_slug |  |

### dbo.tbl_coupon_usage

| Index | Type | Unique | Primary | Columns | Included |
|---|---|---:|---:|---|---|
| ix_tbl_coupon_usage_coupon | NONCLUSTERED | no | no | coupon_id |  |
| ix_tbl_coupon_usage_date | NONCLUSTERED | no | no | used_at |  |
| ix_tbl_coupon_usage_order | NONCLUSTERED | no | no | order_id |  |
| ix_tbl_coupon_usage_user | NONCLUSTERED | no | no | user_id |  |
| PK__tbl_coup__1B44EFEBCD0F9DBD | CLUSTERED | yes | yes | coupon_usage_id |  |

### dbo.tbl_coupons

| Index | Type | Unique | Primary | Columns | Included |
|---|---|---:|---:|---|---|
| ix_tbl_coupons_dates | NONCLUSTERED | no | no | start_date, end_date |  |
| PK__tbl_coup__58CF63898F14BC10 | CLUSTERED | yes | yes | coupon_id |  |
| ux_tbl_coupons_code | NONCLUSTERED | yes | no | coupon_code |  |

### dbo.tbl_courier_partners

| Index | Type | Unique | Primary | Columns | Included |
|---|---|---:|---:|---|---|
| ix_tbl_courier_partners_code | NONCLUSTERED | no | no | courier_code |  |
| PK__tbl_cour__39BCF39E2230EA0B | CLUSTERED | yes | yes | courier_partner_id |  |
| ux_tbl_courier_partners_code | NONCLUSTERED | yes | no | courier_code |  |

### dbo.tbl_custom_appointments

| Index | Type | Unique | Primary | Columns | Included |
|---|---|---:|---:|---|---|
| IX_tbl_custom_appointments_user_time | NONCLUSTERED | no | no | user_id, requested_at |  |
| PK_tbl_custom_appointments | CLUSTERED | yes | yes | appointment_id |  |
| UX_tbl_custom_appointments_time_slot | NONCLUSTERED | yes | no | appointment_time_slot_id |  |

### dbo.tbl_customer_profiles

| Index | Type | Unique | Primary | Columns | Included |
|---|---|---:|---:|---|---|
| PK__tbl_cust__AEBB701F922A2DF3 | CLUSTERED | yes | yes | profile_id |  |
| ux_tbl_customer_profiles_user | NONCLUSTERED | yes | no | user_id |  |

### dbo.tbl_discount_targets

| Index | Type | Unique | Primary | Columns | Included |
|---|---|---:|---:|---|---|
| ix_tbl_discount_targets_discount | NONCLUSTERED | no | no | discount_id |  |
| ix_tbl_discount_targets_target | NONCLUSTERED | no | no | target_type, target_id |  |
| PK__tbl_disc__B422BF010289AE72 | CLUSTERED | yes | yes | discount_target_id |  |

### dbo.tbl_discounts

| Index | Type | Unique | Primary | Columns | Included |
|---|---|---:|---:|---|---|
| ix_tbl_discounts_dates_priority | NONCLUSTERED | no | no | start_date, end_date, discount_priority |  |
| PK__tbl_disc__BDBE9EF9D720D481 | CLUSTERED | yes | yes | discount_id |  |

### dbo.tbl_faqs

| Index | Type | Unique | Primary | Columns | Included |
|---|---|---:|---:|---|---|
| ix_tbl_faqs_active_order | NONCLUSTERED | no | no | isactive, isdeleted, display_order |  |
| PK_tbl_faqs | CLUSTERED | yes | yes | faq_id |  |

### dbo.tbl_invoices

| Index | Type | Unique | Primary | Columns | Included |
|---|---|---:|---:|---|---|
| ix_tbl_invoices_order | NONCLUSTERED | no | no | order_id |  |
| PK__tbl_invo__F58DFD4968E79D18 | CLUSTERED | yes | yes | invoice_id |  |
| ux_tbl_invoices_invoice_number | NONCLUSTERED | yes | no | invoice_number |  |

### dbo.tbl_legal_page_header

| Index | Type | Unique | Primary | Columns | Included |
|---|---|---:|---:|---|---|
| PK__tbl_lega__3213E83FEB7C5468 | CLUSTERED | yes | yes | id |  |

### dbo.tbl_legal_page_sections

| Index | Type | Unique | Primary | Columns | Included |
|---|---|---:|---:|---|---|
| PK__tbl_lega__3213E83F774BB419 | CLUSTERED | yes | yes | id |  |

### dbo.tbl_menu_categories

| Index | Type | Unique | Primary | Columns | Included |
|---|---|---:|---:|---|---|
| ix_tbl_menu_categories_active_order | NONCLUSTERED | no | no | isactive, isdeleted, display_order |  |
| ix_tbl_menu_categories_order | NONCLUSTERED | no | no | display_order |  |
| pk_tbl_menu_categories | CLUSTERED | yes | yes | menu_category_id |  |
| ux_tbl_menu_categories_slug | NONCLUSTERED | yes | no | menu_category_slug |  |

### dbo.tbl_menu_subcategories

| Index | Type | Unique | Primary | Columns | Included |
|---|---|---:|---:|---|---|
| ix_tbl_menu_subcategories_active_order | NONCLUSTERED | no | no | menu_category_id, isactive, isdeleted, display_order |  |
| ix_tbl_menu_subcategories_category_order | NONCLUSTERED | no | no | menu_category_id, display_order |  |
| pk_tbl_menu_subcategories | CLUSTERED | yes | yes | menu_subcategory_id |  |
| ux_tbl_menu_subcategories_slug | NONCLUSTERED | yes | no | menu_subcategory_slug |  |

### dbo.tbl_newsletter_subscriptions

| Index | Type | Unique | Primary | Columns | Included |
|---|---|---:|---:|---|---|
| ix_tbl_newsletter_subscriptions_status | NONCLUSTERED | no | no | subscription_status |  |
| ix_tbl_newsletter_subscriptions_subscribed_at | NONCLUSTERED | no | no | subscribed_at |  |
| ix_tbl_newsletter_subscriptions_user | NONCLUSTERED | no | no | user_id |  |
| PK_tbl_newsletter_subscriptions | CLUSTERED | yes | yes | newsletter_subscription_id |  |
| ux_tbl_newsletter_subscriptions_email | NONCLUSTERED | yes | no | emailid |  |

### dbo.tbl_order_addresses

| Index | Type | Unique | Primary | Columns | Included |
|---|---|---:|---:|---|---|
| ix_tbl_order_addresses_order_type | NONCLUSTERED | no | no | order_id, address_type |  |
| PK__tbl_orde__9A9DCB571DED03B7 | CLUSTERED | yes | yes | order_address_id |  |

### dbo.tbl_order_cancellations

| Index | Type | Unique | Primary | Columns | Included |
|---|---|---:|---:|---|---|
| ix_tbl_order_cancellations_order | NONCLUSTERED | no | no | order_id |  |
| ix_tbl_order_cancellations_time | NONCLUSTERED | no | no | cancelled_at |  |
| PK__tbl_orde__C033AB8710CC116B | CLUSTERED | yes | yes | order_cancellation_id |  |

### dbo.tbl_order_items

| Index | Type | Unique | Primary | Columns | Included |
|---|---|---:|---:|---|---|
| ix_tbl_order_items_order | NONCLUSTERED | no | no | order_id |  |
| ix_tbl_order_items_product | NONCLUSTERED | no | no | product_id |  |
| ix_tbl_order_items_variant | NONCLUSTERED | no | no | product_variant_id |  |
| PK__tbl_orde__3764B6BCA13309CF | CLUSTERED | yes | yes | order_item_id |  |

### dbo.tbl_order_promotions

| Index | Type | Unique | Primary | Columns | Included |
|---|---|---:|---:|---|---|
| ix_tbl_order_promotions_date | NONCLUSTERED | no | no | applied_at |  |
| ix_tbl_order_promotions_order | NONCLUSTERED | no | no | order_id |  |
| ix_tbl_order_promotions_type | NONCLUSTERED | no | no | promotion_type |  |
| PK__tbl_orde__0A2A9E0E1EDCE3E3 | CLUSTERED | yes | yes | order_promotion_id |  |

### dbo.tbl_order_status_history

| Index | Type | Unique | Primary | Columns | Included |
|---|---|---:|---:|---|---|
| ix_tbl_order_status_history_order_time | NONCLUSTERED | no | no | order_id, orderstatustime |  |
| ix_tbl_order_status_history_status | NONCLUSTERED | no | no | order_status_id |  |
| PK__tbl_orde__0AEF0D355F8E1176 | CLUSTERED | yes | yes | order_status_history_id |  |

### dbo.tbl_order_status_master

| Index | Type | Unique | Primary | Columns | Included |
|---|---|---:|---:|---|---|
| ix_tbl_order_status_master_active | NONCLUSTERED | no | no | isactive, isdeleted |  |
| ix_tbl_order_status_master_display_order | NONCLUSTERED | no | no | display_order |  |
| PK__tbl_orde__A499CF231C312767 | CLUSTERED | yes | yes | order_status_id |  |
| ux_tbl_order_status_master_status_code | NONCLUSTERED | yes | no | status_code |  |

### dbo.tbl_orders

| Index | Type | Unique | Primary | Columns | Included |
|---|---|---:|---:|---|---|
| ix_tbl_orders_cart | NONCLUSTERED | no | no | cart_id |  |
| ix_tbl_orders_status | NONCLUSTERED | no | no | order_status_id |  |
| ix_tbl_orders_user_placed_at | NONCLUSTERED | no | no | user_id, placed_at |  |
| PK__tbl_orde__46596229D70FFA50 | CLUSTERED | yes | yes | order_id |  |
| ux_tbl_orders_order_number | NONCLUSTERED | yes | no | order_number |  |

### dbo.tbl_payments

| Index | Type | Unique | Primary | Columns | Included |
|---|---|---:|---:|---|---|
| ix_tbl_payments_order | NONCLUSTERED | no | no | order_id |  |
| ix_tbl_payments_paid_at | NONCLUSTERED | no | no | paid_at |  |
| ix_tbl_payments_razorpay_payment_id | NONCLUSTERED | no | no | razorpay_payment_id |  |
| ix_tbl_payments_status | NONCLUSTERED | no | no | payment_status |  |
| ix_tbl_payments_user | NONCLUSTERED | no | no | user_id |  |
| PK__tbl_paym__ED1FC9EA9578C69D | CLUSTERED | yes | yes | payment_id |  |

### dbo.tbl_product_attribute_values

| Index | Type | Unique | Primary | Columns | Included |
|---|---|---:|---:|---|---|
| ix_tbl_pav_attribute | NONCLUSTERED | no | no | attribute_id |  |
| ix_tbl_pav_product_attribute | NONCLUSTERED | no | no | product_id, attribute_id |  |
| ix_tbl_pav_variant | NONCLUSTERED | no | no | product_variant_id |  |
| pk_tbl_product_attribute_values | CLUSTERED | yes | yes | product_attribute_value_id |  |
| ux_tbl_pav_unique | NONCLUSTERED | yes | no | product_id, product_variant_id, attribute_id |  |

### dbo.tbl_product_media

| Index | Type | Unique | Primary | Columns | Included |
|---|---|---:|---:|---|---|
| ix_tbl_product_media_primary | NONCLUSTERED | no | no | product_id, isprimary |  |
| ix_tbl_product_media_product_order | NONCLUSTERED | no | no | product_id, display_order |  |
| ix_tbl_product_media_variant | NONCLUSTERED | no | no | product_variant_id |  |
| pk_tbl_product_media | CLUSTERED | yes | yes | product_media_id |  |

### dbo.tbl_product_rating_summary

| Index | Type | Unique | Primary | Columns | Included |
|---|---|---:|---:|---|---|
| PK__tbl_prod__47027DF5F127799D | CLUSTERED | yes | yes | product_id |  |

### dbo.tbl_product_reviews

| Index | Type | Unique | Primary | Columns | Included |
|---|---|---:|---:|---|---|
| ix_tbl_product_reviews_date | NONCLUSTERED | no | no | reviewed_date |  |
| ix_tbl_product_reviews_product_rating | NONCLUSTERED | no | no | product_id, rating |  |
| ix_tbl_product_reviews_status | NONCLUSTERED | no | no | review_status |  |
| ix_tbl_product_reviews_user | NONCLUSTERED | no | no | user_id |  |
| ix_tbl_product_reviews_verified | NONCLUSTERED | no | no | is_verified_purchase |  |
| PK__tbl_prod__8440EB03F3CD2A45 | CLUSTERED | yes | yes | product_review_id |  |

### dbo.tbl_product_seo

| Index | Type | Unique | Primary | Columns | Included |
|---|---|---:|---:|---|---|
| pk_tbl_product_seo | CLUSTERED | yes | yes | product_seo_id |  |
| ux_tbl_product_seo_product | NONCLUSTERED | yes | no | product_id |  |

### dbo.tbl_product_variants

| Index | Type | Unique | Primary | Columns | Included |
|---|---|---:|---:|---|---|
| ix_tbl_product_variants_product | NONCLUSTERED | no | no | product_id |  |
| pk_tbl_product_variants | CLUSTERED | yes | yes | product_variant_id |  |
| ux_tbl_product_variants_one_default | NONCLUSTERED | yes | no | product_id |  |
| ux_tbl_product_variants_sku | NONCLUSTERED | yes | no | sku |  |

### dbo.tbl_products

| Index | Type | Unique | Primary | Columns | Included |
|---|---|---:|---:|---|---|
| ix_tbl_products_active | NONCLUSTERED | no | no | isactive, isdeleted |  |
| pk_tbl_products | CLUSTERED | yes | yes | product_id |  |
| ux_tbl_products_slug | NONCLUSTERED | yes | no | product_slug |  |

### dbo.tbl_profiles

| Index | Type | Unique | Primary | Columns | Included |
|---|---|---:|---:|---|---|
| ix_tbl_profiles_user | NONCLUSTERED | no | no | user_id |  |
| pk_tbl_profiles | CLUSTERED | yes | yes | profile_id |  |

### dbo.tbl_refunds

| Index | Type | Unique | Primary | Columns | Included |
|---|---|---:|---:|---|---|
| ix_tbl_refunds_initiated_date | NONCLUSTERED | no | no | initiated_date |  |
| ix_tbl_refunds_order | NONCLUSTERED | no | no | order_id |  |
| ix_tbl_refunds_payment | NONCLUSTERED | no | no | payment_id |  |
| ix_tbl_refunds_return | NONCLUSTERED | no | no | return_id |  |
| ix_tbl_refunds_status | NONCLUSTERED | no | no | refund_status |  |
| ix_tbl_refunds_user | NONCLUSTERED | no | no | user_id |  |
| ix_tbl_refunds_user_status_date | NONCLUSTERED | no | no | user_id, refund_status, initiated_date |  |
| PK__tbl_refu__897E9EA3847B7BED | CLUSTERED | yes | yes | refund_id |  |

### dbo.tbl_returns

| Index | Type | Unique | Primary | Columns | Included |
|---|---|---:|---:|---|---|
| ix_tbl_returns_order | NONCLUSTERED | no | no | order_id |  |
| ix_tbl_returns_requested_date | NONCLUSTERED | no | no | requested_date |  |
| ix_tbl_returns_status | NONCLUSTERED | no | no | return_status |  |
| ix_tbl_returns_user | NONCLUSTERED | no | no | user_id |  |
| PK__tbl_retu__35C234739C6BA681 | CLUSTERED | yes | yes | return_id |  |
| ux_tbl_returns_rma | NONCLUSTERED | yes | no | rma_number |  |

### dbo.tbl_review_media

| Index | Type | Unique | Primary | Columns | Included |
|---|---|---:|---:|---|---|
| PK__tbl_revi__D0A840F4C3D443EE | CLUSTERED | yes | yes | media_id |  |

### dbo.tbl_review_responses

| Index | Type | Unique | Primary | Columns | Included |
|---|---|---:|---:|---|---|
| ix_tbl_review_responses_review | NONCLUSTERED | no | no | product_review_id |  |
| ix_tbl_review_responses_user | NONCLUSTERED | no | no | responder_user_id |  |
| PK__tbl_revi__D317A8EB7825EAA6 | CLUSTERED | yes | yes | review_response_id |  |

### dbo.tbl_review_votes

| Index | Type | Unique | Primary | Columns | Included |
|---|---|---:|---:|---|---|
| idx_review_votes_review | NONCLUSTERED | no | no | review_id |  |
| PK__tbl_revi__9F5405AE6C590472 | CLUSTERED | yes | yes | vote_id |  |
| UQ_review_vote | NONCLUSTERED | yes | no | review_id, user_id |  |

### dbo.tbl_reviews

| Index | Type | Unique | Primary | Columns | Included |
|---|---|---:|---:|---|---|
| idx_reviews_product | NONCLUSTERED | no | no | product_id |  |
| idx_reviews_user | NONCLUSTERED | no | no | user_id |  |
| idx_reviews_variant | NONCLUSTERED | no | no | variant_id |  |
| PK__tbl_revi__60883D905A08A3A7 | CLUSTERED | yes | yes | review_id |  |

### dbo.tbl_roles

| Index | Type | Unique | Primary | Columns | Included |
|---|---|---:|---:|---|---|
| ix_tbl_roles_active | NONCLUSTERED | no | no | isactive, isdeleted |  |
| ix_tbl_roles_code | NONCLUSTERED | no | no | role_code |  |
| pk_tbl_roles | CLUSTERED | yes | yes | role_id |  |
| ux_tbl_roles_role_code | NONCLUSTERED | yes | no | role_code |  |

### dbo.tbl_running_bar_items

| Index | Type | Unique | Primary | Columns | Included |
|---|---|---:|---:|---|---|
| pk_tbl_running_bar_items | CLUSTERED | yes | yes | running_bar_item_id |  |

### dbo.tbl_running_bars

| Index | Type | Unique | Primary | Columns | Included |
|---|---|---:|---:|---|---|
| pk_tbl_running_bars | CLUSTERED | yes | yes | running_bar_id |  |

### dbo.tbl_settings

| Index | Type | Unique | Primary | Columns | Included |
|---|---|---:|---:|---|---|
| ix_tbl_settings_active | NONCLUSTERED | no | no | isactive, isdeleted |  |
| PK_tbl_settings | CLUSTERED | yes | yes | setting_id |  |

### dbo.tbl_shipment_events

| Index | Type | Unique | Primary | Columns | Included |
|---|---|---:|---:|---|---|
| ix_tbl_shipment_events_shipment_time | NONCLUSTERED | no | no | shipment_id, event_timestamp |  |
| ix_tbl_shipment_events_timestamp | NONCLUSTERED | no | no | event_timestamp |  |
| PK__tbl_ship__1F365B12A23DBBBE | CLUSTERED | yes | yes | shipment_event_id |  |

### dbo.tbl_shipments

| Index | Type | Unique | Primary | Columns | Included |
|---|---|---:|---:|---|---|
| ix_tbl_shipments_courier | NONCLUSTERED | no | no | courier_partner_id |  |
| ix_tbl_shipments_order | NONCLUSTERED | no | no | order_id |  |
| ix_tbl_shipments_shipped_date | NONCLUSTERED | no | no | shipped_date |  |
| ix_tbl_shipments_status | NONCLUSTERED | no | no | shipment_status |  |
| PK__tbl_ship__41466E593D1A3ABF | CLUSTERED | yes | yes | shipment_id |  |
| ux_tbl_shipments_tracking | NONCLUSTERED | yes | no | tracking_number |  |

### dbo.tbl_sizes

| Index | Type | Unique | Primary | Columns | Included |
|---|---|---:|---:|---|---|
| ix_tbl_sizes_type_order | NONCLUSTERED | no | no | size_type, display_order |  |
| pk_tbl_sizes | CLUSTERED | yes | yes | size_id |  |
| ux_tbl_sizes_name_type | NONCLUSTERED | yes | no | size_name, size_type |  |

### dbo.tbl_support_contacts

| Index | Type | Unique | Primary | Columns | Included |
|---|---|---:|---:|---|---|
| ix_tbl_support_contacts_active | NONCLUSTERED | no | no | isactive, isdeleted |  |
| ix_tbl_support_contacts_email | NONCLUSTERED | no | no | contact_email |  |
| ix_tbl_support_contacts_phone | NONCLUSTERED | no | no | contact_number |  |
| PK_tbl_support_contacts | CLUSTERED | yes | yes | support_contact_id |  |

### dbo.tbl_user_roles

| Index | Type | Unique | Primary | Columns | Included |
|---|---|---:|---:|---|---|
| ix_tbl_user_roles_role | NONCLUSTERED | no | no | role_id |  |
| ix_tbl_user_roles_user | NONCLUSTERED | no | no | user_id |  |
| pk_tbl_user_roles | CLUSTERED | yes | yes | user_role_id |  |
| ux_tbl_user_roles_unique | NONCLUSTERED | yes | no | user_id, role_id |  |

### dbo.tbl_users

| Index | Type | Unique | Primary | Columns | Included |
|---|---|---:|---:|---|---|
| ix_tbl_users_email | NONCLUSTERED | no | no | email |  |
| ix_tbl_users_last_login | NONCLUSTERED | no | no | last_login |  |
| ix_tbl_users_phone | NONCLUSTERED | no | no | phone_number |  |
| PK__tbl_user__B9BE370F0E7453B1 | CLUSTERED | yes | yes | user_id |  |
| ux_tbl_users_email | NONCLUSTERED | yes | no | email |  |

### dbo.tbl_variant_rating_summary

| Index | Type | Unique | Primary | Columns | Included |
|---|---|---:|---:|---|---|
| PK__tbl_vari__EACC68B779E7C5F9 | CLUSTERED | yes | yes | variant_id |  |

### dbo.tbl_wishlist_items

| Index | Type | Unique | Primary | Columns | Included |
|---|---|---:|---:|---|---|
| ix_tbl_wishlist_items_product | NONCLUSTERED | no | no | product_id |  |
| ix_tbl_wishlist_items_variant | NONCLUSTERED | no | no | product_variant_id |  |
| ix_tbl_wishlist_items_wishlist | NONCLUSTERED | no | no | wishlist_id |  |
| PK__tbl_wish__190EBE2840AB6F5C | CLUSTERED | yes | yes | wishlist_item_id |  |
| ux_tbl_wishlist_items_unique | NONCLUSTERED | yes | no | wishlist_id, product_id, product_variant_id |  |

### dbo.tbl_wishlists

| Index | Type | Unique | Primary | Columns | Included |
|---|---|---:|---:|---|---|
| ix_tbl_wishlists_user | NONCLUSTERED | no | no | user_id |  |
| PK__tbl_wish__6151514E28648F38 | CLUSTERED | yes | yes | wishlist_id |  |

## Foreign Keys

### dbo.tbl_appointment_slot_blocks

| Foreign Key | Columns | References | On Delete | On Update |
|---|---|---|---|---|
| FK_slot_blocks_date_slots | appointment_date_slot_id | dbo.tbl_appointment_date_slots(appointment_date_slot_id) | NO_ACTION | NO_ACTION |

### dbo.tbl_appointment_time_slots

| Foreign Key | Columns | References | On Delete | On Update |
|---|---|---|---|---|
| FK_time_slots_appointments | appointment_id | dbo.tbl_custom_appointments(appointment_id) | NO_ACTION | NO_ACTION |
| FK_time_slots_date_slots | appointment_date_slot_id | dbo.tbl_appointment_date_slots(appointment_date_slot_id) | NO_ACTION | NO_ACTION |

### dbo.tbl_cart_items

| Foreign Key | Columns | References | On Delete | On Update |
|---|---|---|---|---|
| fk_tbl_cart_items_cart | cart_id | dbo.tbl_carts(cart_id) | NO_ACTION | NO_ACTION |
| fk_tbl_cart_items_product | product_id | dbo.tbl_products(product_id) | NO_ACTION | NO_ACTION |
| fk_tbl_cart_items_variant | product_variant_id | dbo.tbl_product_variants(product_variant_id) | NO_ACTION | NO_ACTION |

### dbo.tbl_cloth_type_care_instructions

| Foreign Key | Columns | References | On Delete | On Update |
|---|---|---|---|---|
| fk_tbl_ctci_care_instruction | care_instruction_id | dbo.tbl_care_instructions(care_instruction_id) | NO_ACTION | NO_ACTION |
| fk_tbl_ctci_cloth_type | cloth_type_id | dbo.tbl_cloth_types(cloth_type_id) | NO_ACTION | NO_ACTION |

### dbo.tbl_coupon_usage

| Foreign Key | Columns | References | On Delete | On Update |
|---|---|---|---|---|
| fk_tbl_coupon_usage_coupon | coupon_id | dbo.tbl_coupons(coupon_id) | NO_ACTION | NO_ACTION |
| fk_tbl_coupon_usage_order | order_id | dbo.tbl_orders(order_id) | NO_ACTION | NO_ACTION |

### dbo.tbl_custom_appointments

| Foreign Key | Columns | References | On Delete | On Update |
|---|---|---|---|---|
| FK_custom_appointments_date_slots | appointment_date_slot_id | dbo.tbl_appointment_date_slots(appointment_date_slot_id) | NO_ACTION | NO_ACTION |
| FK_custom_appointments_time_slots | appointment_time_slot_id | dbo.tbl_appointment_time_slots(appointment_time_slot_id) | NO_ACTION | NO_ACTION |

### dbo.tbl_customer_profiles

| Foreign Key | Columns | References | On Delete | On Update |
|---|---|---|---|---|
| fk_tbl_customer_profiles_user | user_id | dbo.tbl_users(user_id) | NO_ACTION | NO_ACTION |

### dbo.tbl_discount_targets

| Foreign Key | Columns | References | On Delete | On Update |
|---|---|---|---|---|
| fk_tbl_discount_targets_discount | discount_id | dbo.tbl_discounts(discount_id) | NO_ACTION | NO_ACTION |

### dbo.tbl_invoices

| Foreign Key | Columns | References | On Delete | On Update |
|---|---|---|---|---|
| fk_tbl_invoices_order | order_id | dbo.tbl_orders(order_id) | NO_ACTION | NO_ACTION |

### dbo.tbl_menu_subcategories

| Foreign Key | Columns | References | On Delete | On Update |
|---|---|---|---|---|
| fk_tbl_menu_subcategories_category | menu_category_id | dbo.tbl_menu_categories(menu_category_id) | NO_ACTION | NO_ACTION |

### dbo.tbl_newsletter_subscriptions

| Foreign Key | Columns | References | On Delete | On Update |
|---|---|---|---|---|
| FK_tbl_newsletter_subscriptions_users | user_id | dbo.tbl_users(user_id) | NO_ACTION | NO_ACTION |

### dbo.tbl_order_addresses

| Foreign Key | Columns | References | On Delete | On Update |
|---|---|---|---|---|
| fk_tbl_order_addresses_order | order_id | dbo.tbl_orders(order_id) | NO_ACTION | NO_ACTION |

### dbo.tbl_order_cancellations

| Foreign Key | Columns | References | On Delete | On Update |
|---|---|---|---|---|
| fk_tbl_order_cancellations_order | order_id | dbo.tbl_orders(order_id) | NO_ACTION | NO_ACTION |

### dbo.tbl_order_items

| Foreign Key | Columns | References | On Delete | On Update |
|---|---|---|---|---|
| fk_tbl_order_items_order | order_id | dbo.tbl_orders(order_id) | NO_ACTION | NO_ACTION |
| fk_tbl_order_items_product | product_id | dbo.tbl_products(product_id) | NO_ACTION | NO_ACTION |
| fk_tbl_order_items_variant | product_variant_id | dbo.tbl_product_variants(product_variant_id) | NO_ACTION | NO_ACTION |

### dbo.tbl_order_promotions

| Foreign Key | Columns | References | On Delete | On Update |
|---|---|---|---|---|
| fk_tbl_order_promotions_order | order_id | dbo.tbl_orders(order_id) | NO_ACTION | NO_ACTION |

### dbo.tbl_order_status_history

| Foreign Key | Columns | References | On Delete | On Update |
|---|---|---|---|---|
| fk_tbl_order_status_history_order | order_id | dbo.tbl_orders(order_id) | NO_ACTION | NO_ACTION |
| fk_tbl_order_status_history_status | order_status_id | dbo.tbl_order_status_master(order_status_id) | NO_ACTION | NO_ACTION |

### dbo.tbl_orders

| Foreign Key | Columns | References | On Delete | On Update |
|---|---|---|---|---|
| fk_tbl_orders_cart | cart_id | dbo.tbl_carts(cart_id) | NO_ACTION | NO_ACTION |
| fk_tbl_orders_status | order_status_id | dbo.tbl_order_status_master(order_status_id) | NO_ACTION | NO_ACTION |

### dbo.tbl_payments

| Foreign Key | Columns | References | On Delete | On Update |
|---|---|---|---|---|
| fk_tbl_payments_order | order_id | dbo.tbl_orders(order_id) | NO_ACTION | NO_ACTION |

### dbo.tbl_product_attribute_values

| Foreign Key | Columns | References | On Delete | On Update |
|---|---|---|---|---|
| fk_tbl_pav_attribute | attribute_id | dbo.tbl_attributes(attribute_id) | NO_ACTION | NO_ACTION |
| fk_tbl_pav_product | product_id | dbo.tbl_products(product_id) | NO_ACTION | NO_ACTION |
| fk_tbl_pav_variant | product_variant_id | dbo.tbl_product_variants(product_variant_id) | NO_ACTION | NO_ACTION |

### dbo.tbl_product_media

| Foreign Key | Columns | References | On Delete | On Update |
|---|---|---|---|---|
| fk_tbl_product_media_product | product_id | dbo.tbl_products(product_id) | NO_ACTION | NO_ACTION |
| fk_tbl_product_media_variant | product_variant_id | dbo.tbl_product_variants(product_variant_id) | NO_ACTION | NO_ACTION |

### dbo.tbl_product_reviews

| Foreign Key | Columns | References | On Delete | On Update |
|---|---|---|---|---|
| fk_tbl_product_reviews_order_item | order_item_id | dbo.tbl_order_items(order_item_id) | NO_ACTION | NO_ACTION |
| fk_tbl_product_reviews_product | product_id | dbo.tbl_products(product_id) | NO_ACTION | NO_ACTION |
| fk_tbl_product_reviews_user | user_id | dbo.tbl_users(user_id) | NO_ACTION | NO_ACTION |

### dbo.tbl_product_seo

| Foreign Key | Columns | References | On Delete | On Update |
|---|---|---|---|---|
| fk_tbl_product_seo_product | product_id | dbo.tbl_products(product_id) | NO_ACTION | NO_ACTION |

### dbo.tbl_product_variants

| Foreign Key | Columns | References | On Delete | On Update |
|---|---|---|---|---|
| fk_tbl_product_variants_cloth_type | cloth_type_id | dbo.tbl_cloth_types(cloth_type_id) | NO_ACTION | NO_ACTION |
| fk_tbl_product_variants_product | product_id | dbo.tbl_products(product_id) | NO_ACTION | NO_ACTION |
| fk_tbl_product_variants_size | size_id | dbo.tbl_sizes(size_id) | NO_ACTION | NO_ACTION |

### dbo.tbl_refunds

| Foreign Key | Columns | References | On Delete | On Update |
|---|---|---|---|---|
| fk_tbl_refunds_order | order_id | dbo.tbl_orders(order_id) | NO_ACTION | NO_ACTION |
| fk_tbl_refunds_payment | payment_id | dbo.tbl_payments(payment_id) | NO_ACTION | NO_ACTION |
| fk_tbl_refunds_return | return_id | dbo.tbl_returns(return_id) | NO_ACTION | NO_ACTION |

### dbo.tbl_returns

| Foreign Key | Columns | References | On Delete | On Update |
|---|---|---|---|---|
| fk_tbl_returns_order | order_id | dbo.tbl_orders(order_id) | NO_ACTION | NO_ACTION |

### dbo.tbl_review_media

| Foreign Key | Columns | References | On Delete | On Update |
|---|---|---|---|---|
| FK_review_media_review | review_id | dbo.tbl_reviews(review_id) | NO_ACTION | NO_ACTION |

### dbo.tbl_review_responses

| Foreign Key | Columns | References | On Delete | On Update |
|---|---|---|---|---|
| fk_tbl_review_responses_review | product_review_id | dbo.tbl_product_reviews(product_review_id) | NO_ACTION | NO_ACTION |
| fk_tbl_review_responses_user | responder_user_id | dbo.tbl_users(user_id) | NO_ACTION | NO_ACTION |

### dbo.tbl_review_votes

| Foreign Key | Columns | References | On Delete | On Update |
|---|---|---|---|---|
| FK_review_votes_review | review_id | dbo.tbl_reviews(review_id) | NO_ACTION | NO_ACTION |

### dbo.tbl_running_bar_items

| Foreign Key | Columns | References | On Delete | On Update |
|---|---|---|---|---|
| fk_tbl_running_bar_items_bar | running_bar_id | dbo.tbl_running_bars(running_bar_id) | NO_ACTION | NO_ACTION |

### dbo.tbl_shipments

| Foreign Key | Columns | References | On Delete | On Update |
|---|---|---|---|---|
| fk_tbl_shipments_courier | courier_partner_id | dbo.tbl_courier_partners(courier_partner_id) | NO_ACTION | NO_ACTION |
| fk_tbl_shipments_order | order_id | dbo.tbl_orders(order_id) | NO_ACTION | NO_ACTION |

### dbo.tbl_user_roles

| Foreign Key | Columns | References | On Delete | On Update |
|---|---|---|---|---|
| fk_tbl_user_roles_role | role_id | dbo.tbl_roles(role_id) | NO_ACTION | NO_ACTION |

### dbo.tbl_wishlist_items

| Foreign Key | Columns | References | On Delete | On Update |
|---|---|---|---|---|
| fk_tbl_wishlist_items_product | product_id | dbo.tbl_products(product_id) | NO_ACTION | NO_ACTION |
| fk_tbl_wishlist_items_variant | product_variant_id | dbo.tbl_product_variants(product_variant_id) | NO_ACTION | NO_ACTION |
| fk_tbl_wishlist_items_wishlist | wishlist_id | dbo.tbl_wishlists(wishlist_id) | NO_ACTION | NO_ACTION |

## Views

_None found._

## Stored Procedures

### dbo.sp_check_email_exists

Created: 2026-01-22T16:02:59.500Z
Modified: 2026-06-23T11:28:25.547Z

```sql
CREATE PROCEDURE [dbo].[sp_check_email_exists]
    @email_id VARCHAR(255),
    @exists BIT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT 1 FROM dbo.tbl_users
        WHERE email = @email_id AND isdeleted = 0 AND isactive = 1
    )
        SET @exists = 1;
    ELSE
        SET @exists = 0;
END;
```

### dbo.sp_get_user_password

Created: 2026-01-25T20:19:40.700Z
Modified: 2026-06-23T11:28:04.377Z

```sql
CREATE PROCEDURE [dbo].[sp_get_user_password]
    @email_id VARCHAR(255),
    @success BIT OUTPUT,
    @message VARCHAR(500) OUTPUT,
    @password_hash VARCHAR(255) OUTPUT
AS
BEGIN
    BEGIN TRY
        IF NOT EXISTS (SELECT 1 FROM tbl_users WHERE email = @email_id AND isdeleted = 0 AND isactive = 1)
        BEGIN
            SET @success = 0;
            SET @message = 'User not found';
            SET @password_hash = NULL;
            RETURN;
        END

        SELECT @password_hash = password_hash
        FROM tbl_users
        WHERE email = @email_id AND isdeleted = 0 AND isactive = 1;

        IF @password_hash IS NULL
        BEGIN
            SET @success = 0;
            SET @message = 'Password not set for this user';
            RETURN;
        END

        SET @success = 1;
        SET @message = 'Password retrieved successfully';
    END TRY
    BEGIN CATCH
        SET @success = 0;
        SET @message = ERROR_MESSAGE();
        SET @password_hash = NULL;
    END CATCH
END;
```

### dbo.sp_login_user

Created: 2026-01-22T16:04:56.843Z
Modified: 2026-06-23T11:27:44.540Z

```sql
CREATE PROCEDURE [dbo].[sp_login_user]
    @email_id VARCHAR(255),
    @password_hash VARCHAR(255),
    @success BIT OUTPUT,
    @message VARCHAR(500) OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        -- Check user exists
        IF NOT EXISTS (
            SELECT 1 FROM dbo.tbl_users
            WHERE email = @email_id AND isdeleted = 0 AND isactive = 1
        )
        BEGIN
            SET @success = 0;
            SET @message = 'User not found.';
            RETURN;
        END

        -- Validate password
        IF NOT EXISTS (
            SELECT 1 FROM dbo.tbl_users
            WHERE email = @email_id AND password_hash = @password_hash
              AND isdeleted = 0 AND isactive = 1
        )
        BEGIN
            SET @success = 0;
            SET @message = 'Invalid password.';
            RETURN;
        END

        -- Update last login timestamp
        UPDATE dbo.tbl_users
        SET last_login = GETDATE()
        WHERE email = @email_id AND isdeleted = 0 AND isactive = 1;

        -- Return user row (aliased for API compatibility)
        SELECT
            user_id,
            full_name,
            email        AS email_id,
            phone_number AS mobile_number,
            profile_picture_url AS profile_url,
            email_verified,
            phone_verified  AS mobile_verified,
            isactive        AS is_active,
            last_login      AS last_login_at,
            rcu, rcm, luu, lcm
        FROM dbo.tbl_users
        WHERE email = @email_id AND isdeleted = 0 AND isactive = 1;

        DECLARE @USER_ID VARCHAR(MAX);
        SELECT @USER_ID = user_id FROM dbo.tbl_users
        WHERE email = @email_id AND isdeleted = 0 AND isactive = 1;

        -- Return user roles
        SELECT roles.*
        FROM tbl_user_roles user_roles
        INNER JOIN tbl_roles roles ON roles.role_id = user_roles.role_id
        WHERE user_roles.user_id = @USER_ID AND user_roles.isdeleted = 0;

        SET @success = 1;
        SET @message = 'Login successful.';
    END TRY
    BEGIN CATCH
        SET @success = 0;
        SET @message = 'Error during login: ' + ERROR_MESSAGE();
    END CATCH
END;
```

### dbo.sp_otp_login_user

Created: 2026-01-25T17:18:29.467Z
Modified: 2026-06-23T11:27:54.740Z

```sql
CREATE PROCEDURE [dbo].[sp_otp_login_user]
    @email_id VARCHAR(255),
    @success BIT OUTPUT,
    @message VARCHAR(500) OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        -- Check user exists
        IF NOT EXISTS (
            SELECT 1 FROM dbo.tbl_users
            WHERE email = @email_id AND isdeleted = 0 AND isactive = 1
        )
        BEGIN
            SET @success = 0;
            SET @message = 'User not found.';
            RETURN;
        END

        -- Update last login timestamp
        UPDATE dbo.tbl_users
        SET last_login = GETDATE()
        WHERE email = @email_id AND isdeleted = 0 AND isactive = 1;

        -- Return user row (aliased for API compatibility)
        SELECT TOP 1
            user_id,
            full_name,
            email        AS email_id,
            phone_number AS mobile_number,
            profile_picture_url AS profile_url,
            email_verified,
            phone_verified  AS mobile_verified,
            isactive        AS is_active,
            last_login      AS last_login_at,
            rcu, rcm, luu, lcm
        FROM dbo.tbl_users
        WHERE email = @email_id AND isdeleted = 0 AND isactive = 1;

        SET @success = 1;
        SET @message = 'Login successful.';
    END TRY
    BEGIN CATCH
        SET @success = 0;
        SET @message = 'Error during login: ' + ERROR_MESSAGE();
    END CATCH
END;
```

### dbo.sp_register_user

Created: 2026-01-22T15:58:58.700Z
Modified: 2026-06-23T11:27:30.957Z

```sql
CREATE PROCEDURE [sp_register_user]
    @full_name VARCHAR(255),
    @email_id VARCHAR(255),
    @mobile_number VARCHAR(50) = NULL,
    @profile_url VARCHAR(50) = NULL,
    @password_hash VARCHAR(255),
    @rcu VARCHAR(100),
    @user_id VARCHAR(36) OUTPUT,
    @success BIT OUTPUT,
    @message VARCHAR(500) OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    
    BEGIN TRY
        -- Check if email already exists
        IF EXISTS (SELECT 1 FROM dbo.tbl_users WHERE email = @email_id AND isdeleted = 0)
        BEGIN
            SET @success = 0;
            SET @message = 'Email already registered.';
            RETURN;
        END
        
        -- Check if phone number already exists (if provided)
        IF @mobile_number IS NOT NULL AND EXISTS (SELECT 1 FROM dbo.tbl_users WHERE phone_number = @mobile_number AND isdeleted = 0)
        BEGIN
            SET @success = 0;
            SET @message = 'Mobile number already registered.';
            RETURN;
        END
        
        -- Generate new user ID
        SET @user_id = CONVERT(VARCHAR(36), NEWID());

        DECLARE @CUSTOMER_ROLE_ID VARCHAR(MAX);
        SELECT @CUSTOMER_ROLE_ID = role_id FROM tbl_roles WHERE role_code = 'CUSTOMER';

        -- Insert new user
        INSERT INTO dbo.tbl_users (
            user_id, full_name, email, phone_number, profile_picture_url,
            password_hash, email_verified, phone_verified, isactive, isdeleted, rcu, rcm
        )
        VALUES (
            @user_id, @full_name, @email_id, @mobile_number, @profile_url,
            @password_hash, 0, 0, 1, 0, @rcu, GETDATE()
        );
        
        INSERT INTO tbl_user_roles (user_id, role_id, rcu)
        VALUES (@user_id, @CUSTOMER_ROLE_ID, @rcu);

        SET @success = 1;
        SET @message = 'User registered successfully.';
    END TRY
    BEGIN CATCH
        SET @success = 0;
        SET @message = 'Error during registration: ' + ERROR_MESSAGE();
    END CATCH
END;
```

### dbo.sp_reset_password

Created: 2026-01-22T16:05:46.447Z
Modified: 2026-06-23T11:28:14.787Z

```sql
CREATE PROCEDURE [dbo].[sp_reset_password]
    @email_id VARCHAR(255),
    @old_password_hash VARCHAR(255),
    @new_password_hash VARCHAR(255),
    @luu VARCHAR(100),
    @success BIT OUTPUT,
    @message VARCHAR(500) OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        IF NOT EXISTS (
            SELECT 1 FROM dbo.tbl_users
            WHERE email = @email_id AND isdeleted = 0 AND isactive = 1
        )
        BEGIN
            SET @success = 0;
            SET @message = 'User not found.';
            RETURN;
        END

        IF NOT EXISTS (
            SELECT 1 FROM dbo.tbl_users
            WHERE email = @email_id AND password_hash = @old_password_hash
              AND isdeleted = 0 AND isactive = 1
        )
        BEGIN
            SET @success = 0;
            SET @message = 'Old password is incorrect.';
            RETURN;
        END

        UPDATE dbo.tbl_users
        SET password_hash = @new_password_hash,
            luu = @luu,
            lcm = GETDATE()
        WHERE email = @email_id AND isdeleted = 0 AND isactive = 1;

        SET @success = 1;
        SET @message = 'Password reset successfully.';
    END TRY
    BEGIN CATCH
        SET @success = 0;
        SET @message = 'Error during password reset: ' + ERROR_MESSAGE();
    END CATCH
END;
```

## Scalar Functions

_None found._

## Inline Table-Valued Functions

_None found._

## Table-Valued Functions

_None found._

## Triggers

### dbo.trg_tbl_menu_categories_lcm

Created: 2026-01-29T17:46:21.860Z
Modified: 2026-01-29T17:46:21.860Z

```sql
create trigger trg_tbl_menu_categories_lcm
on dbo.tbl_menu_categories
after update
as
begin
    set nocount on;

    update t
    set lcm = getdate()
    from dbo.tbl_menu_categories t
    inner join inserted i
        on t.menu_category_id = i.menu_category_id;
end;
```

### dbo.trg_tbl_menu_subcategories_lcm

Created: 2026-01-29T17:46:27.597Z
Modified: 2026-01-29T17:46:27.597Z

```sql
create trigger trg_tbl_menu_subcategories_lcm
on dbo.tbl_menu_subcategories
after update
as
begin
    set nocount on;

    update t
    set lcm = getdate()
    from dbo.tbl_menu_subcategories t
    inner join inserted i
        on t.menu_subcategory_id = i.menu_subcategory_id;
end;
```

### dbo.trg_tbl_roles_lcm

Created: 2026-01-29T14:48:54.927Z
Modified: 2026-01-29T14:48:54.927Z

```sql
create trigger trg_tbl_roles_lcm
on dbo.tbl_roles
after update
as
begin
    set nocount on;

    update t
    set lcm = getdate()
    from dbo.tbl_roles t
    inner join inserted i
        on t.role_id = i.role_id;
end;
```

### dbo.trg_tbl_running_bar_items_lcm

Created: 2026-01-29T17:37:35.573Z
Modified: 2026-01-29T17:37:35.573Z

```sql
create trigger trg_tbl_running_bar_items_lcm
on dbo.tbl_running_bar_items
after update
as
begin
    set nocount on;

    update t
    set lcm = getdate()
    from dbo.tbl_running_bar_items t
    inner join inserted i
        on t.running_bar_item_id = i.running_bar_item_id;
end;
```

### dbo.trg_tbl_running_bars_lcm

Created: 2026-01-29T17:37:38.620Z
Modified: 2026-01-29T17:37:38.620Z

```sql
create trigger trg_tbl_running_bars_lcm
on dbo.tbl_running_bars
after update
as
begin
    set nocount on;

    update t
    set lcm = getdate()
    from dbo.tbl_running_bars t
    inner join inserted i
        on t.running_bar_id = i.running_bar_id;
end;
```

### dbo.trg_tbl_user_roles_lcm

Created: 2026-01-29T14:52:29.160Z
Modified: 2026-01-29T14:52:29.160Z

```sql
create trigger trg_tbl_user_roles_lcm
on dbo.tbl_user_roles
after update
as
begin
    set nocount on;

    update t
    set lcm = getdate()
    from dbo.tbl_user_roles t
    inner join inserted i
        on t.user_role_id = i.user_role_id;
end;
```
