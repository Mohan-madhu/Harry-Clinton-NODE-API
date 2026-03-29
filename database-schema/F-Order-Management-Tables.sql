-- ============================================
-- F) ORDER MANAGEMENT TABLES
-- ============================================

-- 1) tbl_order_status_master
CREATE TABLE dbo.tbl_order_status_master (
  order_status_id varchar(36) PRIMARY KEY NOT NULL DEFAULT CONVERT(varchar(36), newid()),
  
  status_name varchar(100) NOT NULL,  -- placed/shipped/delivered/cancelled
  status_code varchar(50) NOT NULL,   -- PLACED/SHIPPED/DELIVERED/CANCELLED
  display_order int NOT NULL DEFAULT 1,
  
  iscancelled_status bit NOT NULL DEFAULT 0,
  
  isactive bit NOT NULL DEFAULT 1,
  isdeleted bit NOT NULL DEFAULT 0,
  
  rcu varchar(100),
  rcm datetime NOT NULL DEFAULT getdate(),
  luu varchar(100),
  lcm datetime,

  CONSTRAINT ux_tbl_order_status_master_status_code UNIQUE (status_code)
);

-- Index on display_order
CREATE INDEX ix_tbl_order_status_master_display_order ON dbo.tbl_order_status_master(display_order) WHERE isdeleted = 0;

-- Index on isactive, isdeleted
CREATE INDEX ix_tbl_order_status_master_active ON dbo.tbl_order_status_master(isactive, isdeleted) WHERE isdeleted = 0;

-- ============================================

-- 2) tbl_orders
CREATE TABLE dbo.tbl_orders (
  order_id varchar(36) PRIMARY KEY NOT NULL DEFAULT CONVERT(varchar(36), newid()),
  
  user_id varchar(36) NOT NULL,
  cart_id varchar(36),
  
  order_number varchar(50) NOT NULL,
  
  order_status_id varchar(36) NOT NULL,
  orderstatus varchar(50),  -- snapshot text
  
  subtotal decimal(18,2),
  discount_amount decimal(18,2),
  shipping_amount decimal(18,2),
  tax_amount decimal(18,2),
  total_amount decimal(18,2),
  
  payment_status varchar(50),  -- pending/paid/failed/refunded
  notes varchar(500),
  
  placed_at datetime NOT NULL DEFAULT getdate(),
  cancelled_at datetime,
  
  isactive bit NOT NULL DEFAULT 1,
  isdeleted bit NOT NULL DEFAULT 0,
  
  rcu varchar(100),
  rcm datetime NOT NULL DEFAULT getdate(),
  luu varchar(100),
  lcm datetime,

  CONSTRAINT fk_tbl_orders_user FOREIGN KEY (user_id) REFERENCES dbo.tbl_users(user_id),
  CONSTRAINT fk_tbl_orders_cart FOREIGN KEY (cart_id) REFERENCES dbo.tbl_carts(cart_id),
  CONSTRAINT fk_tbl_orders_status FOREIGN KEY (order_status_id) REFERENCES dbo.tbl_order_status_master(order_status_id)
);

-- Unique index on order_number - filtered for non-deleted
CREATE UNIQUE INDEX ux_tbl_orders_order_number ON dbo.tbl_orders(order_number) WHERE isdeleted = 0;

-- Index on user_id + placed_at
CREATE INDEX ix_tbl_orders_user_placed_at ON dbo.tbl_orders(user_id, placed_at) WHERE isdeleted = 0;

-- Index on order_status_id
CREATE INDEX ix_tbl_orders_status ON dbo.tbl_orders(order_status_id) WHERE isdeleted = 0;

-- Index on cart_id
CREATE INDEX ix_tbl_orders_cart ON dbo.tbl_orders(cart_id) WHERE isdeleted = 0;

-- ============================================

-- 3) tbl_order_items
CREATE TABLE dbo.tbl_order_items (
  order_item_id varchar(36) PRIMARY KEY NOT NULL DEFAULT CONVERT(varchar(36), newid()),
  
  order_id varchar(36) NOT NULL,
  
  product_id varchar(36) NOT NULL,
  product_variant_id varchar(36),
  
  product_name varchar(255) NOT NULL,  -- snapshot
  sku varchar(100),                     -- snapshot
  
  qty int NOT NULL DEFAULT 1,
  unit_price decimal(18,2),
  total_price decimal(18,2),
  
  isactive bit NOT NULL DEFAULT 1,
  isdeleted bit NOT NULL DEFAULT 0,
  
  rcu varchar(100),
  rcm datetime NOT NULL DEFAULT getdate(),
  luu varchar(100),
  lcm datetime,

  CONSTRAINT fk_tbl_order_items_order FOREIGN KEY (order_id) REFERENCES dbo.tbl_orders(order_id),
  CONSTRAINT fk_tbl_order_items_product FOREIGN KEY (product_id) REFERENCES dbo.tbl_products(product_id),
  CONSTRAINT fk_tbl_order_items_variant FOREIGN KEY (product_variant_id) REFERENCES dbo.tbl_product_variants(product_variant_id)
);

-- Index on order_id
CREATE INDEX ix_tbl_order_items_order ON dbo.tbl_order_items(order_id) WHERE isdeleted = 0;

-- Index on product_id
CREATE INDEX ix_tbl_order_items_product ON dbo.tbl_order_items(product_id) WHERE isdeleted = 0;

