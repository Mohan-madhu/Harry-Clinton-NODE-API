-- ============================================
-- HC_A) APPOINTMENTS & BOOKING
-- ============================================

-- 1) tbl_appointment_date_slots
CREATE TABLE dbo.tbl_appointment_date_slots (
  appointment_date_slot_id varchar(36) PRIMARY KEY NOT NULL DEFAULT CONVERT(varchar(36), newid()),
  
  slot_date date NOT NULL,
  day_of_week varchar(20),
  
  max_appointments int NOT NULL DEFAULT 10,
  booked_count int NOT NULL DEFAULT 0,
  
  is_available bit NOT NULL DEFAULT 1,
  
  isactive bit NOT NULL DEFAULT 1,
  isdeleted bit NOT NULL DEFAULT 0,
  
  rcu varchar(100),
  rcm datetime NOT NULL DEFAULT getdate(),
  luu varchar(100),
  lcm datetime,

  CONSTRAINT ux_tbl_appointment_date_slots_date UNIQUE (slot_date)
);

-- Index on slot_date
CREATE INDEX ix_tbl_appointment_date_slots_date ON dbo.tbl_appointment_date_slots(slot_date) WHERE isdeleted = 0;

-- Index on is_available
CREATE INDEX ix_tbl_appointment_date_slots_available ON dbo.tbl_appointment_date_slots(is_available) 
  WHERE isdeleted = 0 AND is_available = 1;

-- ============================================

-- 2) tbl_appointment_time_slots
CREATE TABLE dbo.tbl_appointment_time_slots (
  appointment_time_slot_id varchar(36) PRIMARY KEY NOT NULL DEFAULT CONVERT(varchar(36), newid()),
  
  appointment_date_slot_id varchar(36) NOT NULL,
  
  slot_start_time time NOT NULL,
  slot_end_time time NOT NULL,
  
  max_concurrent_appointments int NOT NULL DEFAULT 1,
  booked_count int NOT NULL DEFAULT 0,
  
  is_available bit NOT NULL DEFAULT 1,
  
  isactive bit NOT NULL DEFAULT 1,
  isdeleted bit NOT NULL DEFAULT 0,
  
  rcu varchar(100),
  rcm datetime NOT NULL DEFAULT getdate(),
  luu varchar(100),
  lcm datetime,

  CONSTRAINT fk_tbl_appointment_time_slots_date_slot FOREIGN KEY (appointment_date_slot_id) 
    REFERENCES dbo.tbl_appointment_date_slots(appointment_date_slot_id)
);

-- Index on appointment_date_slot_id + slot_start_time
CREATE INDEX ix_tbl_appointment_time_slots_date_time ON dbo.tbl_appointment_time_slots(appointment_date_slot_id, slot_start_time) 
  WHERE isdeleted = 0;

-- Index on is_available
CREATE INDEX ix_tbl_appointment_time_slots_available ON dbo.tbl_appointment_time_slots(is_available) 
  WHERE isdeleted = 0 AND is_available = 1;

-- ============================================

-- 3) tbl_appointment_slot_blocks
CREATE TABLE dbo.tbl_appointment_slot_blocks (
  appointment_slot_block_id varchar(36) PRIMARY KEY NOT NULL DEFAULT CONVERT(varchar(36), newid()),
  
  appointment_time_slot_id varchar(36),
  appointment_date_slot_id varchar(36),
  
  block_start_datetime datetime NOT NULL,
  block_end_datetime datetime NOT NULL,
  
  block_reason varchar(255),  -- maintenance/holiday/emergency/manual
  
  isactive bit NOT NULL DEFAULT 1,
  isdeleted bit NOT NULL DEFAULT 0,
  
  rcu varchar(100),
  rcm datetime NOT NULL DEFAULT getdate(),
  luu varchar(100),
  lcm datetime,

  CONSTRAINT fk_tbl_appointment_slot_blocks_time_slot FOREIGN KEY (appointment_time_slot_id) 
    REFERENCES dbo.tbl_appointment_time_slots(appointment_time_slot_id),
  CONSTRAINT fk_tbl_appointment_slot_blocks_date_slot FOREIGN KEY (appointment_date_slot_id) 
    REFERENCES dbo.tbl_appointment_date_slots(appointment_date_slot_id)
);

-- Index on block_start_datetime
CREATE INDEX ix_tbl_appointment_slot_blocks_start_time ON dbo.tbl_appointment_slot_blocks(block_start_datetime) 
  WHERE isdeleted = 0;

