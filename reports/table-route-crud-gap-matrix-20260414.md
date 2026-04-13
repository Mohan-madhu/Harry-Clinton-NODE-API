# Table to Route CRUD-5 Gap Matrix

Date: 2026-04-14
Scope: CRUD-5 check only in routes/HARRY_CLINTON.
CRUD-5 means: GET /, GET /:id, POST /, PUT /, DELETE /.

| Expected table | Actual route file | CRUD-5 yes/no | Gap action |
|---|---|---|---|
| tbl_users | User.js | Yes | No gap |
| tbl_roles | Roles.js | Yes | No gap |
| tbl_user_roles | UserRoles.js | Yes | No gap |
| tbl_profiles | B_Customer_Management/Profiles.js | Yes | No gap |
| tbl_addresses | B_Customer_Management/Addresses.js | Yes | No gap |
| tbl_products | C_Product_Catalog_&_Configuration/Products.js | Yes | No gap |
| tbl_product_variants | C_Product_Catalog_&_Configuration/Products_Variants.js | Yes | No gap |
| tbl_product_media | C_Product_Catalog_&_Configuration/Products_Media.js | Yes | No gap |
| tbl_attributes | C_Product_Catalog_&_Configuration/Products_Attributes.js | Yes | No gap |
| tbl_product_attribute_values | C_Product_Catalog_&_Configuration/Products_Attributes_Values.js | Yes | No gap |
| tbl_sizes | C_Product_Catalog_&_Configuration/Products_Sizes.js | Yes | No gap |
| tbl_cloth_types | C_Product_Catalog_&_Configuration/Products_Cloth_Types.js | Yes | No gap |
| tbl_care_instructions | C_Product_Catalog_&_Configuration/Products_Care_Instructions.js | Yes | No gap |
| tbl_cloth_type_care_instructions | C_Product_Catalog_&_Configuration/Products_Cloth_Type_Care_Instructions.js | Yes | No gap |
| tbl_product_media (duplicate in source list) | C_Product_Catalog_&_Configuration/Products_Media.js | Yes | No gap |
| tbl_wishlists | D_Wishlist_Management/Wishlists.js | Yes | No gap |
| tbl_wishlist_items | D_Wishlist_Management/Wishlist_Items.js | Yes | No gap |
| tbl_carts | E_Cart_Management/Carts.js | Yes | No gap |
| tbl_cart_items | E_Cart_Management/Cart_Items.js | Yes | No gap |
| tbl_orders | F_Order_Management/Orders.js | Yes | No gap |
| tbl_order_items | F_Order_Management/Order_Items.js | Yes | No gap |
| tbl_order_addresses | F_Order_Management/Order_Addresses.js | Yes | No gap |
| tbl_order_status_master | F_Order_Management/Order_Status_Master.js | Yes | No gap |
| tbl_order_status_history | F_Order_Management/Order_Status_History.js | Yes | No gap |
| tbl_order_cancellations | F_Order_Management/Order_Cancellations.js | Yes | No gap |
| tbl_invoices | F_Order_Management/Invoices.js | Yes | No gap |
| tbl_payments | G_Payments/Payments.js | Yes | No gap |
| tbl_coupons | H_Coupons_&_Discounts/Coupons.js | Yes | No gap |
| tbl_discounts | H_Coupons_&_Discounts/Discounts.js | Yes | No gap |
| tbl_discount_targets | H_Coupons_&_Discounts/Discount_Targets.js | Yes | No gap |
| tbl_coupon_usage | H_Coupons_&_Discounts/Coupon_Usage.js | Yes | No gap |
| tbl_order_promotions | H_Coupons_&_Discounts/Order_Promotions.js | Yes | No gap |
| tbl_courier_partners | I_ Shipping_&_Delivery/Courier_Partners.js | Yes | No gap |
| tbl_shipments | I_ Shipping_&_Delivery/Shipments.js | Yes | No gap |
| tbl_shipment_events | I_ Shipping_&_Delivery/Shipment_Events.js | Yes | No gap |
| tbl_returns | J_Returns_&_Refunds/Returns.js | Yes | No gap |
| tbl_refunds | J_Returns_&_Refunds/Refunds.js | Yes | No gap |
| tbl_support_contacts | K_Support_Content_&_System_Configuration/Support_Contacts.js | Yes | No gap |
| tbl_faqs | K_Support_Content_&_System_Configuration/FAQs.js | Yes | No gap |
| tbl_newsletter_subscriptions | K_Support_Content_&_System_Configuration/Newsletter_Subscriptions.js | Yes | No gap |
| tbl_settings | K_Support_Content_&_System_Configuration/Settings.js | Yes | No gap |
| tbl_about_us_pages | Not mapped in routes | No | Create dedicated module, add CRUD-5, and mount in routes/HARRY_CLINTON/index.js |
| tbl_privacy_policy_pages | Not mapped in routes | No | Create dedicated module, add CRUD-5, and mount in routes/HARRY_CLINTON/index.js |
| tbl_terms_conditions_pages | Not mapped in routes | No | Create dedicated module, add CRUD-5, and mount in routes/HARRY_CLINTON/index.js |
| tbl_notification_bars | Not mapped in routes | No | Create dedicated module, add CRUD-5, and mount in routes/HARRY_CLINTON/index.js |
| tbl_running_bars | RunningBar.js | Yes | No gap |
| tbl_running_bar_items | RunningBarItems.js | Yes | No gap |
| tbl_menu_categories | MenuCategory.js | Yes | No gap |
| tbl_menu_subcategories | MenuSubCategory.js | Yes | No gap |
| tbl_menu_section_images | Not mapped in routes | No | Create dedicated module, add CRUD-5, and mount in routes/HARRY_CLINTON/index.js |
| tbl_subcategory_sections | Not mapped in routes | No | Create dedicated module, add CRUD-5, and mount in routes/HARRY_CLINTON/index.js |
| tbl_image_sliders | HC_C_Home_Visuals/Image_Sliders.js | Yes | No gap |
| tbl_menu_videos | HC_C_Home_Visuals/Menu_Video.js | Yes | No gap |
| tbl_spotlight_entries | HC_D_Spotlight/Spotlight_Entries.js | Yes | No gap |
| tbl_spotlight_media | HC_D_Spotlight/Spotlight_Media.js | Yes | No gap |
| tbl_style_collections | HC_E_Style_by_HC/Style_Collections.js | Yes | No gap |
| tbl_style_collection_media | HC_E_Style_by_HC/Style_Collection_Media.js | Yes | No gap |
| tbl_custom_appointments | HC_F_Appointments/CustomAppointments.js | Yes | No gap |
| tbl_appointment_date_slots | HC_F_Appointments/AppointmentDateSlots.js | Yes | No gap |
| tbl_appointment_time_slots | HC_F_Appointments/AppointmentTimeSlots.js | Yes | No gap |
| tbl_appointment_slot_blocks | HC_F_Appointments/AppointmentSlotBlocks.js | Yes | No gap |

## Summary

- Total expected rows in this strict matrix: 61
- CRUD-5 complete: 55
- Missing direct table-wise module: 6
- Missing direct table-wise module list:
  - tbl_about_us_pages
  - tbl_privacy_policy_pages
  - tbl_terms_conditions_pages
  - tbl_notification_bars
  - tbl_menu_section_images
  - tbl_subcategory_sections

## Notes

- Custom extra routes exist in some modules (for example, UserRoles add/remove and AppointmentTimeSlots by-date), but they do not reduce CRUD-5 compliance.
- This report intentionally ignores SQL create-table validation as requested.
