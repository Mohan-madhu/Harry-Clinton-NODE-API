-- ============================================
-- K) REVIEWS & RATINGS
-- ============================================

-- 1) tbl_product_reviews
CREATE TABLE dbo.tbl_product_reviews (
  product_review_id varchar(36) PRIMARY KEY NOT NULL DEFAULT CONVERT(varchar(36), newid()),
  
  product_id varchar(36) NOT NULL,
  user_id varchar(36) NOT NULL,
  order_item_id varchar(36),
  
  rating int NOT NULL,  -- 1-5
  review_title varchar(255),
  review_text varchar(max),
  
  helpful_count int NOT NULL DEFAULT 0,
  unhelpful_count int NOT NULL DEFAULT 0,
  
  is_verified_purchase bit NOT NULL DEFAULT 0,
  
  review_status varchar(50) NOT NULL DEFAULT 'pending',  -- pending/approved/rejected
  
  reviewed_date datetime NOT NULL DEFAULT getdate(),
  approved_date datetime,
  
  isactive bit NOT NULL DEFAULT 1,
  isdeleted bit NOT NULL DEFAULT 0,
  
  rcu varchar(100),
  rcm datetime NOT NULL DEFAULT getdate(),
  luu varchar(100),
  lcm datetime,

  CONSTRAINT fk_tbl_product_reviews_product FOREIGN KEY (product_id) REFERENCES dbo.tbl_products(product_id),
  CONSTRAINT fk_tbl_product_reviews_user FOREIGN KEY (user_id) REFERENCES dbo.tbl_users(user_id),
  CONSTRAINT fk_tbl_product_reviews_order_item FOREIGN KEY (order_item_id) REFERENCES dbo.tbl_order_items(order_item_id),
  CONSTRAINT ck_tbl_product_reviews_rating CHECK (rating >= 1 AND rating <= 5),
  CONSTRAINT ck_tbl_product_reviews_status CHECK (review_status IN ('pending', 'approved', 'rejected'))
);

-- Index on product_id + rating
CREATE INDEX ix_tbl_product_reviews_product_rating ON dbo.tbl_product_reviews(product_id, rating) 
  WHERE isdeleted = 0 AND review_status = 'approved';

-- Index on user_id
CREATE INDEX ix_tbl_product_reviews_user ON dbo.tbl_product_reviews(user_id) WHERE isdeleted = 0;

-- Index on review_status
CREATE INDEX ix_tbl_product_reviews_status ON dbo.tbl_product_reviews(review_status) WHERE isdeleted = 0;

-- Index on is_verified_purchase
CREATE INDEX ix_tbl_product_reviews_verified ON dbo.tbl_product_reviews(is_verified_purchase) 
  WHERE isdeleted = 0 AND is_verified_purchase = 1;

-- Index on reviewed_date for recent reviews
CREATE INDEX ix_tbl_product_reviews_date ON dbo.tbl_product_reviews(reviewed_date) WHERE isdeleted = 0;

-- ============================================

-- 2) tbl_review_responses
CREATE TABLE dbo.tbl_review_responses (
  review_response_id varchar(36) PRIMARY KEY NOT NULL DEFAULT CONVERT(varchar(36), newid()),
  
  product_review_id varchar(36) NOT NULL,
  responder_user_id varchar(36) NOT NULL,
  
  response_text varchar(max),
  
  response_date datetime NOT NULL DEFAULT getdate(),
  
  isactive bit NOT NULL DEFAULT 1,
  isdeleted bit NOT NULL DEFAULT 0,
  
  rcu varchar(100),
  rcm datetime NOT NULL DEFAULT getdate(),
  luu varchar(100),
  lcm datetime,

  CONSTRAINT fk_tbl_review_responses_review FOREIGN KEY (product_review_id) REFERENCES dbo.tbl_product_reviews(product_review_id),
  CONSTRAINT fk_tbl_review_responses_user FOREIGN KEY (responder_user_id) REFERENCES dbo.tbl_users(user_id)
);

-- Index on product_review_id
CREATE INDEX ix_tbl_review_responses_review ON dbo.tbl_review_responses(product_review_id) WHERE isdeleted = 0;

-- Index on responder_user_id
CREATE INDEX ix_tbl_review_responses_user ON dbo.tbl_review_responses(responder_user_id) WHERE isdeleted = 0;

-- ============================================

-- 3) tbl_review_media
CREATE TABLE dbo.tbl_review_media (
  review_media_id varchar(36) PRIMARY KEY NOT NULL DEFAULT CONVERT(varchar(36), newid()),
  
  product_review_id varchar(36) NOT NULL,
  
  media_url varchar(1000) NOT NULL,
  media_type varchar(20),  -- image/video
  
  display_order int NOT NULL DEFAULT 1,
  
  isactive bit NOT NULL DEFAULT 1,
  isdeleted bit NOT NULL DEFAULT 0,
  
  rcu varchar(100),
  rcm datetime NOT NULL DEFAULT getdate(),
  luu varchar(100),
  lcm datetime,

  CONSTRAINT fk_tbl_review_media_review FOREIGN KEY (product_review_id) REFERENCES dbo.tbl_product_reviews(product_review_id)
);

-- Index on product_review_id + display_order
CREATE INDEX ix_tbl_review_media_review_order ON dbo.tbl_review_media(product_review_id, display_order) WHERE isdeleted = 0;

-- ============================================

-- 4) tbl_product_rating_summary
CREATE TABLE dbo.tbl_product_rating_summary (
  product_rating_summary_id varchar(36) PRIMARY KEY NOT NULL DEFAULT CONVERT(varchar(36), newid()),
  
  product_id varchar(36) NOT NULL,
  
  total_reviews int NOT NULL DEFAULT 0,
  verified_reviews int NOT NULL DEFAULT 0,
  
  average_rating decimal(3,2) NOT NULL DEFAULT 0.00,
  
  rating_1_count int NOT NULL DEFAULT 0,
  rating_2_count int NOT NULL DEFAULT 0,
  rating_3_count int NOT NULL DEFAULT 0,
  rating_4_count int NOT NULL DEFAULT 0,
  rating_5_count int NOT NULL DEFAULT 0,
  
  recommended_count int NOT NULL DEFAULT 0,
  
  last_updated datetime NOT NULL DEFAULT getdate(),
  
  isactive bit NOT NULL DEFAULT 1,
  isdeleted bit NOT NULL DEFAULT 0,
  
  rcu varchar(100),
  rcm datetime NOT NULL DEFAULT getdate(),
  luu varchar(100),
  lcm datetime,

  CONSTRAINT fk_tbl_product_rating_summary_product FOREIGN KEY (product_id) REFERENCES dbo.tbl_products(product_id),
  CONSTRAINT ux_tbl_product_rating_summary_product UNIQUE (product_id)
);

-- Index on product_id
CREATE INDEX ix_tbl_product_rating_summary_product ON dbo.tbl_product_rating_summary(product_id) WHERE isdeleted = 0;

-- Index on average_rating for sorting
CREATE INDEX ix_tbl_product_rating_summary_rating ON dbo.tbl_product_rating_summary(average_rating) WHERE isdeleted = 0;
