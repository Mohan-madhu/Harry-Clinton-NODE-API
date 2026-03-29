-- ============================================
-- G) PAYMENTS TABLE
-- ============================================

-- 1) tbl_payments
CREATE TABLE dbo.tbl_payments (
  payment_id varchar(36) PRIMARY KEY NOT NULL DEFAULT CONVERT(varchar(36), newid()),
  
  order_id varchar(36) NOT NULL,
  user_id varchar(36) NOT NULL,
  
  payment_provider varchar(50) NOT NULL DEFAULT 'razorpay',
  payment_method_type varchar(20),  -- card/upi/netbanking/wallet
  payment_status varchar(50) NOT NULL DEFAULT 'pending',  -- pending/paid/failed/refunded
  
  amount decimal(18,2) NOT NULL,
  currency_code varchar(10) NOT NULL DEFAULT 'inr',
  
  razorpay_order_id varchar(100),
  razorpay_payment_id varchar(100),
  razorpay_signature varchar(255),
  
  paid_at datetime,
  failed_at datetime,
  
  refund_amount decimal(18,2),
  refunded_at datetime,
  
  notes varchar(500),
  
  isactive bit NOT NULL DEFAULT 1,
  isdeleted bit NOT NULL DEFAULT 0,
  
  rcu varchar(100),
  rcm datetime NOT NULL DEFAULT getdate(),
  luu varchar(100),
  lcm datetime,

  CONSTRAINT fk_tbl_payments_order FOREIGN KEY (order_id) REFERENCES dbo.tbl_orders(order_id),
  CONSTRAINT fk_tbl_payments_user FOREIGN KEY (user_id) REFERENCES dbo.tbl_users(user_id),
  CONSTRAINT ck_tbl_payments_status CHECK (payment_status IN ('pending', 'paid', 'failed', 'refunded')),
  CONSTRAINT ck_tbl_payments_amount CHECK (amount > 0)
);

-- Index on order_id - filtered for non-deleted
CREATE INDEX ix_tbl_payments_order ON dbo.tbl_payments(order_id) WHERE isdeleted = 0;

-- Index on razorpay_payment_id - filtered for non-deleted
CREATE INDEX ix_tbl_payments_razorpay_payment_id ON dbo.tbl_payments(razorpay_payment_id) WHERE isdeleted = 0;

-- Index on user_id
CREATE INDEX ix_tbl_payments_user ON dbo.tbl_payments(user_id) WHERE isdeleted = 0;

-- Index on payment_status
CREATE INDEX ix_tbl_payments_status ON dbo.tbl_payments(payment_status) WHERE isdeleted = 0;

-- Index on paid_at for recent transactions
CREATE INDEX ix_tbl_payments_paid_at ON dbo.tbl_payments(paid_at) WHERE isdeleted = 0 AND payment_status = 'paid';