-- Index on product_variant_id
CREATE INDEX ix_tbl_order_items_variant ON dbo.tbl_order_items(product_variant_id) WHERE isdeleted = 0;

-- ============================================

-- 4) tbl_order_addresses
CREATE TABLE dbo.tbl_order_addresses (
  order_address_id varchar(36) PRIMARY KEY NOT NULL DEFAULT CONVERT(varchar(36), newid()),
  
  order_id varchar(36) NOT NULL,
  address_type varchar(20) NOT NULL,  -- shipping/billing
  
  full_name varchar(255) NOT NULL,
  mobile_number varchar(50) NOT NULL,
  house_street varchar(500) NOT NULL,
  city varchar(150) NOT NULL,
  state varchar(150) NOT NULL,
  pincode varchar(20) NOT NULL,
  landmark varchar(255),
  
  isactive bit NOT NULL DEFAULT 1,
  isdeleted bit NOT NULL DEFAULT 0,
  
  rcu varchar(100),
  rcm datetime NOT NULL DEFAULT getdate(),
  luu varchar(100),
  lcm datetime,

  CONSTRAINT fk_tbl_order_addresses_order FOREIGN KEY (order_id) REFERENCES dbo.tbl_orders(order_id),
  CONSTRAINT ck_tbl_order_addresses_type CHECK (address_type IN ('shipping', 'billing'))
);

-- Index on order_id + address_type
CREATE INDEX ix_tbl_order_addresses_order_type ON dbo.tbl_order_addresses(order_id, address_type) WHERE isdeleted = 0;

-- ============================================

-- 5) tbl_order_status_history
CREATE TABLE dbo.tbl_order_status_history (
  order_status_history_id varchar(36) PRIMARY KEY NOT NULL DEFAULT CONVERT(varchar(36), newid()),
  
  order_id varchar(36) NOT NULL,
  order_status_id varchar(36) NOT NULL,
  
  orderstatus varchar(50) NOT NULL,  -- snapshot
  orderstatusby varchar(255),
  orderstatustime datetime NOT NULL DEFAULT getdate(),
  
  remarks varchar(500),
  
  isactive bit NOT NULL DEFAULT 1,
  isdeleted bit NOT NULL DEFAULT 0,
  
  rcu varchar(100),
  rcm datetime NOT NULL DEFAULT getdate(),
  luu varchar(100),
  lcm datetime,

  CONSTRAINT fk_tbl_order_status_history_order FOREIGN KEY (order_id) REFERENCES dbo.tbl_orders(order_id),
  CONSTRAINT fk_tbl_order_status_history_status FOREIGN KEY (order_status_id) REFERENCES dbo.tbl_order_status_master(order_status_id)
);

-- Index on order_id + orderstatustime
CREATE INDEX ix_tbl_order_status_history_order_time ON dbo.tbl_order_status_history(order_id, orderstatustime) WHERE isdeleted = 0;

-- Index on order_status_id
CREATE INDEX ix_tbl_order_status_history_status ON dbo.tbl_order_status_history(order_status_id) WHERE isdeleted = 0;

-- ============================================

-- 6) tbl_order_cancellations
CREATE TABLE dbo.tbl_order_cancellations (
  order_cancellation_id varchar(36) PRIMARY KEY NOT NULL DEFAULT CONVERT(varchar(36), newid()),
  
  order_id varchar(36) NOT NULL,
  
  cancelled_by varchar(50),  -- user/admin/system
  cancelled_reason varchar(500),
  cancelled_at datetime NOT NULL DEFAULT getdate(),
  
  isactive bit NOT NULL DEFAULT 1,
  isdeleted bit NOT NULL DEFAULT 0,
  
  rcu varchar(100),
  rcm datetime NOT NULL DEFAULT getdate(),
  luu varchar(100),
  lcm datetime,

  CONSTRAINT fk_tbl_order_cancellations_order FOREIGN KEY (order_id) REFERENCES dbo.tbl_orders(order_id)
);

-- Index on order_id
CREATE INDEX ix_tbl_order_cancellations_order ON dbo.tbl_order_cancellations(order_id) WHERE isdeleted = 0;

-- Index on cancelled_at
CREATE INDEX ix_tbl_order_cancellations_time ON dbo.tbl_order_cancellations(cancelled_at) WHERE isdeleted = 0;

-- ============================================

-- 7) tbl_invoices
CREATE TABLE dbo.tbl_invoices (
  invoice_id varchar(36) PRIMARY KEY NOT NULL DEFAULT CONVERT(varchar(36), newid()),
  
  order_id varchar(36) NOT NULL,
  
  invoice_number varchar(50) NOT NULL,
  invoice_date datetime NOT NULL DEFAULT getdate(),
  
  invoice_url varchar(1000),
  notes varchar(500),
  
  isactive bit NOT NULL DEFAULT 1,
  isdeleted bit NOT NULL DEFAULT 0,
  
  rcu varchar(100),
  rcm datetime NOT NULL DEFAULT getdate(),
  luu varchar(100),
  lcm datetime,

  CONSTRAINT fk_tbl_invoices_order FOREIGN KEY (order_id) REFERENCES dbo.tbl_orders(order_id)
);

-- Unique index on invoice_number - filtered for non-deleted
CREATE UNIQUE INDEX ux_tbl_invoices_invoice_number ON dbo.tbl_invoices(invoice_number) WHERE isdeleted = 0;

-- Index on order_id
CREATE INDEX ix_tbl_invoices_order ON dbo.tbl_invoices(order_id) WHERE isdeleted = 0;
