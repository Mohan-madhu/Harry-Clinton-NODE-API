-- ============================================
-- A) USER MANAGEMENT & AUTHENTICATION
-- ============================================

-- 1) tbl_users
CREATE TABLE dbo.tbl_users (
  user_id varchar(36) PRIMARY KEY NOT NULL DEFAULT CONVERT(varchar(36), newid()),
  
  email varchar(255) NOT NULL,
  phone_number varchar(20),
  
  first_name varchar(100),
  last_name varchar(100),
  full_name varchar(255),
  
  password_hash varchar(500),
  password_salt varchar(500),
  
  profile_picture_url varchar(1000),
  
  email_verified bit NOT NULL DEFAULT 0,
  email_verified_at datetime,
  
  phone_verified bit NOT NULL DEFAULT 0,
  phone_verified_at datetime,
  
  last_login datetime,
  
  isactive bit NOT NULL DEFAULT 1,
  isdeleted bit NOT NULL DEFAULT 0,
  
  rcu varchar(100),
  rcm datetime NOT NULL DEFAULT getdate(),
  luu varchar(100),
  lcm datetime,

  CONSTRAINT ux_tbl_users_email UNIQUE (email)
);

-- Index on email
CREATE INDEX ix_tbl_users_email ON dbo.tbl_users(email) WHERE isdeleted = 0;

-- Index on phone_number
CREATE INDEX ix_tbl_users_phone ON dbo.tbl_users(phone_number) WHERE isdeleted = 0;

-- Index on last_login
CREATE INDEX ix_tbl_users_last_login ON dbo.tbl_users(last_login) WHERE isdeleted = 0;

-- ============================================

-- 2) tbl_roles
CREATE TABLE dbo.tbl_roles (
  role_id varchar(36) PRIMARY KEY NOT NULL DEFAULT CONVERT(varchar(36), newid()),
  
  role_name varchar(100) NOT NULL,
  role_code varchar(50) NOT NULL,
  description varchar(500),
  
  isactive bit NOT NULL DEFAULT 1,
  isdeleted bit NOT NULL DEFAULT 0,
  
  rcu varchar(100),
  rcm datetime NOT NULL DEFAULT getdate(),
  luu varchar(100),
  lcm datetime,

  CONSTRAINT ux_tbl_roles_code UNIQUE (role_code)
);

-- Index on role_code
CREATE INDEX ix_tbl_roles_code ON dbo.tbl_roles(role_code) WHERE isdeleted = 0;

-- ============================================

-- 3) tbl_user_roles
CREATE TABLE dbo.tbl_user_roles (
  user_role_id varchar(36) PRIMARY KEY NOT NULL DEFAULT CONVERT(varchar(36), newid()),
  
  user_id varchar(36) NOT NULL,
  role_id varchar(36) NOT NULL,
  
  assigned_date datetime NOT NULL DEFAULT getdate(),
  
  isactive bit NOT NULL DEFAULT 1,
  isdeleted bit NOT NULL DEFAULT 0,
  
  rcu varchar(100),
  rcm datetime NOT NULL DEFAULT getdate(),
  luu varchar(100),
  lcm datetime,

  CONSTRAINT fk_tbl_user_roles_user FOREIGN KEY (user_id) REFERENCES dbo.tbl_users(user_id),
  CONSTRAINT fk_tbl_user_roles_role FOREIGN KEY (role_id) REFERENCES dbo.tbl_roles(role_id)
);

-- Unique constraint on user_id + role_id - filtered for non-deleted
CREATE UNIQUE INDEX ux_tbl_user_roles_unique ON dbo.tbl_user_roles(user_id, role_id) WHERE isdeleted = 0;

-- Index on user_id
CREATE INDEX ix_tbl_user_roles_user ON dbo.tbl_user_roles(user_id) WHERE isdeleted = 0;

-- Index on role_id
CREATE INDEX ix_tbl_user_roles_role ON dbo.tbl_user_roles(role_id) WHERE isdeleted = 0;

-- ============================================
