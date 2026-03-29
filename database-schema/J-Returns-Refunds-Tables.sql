-- ============================================
-- J) RETURNS & REFUNDS TABLES
-- ============================================

-- 1) tbl_returns
CREATE TABLE dbo.tbl_returns (
  return_id varchar(36) PRIMARY KEY NOT NULL DEFAULT CONVERT(varchar(36), newid()),
  
  order_id varchar(36) NOT NULL,
  user_id varchar(36) NOT NULL,
  
  return_type varchar(50) NOT NULL,  -- full/partial
  return_status varchar(50) NOT NULL DEFAULT 'requested',  -- requested/approved/rejected/received/processed
  
  return_reason varchar(500),
  return_reason_code varchar(50),  -- defective/wrong_size/damaged/changed_mind/not_as_described
  
  return_items_count int NOT NULL DEFAULT 1,
  return_amount decimal(18,2),  -- amount to be refunded
  
  requested_date datetime NOT NULL DEFAULT getdate(),
  approved_date datetime,
  received_date datetime,
  completed_date datetime,
  
  rma_number varchar(100),  -- Return Merchandise Authorization
  
  notes varchar(500),
  
  isactive bit NOT NULL DEFAULT 1,
  isdeleted bit NOT NULL DEFAULT 0,
  
  rcu varchar(100),
  rcm datetime NOT NULL DEFAULT getdate(),
  luu varchar(100),
  lcm datetime,

  CONSTRAINT fk_tbl_returns_order FOREIGN KEY (order_id) REFERENCES dbo.tbl_orders(order_id),
  CONSTRAINT fk_tbl_returns_user FOREIGN KEY (user_id) REFERENCES dbo.tbl_users(user_id),
  CONSTRAINT ck_tbl_returns_type CHECK (return_type IN ('full', 'partial')),
  CONSTRAINT ck_tbl_returns_status CHECK (return_status IN ('requested', 'approved', 'rejected', 'received', 'processed')),
  CONSTRAINT ck_tbl_returns_reason CHECK (return_reason_code IN ('defective', 'wrong_size', 'damaged', 'changed_mind', 'not_as_described', 'other'))
);

-- Unique index on rma_number - filtered for non-deleted
CREATE UNIQUE INDEX ux_tbl_returns_rma ON dbo.tbl_returns(rma_number) WHERE isdeleted = 0 AND rma_number IS NOT NULL;

-- Index on order_id
CREATE INDEX ix_tbl_returns_order ON dbo.tbl_returns(order_id) WHERE isdeleted = 0;

-- Index on user_id
CREATE INDEX ix_tbl_returns_user ON dbo.tbl_returns(user_id) WHERE isdeleted = 0;

-- Index on return_status
CREATE INDEX ix_tbl_returns_status ON dbo.tbl_returns(return_status) WHERE isdeleted = 0;

-- Index on requested_date for tracking recent returns
CREATE INDEX ix_tbl_returns_requested_date ON dbo.tbl_returns(requested_date) WHERE isdeleted = 0;

-- ============================================

-- 2) tbl_refunds
CREATE TABLE dbo.tbl_refunds (
  refund_id varchar(36) PRIMARY KEY NOT NULL DEFAULT CONVERT(varchar(36), newid()),
  
  return_id varchar(36) NOT NULL,
  payment_id varchar(36),
  
  order_id varchar(36) NOT NULL,
  user_id varchar(36) NOT NULL,
  
  refund_type varchar(50) NOT NULL,  -- full/partial
  refund_status varchar(50) NOT NULL DEFAULT 'initiated',  -- initiated/processed/completed/failed/cancelled
  
  refund_amount decimal(18,2) NOT NULL,
  
  refund_method varchar(50) NOT NULL,  -- original_payment/wallet/bank_transfer
  
  transaction_id varchar(100),  -- razorpay refund id or bank reference
  
  initiated_date datetime NOT NULL DEFAULT getdate(),
  processed_date datetime,
  completed_date datetime,
  
  failure_reason varchar(500),
  
  notes varchar(500),
  
  isactive bit NOT NULL DEFAULT 1,
  isdeleted bit NOT NULL DEFAULT 0,
  
  rcu varchar(100),
  rcm datetime NOT NULL DEFAULT getdate(),
  luu varchar(100),
  lcm datetime,

  CONSTRAINT fk_tbl_refunds_return FOREIGN KEY (return_id) REFERENCES dbo.tbl_returns(return_id),
  CONSTRAINT fk_tbl_refunds_payment FOREIGN KEY (payment_id) REFERENCES dbo.tbl_payments(payment_id),
  CONSTRAINT fk_tbl_refunds_order FOREIGN KEY (order_id) REFERENCES dbo.tbl_orders(order_id),
  CONSTRAINT fk_tbl_refunds_user FOREIGN KEY (user_id) REFERENCES dbo.tbl_users(user_id),
  CONSTRAINT ck_tbl_refunds_type CHECK (refund_type IN ('full', 'partial')),
  CONSTRAINT ck_tbl_refunds_status CHECK (refund_status IN ('initiated', 'processed', 'completed', 'failed', 'cancelled')),
  CONSTRAINT ck_tbl_refunds_method CHECK (refund_method IN ('original_payment', 'wallet', 'bank_transfer')),
  CONSTRAINT ck_tbl_refunds_amount CHECK (refund_amount > 0)
);

-- Index on return_id
CREATE INDEX ix_tbl_refunds_return ON dbo.tbl_refunds(return_id) WHERE isdeleted = 0;

-- Index on payment_id
CREATE INDEX ix_tbl_refunds_payment ON dbo.tbl_refunds(payment_id) WHERE isdeleted = 0;

-- Index on order_id
CREATE INDEX ix_tbl_refunds_order ON dbo.tbl_refunds(order_id) WHERE isdeleted = 0;

-- Index on user_id
CREATE INDEX ix_tbl_refunds_user ON dbo.tbl_refunds(user_id) WHERE isdeleted = 0;

-- Index on refund_status
CREATE INDEX ix_tbl_refunds_status ON dbo.tbl_refunds(refund_status) WHERE isdeleted = 0;

-- Index on initiated_date for tracking recent refunds
CREATE INDEX ix_tbl_refunds_initiated_date ON dbo.tbl_refunds(initiated_date) WHERE isdeleted = 0;

-- Composite index for dashboard queries (user + status + date)
CREATE INDEX ix_tbl_refunds_user_status_date ON dbo.tbl_refunds(user_id, refund_status, initiated_date) WHERE isdeleted = 0;
