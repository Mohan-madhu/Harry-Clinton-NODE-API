-- ============================================
-- H) COUPONS & DISCOUNTS TABLES
-- ============================================

-- 1) tbl_coupons
CREATE TABLE dbo.tbl_coupons (
  coupon_id varchar(36) PRIMARY KEY NOT NULL DEFAULT CONVERT(varchar(36), newid()),
  
  coupon_code varchar(100) NOT NULL,
  coupon_name varchar(255),
  description varchar(500),
  
  discount_type varchar(20) NOT NULL,  -- percentage/fixed
  discount_value decimal(18,2) NOT NULL,
  
  min_purchase_amount decimal(18,2),
  max_discount_amount decimal(18,2),
  
  usage_limit int,  -- max times coupon can be used
  usage_count int NOT NULL DEFAULT 0,
  
  per_user_limit int DEFAULT 1,  -- max times single user can use
  
  start_date datetime NOT NULL,
  end_date datetime,
  
  isactive bit NOT NULL DEFAULT 1,
  isdeleted bit NOT NULL DEFAULT 0,
  
  rcu varchar(100),
  rcm datetime NOT NULL DEFAULT getdate(),
  luu varchar(100),
  lcm datetime,

  CONSTRAINT ck_tbl_coupons_discount_type CHECK (discount_type IN ('percentage', 'fixed')),
  CONSTRAINT ck_tbl_coupons_discount_value CHECK (discount_value > 0)
);

-- Unique index on coupon_code - filtered for non-deleted
CREATE UNIQUE INDEX ux_tbl_coupons_code ON dbo.tbl_coupons(coupon_code) WHERE isdeleted = 0;

-- Index on start_date + end_date
CREATE INDEX ix_tbl_coupons_dates ON dbo.tbl_coupons(start_date, end_date) WHERE isdeleted = 0 AND isactive = 1;

-- ============================================

-- 2) tbl_discounts
CREATE TABLE dbo.tbl_discounts (
  discount_id varchar(36) PRIMARY KEY NOT NULL DEFAULT CONVERT(varchar(36), newid()),
  
  discount_name varchar(255) NOT NULL,
  description varchar(500),
  
  discount_type varchar(20) NOT NULL,  -- percentage/fixed
  discount_value decimal(18,2) NOT NULL,
  
  max_discount_amount decimal(18,2),
  
  usage_limit int,
  usage_count int NOT NULL DEFAULT 0,
  
  start_date datetime NOT NULL,
  end_date datetime,
  
  discount_priority int NOT NULL DEFAULT 1,  -- lower number = higher priority
  
  isactive bit NOT NULL DEFAULT 1,
  isdeleted bit NOT NULL DEFAULT 0,
  
  rcu varchar(100),
  rcm datetime NOT NULL DEFAULT getdate(),
  luu varchar(100),
  lcm datetime,

  CONSTRAINT ck_tbl_discounts_discount_type CHECK (discount_type IN ('percentage', 'fixed')),
  CONSTRAINT ck_tbl_discounts_discount_value CHECK (discount_value > 0),
  CONSTRAINT ck_tbl_discounts_priority CHECK (discount_priority > 0)
);

-- Index on start_date + end_date + priority
CREATE INDEX ix_tbl_discounts_dates_priority ON dbo.tbl_discounts(start_date, end_date, discount_priority) 
  WHERE isdeleted = 0 AND isactive = 1;

-- ============================================

-- 3) tbl_discount_targets
CREATE TABLE dbo.tbl_discount_targets (
  discount_target_id varchar(36) PRIMARY KEY NOT NULL DEFAULT CONVERT(varchar(36), newid()),
  
  discount_id varchar(36) NOT NULL,
  
  target_type varchar(50) NOT NULL,  -- product/category/collection/all
  target_id varchar(36),  -- product_id or category_id (NULL for 'all')
  
  isactive bit NOT NULL DEFAULT 1,
  isdeleted bit NOT NULL DEFAULT 0,
  
  rcu varchar(100),
  rcm datetime NOT NULL DEFAULT getdate(),
  luu varchar(100),
  lcm datetime,

  CONSTRAINT fk_tbl_discount_targets_discount FOREIGN KEY (discount_id) REFERENCES dbo.tbl_discounts(discount_id),
  CONSTRAINT ck_tbl_discount_targets_type CHECK (target_type IN ('product', 'category', 'collection', 'all'))
);

