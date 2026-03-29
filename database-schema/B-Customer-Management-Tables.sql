-- ============================================
-- B) CUSTOMER MANAGEMENT
-- ============================================

-- 1) tbl_profiles
CREATE TABLE dbo.tbl_profiles (
  profile_id varchar(36) PRIMARY KEY NOT NULL DEFAULT CONVERT(varchar(36), newid()),
  
  user_id varchar(36) NOT NULL,
  
  date_of_birth date,
  gender varchar(20),  -- male/female/other
  
  gstin varchar(20),
  company_name varchar(255),
  
  preferred_language varchar(20),
  preferred_currency varchar(10),
  
  newsletter_subscription bit NOT NULL DEFAULT 0,
  sms_notifications bit NOT NULL DEFAULT 1,
  email_notifications bit NOT NULL DEFAULT 1,
  
  push_notifications bit NOT NULL DEFAULT 1,
  
  loyalty_points int NOT NULL DEFAULT 0,
  
  isactive bit NOT NULL DEFAULT 1,
  isdeleted bit NOT NULL DEFAULT 0,
  
  rcu varchar(100),
  rcm datetime NOT NULL DEFAULT getdate(),
  luu varchar(100),
  lcm datetime,

  CONSTRAINT fk_tbl_profiles_user FOREIGN KEY (user_id) REFERENCES dbo.tbl_users(user_id),
  CONSTRAINT ux_tbl_profiles_user UNIQUE (user_id)
);

-- Index on user_id
CREATE INDEX ix_tbl_profiles_user ON dbo.tbl_profiles(user_id) WHERE isdeleted = 0;

-- ============================================

-- 2) tbl_customer_addresses
CREATE TABLE dbo.tbl_customer_addresses (
  address_id varchar(36) PRIMARY KEY NOT NULL DEFAULT CONVERT(varchar(36), newid()),
  
  user_id varchar(36) NOT NULL,
  
  address_type varchar(20) NOT NULL,  -- home/work/other
  
  full_name varchar(255) NOT NULL,
  mobile_number varchar(20) NOT NULL,
  
  house_street varchar(500) NOT NULL,
  apartment_suite varchar(255),
  city varchar(150) NOT NULL,
  state varchar(150) NOT NULL,
  country varchar(150) NOT NULL DEFAULT 'India',
  pincode varchar(20) NOT NULL,
  
  landmark varchar(255),
  latitude decimal(10,8),
  longitude decimal(10,8),
  
  is_default bit NOT NULL DEFAULT 0,
  is_billing_address bit NOT NULL DEFAULT 0,
  
  isactive bit NOT NULL DEFAULT 1,
  isdeleted bit NOT NULL DEFAULT 0,
  
  rcu varchar(100),
  rcm datetime NOT NULL DEFAULT getdate(),
  luu varchar(100),
  lcm datetime,

  CONSTRAINT fk_tbl_customer_addresses_user FOREIGN KEY (user_id) REFERENCES dbo.tbl_users(user_id),
  CONSTRAINT ck_tbl_customer_addresses_type CHECK (address_type IN ('home', 'work', 'other'))
);

-- Index on user_id
CREATE INDEX ix_tbl_customer_addresses_user ON dbo.tbl_customer_addresses(user_id) WHERE isdeleted = 0;

-- Index on user_id + is_default
CREATE INDEX ix_tbl_customer_addresses_user_default ON dbo.tbl_customer_addresses(user_id, is_default) 
  WHERE isdeleted = 0 AND is_default = 1;

-- Index on user_id + is_billing_address
CREATE INDEX ix_tbl_customer_addresses_user_billing ON dbo.tbl_customer_addresses(user_id, is_billing_address) 
  WHERE isdeleted = 0 AND is_billing_address = 1;

-- ============================================
