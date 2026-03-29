-- ============================================
-- D) WISHLIST TABLES
-- ============================================

-- 1) tbl_wishlists
CREATE TABLE dbo.tbl_wishlists (
  wishlist_id varchar(36) PRIMARY KEY NOT NULL DEFAULT CONVERT(varchar(36), newid()),
  user_id varchar(36) NOT NULL,
  wishlist_name varchar(255) NOT NULL DEFAULT 'my wishlist',
  
  isactive bit NOT NULL DEFAULT 1,
  isdeleted bit NOT NULL DEFAULT 0,
  
  rcu varchar(100),
  rcm datetime NOT NULL DEFAULT getdate(),
  luu varchar(100),
  lcm datetime,

  CONSTRAINT fk_tbl_wishlists_user FOREIGN KEY (user_id) REFERENCES dbo.tbl_users(user_id)
);

-- Index on user_id for fast lookup
CREATE INDEX ix_tbl_wishlists_user ON dbo.tbl_wishlists(user_id) WHERE isdeleted = 0;

-- ============================================

-- 2) tbl_wishlist_items
CREATE TABLE dbo.tbl_wishlist_items (
  wishlist_item_id varchar(36) PRIMARY KEY NOT NULL DEFAULT CONVERT(varchar(36), newid()),
  
  wishlist_id varchar(36) NOT NULL,
  product_id varchar(36) NOT NULL,
  product_variant_id varchar(36),
  
  added_at datetime NOT NULL DEFAULT getdate(),
  
  isactive bit NOT NULL DEFAULT 1,
  isdeleted bit NOT NULL DEFAULT 0,
  
  rcu varchar(100),
  rcm datetime NOT NULL DEFAULT getdate(),
  luu varchar(100),
  lcm datetime,

  CONSTRAINT fk_tbl_wishlist_items_wishlist FOREIGN KEY (wishlist_id) REFERENCES dbo.tbl_wishlists(wishlist_id),
  CONSTRAINT fk_tbl_wishlist_items_product FOREIGN KEY (product_id) REFERENCES dbo.tbl_products(product_id),
  CONSTRAINT fk_tbl_wishlist_items_variant FOREIGN KEY (product_variant_id) REFERENCES dbo.tbl_product_variants(product_variant_id)
);

-- Unique constraint on (wishlist_id, product_id, product_variant_id) - filtered for non-deleted
CREATE UNIQUE INDEX ux_tbl_wishlist_items_unique ON dbo.tbl_wishlist_items(wishlist_id, product_id, product_variant_id) WHERE isdeleted = 0;

-- Index on wishlist_id
CREATE INDEX ix_tbl_wishlist_items_wishlist ON dbo.tbl_wishlist_items(wishlist_id) WHERE isdeleted = 0;

-- Index on product_id
CREATE INDEX ix_tbl_wishlist_items_product ON dbo.tbl_wishlist_items(product_id) WHERE isdeleted = 0;

-- Index on product_variant_id
CREATE INDEX ix_tbl_wishlist_items_variant ON dbo.tbl_wishlist_items(product_variant_id) WHERE isdeleted = 0;
