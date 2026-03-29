-- ============================================
-- E) CART MANAGEMENT TABLES
-- ============================================

-- 1) tbl_carts
CREATE TABLE dbo.tbl_carts (
  cart_id varchar(36) PRIMARY KEY NOT NULL DEFAULT CONVERT(varchar(36), newid()),
  
  user_id varchar(36) NOT NULL,
  cart_status varchar(20) NOT NULL DEFAULT 'active',  -- active/checkedout/abandoned
  
  isactive bit NOT NULL DEFAULT 1,
  isdeleted bit NOT NULL DEFAULT 0,
  
  rcu varchar(100),
  rcm datetime NOT NULL DEFAULT getdate(),
  luu varchar(100),
  lcm datetime,

  CONSTRAINT fk_tbl_carts_user FOREIGN KEY (user_id) REFERENCES dbo.tbl_users(user_id),
  CONSTRAINT ck_tbl_carts_status CHECK (cart_status IN ('active', 'checkedout', 'abandoned'))
);

-- Index on user_id
CREATE INDEX ix_tbl_carts_user ON dbo.tbl_carts(user_id) WHERE isdeleted = 0;

-- Index on user_id + cart_status (find active cart fast)
CREATE INDEX ix_tbl_carts_user_status ON dbo.tbl_carts(user_id, cart_status) WHERE isdeleted = 0 AND cart_status = 'active';

-- ============================================

-- 2) tbl_cart_items
CREATE TABLE dbo.tbl_cart_items (
  cart_item_id varchar(36) PRIMARY KEY NOT NULL DEFAULT CONVERT(varchar(36), newid()),
  
  cart_id varchar(36) NOT NULL,
  product_id varchar(36) NOT NULL,
  product_variant_id varchar(36),
  
  qty int NOT NULL DEFAULT 1,
  unit_price decimal(18,2),
  total_price decimal(18,2),
  
  added_at datetime NOT NULL DEFAULT getdate(),
  
  isactive bit NOT NULL DEFAULT 1,
  isdeleted bit NOT NULL DEFAULT 0,
  
  rcu varchar(100),
  rcm datetime NOT NULL DEFAULT getdate(),
  luu varchar(100),
  lcm datetime,

  CONSTRAINT fk_tbl_cart_items_cart FOREIGN KEY (cart_id) REFERENCES dbo.tbl_carts(cart_id),
  CONSTRAINT fk_tbl_cart_items_product FOREIGN KEY (product_id) REFERENCES dbo.tbl_products(product_id),
  CONSTRAINT fk_tbl_cart_items_variant FOREIGN KEY (product_variant_id) REFERENCES dbo.tbl_product_variants(product_variant_id),
  CONSTRAINT ck_tbl_cart_items_qty CHECK (qty > 0)
);

-- Unique constraint on (cart_id, product_id, product_variant_id) - filtered for non-deleted
CREATE UNIQUE INDEX ux_tbl_cart_items_unique ON dbo.tbl_cart_items(cart_id, product_id, product_variant_id) WHERE isdeleted = 0;

-- Index on cart_id
CREATE INDEX ix_tbl_cart_items_cart ON dbo.tbl_cart_items(cart_id) WHERE isdeleted = 0;

-- Index on product_id
CREATE INDEX ix_tbl_cart_items_product ON dbo.tbl_cart_items(product_id) WHERE isdeleted = 0;

-- Index on product_variant_id
CREATE INDEX ix_tbl_cart_items_variant ON dbo.tbl_cart_items(product_variant_id) WHERE isdeleted = 0;
