-- ============================================
-- C) PRODUCT CATALOG & CONFIGURATION
-- ============================================

-- 1) tbl_menu_categories
CREATE TABLE dbo.tbl_menu_categories (
  menu_category_id varchar(36) PRIMARY KEY NOT NULL DEFAULT CONVERT(varchar(36), newid()),
  
  category_name varchar(255) NOT NULL,
  category_slug varchar(255),
  description varchar(1000),
  
  category_icon_url varchar(1000),
  category_image_url varchar(1000),
  
  display_order int NOT NULL DEFAULT 1,
  
  isactive bit NOT NULL DEFAULT 1,
  isdeleted bit NOT NULL DEFAULT 0,
  
  rcu varchar(100),
  rcm datetime NOT NULL DEFAULT getdate(),
  luu varchar(100),
  lcm datetime,

  CONSTRAINT ux_tbl_menu_categories_slug UNIQUE (category_slug)
);

-- Index on display_order
CREATE INDEX ix_tbl_menu_categories_order ON dbo.tbl_menu_categories(display_order) WHERE isdeleted = 0;

-- ============================================

-- 2) tbl_menu_subcategories
CREATE TABLE dbo.tbl_menu_subcategories (
  menu_subcategory_id varchar(36) PRIMARY KEY NOT NULL DEFAULT CONVERT(varchar(36), newid()),
  
  menu_category_id varchar(36) NOT NULL,
  
  subcategory_name varchar(255) NOT NULL,
  subcategory_slug varchar(255),
  description varchar(1000),
  
  subcategory_image_url varchar(1000),
  
  display_order int NOT NULL DEFAULT 1,
  
  isactive bit NOT NULL DEFAULT 1,
  isdeleted bit NOT NULL DEFAULT 0,
  
  rcu varchar(100),
  rcm datetime NOT NULL DEFAULT getdate(),
  luu varchar(100),
  lcm datetime,

  CONSTRAINT fk_tbl_menu_subcategories_category FOREIGN KEY (menu_category_id) REFERENCES dbo.tbl_menu_categories(menu_category_id),
  CONSTRAINT ux_tbl_menu_subcategories_slug UNIQUE (subcategory_slug)
);

-- Index on menu_category_id + display_order
CREATE INDEX ix_tbl_menu_subcategories_category_order ON dbo.tbl_menu_subcategories(menu_category_id, display_order) 
  WHERE isdeleted = 0;

-- ============================================

-- 3) tbl_products
CREATE TABLE dbo.tbl_products (
  product_id varchar(36) PRIMARY KEY NOT NULL DEFAULT CONVERT(varchar(36), newid()),
  
  product_name varchar(255) NOT NULL,
  product_slug varchar(255),
  
  sku varchar(100),
  barcode varchar(100),
  
  menu_category_id varchar(36),
  menu_subcategory_id varchar(36),
  
  description varchar(max),
  short_description varchar(500),
  
  base_price decimal(18,2),
  sale_price decimal(18,2),
  
  product_image_url varchar(1000),
  
  stock_quantity int NOT NULL DEFAULT 0,
  
  display_order int NOT NULL DEFAULT 1,
  
  is_featured bit NOT NULL DEFAULT 0,
  is_trending bit NOT NULL DEFAULT 0,
  
  isactive bit NOT NULL DEFAULT 1,
  isdeleted bit NOT NULL DEFAULT 0,
  
  rcu varchar(100),
  rcm datetime NOT NULL DEFAULT getdate(),
  luu varchar(100),
  lcm datetime,

  CONSTRAINT fk_tbl_products_category FOREIGN KEY (menu_category_id) REFERENCES dbo.tbl_menu_categories(menu_category_id),
  CONSTRAINT fk_tbl_products_subcategory FOREIGN KEY (menu_subcategory_id) REFERENCES dbo.tbl_menu_subcategories(menu_subcategory_id),
  CONSTRAINT ux_tbl_products_sku UNIQUE (sku),
  CONSTRAINT ux_tbl_products_slug UNIQUE (product_slug)
);

-- Index on menu_category_id
CREATE INDEX ix_tbl_products_category ON dbo.tbl_products(menu_category_id) WHERE isdeleted = 0;

-- Index on menu_subcategory_id
CREATE INDEX ix_tbl_products_subcategory ON dbo.tbl_products(menu_subcategory_id) WHERE isdeleted = 0;

-- Index on is_featured + display_order
CREATE INDEX ix_tbl_products_featured ON dbo.tbl_products(is_featured, display_order) 
  WHERE isdeleted = 0 AND is_featured = 1;

-- Index on is_trending
CREATE INDEX ix_tbl_products_trending ON dbo.tbl_products(is_trending) WHERE isdeleted = 0 AND is_trending = 1;

-- Index on product_name for search
CREATE INDEX ix_tbl_products_name ON dbo.tbl_products(product_name) WHERE isdeleted = 0;

-- ============================================

-- 4) tbl_product_variants
CREATE TABLE dbo.tbl_product_variants (
  product_variant_id varchar(36) PRIMARY KEY NOT NULL DEFAULT CONVERT(varchar(36), newid()),
  
  product_id varchar(36) NOT NULL,
  
  variant_name varchar(255),
  variant_sku varchar(100),
  
  size varchar(50),
  color varchar(100),
  material varchar(100),
  
  variant_price decimal(18,2),
  variant_sale_price decimal(18,2),
  
  variant_image_url varchar(1000),
  
  stock_quantity int NOT NULL DEFAULT 0,
  
  isactive bit NOT NULL DEFAULT 1,
  isdeleted bit NOT NULL DEFAULT 0,
  
  rcu varchar(100),
  rcm datetime NOT NULL DEFAULT getdate(),
  luu varchar(100),
  lcm datetime,

  CONSTRAINT fk_tbl_product_variants_product FOREIGN KEY (product_id) REFERENCES dbo.tbl_products(product_id),
  CONSTRAINT ux_tbl_product_variants_sku UNIQUE (variant_sku)
);