-- Index on discount_id
CREATE INDEX ix_tbl_discount_targets_discount ON dbo.tbl_discount_targets(discount_id) WHERE isdeleted = 0;

-- Index on target_type + target_id
CREATE INDEX ix_tbl_discount_targets_target ON dbo.tbl_discount_targets(target_type, target_id) WHERE isdeleted = 0;

-- ============================================

-- 4) tbl_coupon_usage
CREATE TABLE dbo.tbl_coupon_usage (
  coupon_usage_id varchar(36) PRIMARY KEY NOT NULL DEFAULT CONVERT(varchar(36), newid()),
  
  coupon_id varchar(36) NOT NULL,
  user_id varchar(36) NOT NULL,
  order_id varchar(36),
  
  discount_amount decimal(18,2) NOT NULL,
  used_at datetime NOT NULL DEFAULT getdate(),
  
  isactive bit NOT NULL DEFAULT 1,
  isdeleted bit NOT NULL DEFAULT 0,
  
  rcu varchar(100),
  rcm datetime NOT NULL DEFAULT getdate(),
  luu varchar(100),
  lcm datetime,

  CONSTRAINT fk_tbl_coupon_usage_coupon FOREIGN KEY (coupon_id) REFERENCES dbo.tbl_coupons(coupon_id),
  CONSTRAINT fk_tbl_coupon_usage_user FOREIGN KEY (user_id) REFERENCES dbo.tbl_users(user_id),
  CONSTRAINT fk_tbl_coupon_usage_order FOREIGN KEY (order_id) REFERENCES dbo.tbl_orders(order_id)
);

-- Index on coupon_id
CREATE INDEX ix_tbl_coupon_usage_coupon ON dbo.tbl_coupon_usage(coupon_id) WHERE isdeleted = 0;

-- Index on user_id
CREATE INDEX ix_tbl_coupon_usage_user ON dbo.tbl_coupon_usage(user_id) WHERE isdeleted = 0;

-- Index on order_id
CREATE INDEX ix_tbl_coupon_usage_order ON dbo.tbl_coupon_usage(order_id) WHERE isdeleted = 0;

-- Index on used_at for recent usage
CREATE INDEX ix_tbl_coupon_usage_date ON dbo.tbl_coupon_usage(used_at) WHERE isdeleted = 0;

-- ============================================

-- 5) tbl_order_promotions
CREATE TABLE dbo.tbl_order_promotions (
  order_promotion_id varchar(36) PRIMARY KEY NOT NULL DEFAULT CONVERT(varchar(36), newid()),
  
  order_id varchar(36) NOT NULL,
  
  promotion_type varchar(50) NOT NULL,  -- coupon/discount/automatic/referral
  promotion_id varchar(36),  -- coupon_id or discount_id
  promotion_name varchar(255),
  
  discount_amount decimal(18,2) NOT NULL,
  discount_type varchar(20),  -- percentage/fixed (snapshot)
  discount_value decimal(18,2),  -- snapshot
  
  applied_at datetime NOT NULL DEFAULT getdate(),
  
  isactive bit NOT NULL DEFAULT 1,
  isdeleted bit NOT NULL DEFAULT 0,
  
  rcu varchar(100),
  rcm datetime NOT NULL DEFAULT getdate(),
  luu varchar(100),
  lcm datetime,

  CONSTRAINT fk_tbl_order_promotions_order FOREIGN KEY (order_id) REFERENCES dbo.tbl_orders(order_id),
  CONSTRAINT ck_tbl_order_promotions_type CHECK (promotion_type IN ('coupon', 'discount', 'automatic', 'referral'))
);

-- Index on order_id
CREATE INDEX ix_tbl_order_promotions_order ON dbo.tbl_order_promotions(order_id) WHERE isdeleted = 0;

-- Index on promotion_type
CREATE INDEX ix_tbl_order_promotions_type ON dbo.tbl_order_promotions(promotion_type) WHERE isdeleted = 0;

-- Index on applied_at
CREATE INDEX ix_tbl_order_promotions_date ON dbo.tbl_order_promotions(applied_at) WHERE isdeleted = 0;