-- ============================================

-- 4) tbl_appointments
CREATE TABLE dbo.tbl_appointments (
  appointment_id varchar(36) PRIMARY KEY NOT NULL DEFAULT CONVERT(varchar(36), newid()),
  
  user_id varchar(36) NOT NULL,
  
  appointment_time_slot_id varchar(36),
  appointment_date_slot_id varchar(36) NOT NULL,
  
  appointment_date datetime NOT NULL,
  
  appointment_type varchar(50),  -- consultation/fitting/styling/trial
  
  appointment_status varchar(50) NOT NULL DEFAULT 'scheduled',  -- scheduled/confirmed/in_progress/completed/cancelled/no_show
  
  customer_name varchar(255),
  customer_phone varchar(20),
  customer_email varchar(255),
  
  assigned_stylist_id varchar(36),
  
  notes varchar(500),
  
  appointment_end_time datetime,
  
  isactive bit NOT NULL DEFAULT 1,
  isdeleted bit NOT NULL DEFAULT 0,
  
  rcu varchar(100),
  rcm datetime NOT NULL DEFAULT getdate(),
  luu varchar(100),
  lcm datetime,

  CONSTRAINT fk_tbl_appointments_user FOREIGN KEY (user_id) REFERENCES dbo.tbl_users(user_id),
  CONSTRAINT fk_tbl_appointments_time_slot FOREIGN KEY (appointment_time_slot_id) 
    REFERENCES dbo.tbl_appointment_time_slots(appointment_time_slot_id),
  CONSTRAINT fk_tbl_appointments_date_slot FOREIGN KEY (appointment_date_slot_id) 
    REFERENCES dbo.tbl_appointment_date_slots(appointment_date_slot_id),
  CONSTRAINT fk_tbl_appointments_stylist FOREIGN KEY (assigned_stylist_id) REFERENCES dbo.tbl_users(user_id),
  CONSTRAINT ck_tbl_appointments_status CHECK (appointment_status IN ('scheduled', 'confirmed', 'in_progress', 'completed', 'cancelled', 'no_show'))
);

-- Index on user_id + appointment_date
CREATE INDEX ix_tbl_appointments_user_date ON dbo.tbl_appointments(user_id, appointment_date) WHERE isdeleted = 0;

-- Index on appointment_date
CREATE INDEX ix_tbl_appointments_date ON dbo.tbl_appointments(appointment_date) WHERE isdeleted = 0;

-- Index on appointment_status
CREATE INDEX ix_tbl_appointments_status ON dbo.tbl_appointments(appointment_status) WHERE isdeleted = 0;

-- Index on assigned_stylist_id
CREATE INDEX ix_tbl_appointments_stylist ON dbo.tbl_appointments(assigned_stylist_id) WHERE isdeleted = 0;

-- ============================================

-- 5) tbl_custom_appointments
CREATE TABLE dbo.tbl_custom_appointments (
  custom_appointment_id varchar(36) PRIMARY KEY NOT NULL DEFAULT CONVERT(varchar(36), newid()),
  
  appointment_id varchar(36),
  
  custom_requested_date datetime,
  custom_requested_time time,
  custom_requested_duration_minutes int,
  
  custom_reason varchar(255),
  
  request_status varchar(50) NOT NULL DEFAULT 'pending',  -- pending/approved/rejected
  
  approval_notes varchar(500),
  
  approved_by_user_id varchar(36),
  approved_date datetime,
  
  isactive bit NOT NULL DEFAULT 1,
  isdeleted bit NOT NULL DEFAULT 0,
  
  rcu varchar(100),
  rcm datetime NOT NULL DEFAULT getdate(),
  luu varchar(100),
  lcm datetime,

  CONSTRAINT fk_tbl_custom_appointments_appointment FOREIGN KEY (appointment_id) REFERENCES dbo.tbl_appointments(appointment_id),
  CONSTRAINT fk_tbl_custom_appointments_approver FOREIGN KEY (approved_by_user_id) REFERENCES dbo.tbl_users(user_id),
  CONSTRAINT ck_tbl_custom_appointments_status CHECK (request_status IN ('pending', 'approved', 'rejected'))
);

-- Index on appointment_id
CREATE INDEX ix_tbl_custom_appointments_appointment ON dbo.tbl_custom_appointments(appointment_id) WHERE isdeleted = 0;

-- Index on request_status
CREATE INDEX ix_tbl_custom_appointments_status ON dbo.tbl_custom_appointments(request_status) WHERE isdeleted = 0;
