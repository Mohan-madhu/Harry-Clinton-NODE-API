-- ============================================
-- I) SHIPPING & DELIVERY TABLES
-- ============================================

-- 1) tbl_courier_partners
CREATE TABLE dbo.tbl_courier_partners (
  courier_partner_id varchar(36) PRIMARY KEY NOT NULL DEFAULT CONVERT(varchar(36), newid()),
  
  courier_name varchar(255) NOT NULL,
  courier_code varchar(50) NOT NULL,
  
  contact_email varchar(255),
  contact_phone varchar(50),
  
  base_rate decimal(18,2),
  rate_per_kg decimal(18,2),
  
  api_base_url varchar(500),
  api_key varchar(255),
  
  integration_status varchar(50),  -- active/inactive/testing
  
  isactive bit NOT NULL DEFAULT 1,
  isdeleted bit NOT NULL DEFAULT 0,
  
  rcu varchar(100),
  rcm datetime NOT NULL DEFAULT getdate(),
  luu varchar(100),
  lcm datetime,

  CONSTRAINT ux_tbl_courier_partners_code UNIQUE (courier_code)
);

-- Index on courier_code
CREATE INDEX ix_tbl_courier_partners_code ON dbo.tbl_courier_partners(courier_code) WHERE isdeleted = 0;

-- ============================================

-- 2) tbl_shipments
CREATE TABLE dbo.tbl_shipments (
  shipment_id varchar(36) PRIMARY KEY NOT NULL DEFAULT CONVERT(varchar(36), newid()),
  
  order_id varchar(36) NOT NULL,
  
  courier_partner_id varchar(36) NOT NULL,
  
  tracking_number varchar(100),
  awb_number varchar(100),  -- Air Way Bill
  
  shipment_status varchar(50) NOT NULL DEFAULT 'pending',  -- pending/shipped/in-transit/delivered/failed/cancelled
  
  weight decimal(18,2),  -- in kg
  dimensions varchar(100),  -- LxWxH
  
  shipped_date datetime,
  estimated_delivery datetime,
  actual_delivery_date datetime,
  
  pickup_address_id varchar(36),
  drop_address_id varchar(36),
  
  shipping_cost decimal(18,2),
  
  notes varchar(500),
  
  isactive bit NOT NULL DEFAULT 1,
  isdeleted bit NOT NULL DEFAULT 0,
  
  rcu varchar(100),
  rcm datetime NOT NULL DEFAULT getdate(),
  luu varchar(100),
  lcm datetime,

  CONSTRAINT fk_tbl_shipments_order FOREIGN KEY (order_id) REFERENCES dbo.tbl_orders(order_id),
  CONSTRAINT fk_tbl_shipments_courier FOREIGN KEY (courier_partner_id) REFERENCES dbo.tbl_courier_partners(courier_partner_id),
  CONSTRAINT ck_tbl_shipments_status CHECK (shipment_status IN ('pending', 'shipped', 'in-transit', 'delivered', 'failed', 'cancelled'))
);

-- Unique index on tracking_number - filtered for non-deleted
CREATE UNIQUE INDEX ux_tbl_shipments_tracking ON dbo.tbl_shipments(tracking_number) WHERE isdeleted = 0 AND tracking_number IS NOT NULL;

-- Index on order_id
CREATE INDEX ix_tbl_shipments_order ON dbo.tbl_shipments(order_id) WHERE isdeleted = 0;

-- Index on courier_partner_id
CREATE INDEX ix_tbl_shipments_courier ON dbo.tbl_shipments(courier_partner_id) WHERE isdeleted = 0;

-- Index on shipment_status
CREATE INDEX ix_tbl_shipments_status ON dbo.tbl_shipments(shipment_status) WHERE isdeleted = 0;

-- Index on shipped_date for tracking recent shipments
CREATE INDEX ix_tbl_shipments_shipped_date ON dbo.tbl_shipments(shipped_date) WHERE isdeleted = 0;

-- ============================================

-- 3) tbl_shipment_events
CREATE TABLE dbo.tbl_shipment_events (
  shipment_event_id varchar(36) PRIMARY KEY NOT NULL DEFAULT CONVERT(varchar(36), newid()),
  
  shipment_id varchar(36) NOT NULL,
  
  event_status varchar(50) NOT NULL,  -- pickup_scheduled/dispatched/in_transit/out_for_delivery/delivered/failed/returned
  event_location varchar(255),  -- city/warehouse name
  event_description varchar(500),
  
  event_timestamp datetime NOT NULL DEFAULT getdate(),
  
  event_source varchar(50),  -- gps/manual/api/system
  
  isactive bit NOT NULL DEFAULT 1,
  isdeleted bit NOT NULL DEFAULT 0,
  
  rcu varchar(100),
  rcm datetime NOT NULL DEFAULT getdate(),
  luu varchar(100),
  lcm datetime,

  CONSTRAINT fk_tbl_shipment_events_shipment FOREIGN KEY (shipment_id) REFERENCES dbo.tbl_shipments(shipment_id),
  CONSTRAINT ck_tbl_shipment_events_status CHECK (event_status IN ('pickup_scheduled', 'dispatched', 'in_transit', 'out_for_delivery', 'delivered', 'failed', 'returned', 'exception'))
);

-- Index on shipment_id + event_timestamp (chronological order)
CREATE INDEX ix_tbl_shipment_events_shipment_time ON dbo.tbl_shipment_events(shipment_id, event_timestamp) WHERE isdeleted = 0;

-- Index on event_timestamp for recent events
CREATE INDEX ix_tbl_shipment_events_timestamp ON dbo.tbl_shipment_events(event_timestamp) WHERE isdeleted = 0;