-- Index on product_id
CREATE INDEX ix_tbl_product_variants_product ON dbo.tbl_product_variants(product_id) WHERE isdeleted = 0;

-- Index on size
CREATE INDEX ix_tbl_product_variants_size ON dbo.tbl_product_variants(size) WHERE isdeleted = 0;

-- Index on color
CREATE INDEX ix_tbl_product_variants_color ON dbo.tbl_product_variants(color) WHERE isdeleted = 0;

-- ============================================

-- 5) tbl_product_attributes
CREATE TABLE dbo.tbl_product_attributes (
  product_attribute_id varchar(36) PRIMARY KEY NOT NULL DEFAULT CONVERT(varchar(36), newid()),
  
  attribute_name varchar(255) NOT NULL,
  attribute_code varchar(100) NOT NULL,
  
  attribute_type varchar(50),  -- text/dropdown/checkbox/color/size
  
  isactive bit NOT NULL DEFAULT 1,
  isdeleted bit NOT NULL DEFAULT 0,
  
  rcu varchar(100),
  rcm datetime NOT NULL DEFAULT getdate(),
  luu varchar(100),
  lcm datetime,

  CONSTRAINT ux_tbl_product_attributes_code UNIQUE (attribute_code)
);

-- Index on attribute_code
CREATE INDEX ix_tbl_product_attributes_code ON dbo.tbl_product_attributes(attribute_code) WHERE isdeleted = 0;

-- ============================================

-- 6) tbl_product_attribute_values
CREATE TABLE dbo.tbl_product_attribute_values (
  product_attribute_value_id varchar(36) PRIMARY KEY NOT NULL DEFAULT CONVERT(varchar(36), newid()),
  
  product_id varchar(36) NOT NULL,
  product_attribute_id varchar(36) NOT NULL,
  
  attribute_value varchar(255),
  
  isactive bit NOT NULL DEFAULT 1,
  isdeleted bit NOT NULL DEFAULT 0,
  
  rcu varchar(100),
  rcm datetime NOT NULL DEFAULT getdate(),
  luu varchar(100),
  lcm datetime,

  CONSTRAINT fk_tbl_product_attribute_values_product FOREIGN KEY (product_id) REFERENCES dbo.tbl_products(product_id),
  CONSTRAINT fk_tbl_product_attribute_values_attribute FOREIGN KEY (product_attribute_id) REFERENCES dbo.tbl_product_attributes(product_attribute_id)
);

-- Index on product_id
CREATE INDEX ix_tbl_product_attribute_values_product ON dbo.tbl_product_attribute_values(product_id) WHERE isdeleted = 0;

-- Index on product_attribute_id
CREATE INDEX ix_tbl_product_attribute_values_attribute ON dbo.tbl_product_attribute_values(product_attribute_id) WHERE isdeleted = 0;

-- ============================================

-- 7) tbl_product_media
CREATE TABLE dbo.tbl_product_media (
  product_media_id varchar(36) PRIMARY KEY NOT NULL DEFAULT CONVERT(varchar(36), newid()),
  
  product_id varchar(36) NOT NULL,
  
  media_url varchar(1000) NOT NULL,
  media_type varchar(20),  -- image/video
  
  display_order int NOT NULL DEFAULT 1,
  
  is_primary bit NOT NULL DEFAULT 0,
  
  isactive bit NOT NULL DEFAULT 1,
  isdeleted bit NOT NULL DEFAULT 0,
  
  rcu varchar(100),
  rcm datetime NOT NULL DEFAULT getdate(),
  luu varchar(100),
  lcm datetime,

  CONSTRAINT fk_tbl_product_media_product FOREIGN KEY (product_id) REFERENCES dbo.tbl_products(product_id)
);

-- Index on product_id + display_order
CREATE INDEX ix_tbl_product_media_product_order ON dbo.tbl_product_media(product_id, display_order) WHERE isdeleted = 0;

-- ============================================

-- 8) tbl_product_seo
CREATE TABLE dbo.tbl_product_seo (
  product_seo_id varchar(36) PRIMARY KEY NOT NULL DEFAULT CONVERT(varchar(36), newid()),
  
  product_id varchar(36) NOT NULL,
  
  seo_title varchar(255),
  seo_description varchar(500),
  seo_keywords varchar(500),
  
  meta_tags varchar(max),
  
  isactive bit NOT NULL DEFAULT 1,
  isdeleted bit NOT NULL DEFAULT 0,
  
  rcu varchar(100),
  rcm datetime NOT NULL DEFAULT getdate(),
  luu varchar(100),
  lcm datetime,

  CONSTRAINT fk_tbl_product_seo_product FOREIGN KEY (product_id) REFERENCES dbo.tbl_products(product_id),
  CONSTRAINT ux_tbl_product_seo_product UNIQUE (product_id)
);

-- Index on product_id
CREATE INDEX ix_tbl_product_seo_product ON dbo.tbl_product_seo(product_id) WHERE isdeleted = 0;
