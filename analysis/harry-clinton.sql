USE [master]
GO
/****** Object:  Database [db_harry_clinton]    Script Date: 30-06-2026 19:59:19 ******/
CREATE DATABASE [db_harry_clinton]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'db_harry_clinton', FILENAME = N'/var/opt/mssql/data/db_harry_clinton.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'db_harry_clinton_log', FILENAME = N'/var/opt/mssql/data/db_harry_clinton_log.ldf' , SIZE = 139264KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [db_harry_clinton] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [db_harry_clinton].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [db_harry_clinton] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [db_harry_clinton] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [db_harry_clinton] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [db_harry_clinton] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [db_harry_clinton] SET ARITHABORT OFF 
GO
ALTER DATABASE [db_harry_clinton] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [db_harry_clinton] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [db_harry_clinton] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [db_harry_clinton] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [db_harry_clinton] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [db_harry_clinton] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [db_harry_clinton] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [db_harry_clinton] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [db_harry_clinton] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [db_harry_clinton] SET  DISABLE_BROKER 
GO
ALTER DATABASE [db_harry_clinton] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [db_harry_clinton] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [db_harry_clinton] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [db_harry_clinton] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [db_harry_clinton] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [db_harry_clinton] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [db_harry_clinton] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [db_harry_clinton] SET RECOVERY FULL 
GO
ALTER DATABASE [db_harry_clinton] SET  MULTI_USER 
GO
ALTER DATABASE [db_harry_clinton] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [db_harry_clinton] SET DB_CHAINING OFF 
GO
ALTER DATABASE [db_harry_clinton] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [db_harry_clinton] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [db_harry_clinton] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [db_harry_clinton] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'db_harry_clinton', N'ON'
GO
ALTER DATABASE [db_harry_clinton] SET QUERY_STORE = ON
GO
ALTER DATABASE [db_harry_clinton] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [db_harry_clinton]
GO
/****** Object:  Table [dbo].[tbl_addresses]    Script Date: 30-06-2026 19:59:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_addresses](
	[address_id] [varchar](36) NOT NULL,
	[user_id] [varchar](36) NOT NULL,
	[full_name] [varchar](255) NOT NULL,
	[mobile_number] [varchar](50) NOT NULL,
	[house_street] [varchar](500) NOT NULL,
	[city] [varchar](150) NOT NULL,
	[state] [varchar](150) NOT NULL,
	[pincode] [varchar](20) NOT NULL,
	[landmark] [varchar](255) NULL,
	[isdefault] [bit] NOT NULL,
	[isactive] [bit] NOT NULL,
	[isdeleted] [bit] NOT NULL,
	[rcu] [varchar](100) NULL,
	[rcm] [datetime] NOT NULL,
	[luu] [varchar](100) NULL,
	[lcm] [datetime] NULL,
 CONSTRAINT [pk_tbl_addresses] PRIMARY KEY CLUSTERED 
(
	[address_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_appointment_date_slots]    Script Date: 30-06-2026 19:59:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_appointment_date_slots](
	[appointment_date_slot_id] [uniqueidentifier] NOT NULL,
	[slot_date] [date] NOT NULL,
	[slot_duration_minutes] [int] NOT NULL,
	[isavailable] [bit] NOT NULL,
	[notes] [varchar](500) NULL,
	[isactive] [bit] NOT NULL,
	[isdeleted] [bit] NOT NULL,
	[rcu] [varchar](100) NULL,
	[rcm] [datetime] NOT NULL,
	[luu] [varchar](100) NULL,
	[lcm] [datetime] NULL,
 CONSTRAINT [PK_tbl_appointment_date_slots] PRIMARY KEY CLUSTERED 
(
	[appointment_date_slot_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_appointment_slot_blocks]    Script Date: 30-06-2026 19:59:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_appointment_slot_blocks](
	[appointment_slot_block_id] [uniqueidentifier] NOT NULL,
	[appointment_date_slot_id] [uniqueidentifier] NOT NULL,
	[block_start_time] [time](0) NOT NULL,
	[block_end_time] [time](0) NOT NULL,
	[block_reason] [varchar](255) NULL,
	[blocked_by] [varchar](100) NULL,
	[isactive] [bit] NOT NULL,
	[isdeleted] [bit] NOT NULL,
	[rcu] [varchar](100) NULL,
	[rcm] [datetime] NOT NULL,
	[luu] [varchar](100) NULL,
	[lcm] [datetime] NULL,
 CONSTRAINT [PK_tbl_appointment_slot_blocks] PRIMARY KEY CLUSTERED 
(
	[appointment_slot_block_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_appointment_time_slots]    Script Date: 30-06-2026 19:59:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_appointment_time_slots](
	[appointment_time_slot_id] [uniqueidentifier] NOT NULL,
	[appointment_date_slot_id] [uniqueidentifier] NOT NULL,
	[slot_start_time] [time](0) NOT NULL,
	[slot_end_time] [time](0) NOT NULL,
	[isavailable] [bit] NOT NULL,
	[isbooked] [bit] NOT NULL,
	[booked_at] [datetime] NULL,
	[appointment_id] [uniqueidentifier] NULL,
	[notes] [varchar](500) NULL,
	[display_order] [int] NOT NULL,
	[isactive] [bit] NOT NULL,
	[isdeleted] [bit] NOT NULL,
	[rcu] [varchar](100) NULL,
	[rcm] [datetime] NOT NULL,
	[luu] [varchar](100) NULL,
	[lcm] [datetime] NULL,
 CONSTRAINT [PK_tbl_appointment_time_slots] PRIMARY KEY CLUSTERED 
(
	[appointment_time_slot_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_attributes]    Script Date: 30-06-2026 19:59:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_attributes](
	[attribute_id] [varchar](36) NOT NULL,
	[attribute_name] [varchar](255) NOT NULL,
	[attribute_slug] [varchar](255) NOT NULL,
	[attribute_type] [varchar](50) NOT NULL,
	[display_order] [int] NOT NULL,
	[isactive] [bit] NOT NULL,
	[isdeleted] [bit] NOT NULL,
	[rcu] [varchar](100) NULL,
	[rcm] [datetime] NOT NULL,
	[luu] [varchar](100) NULL,
	[lcm] [datetime] NULL,
 CONSTRAINT [pk_tbl_attributes] PRIMARY KEY CLUSTERED 
(
	[attribute_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_care_instructions]    Script Date: 30-06-2026 19:59:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_care_instructions](
	[care_instruction_id] [varchar](36) NOT NULL,
	[instruction_text] [varchar](max) NOT NULL,
	[display_order] [int] NOT NULL,
	[isactive] [bit] NOT NULL,
	[isdeleted] [bit] NOT NULL,
	[rcu] [varchar](100) NULL,
	[rcm] [datetime] NOT NULL,
	[luu] [varchar](100) NULL,
	[lcm] [datetime] NULL,
 CONSTRAINT [pk_tbl_care_instructions] PRIMARY KEY CLUSTERED 
(
	[care_instruction_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_cart_items]    Script Date: 30-06-2026 19:59:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_cart_items](
	[cart_item_id] [varchar](36) NOT NULL,
	[cart_id] [varchar](36) NOT NULL,
	[product_id] [varchar](36) NOT NULL,
	[product_variant_id] [varchar](36) NULL,
	[qty] [int] NOT NULL,
	[unit_price] [decimal](18, 2) NULL,
	[total_price] [decimal](18, 2) NULL,
	[added_at] [datetime] NOT NULL,
	[isactive] [bit] NOT NULL,
	[isdeleted] [bit] NOT NULL,
	[rcu] [varchar](100) NULL,
	[rcm] [datetime] NOT NULL,
	[luu] [varchar](100) NULL,
	[lcm] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[cart_item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_carts]    Script Date: 30-06-2026 19:59:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_carts](
	[cart_id] [varchar](36) NOT NULL,
	[user_id] [varchar](36) NOT NULL,
	[cart_status] [varchar](20) NOT NULL,
	[isactive] [bit] NOT NULL,
	[isdeleted] [bit] NOT NULL,
	[rcu] [varchar](100) NULL,
	[rcm] [datetime] NOT NULL,
	[luu] [varchar](100) NULL,
	[lcm] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[cart_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_cloth_type_care_instructions]    Script Date: 30-06-2026 19:59:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_cloth_type_care_instructions](
	[cloth_type_care_instruction_id] [varchar](36) NOT NULL,
	[cloth_type_id] [varchar](36) NOT NULL,
	[care_instruction_id] [varchar](36) NOT NULL,
	[display_order] [int] NOT NULL,
	[isactive] [bit] NOT NULL,
	[isdeleted] [bit] NOT NULL,
	[rcu] [varchar](100) NULL,
	[rcm] [datetime] NOT NULL,
	[luu] [varchar](100) NULL,
	[lcm] [datetime] NULL,
 CONSTRAINT [pk_tbl_cloth_type_care_instructions] PRIMARY KEY CLUSTERED 
(
	[cloth_type_care_instruction_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_cloth_types]    Script Date: 30-06-2026 19:59:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_cloth_types](
	[cloth_type_id] [varchar](36) NOT NULL,
	[cloth_type_name] [varchar](255) NOT NULL,
	[cloth_type_slug] [varchar](255) NOT NULL,
	[description] [varchar](500) NULL,
	[display_order] [int] NOT NULL,
	[isactive] [bit] NOT NULL,
	[isdeleted] [bit] NOT NULL,
	[rcu] [varchar](100) NULL,
	[rcm] [datetime] NOT NULL,
	[luu] [varchar](100) NULL,
	[lcm] [datetime] NULL,
 CONSTRAINT [pk_tbl_cloth_types] PRIMARY KEY CLUSTERED 
(
	[cloth_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_coupon_usage]    Script Date: 30-06-2026 19:59:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_coupon_usage](
	[coupon_usage_id] [varchar](36) NOT NULL,
	[coupon_id] [varchar](36) NOT NULL,
	[user_id] [varchar](36) NOT NULL,
	[order_id] [varchar](36) NULL,
	[discount_amount] [decimal](18, 2) NOT NULL,
	[used_at] [datetime] NOT NULL,
	[isactive] [bit] NOT NULL,
	[isdeleted] [bit] NOT NULL,
	[rcu] [varchar](100) NULL,
	[rcm] [datetime] NOT NULL,
	[luu] [varchar](100) NULL,
	[lcm] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[coupon_usage_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_coupons]    Script Date: 30-06-2026 19:59:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_coupons](
	[coupon_id] [varchar](36) NOT NULL,
	[coupon_code] [varchar](100) NOT NULL,
	[coupon_name] [varchar](255) NULL,
	[description] [varchar](500) NULL,
	[discount_type] [varchar](20) NOT NULL,
	[discount_value] [decimal](18, 2) NOT NULL,
	[min_purchase_amount] [decimal](18, 2) NULL,
	[max_discount_amount] [decimal](18, 2) NULL,
	[usage_limit] [int] NULL,
	[usage_count] [int] NOT NULL,
	[per_user_limit] [int] NULL,
	[start_date] [datetime] NOT NULL,
	[end_date] [datetime] NULL,
	[isactive] [bit] NOT NULL,
	[isdeleted] [bit] NOT NULL,
	[rcu] [varchar](100) NULL,
	[rcm] [datetime] NOT NULL,
	[luu] [varchar](100) NULL,
	[lcm] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[coupon_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_courier_partners]    Script Date: 30-06-2026 19:59:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_courier_partners](
	[courier_partner_id] [varchar](36) NOT NULL,
	[courier_name] [varchar](255) NOT NULL,
	[courier_code] [varchar](50) NOT NULL,
	[contact_email] [varchar](255) NULL,
	[contact_phone] [varchar](50) NULL,
	[base_rate] [decimal](18, 2) NULL,
	[rate_per_kg] [decimal](18, 2) NULL,
	[api_base_url] [varchar](500) NULL,
	[api_key] [varchar](255) NULL,
	[integration_status] [varchar](50) NULL,
	[isactive] [bit] NOT NULL,
	[isdeleted] [bit] NOT NULL,
	[rcu] [varchar](100) NULL,
	[rcm] [datetime] NOT NULL,
	[luu] [varchar](100) NULL,
	[lcm] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[courier_partner_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [ux_tbl_courier_partners_code] UNIQUE NONCLUSTERED 
(
	[courier_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_custom_appointments]    Script Date: 30-06-2026 19:59:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_custom_appointments](
	[appointment_id] [uniqueidentifier] NOT NULL,
	[user_id] [uniqueidentifier] NULL,
	[appointment_date_slot_id] [uniqueidentifier] NOT NULL,
	[appointment_time_slot_id] [uniqueidentifier] NOT NULL,
	[name] [varchar](255) NOT NULL,
	[city] [varchar](150) NULL,
	[preferred_delivery_date] [date] NULL,
	[occasion] [varchar](255) NULL,
	[appointment_status] [varchar](30) NOT NULL,
	[isrejected] [bit] NOT NULL,
	[appointment_notes] [varchar](500) NULL,
	[requested_at] [datetime] NOT NULL,
	[approved_at] [datetime] NULL,
	[rejected_at] [datetime] NULL,
	[cancelled_at] [datetime] NULL,
	[isactive] [bit] NOT NULL,
	[isdeleted] [bit] NOT NULL,
	[rcu] [varchar](100) NULL,
	[rcm] [datetime] NOT NULL,
	[luu] [varchar](100) NULL,
	[lcm] [datetime] NULL,
 CONSTRAINT [PK_tbl_custom_appointments] PRIMARY KEY CLUSTERED 
(
	[appointment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_customer_profiles]    Script Date: 30-06-2026 19:59:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_customer_profiles](
	[profile_id] [varchar](36) NOT NULL,
	[user_id] [varchar](36) NOT NULL,
	[date_of_birth] [date] NULL,
	[gender] [varchar](20) NULL,
	[gstin] [varchar](20) NULL,
	[company_name] [varchar](255) NULL,
	[preferred_language] [varchar](20) NULL,
	[preferred_currency] [varchar](10) NULL,
	[newsletter_subscription] [bit] NOT NULL,
	[sms_notifications] [bit] NOT NULL,
	[email_notifications] [bit] NOT NULL,
	[push_notifications] [bit] NOT NULL,
	[loyalty_points] [int] NOT NULL,
	[isactive] [bit] NOT NULL,
	[isdeleted] [bit] NOT NULL,
	[rcu] [varchar](100) NULL,
	[rcm] [datetime] NOT NULL,
	[luu] [varchar](100) NULL,
	[lcm] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[profile_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [ux_tbl_customer_profiles_user] UNIQUE NONCLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_discount_targets]    Script Date: 30-06-2026 19:59:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_discount_targets](
	[discount_target_id] [varchar](36) NOT NULL,
	[discount_id] [varchar](36) NOT NULL,
	[target_type] [varchar](50) NOT NULL,
	[target_id] [varchar](36) NULL,
	[isactive] [bit] NOT NULL,
	[isdeleted] [bit] NOT NULL,
	[rcu] [varchar](100) NULL,
	[rcm] [datetime] NOT NULL,
	[luu] [varchar](100) NULL,
	[lcm] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[discount_target_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_discounts]    Script Date: 30-06-2026 19:59:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_discounts](
	[discount_id] [varchar](36) NOT NULL,
	[discount_name] [varchar](255) NOT NULL,
	[description] [varchar](500) NULL,
	[discount_type] [varchar](20) NOT NULL,
	[discount_value] [decimal](18, 2) NOT NULL,
	[max_discount_amount] [decimal](18, 2) NULL,
	[usage_limit] [int] NULL,
	[usage_count] [int] NOT NULL,
	[start_date] [datetime] NOT NULL,
	[end_date] [datetime] NULL,
	[discount_priority] [int] NOT NULL,
	[isactive] [bit] NOT NULL,
	[isdeleted] [bit] NOT NULL,
	[rcu] [varchar](100) NULL,
	[rcm] [datetime] NOT NULL,
	[luu] [varchar](100) NULL,
	[lcm] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[discount_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_faqs]    Script Date: 30-06-2026 19:59:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_faqs](
	[faq_id] [varchar](36) NOT NULL,
	[question] [varchar](1000) NOT NULL,
	[answer] [varchar](max) NOT NULL,
	[display_order] [int] NOT NULL,
	[isactive] [bit] NOT NULL,
	[isdeleted] [bit] NOT NULL,
	[rcu] [varchar](100) NULL,
	[rcm] [datetime] NOT NULL,
	[luu] [varchar](100) NULL,
	[lcm] [datetime] NULL,
 CONSTRAINT [PK_tbl_faqs] PRIMARY KEY CLUSTERED 
(
	[faq_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_image_sliders]    Script Date: 30-06-2026 19:59:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_image_sliders](
	[image_slider_id] [varchar](36) NULL,
	[image_url] [varchar](max) NULL,
	[title] [varchar](max) NULL,
	[subtitle] [varchar](max) NULL,
	[button_text] [varchar](max) NULL,
	[redirect_link] [varchar](max) NULL,
	[display_order] [int] NULL,
	[auto_slide_interval_seconds] [int] NULL,
	[isactive] [bit] NULL,
	[isdeleted] [bit] NULL,
	[rcu] [varchar](max) NULL,
	[rcm] [datetime] NULL,
	[luu] [varchar](max) NULL,
	[lcm] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_invoices]    Script Date: 30-06-2026 19:59:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_invoices](
	[invoice_id] [varchar](36) NOT NULL,
	[order_id] [varchar](36) NOT NULL,
	[invoice_number] [varchar](50) NOT NULL,
	[invoice_date] [datetime] NOT NULL,
	[invoice_url] [varchar](1000) NULL,
	[notes] [varchar](500) NULL,
	[isactive] [bit] NOT NULL,
	[isdeleted] [bit] NOT NULL,
	[rcu] [varchar](100) NULL,
	[rcm] [datetime] NOT NULL,
	[luu] [varchar](100) NULL,
	[lcm] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[invoice_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_legal_page_header]    Script Date: 30-06-2026 19:59:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_legal_page_header](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[page_type] [nvarchar](50) NOT NULL,
	[page_title] [nvarchar](255) NOT NULL,
	[intro_text] [nvarchar](max) NOT NULL,
	[effective_date] [date] NULL,
	[version_number] [nvarchar](20) NULL,
	[is_active] [bit] NOT NULL,
	[updated_by] [nvarchar](100) NULL,
	[updated_at] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_legal_page_sections]    Script Date: 30-06-2026 19:59:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_legal_page_sections](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[page_type] [nvarchar](50) NOT NULL,
	[section_title] [nvarchar](255) NOT NULL,
	[section_order] [int] NOT NULL,
	[content] [nvarchar](max) NOT NULL,
	[is_active] [bit] NOT NULL,
	[created_by] [nvarchar](100) NULL,
	[created_at] [datetime] NOT NULL,
	[updated_by] [nvarchar](100) NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_menu_categories]    Script Date: 30-06-2026 19:59:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_menu_categories](
	[menu_category_id] [varchar](36) NOT NULL,
	[menu_category_name] [varchar](255) NOT NULL,
	[menu_category_slug] [varchar](255) NOT NULL,
	[display_order] [int] NOT NULL,
	[isactive] [bit] NOT NULL,
	[isdeleted] [bit] NOT NULL,
	[rcu] [varchar](100) NULL,
	[rcm] [datetime] NOT NULL,
	[luu] [varchar](100) NULL,
	[lcm] [datetime] NULL,
 CONSTRAINT [pk_tbl_menu_categories] PRIMARY KEY CLUSTERED 
(
	[menu_category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_menu_subcategories]    Script Date: 30-06-2026 19:59:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_menu_subcategories](
	[menu_subcategory_id] [varchar](36) NOT NULL,
	[menu_category_id] [varchar](36) NOT NULL,
	[menu_subcategory_name] [varchar](255) NOT NULL,
	[menu_subcategory_slug] [varchar](255) NOT NULL,
	[redirect_link] [varchar](1000) NULL,
	[display_order] [int] NOT NULL,
	[isactive] [bit] NOT NULL,
	[isdeleted] [bit] NOT NULL,
	[rcu] [varchar](100) NULL,
	[rcm] [datetime] NOT NULL,
	[luu] [varchar](100) NULL,
	[lcm] [datetime] NULL,
 CONSTRAINT [pk_tbl_menu_subcategories] PRIMARY KEY CLUSTERED 
(
	[menu_subcategory_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_menu_video]    Script Date: 30-06-2026 19:59:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_menu_video](
	[menu_video_id] [varchar](36) NULL,
	[video_type] [varchar](36) NULL,
	[video_url] [varchar](max) NULL,
	[poster_image_url] [varchar](max) NULL,
	[autoplay] [bit] NULL,
	[loop_video] [bit] NULL,
	[mute_default] [bit] NULL,
	[display_order] [int] NULL,
	[isactive] [bit] NULL,
	[isdeleted] [bit] NULL,
	[rcu] [varchar](max) NULL,
	[rcm] [datetime] NULL,
	[luu] [varchar](max) NULL,
	[lcm] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_newsletter_subscriptions]    Script Date: 30-06-2026 19:59:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_newsletter_subscriptions](
	[newsletter_subscription_id] [varchar](36) NOT NULL,
	[emailid] [varchar](255) NOT NULL,
	[user_id] [varchar](36) NULL,
	[subscribed_at] [datetime] NOT NULL,
	[unsubscribed_at] [datetime] NULL,
	[subscription_status] [varchar](20) NOT NULL,
	[isactive] [bit] NOT NULL,
	[isdeleted] [bit] NOT NULL,
	[rcu] [varchar](100) NULL,
	[rcm] [datetime] NOT NULL,
	[luu] [varchar](100) NULL,
	[lcm] [datetime] NULL,
 CONSTRAINT [PK_tbl_newsletter_subscriptions] PRIMARY KEY CLUSTERED 
(
	[newsletter_subscription_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_order_addresses]    Script Date: 30-06-2026 19:59:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_order_addresses](
	[order_address_id] [varchar](36) NOT NULL,
	[order_id] [varchar](36) NOT NULL,
	[address_type] [varchar](20) NOT NULL,
	[full_name] [varchar](255) NOT NULL,
	[mobile_number] [varchar](50) NOT NULL,
	[house_street] [varchar](500) NOT NULL,
	[city] [varchar](150) NOT NULL,
	[state] [varchar](150) NOT NULL,
	[pincode] [varchar](20) NOT NULL,
	[landmark] [varchar](255) NULL,
	[isactive] [bit] NOT NULL,
	[isdeleted] [bit] NOT NULL,
	[rcu] [varchar](100) NULL,
	[rcm] [datetime] NOT NULL,
	[luu] [varchar](100) NULL,
	[lcm] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[order_address_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_order_cancellations]    Script Date: 30-06-2026 19:59:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_order_cancellations](
	[order_cancellation_id] [varchar](36) NOT NULL,
	[order_id] [varchar](36) NOT NULL,
	[cancelled_by] [varchar](50) NULL,
	[cancelled_reason] [varchar](500) NULL,
	[cancelled_at] [datetime] NOT NULL,
	[isactive] [bit] NOT NULL,
	[isdeleted] [bit] NOT NULL,
	[rcu] [varchar](100) NULL,
	[rcm] [datetime] NOT NULL,
	[luu] [varchar](100) NULL,
	[lcm] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[order_cancellation_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_order_items]    Script Date: 30-06-2026 19:59:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_order_items](
	[order_item_id] [varchar](36) NOT NULL,
	[order_id] [varchar](36) NOT NULL,
	[product_id] [varchar](36) NOT NULL,
	[product_variant_id] [varchar](36) NULL,
	[product_name] [varchar](255) NOT NULL,
	[sku] [varchar](100) NULL,
	[qty] [int] NOT NULL,
	[unit_price] [decimal](18, 2) NULL,
	[total_price] [decimal](18, 2) NULL,
	[isactive] [bit] NOT NULL,
	[isdeleted] [bit] NOT NULL,
	[rcu] [varchar](100) NULL,
	[rcm] [datetime] NOT NULL,
	[luu] [varchar](100) NULL,
	[lcm] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[order_item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_order_promotions]    Script Date: 30-06-2026 19:59:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_order_promotions](
	[order_promotion_id] [varchar](36) NOT NULL,
	[order_id] [varchar](36) NOT NULL,
	[promotion_type] [varchar](50) NOT NULL,
	[promotion_id] [varchar](36) NULL,
	[promotion_name] [varchar](255) NULL,
	[discount_amount] [decimal](18, 2) NOT NULL,
	[discount_type] [varchar](20) NULL,
	[discount_value] [decimal](18, 2) NULL,
	[applied_at] [datetime] NOT NULL,
	[isactive] [bit] NOT NULL,
	[isdeleted] [bit] NOT NULL,
	[rcu] [varchar](100) NULL,
	[rcm] [datetime] NOT NULL,
	[luu] [varchar](100) NULL,
	[lcm] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[order_promotion_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_order_status_history]    Script Date: 30-06-2026 19:59:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_order_status_history](
	[order_status_history_id] [varchar](36) NOT NULL,
	[order_id] [varchar](36) NOT NULL,
	[order_status_id] [varchar](36) NOT NULL,
	[orderstatus] [varchar](50) NOT NULL,
	[orderstatusby] [varchar](255) NULL,
	[orderstatustime] [datetime] NOT NULL,
	[remarks] [varchar](500) NULL,
	[isactive] [bit] NOT NULL,
	[isdeleted] [bit] NOT NULL,
	[rcu] [varchar](100) NULL,
	[rcm] [datetime] NOT NULL,
	[luu] [varchar](100) NULL,
	[lcm] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[order_status_history_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_order_status_master]    Script Date: 30-06-2026 19:59:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_order_status_master](
	[order_status_id] [varchar](36) NOT NULL,
	[status_name] [varchar](100) NOT NULL,
	[status_code] [varchar](50) NOT NULL,
	[display_order] [int] NOT NULL,
	[iscancelled_status] [bit] NOT NULL,
	[isactive] [bit] NOT NULL,
	[isdeleted] [bit] NOT NULL,
	[rcu] [varchar](100) NULL,
	[rcm] [datetime] NOT NULL,
	[luu] [varchar](100) NULL,
	[lcm] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[order_status_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [ux_tbl_order_status_master_status_code] UNIQUE NONCLUSTERED 
(
	[status_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_orders]    Script Date: 30-06-2026 19:59:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_orders](
	[order_id] [varchar](36) NOT NULL,
	[user_id] [varchar](36) NOT NULL,
	[cart_id] [varchar](36) NULL,
	[order_number] [varchar](50) NOT NULL,
	[order_status_id] [varchar](36) NOT NULL,
	[orderstatus] [varchar](50) NULL,
	[subtotal] [decimal](18, 2) NULL,
	[discount_amount] [decimal](18, 2) NULL,
	[shipping_amount] [decimal](18, 2) NULL,
	[tax_amount] [decimal](18, 2) NULL,
	[total_amount] [decimal](18, 2) NULL,
	[payment_status] [varchar](50) NULL,
	[notes] [varchar](500) NULL,
	[placed_at] [datetime] NOT NULL,
	[cancelled_at] [datetime] NULL,
	[isactive] [bit] NOT NULL,
	[isdeleted] [bit] NOT NULL,
	[rcu] [varchar](100) NULL,
	[rcm] [datetime] NOT NULL,
	[luu] [varchar](100) NULL,
	[lcm] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_payments]    Script Date: 30-06-2026 19:59:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_payments](
	[payment_id] [varchar](36) NOT NULL,
	[order_id] [varchar](36) NOT NULL,
	[user_id] [varchar](36) NOT NULL,
	[payment_provider] [varchar](50) NOT NULL,
	[payment_method_type] [varchar](20) NULL,
	[payment_status] [varchar](50) NOT NULL,
	[amount] [decimal](18, 2) NOT NULL,
	[currency_code] [varchar](10) NOT NULL,
	[razorpay_order_id] [varchar](100) NULL,
	[razorpay_payment_id] [varchar](100) NULL,
	[razorpay_signature] [varchar](255) NULL,
	[paid_at] [datetime] NULL,
	[failed_at] [datetime] NULL,
	[refund_amount] [decimal](18, 2) NULL,
	[refunded_at] [datetime] NULL,
	[notes] [varchar](500) NULL,
	[isactive] [bit] NOT NULL,
	[isdeleted] [bit] NOT NULL,
	[rcu] [varchar](100) NULL,
	[rcm] [datetime] NOT NULL,
	[luu] [varchar](100) NULL,
	[lcm] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[payment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_product_attribute_values]    Script Date: 30-06-2026 19:59:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_product_attribute_values](
	[product_attribute_value_id] [varchar](36) NOT NULL,
	[product_id] [varchar](36) NOT NULL,
	[product_variant_id] [varchar](36) NULL,
	[attribute_id] [varchar](36) NOT NULL,
	[attribute_value] [varchar](1000) NOT NULL,
	[isactive] [bit] NOT NULL,
	[isdeleted] [bit] NOT NULL,
	[rcu] [varchar](100) NULL,
	[rcm] [datetime] NOT NULL,
	[luu] [varchar](100) NULL,
	[lcm] [datetime] NULL,
 CONSTRAINT [pk_tbl_product_attribute_values] PRIMARY KEY CLUSTERED 
(
	[product_attribute_value_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_product_media]    Script Date: 30-06-2026 19:59:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_product_media](
	[product_media_id] [varchar](36) NOT NULL,
	[product_id] [varchar](36) NOT NULL,
	[product_variant_id] [varchar](36) NULL,
	[media_type] [varchar](20) NOT NULL,
	[media_url] [varchar](1000) NOT NULL,
	[alt_text] [varchar](255) NULL,
	[display_order] [int] NOT NULL,
	[isprimary] [bit] NOT NULL,
	[isactive] [bit] NOT NULL,
	[isdeleted] [bit] NOT NULL,
	[rcu] [varchar](100) NULL,
	[rcm] [datetime] NOT NULL,
	[luu] [varchar](100) NULL,
	[lcm] [datetime] NULL,
 CONSTRAINT [pk_tbl_product_media] PRIMARY KEY CLUSTERED 
(
	[product_media_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_product_rating_summary]    Script Date: 30-06-2026 19:59:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_product_rating_summary](
	[product_id] [varchar](36) NOT NULL,
	[avg_rating] [decimal](3, 2) NULL,
	[total_reviews] [int] NULL,
	[rating_1_count] [int] NULL,
	[rating_2_count] [int] NULL,
	[rating_3_count] [int] NULL,
	[rating_4_count] [int] NULL,
	[rating_5_count] [int] NULL,
	[rcu] [varchar](100) NULL,
	[rcm] [datetime] NULL,
	[luu] [varchar](100) NULL,
	[lcm] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_product_reviews]    Script Date: 30-06-2026 19:59:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_product_reviews](
	[product_review_id] [varchar](36) NOT NULL,
	[product_id] [varchar](36) NOT NULL,
	[user_id] [varchar](36) NOT NULL,
	[order_item_id] [varchar](36) NULL,
	[rating] [int] NOT NULL,
	[review_title] [varchar](255) NULL,
	[review_text] [varchar](max) NULL,
	[helpful_count] [int] NOT NULL,
	[unhelpful_count] [int] NOT NULL,
	[is_verified_purchase] [bit] NOT NULL,
	[review_status] [varchar](50) NOT NULL,
	[reviewed_date] [datetime] NOT NULL,
	[approved_date] [datetime] NULL,
	[isactive] [bit] NOT NULL,
	[isdeleted] [bit] NOT NULL,
	[rcu] [varchar](100) NULL,
	[rcm] [datetime] NOT NULL,
	[luu] [varchar](100) NULL,
	[lcm] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[product_review_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_product_seo]    Script Date: 30-06-2026 19:59:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_product_seo](
	[product_seo_id] [varchar](36) NOT NULL,
	[product_id] [varchar](36) NOT NULL,
	[seo_title] [varchar](255) NULL,
	[seo_description] [varchar](500) NULL,
	[seo_keywords] [varchar](500) NULL,
	[og_image_url] [varchar](1000) NULL,
	[isactive] [bit] NOT NULL,
	[isdeleted] [bit] NOT NULL,
	[rcu] [varchar](100) NULL,
	[rcm] [datetime] NOT NULL,
	[luu] [varchar](100) NULL,
	[lcm] [datetime] NULL,
 CONSTRAINT [pk_tbl_product_seo] PRIMARY KEY CLUSTERED 
(
	[product_seo_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_product_variants]    Script Date: 30-06-2026 19:59:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_product_variants](
	[product_variant_id] [varchar](36) NOT NULL,
	[product_id] [varchar](36) NOT NULL,
	[sku] [varchar](100) NOT NULL,
	[variant_name] [varchar](255) NULL,
	[price] [decimal](18, 2) NULL,
	[stock_qty] [int] NOT NULL,
	[size_id] [varchar](36) NULL,
	[cloth_type_id] [varchar](36) NULL,
	[isdefault] [bit] NOT NULL,
	[isactive] [bit] NOT NULL,
	[isdeleted] [bit] NOT NULL,
	[rcu] [varchar](100) NULL,
	[rcm] [datetime] NOT NULL,
	[luu] [varchar](100) NULL,
	[lcm] [datetime] NULL,
 CONSTRAINT [pk_tbl_product_variants] PRIMARY KEY CLUSTERED 
(
	[product_variant_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_products]    Script Date: 30-06-2026 19:59:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_products](
	[product_id] [varchar](36) NOT NULL,
	[product_name] [varchar](255) NOT NULL,
	[product_slug] [varchar](255) NOT NULL,
	[short_description] [varchar](500) NULL,
	[description] [varchar](max) NULL,
	[base_price] [decimal](18, 2) NULL,
	[currency_code] [varchar](10) NOT NULL,
	[isactive] [bit] NOT NULL,
	[isdeleted] [bit] NOT NULL,
	[rcu] [varchar](100) NULL,
	[rcm] [datetime] NOT NULL,
	[luu] [varchar](100) NULL,
	[lcm] [datetime] NULL,
 CONSTRAINT [pk_tbl_products] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_profiles]    Script Date: 30-06-2026 19:59:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_profiles](
	[profile_id] [varchar](36) NOT NULL,
	[user_id] [varchar](36) NOT NULL,
	[fullname] [varchar](255) NOT NULL,
	[emailid] [varchar](255) NOT NULL,
	[mobile_number] [varchar](50) NULL,
	[gender] [varchar](20) NULL,
	[dateofbirth] [date] NULL,
	[profile_url] [varchar](1000) NULL,
	[lastloginat] [datetime] NULL,
	[isactive] [bit] NOT NULL,
	[isdeleted] [bit] NOT NULL,
	[rcu] [varchar](100) NULL,
	[rcm] [datetime] NOT NULL,
	[luu] [varchar](100) NULL,
	[lcm] [datetime] NULL,
 CONSTRAINT [pk_tbl_profiles] PRIMARY KEY CLUSTERED 
(
	[profile_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_refunds]    Script Date: 30-06-2026 19:59:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_refunds](
	[refund_id] [varchar](36) NOT NULL,
	[return_id] [varchar](36) NOT NULL,
	[payment_id] [varchar](36) NULL,
	[order_id] [varchar](36) NOT NULL,
	[user_id] [varchar](36) NOT NULL,
	[refund_type] [varchar](50) NOT NULL,
	[refund_status] [varchar](50) NOT NULL,
	[refund_amount] [decimal](18, 2) NOT NULL,
	[refund_method] [varchar](50) NOT NULL,
	[transaction_id] [varchar](100) NULL,
	[initiated_date] [datetime] NOT NULL,
	[processed_date] [datetime] NULL,
	[completed_date] [datetime] NULL,
	[failure_reason] [varchar](500) NULL,
	[notes] [varchar](500) NULL,
	[isactive] [bit] NOT NULL,
	[isdeleted] [bit] NOT NULL,
	[rcu] [varchar](100) NULL,
	[rcm] [datetime] NOT NULL,
	[luu] [varchar](100) NULL,
	[lcm] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[refund_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_returns]    Script Date: 30-06-2026 19:59:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_returns](
	[return_id] [varchar](36) NOT NULL,
	[order_id] [varchar](36) NOT NULL,
	[user_id] [varchar](36) NOT NULL,
	[return_type] [varchar](50) NOT NULL,
	[return_status] [varchar](50) NOT NULL,
	[return_reason] [varchar](500) NULL,
	[return_reason_code] [varchar](50) NULL,
	[return_items_count] [int] NOT NULL,
	[return_amount] [decimal](18, 2) NULL,
	[requested_date] [datetime] NOT NULL,
	[approved_date] [datetime] NULL,
	[received_date] [datetime] NULL,
	[completed_date] [datetime] NULL,
	[rma_number] [varchar](100) NULL,
	[notes] [varchar](500) NULL,
	[isactive] [bit] NOT NULL,
	[isdeleted] [bit] NOT NULL,
	[rcu] [varchar](100) NULL,
	[rcm] [datetime] NOT NULL,
	[luu] [varchar](100) NULL,
	[lcm] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[return_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_review_media]    Script Date: 30-06-2026 19:59:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_review_media](
	[media_id] [varchar](36) NOT NULL,
	[review_id] [varchar](36) NOT NULL,
	[media_type] [varchar](20) NOT NULL,
	[media_url] [varchar](500) NOT NULL,
	[isactive] [bit] NULL,
	[isdeleted] [bit] NULL,
	[rcu] [varchar](100) NULL,
	[rcm] [datetime] NULL,
	[luu] [varchar](100) NULL,
	[lcm] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[media_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_review_responses]    Script Date: 30-06-2026 19:59:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_review_responses](
	[review_response_id] [varchar](36) NOT NULL,
	[product_review_id] [varchar](36) NOT NULL,
	[responder_user_id] [varchar](36) NOT NULL,
	[response_text] [varchar](max) NULL,
	[response_date] [datetime] NOT NULL,
	[isactive] [bit] NOT NULL,
	[isdeleted] [bit] NOT NULL,
	[rcu] [varchar](100) NULL,
	[rcm] [datetime] NOT NULL,
	[luu] [varchar](100) NULL,
	[lcm] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[review_response_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_review_votes]    Script Date: 30-06-2026 19:59:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_review_votes](
	[vote_id] [varchar](36) NOT NULL,
	[review_id] [varchar](36) NOT NULL,
	[user_id] [varchar](36) NOT NULL,
	[is_helpful] [bit] NOT NULL,
	[isactive] [bit] NULL,
	[isdeleted] [bit] NULL,
	[rcu] [varchar](100) NULL,
	[rcm] [datetime] NULL,
	[luu] [varchar](100) NULL,
	[lcm] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[vote_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_review_vote] UNIQUE NONCLUSTERED 
(
	[review_id] ASC,
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_reviews]    Script Date: 30-06-2026 19:59:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_reviews](
	[review_id] [varchar](36) NOT NULL,
	[product_id] [varchar](36) NOT NULL,
	[variant_id] [varchar](36) NULL,
	[user_id] [varchar](36) NOT NULL,
	[rating] [int] NOT NULL,
	[review_title] [varchar](255) NULL,
	[review_text] [varchar](max) NULL,
	[is_verified] [bit] NULL,
	[is_approved] [bit] NULL,
	[isactive] [bit] NULL,
	[isdeleted] [bit] NULL,
	[rcu] [varchar](100) NULL,
	[rcm] [datetime] NULL,
	[luu] [varchar](100) NULL,
	[lcm] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[review_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_roles]    Script Date: 30-06-2026 19:59:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_roles](
	[role_id] [varchar](36) NOT NULL,
	[role_name] [varchar](100) NOT NULL,
	[role_code] [varchar](50) NOT NULL,
	[description] [varchar](255) NULL,
	[isactive] [bit] NOT NULL,
	[isdeleted] [bit] NOT NULL,
	[rcu] [varchar](100) NULL,
	[rcm] [datetime] NOT NULL,
	[luu] [varchar](100) NULL,
	[lcm] [datetime] NULL,
 CONSTRAINT [pk_tbl_roles] PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_running_bar_items]    Script Date: 30-06-2026 19:59:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_running_bar_items](
	[running_bar_item_id] [varchar](36) NOT NULL,
	[running_bar_id] [varchar](36) NOT NULL,
	[itemsdata] [varchar](max) NOT NULL,
	[duration_seconds] [int] NOT NULL,
	[display_order] [int] NOT NULL,
	[isactive] [bit] NOT NULL,
	[isdeleted] [bit] NOT NULL,
	[rcu] [varchar](100) NULL,
	[rcm] [datetime] NOT NULL,
	[luu] [varchar](100) NULL,
	[lcm] [datetime] NULL,
 CONSTRAINT [pk_tbl_running_bar_items] PRIMARY KEY CLUSTERED 
(
	[running_bar_item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_running_bars]    Script Date: 30-06-2026 19:59:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_running_bars](
	[running_bar_id] [varchar](36) NOT NULL,
	[running_bar_name] [varchar](255) NOT NULL,
	[isactive] [bit] NOT NULL,
	[isdeleted] [bit] NOT NULL,
	[rcu] [varchar](100) NULL,
	[rcm] [datetime] NOT NULL,
	[luu] [varchar](100) NULL,
	[lcm] [datetime] NULL,
 CONSTRAINT [pk_tbl_running_bars] PRIMARY KEY CLUSTERED 
(
	[running_bar_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_settings]    Script Date: 30-06-2026 19:59:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_settings](
	[setting_id] [varchar](36) NOT NULL,
	[site_name] [varchar](255) NULL,
	[header_logo_url] [varchar](1000) NULL,
	[brand_logo_url] [varchar](1000) NULL,
	[footer_logo_url] [varchar](1000) NULL,
	[brand_description] [varchar](max) NULL,
	[newsletter_title] [varchar](255) NULL,
	[newsletter_description] [varchar](max) NULL,
	[ismaintenance_mode] [bit] NOT NULL,
	[isactive] [bit] NOT NULL,
	[isdeleted] [bit] NOT NULL,
	[rcu] [varchar](100) NULL,
	[rcm] [datetime] NOT NULL,
	[luu] [varchar](100) NULL,
	[lcm] [datetime] NULL,
 CONSTRAINT [PK_tbl_settings] PRIMARY KEY CLUSTERED 
(
	[setting_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_shipment_events]    Script Date: 30-06-2026 19:59:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_shipment_events](
	[shipment_event_id] [varchar](36) NOT NULL,
	[shipment_id] [varchar](36) NOT NULL,
	[event_status] [varchar](50) NOT NULL,
	[event_location] [varchar](255) NULL,
	[event_description] [varchar](500) NULL,
	[event_timestamp] [datetime] NOT NULL,
	[event_source] [varchar](50) NULL,
	[isactive] [bit] NOT NULL,
	[isdeleted] [bit] NOT NULL,
	[rcu] [varchar](100) NULL,
	[rcm] [datetime] NOT NULL,
	[luu] [varchar](100) NULL,
	[lcm] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[shipment_event_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_shipments]    Script Date: 30-06-2026 19:59:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_shipments](
	[shipment_id] [varchar](36) NOT NULL,
	[order_id] [varchar](36) NOT NULL,
	[courier_partner_id] [varchar](36) NOT NULL,
	[tracking_number] [varchar](100) NULL,
	[awb_number] [varchar](100) NULL,
	[shipment_status] [varchar](50) NOT NULL,
	[weight] [decimal](18, 2) NULL,
	[dimensions] [varchar](100) NULL,
	[shipped_date] [datetime] NULL,
	[estimated_delivery] [datetime] NULL,
	[actual_delivery_date] [datetime] NULL,
	[pickup_address_id] [varchar](36) NULL,
	[drop_address_id] [varchar](36) NULL,
	[shipping_cost] [decimal](18, 2) NULL,
	[notes] [varchar](500) NULL,
	[isactive] [bit] NOT NULL,
	[isdeleted] [bit] NOT NULL,
	[rcu] [varchar](100) NULL,
	[rcm] [datetime] NOT NULL,
	[luu] [varchar](100) NULL,
	[lcm] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[shipment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_sizes]    Script Date: 30-06-2026 19:59:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_sizes](
	[size_id] [varchar](36) NOT NULL,
	[size_name] [varchar](50) NOT NULL,
	[size_type] [varchar](20) NOT NULL,
	[display_order] [int] NOT NULL,
	[isactive] [bit] NOT NULL,
	[isdeleted] [bit] NOT NULL,
	[rcu] [varchar](100) NULL,
	[rcm] [datetime] NOT NULL,
	[luu] [varchar](100) NULL,
	[lcm] [datetime] NULL,
 CONSTRAINT [pk_tbl_sizes] PRIMARY KEY CLUSTERED 
(
	[size_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_spotlight_entries]    Script Date: 30-06-2026 19:59:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_spotlight_entries](
	[spotlight_entry_id] [varchar](36) NULL,
	[title] [varchar](max) NULL,
	[subtitle] [varchar](max) NULL,
	[description] [varchar](max) NULL,
	[redirect_link] [varchar](max) NULL,
	[cta_text] [varchar](100) NULL,
	[display_order] [int] NULL,
	[isactive] [bit] NULL,
	[isdeleted] [bit] NULL,
	[rcu] [varchar](100) NULL,
	[rcm] [datetime] NULL,
	[luu] [varchar](100) NULL,
	[lcm] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_spotlight_media]    Script Date: 30-06-2026 19:59:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_spotlight_media](
	[spotlight_media_id] [varchar](36) NULL,
	[spotlight_entry_id] [varchar](36) NULL,
	[media_type] [varchar](20) NULL,
	[media_url] [varchar](max) NULL,
	[alt_text] [varchar](max) NULL,
	[display_order] [int] NULL,
	[isprimary] [bit] NULL,
	[isactive] [bit] NULL,
	[isdeleted] [bit] NULL,
	[rcu] [varchar](max) NULL,
	[rcm] [datetime] NULL,
	[luu] [varchar](max) NULL,
	[lcm] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_style_collection_media]    Script Date: 30-06-2026 19:59:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_style_collection_media](
	[style_collection_media_id] [varchar](36) NULL,
	[style_collection_id] [varchar](36) NULL,
	[media_type] [varchar](20) NULL,
	[media_url] [varchar](max) NULL,
	[alt_text] [varchar](max) NULL,
	[display_order] [int] NULL,
	[isprimary] [bit] NULL,
	[isactive] [bit] NULL,
	[isdeleted] [bit] NULL,
	[rcu] [varchar](max) NULL,
	[rcm] [datetime] NULL,
	[luu] [varchar](max) NULL,
	[lcm] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_style_collections]    Script Date: 30-06-2026 19:59:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_style_collections](
	[style_collection_id] [varchar](36) NULL,
	[collection_name] [varchar](max) NULL,
	[collection_slug] [varchar](max) NULL,
	[description] [varchar](max) NULL,
	[redirect_link] [varchar](max) NULL,
	[cta_text] [varchar](max) NULL,
	[display_order] [int] NULL,
	[isactive] [bit] NULL,
	[isdeleted] [bit] NULL,
	[rcu] [varchar](max) NULL,
	[rcm] [datetime] NULL,
	[luu] [varchar](max) NULL,
	[lcm] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_support_contacts]    Script Date: 30-06-2026 19:59:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_support_contacts](
	[support_contact_id] [varchar](36) NOT NULL,
	[contact_title] [varchar](255) NULL,
	[contact_name] [varchar](255) NULL,
	[contact_email] [varchar](255) NULL,
	[contact_number] [varchar](50) NULL,
	[whatsapp_number] [varchar](50) NULL,
	[address_text] [varchar](500) NULL,
	[working_hours] [varchar](255) NULL,
	[isactive] [bit] NOT NULL,
	[isdeleted] [bit] NOT NULL,
	[rcu] [varchar](100) NULL,
	[rcm] [datetime] NOT NULL,
	[luu] [varchar](100) NULL,
	[lcm] [datetime] NULL,
 CONSTRAINT [PK_tbl_support_contacts] PRIMARY KEY CLUSTERED 
(
	[support_contact_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_user_roles]    Script Date: 30-06-2026 19:59:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_user_roles](
	[user_role_id] [varchar](36) NOT NULL,
	[user_id] [varchar](36) NOT NULL,
	[role_id] [varchar](36) NOT NULL,
	[assigned_at] [datetime] NOT NULL,
	[isactive] [bit] NOT NULL,
	[isdeleted] [bit] NOT NULL,
	[rcu] [varchar](100) NULL,
	[rcm] [datetime] NOT NULL,
	[luu] [varchar](100) NULL,
	[lcm] [datetime] NULL,
 CONSTRAINT [pk_tbl_user_roles] PRIMARY KEY CLUSTERED 
(
	[user_role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_users]    Script Date: 30-06-2026 19:59:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_users](
	[user_id] [varchar](36) NOT NULL,
	[email] [varchar](255) NOT NULL,
	[phone_number] [varchar](20) NULL,
	[first_name] [varchar](100) NULL,
	[last_name] [varchar](100) NULL,
	[full_name] [varchar](255) NULL,
	[password_hash] [varchar](500) NULL,
	[password_salt] [varchar](500) NULL,
	[profile_picture_url] [varchar](1000) NULL,
	[email_verified] [bit] NOT NULL,
	[email_verified_at] [datetime] NULL,
	[phone_verified] [bit] NOT NULL,
	[phone_verified_at] [datetime] NULL,
	[last_login] [datetime] NULL,
	[isactive] [bit] NOT NULL,
	[isdeleted] [bit] NOT NULL,
	[rcu] [varchar](100) NULL,
	[rcm] [datetime] NOT NULL,
	[luu] [varchar](100) NULL,
	[lcm] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [ux_tbl_users_email] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_variant_rating_summary]    Script Date: 30-06-2026 19:59:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_variant_rating_summary](
	[variant_id] [varchar](36) NOT NULL,
	[avg_rating] [decimal](3, 2) NULL,
	[total_reviews] [int] NULL,
	[rcu] [varchar](100) NULL,
	[rcm] [datetime] NULL,
	[luu] [varchar](100) NULL,
	[lcm] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[variant_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_wishlist_items]    Script Date: 30-06-2026 19:59:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_wishlist_items](
	[wishlist_item_id] [varchar](36) NOT NULL,
	[wishlist_id] [varchar](36) NOT NULL,
	[product_id] [varchar](36) NOT NULL,
	[product_variant_id] [varchar](36) NULL,
	[added_at] [datetime] NOT NULL,
	[isactive] [bit] NOT NULL,
	[isdeleted] [bit] NOT NULL,
	[rcu] [varchar](100) NULL,
	[rcm] [datetime] NOT NULL,
	[luu] [varchar](100) NULL,
	[lcm] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[wishlist_item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_wishlists]    Script Date: 30-06-2026 19:59:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_wishlists](
	[wishlist_id] [varchar](36) NOT NULL,
	[user_id] [varchar](36) NOT NULL,
	[wishlist_name] [varchar](255) NOT NULL,
	[isactive] [bit] NOT NULL,
	[isdeleted] [bit] NOT NULL,
	[rcu] [varchar](100) NULL,
	[rcm] [datetime] NOT NULL,
	[luu] [varchar](100) NULL,
	[lcm] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[wishlist_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_tbl_addresses_user]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_addresses_user] ON [dbo].[tbl_addresses]
(
	[user_id] ASC,
	[isdefault] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UX_tbl_appointment_date_slots_slot_date]    Script Date: 30-06-2026 19:59:29 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UX_tbl_appointment_date_slots_slot_date] ON [dbo].[tbl_appointment_date_slots]
(
	[slot_date] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_tbl_appointment_slot_blocks_date]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [IX_tbl_appointment_slot_blocks_date] ON [dbo].[tbl_appointment_slot_blocks]
(
	[appointment_date_slot_id] ASC,
	[isdeleted] ASC
)
INCLUDE([block_start_time],[block_end_time],[block_reason],[blocked_by]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_tbl_appointment_time_slots_date_fetch]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [IX_tbl_appointment_time_slots_date_fetch] ON [dbo].[tbl_appointment_time_slots]
(
	[appointment_date_slot_id] ASC,
	[isavailable] ASC,
	[isbooked] ASC,
	[isdeleted] ASC
)
INCLUDE([slot_start_time],[slot_end_time],[display_order],[appointment_id],[booked_at]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UX_tbl_appointment_time_slots_unique]    Script Date: 30-06-2026 19:59:29 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UX_tbl_appointment_time_slots_unique] ON [dbo].[tbl_appointment_time_slots]
(
	[appointment_date_slot_id] ASC,
	[slot_start_time] ASC,
	[slot_end_time] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [ix_tbl_attributes_active_order]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_attributes_active_order] ON [dbo].[tbl_attributes]
(
	[isactive] ASC,
	[isdeleted] ASC,
	[display_order] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ux_tbl_attributes_slug]    Script Date: 30-06-2026 19:59:29 ******/
CREATE UNIQUE NONCLUSTERED INDEX [ux_tbl_attributes_slug] ON [dbo].[tbl_attributes]
(
	[attribute_slug] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [ix_tbl_care_instructions_active_order]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_care_instructions_active_order] ON [dbo].[tbl_care_instructions]
(
	[isactive] ASC,
	[isdeleted] ASC,
	[display_order] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_tbl_cart_items_cart]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_cart_items_cart] ON [dbo].[tbl_cart_items]
(
	[cart_id] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_tbl_cart_items_product]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_cart_items_product] ON [dbo].[tbl_cart_items]
(
	[product_id] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_tbl_cart_items_variant]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_cart_items_variant] ON [dbo].[tbl_cart_items]
(
	[product_variant_id] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ux_tbl_cart_items_unique]    Script Date: 30-06-2026 19:59:29 ******/
CREATE UNIQUE NONCLUSTERED INDEX [ux_tbl_cart_items_unique] ON [dbo].[tbl_cart_items]
(
	[cart_id] ASC,
	[product_id] ASC,
	[product_variant_id] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_tbl_carts_user]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_carts_user] ON [dbo].[tbl_carts]
(
	[user_id] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_tbl_carts_user_status]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_carts_user_status] ON [dbo].[tbl_carts]
(
	[user_id] ASC,
	[cart_status] ASC
)
WHERE ([isdeleted]=(0) AND [cart_status]='active')
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_tbl_ctci_type_order]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_ctci_type_order] ON [dbo].[tbl_cloth_type_care_instructions]
(
	[cloth_type_id] ASC,
	[display_order] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ux_tbl_ctci_unique]    Script Date: 30-06-2026 19:59:29 ******/
CREATE UNIQUE NONCLUSTERED INDEX [ux_tbl_ctci_unique] ON [dbo].[tbl_cloth_type_care_instructions]
(
	[cloth_type_id] ASC,
	[care_instruction_id] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [ix_tbl_cloth_types_active_order]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_cloth_types_active_order] ON [dbo].[tbl_cloth_types]
(
	[isactive] ASC,
	[isdeleted] ASC,
	[display_order] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ux_tbl_cloth_types_slug]    Script Date: 30-06-2026 19:59:29 ******/
CREATE UNIQUE NONCLUSTERED INDEX [ux_tbl_cloth_types_slug] ON [dbo].[tbl_cloth_types]
(
	[cloth_type_slug] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_tbl_coupon_usage_coupon]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_coupon_usage_coupon] ON [dbo].[tbl_coupon_usage]
(
	[coupon_id] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [ix_tbl_coupon_usage_date]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_coupon_usage_date] ON [dbo].[tbl_coupon_usage]
(
	[used_at] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_tbl_coupon_usage_order]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_coupon_usage_order] ON [dbo].[tbl_coupon_usage]
(
	[order_id] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_tbl_coupon_usage_user]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_coupon_usage_user] ON [dbo].[tbl_coupon_usage]
(
	[user_id] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [ix_tbl_coupons_dates]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_coupons_dates] ON [dbo].[tbl_coupons]
(
	[start_date] ASC,
	[end_date] ASC
)
WHERE ([isdeleted]=(0) AND [isactive]=(1))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ux_tbl_coupons_code]    Script Date: 30-06-2026 19:59:29 ******/
CREATE UNIQUE NONCLUSTERED INDEX [ux_tbl_coupons_code] ON [dbo].[tbl_coupons]
(
	[coupon_code] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_tbl_courier_partners_code]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_courier_partners_code] ON [dbo].[tbl_courier_partners]
(
	[courier_code] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_tbl_custom_appointments_user_time]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [IX_tbl_custom_appointments_user_time] ON [dbo].[tbl_custom_appointments]
(
	[user_id] ASC,
	[requested_at] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UX_tbl_custom_appointments_time_slot]    Script Date: 30-06-2026 19:59:29 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UX_tbl_custom_appointments_time_slot] ON [dbo].[tbl_custom_appointments]
(
	[appointment_time_slot_id] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_tbl_discount_targets_discount]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_discount_targets_discount] ON [dbo].[tbl_discount_targets]
(
	[discount_id] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_tbl_discount_targets_target]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_discount_targets_target] ON [dbo].[tbl_discount_targets]
(
	[target_type] ASC,
	[target_id] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [ix_tbl_discounts_dates_priority]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_discounts_dates_priority] ON [dbo].[tbl_discounts]
(
	[start_date] ASC,
	[end_date] ASC,
	[discount_priority] ASC
)
WHERE ([isdeleted]=(0) AND [isactive]=(1))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [ix_tbl_faqs_active_order]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_faqs_active_order] ON [dbo].[tbl_faqs]
(
	[isactive] ASC,
	[isdeleted] ASC,
	[display_order] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_tbl_invoices_order]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_invoices_order] ON [dbo].[tbl_invoices]
(
	[order_id] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ux_tbl_invoices_invoice_number]    Script Date: 30-06-2026 19:59:29 ******/
CREATE UNIQUE NONCLUSTERED INDEX [ux_tbl_invoices_invoice_number] ON [dbo].[tbl_invoices]
(
	[invoice_number] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [ix_tbl_menu_categories_active_order]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_menu_categories_active_order] ON [dbo].[tbl_menu_categories]
(
	[isactive] ASC,
	[isdeleted] ASC,
	[display_order] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [ix_tbl_menu_categories_order]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_menu_categories_order] ON [dbo].[tbl_menu_categories]
(
	[display_order] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ux_tbl_menu_categories_slug]    Script Date: 30-06-2026 19:59:29 ******/
CREATE UNIQUE NONCLUSTERED INDEX [ux_tbl_menu_categories_slug] ON [dbo].[tbl_menu_categories]
(
	[menu_category_slug] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_tbl_menu_subcategories_active_order]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_menu_subcategories_active_order] ON [dbo].[tbl_menu_subcategories]
(
	[menu_category_id] ASC,
	[isactive] ASC,
	[isdeleted] ASC,
	[display_order] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_tbl_menu_subcategories_category_order]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_menu_subcategories_category_order] ON [dbo].[tbl_menu_subcategories]
(
	[menu_category_id] ASC,
	[display_order] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ux_tbl_menu_subcategories_slug]    Script Date: 30-06-2026 19:59:29 ******/
CREATE UNIQUE NONCLUSTERED INDEX [ux_tbl_menu_subcategories_slug] ON [dbo].[tbl_menu_subcategories]
(
	[menu_subcategory_slug] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_tbl_newsletter_subscriptions_status]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_newsletter_subscriptions_status] ON [dbo].[tbl_newsletter_subscriptions]
(
	[subscription_status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [ix_tbl_newsletter_subscriptions_subscribed_at]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_newsletter_subscriptions_subscribed_at] ON [dbo].[tbl_newsletter_subscriptions]
(
	[subscribed_at] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_tbl_newsletter_subscriptions_user]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_newsletter_subscriptions_user] ON [dbo].[tbl_newsletter_subscriptions]
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ux_tbl_newsletter_subscriptions_email]    Script Date: 30-06-2026 19:59:29 ******/
CREATE UNIQUE NONCLUSTERED INDEX [ux_tbl_newsletter_subscriptions_email] ON [dbo].[tbl_newsletter_subscriptions]
(
	[emailid] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_tbl_order_addresses_order_type]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_order_addresses_order_type] ON [dbo].[tbl_order_addresses]
(
	[order_id] ASC,
	[address_type] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_tbl_order_cancellations_order]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_order_cancellations_order] ON [dbo].[tbl_order_cancellations]
(
	[order_id] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [ix_tbl_order_cancellations_time]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_order_cancellations_time] ON [dbo].[tbl_order_cancellations]
(
	[cancelled_at] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_tbl_order_items_order]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_order_items_order] ON [dbo].[tbl_order_items]
(
	[order_id] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_tbl_order_items_product]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_order_items_product] ON [dbo].[tbl_order_items]
(
	[product_id] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_tbl_order_items_variant]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_order_items_variant] ON [dbo].[tbl_order_items]
(
	[product_variant_id] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [ix_tbl_order_promotions_date]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_order_promotions_date] ON [dbo].[tbl_order_promotions]
(
	[applied_at] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_tbl_order_promotions_order]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_order_promotions_order] ON [dbo].[tbl_order_promotions]
(
	[order_id] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_tbl_order_promotions_type]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_order_promotions_type] ON [dbo].[tbl_order_promotions]
(
	[promotion_type] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_tbl_order_status_history_order_time]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_order_status_history_order_time] ON [dbo].[tbl_order_status_history]
(
	[order_id] ASC,
	[orderstatustime] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_tbl_order_status_history_status]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_order_status_history_status] ON [dbo].[tbl_order_status_history]
(
	[order_status_id] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [ix_tbl_order_status_master_active]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_order_status_master_active] ON [dbo].[tbl_order_status_master]
(
	[isactive] ASC,
	[isdeleted] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [ix_tbl_order_status_master_display_order]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_order_status_master_display_order] ON [dbo].[tbl_order_status_master]
(
	[display_order] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_tbl_orders_cart]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_orders_cart] ON [dbo].[tbl_orders]
(
	[cart_id] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_tbl_orders_status]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_orders_status] ON [dbo].[tbl_orders]
(
	[order_status_id] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_tbl_orders_user_placed_at]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_orders_user_placed_at] ON [dbo].[tbl_orders]
(
	[user_id] ASC,
	[placed_at] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ux_tbl_orders_order_number]    Script Date: 30-06-2026 19:59:29 ******/
CREATE UNIQUE NONCLUSTERED INDEX [ux_tbl_orders_order_number] ON [dbo].[tbl_orders]
(
	[order_number] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_tbl_payments_order]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_payments_order] ON [dbo].[tbl_payments]
(
	[order_id] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [ix_tbl_payments_paid_at]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_payments_paid_at] ON [dbo].[tbl_payments]
(
	[paid_at] ASC
)
WHERE ([isdeleted]=(0) AND [payment_status]='paid')
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_tbl_payments_razorpay_payment_id]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_payments_razorpay_payment_id] ON [dbo].[tbl_payments]
(
	[razorpay_payment_id] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_tbl_payments_status]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_payments_status] ON [dbo].[tbl_payments]
(
	[payment_status] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_tbl_payments_user]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_payments_user] ON [dbo].[tbl_payments]
(
	[user_id] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_tbl_pav_attribute]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_pav_attribute] ON [dbo].[tbl_product_attribute_values]
(
	[attribute_id] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_tbl_pav_product_attribute]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_pav_product_attribute] ON [dbo].[tbl_product_attribute_values]
(
	[product_id] ASC,
	[attribute_id] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_tbl_pav_variant]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_pav_variant] ON [dbo].[tbl_product_attribute_values]
(
	[product_variant_id] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ux_tbl_pav_unique]    Script Date: 30-06-2026 19:59:29 ******/
CREATE UNIQUE NONCLUSTERED INDEX [ux_tbl_pav_unique] ON [dbo].[tbl_product_attribute_values]
(
	[product_id] ASC,
	[product_variant_id] ASC,
	[attribute_id] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_tbl_product_media_primary]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_product_media_primary] ON [dbo].[tbl_product_media]
(
	[product_id] ASC,
	[isprimary] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_tbl_product_media_product_order]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_product_media_product_order] ON [dbo].[tbl_product_media]
(
	[product_id] ASC,
	[display_order] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_tbl_product_media_variant]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_product_media_variant] ON [dbo].[tbl_product_media]
(
	[product_variant_id] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [ix_tbl_product_reviews_date]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_product_reviews_date] ON [dbo].[tbl_product_reviews]
(
	[reviewed_date] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_tbl_product_reviews_product_rating]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_product_reviews_product_rating] ON [dbo].[tbl_product_reviews]
(
	[product_id] ASC,
	[rating] ASC
)
WHERE ([isdeleted]=(0) AND [review_status]='approved')
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_tbl_product_reviews_status]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_product_reviews_status] ON [dbo].[tbl_product_reviews]
(
	[review_status] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_tbl_product_reviews_user]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_product_reviews_user] ON [dbo].[tbl_product_reviews]
(
	[user_id] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [ix_tbl_product_reviews_verified]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_product_reviews_verified] ON [dbo].[tbl_product_reviews]
(
	[is_verified_purchase] ASC
)
WHERE ([isdeleted]=(0) AND [is_verified_purchase]=(1))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ux_tbl_product_seo_product]    Script Date: 30-06-2026 19:59:29 ******/
CREATE UNIQUE NONCLUSTERED INDEX [ux_tbl_product_seo_product] ON [dbo].[tbl_product_seo]
(
	[product_id] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_tbl_product_variants_product]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_product_variants_product] ON [dbo].[tbl_product_variants]
(
	[product_id] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ux_tbl_product_variants_one_default]    Script Date: 30-06-2026 19:59:29 ******/
CREATE UNIQUE NONCLUSTERED INDEX [ux_tbl_product_variants_one_default] ON [dbo].[tbl_product_variants]
(
	[product_id] ASC
)
WHERE ([isdeleted]=(0) AND [isdefault]=(1))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ux_tbl_product_variants_sku]    Script Date: 30-06-2026 19:59:29 ******/
CREATE UNIQUE NONCLUSTERED INDEX [ux_tbl_product_variants_sku] ON [dbo].[tbl_product_variants]
(
	[sku] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [ix_tbl_products_active]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_products_active] ON [dbo].[tbl_products]
(
	[isactive] ASC,
	[isdeleted] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ux_tbl_products_slug]    Script Date: 30-06-2026 19:59:29 ******/
CREATE UNIQUE NONCLUSTERED INDEX [ux_tbl_products_slug] ON [dbo].[tbl_products]
(
	[product_slug] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_tbl_profiles_user]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_profiles_user] ON [dbo].[tbl_profiles]
(
	[user_id] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [ix_tbl_refunds_initiated_date]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_refunds_initiated_date] ON [dbo].[tbl_refunds]
(
	[initiated_date] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_tbl_refunds_order]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_refunds_order] ON [dbo].[tbl_refunds]
(
	[order_id] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_tbl_refunds_payment]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_refunds_payment] ON [dbo].[tbl_refunds]
(
	[payment_id] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_tbl_refunds_return]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_refunds_return] ON [dbo].[tbl_refunds]
(
	[return_id] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_tbl_refunds_status]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_refunds_status] ON [dbo].[tbl_refunds]
(
	[refund_status] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_tbl_refunds_user]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_refunds_user] ON [dbo].[tbl_refunds]
(
	[user_id] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_tbl_refunds_user_status_date]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_refunds_user_status_date] ON [dbo].[tbl_refunds]
(
	[user_id] ASC,
	[refund_status] ASC,
	[initiated_date] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_tbl_returns_order]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_returns_order] ON [dbo].[tbl_returns]
(
	[order_id] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [ix_tbl_returns_requested_date]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_returns_requested_date] ON [dbo].[tbl_returns]
(
	[requested_date] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_tbl_returns_status]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_returns_status] ON [dbo].[tbl_returns]
(
	[return_status] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_tbl_returns_user]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_returns_user] ON [dbo].[tbl_returns]
(
	[user_id] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ux_tbl_returns_rma]    Script Date: 30-06-2026 19:59:29 ******/
CREATE UNIQUE NONCLUSTERED INDEX [ux_tbl_returns_rma] ON [dbo].[tbl_returns]
(
	[rma_number] ASC
)
WHERE ([isdeleted]=(0) AND [rma_number] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_tbl_review_responses_review]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_review_responses_review] ON [dbo].[tbl_review_responses]
(
	[product_review_id] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_tbl_review_responses_user]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_review_responses_user] ON [dbo].[tbl_review_responses]
(
	[responder_user_id] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_review_votes_review]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [idx_review_votes_review] ON [dbo].[tbl_review_votes]
(
	[review_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_reviews_product]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [idx_reviews_product] ON [dbo].[tbl_reviews]
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_reviews_user]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [idx_reviews_user] ON [dbo].[tbl_reviews]
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_reviews_variant]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [idx_reviews_variant] ON [dbo].[tbl_reviews]
(
	[variant_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [ix_tbl_roles_active]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_roles_active] ON [dbo].[tbl_roles]
(
	[isactive] ASC,
	[isdeleted] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_tbl_roles_code]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_roles_code] ON [dbo].[tbl_roles]
(
	[role_code] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ux_tbl_roles_role_code]    Script Date: 30-06-2026 19:59:29 ******/
CREATE UNIQUE NONCLUSTERED INDEX [ux_tbl_roles_role_code] ON [dbo].[tbl_roles]
(
	[role_code] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [ix_tbl_settings_active]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_settings_active] ON [dbo].[tbl_settings]
(
	[isactive] ASC,
	[isdeleted] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_tbl_shipment_events_shipment_time]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_shipment_events_shipment_time] ON [dbo].[tbl_shipment_events]
(
	[shipment_id] ASC,
	[event_timestamp] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [ix_tbl_shipment_events_timestamp]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_shipment_events_timestamp] ON [dbo].[tbl_shipment_events]
(
	[event_timestamp] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_tbl_shipments_courier]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_shipments_courier] ON [dbo].[tbl_shipments]
(
	[courier_partner_id] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_tbl_shipments_order]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_shipments_order] ON [dbo].[tbl_shipments]
(
	[order_id] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [ix_tbl_shipments_shipped_date]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_shipments_shipped_date] ON [dbo].[tbl_shipments]
(
	[shipped_date] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_tbl_shipments_status]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_shipments_status] ON [dbo].[tbl_shipments]
(
	[shipment_status] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ux_tbl_shipments_tracking]    Script Date: 30-06-2026 19:59:29 ******/
CREATE UNIQUE NONCLUSTERED INDEX [ux_tbl_shipments_tracking] ON [dbo].[tbl_shipments]
(
	[tracking_number] ASC
)
WHERE ([isdeleted]=(0) AND [tracking_number] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_tbl_sizes_type_order]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_sizes_type_order] ON [dbo].[tbl_sizes]
(
	[size_type] ASC,
	[display_order] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ux_tbl_sizes_name_type]    Script Date: 30-06-2026 19:59:29 ******/
CREATE UNIQUE NONCLUSTERED INDEX [ux_tbl_sizes_name_type] ON [dbo].[tbl_sizes]
(
	[size_name] ASC,
	[size_type] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [ix_tbl_support_contacts_active]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_support_contacts_active] ON [dbo].[tbl_support_contacts]
(
	[isactive] ASC,
	[isdeleted] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_tbl_support_contacts_email]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_support_contacts_email] ON [dbo].[tbl_support_contacts]
(
	[contact_email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_tbl_support_contacts_phone]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_support_contacts_phone] ON [dbo].[tbl_support_contacts]
(
	[contact_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_tbl_user_roles_role]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_user_roles_role] ON [dbo].[tbl_user_roles]
(
	[role_id] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_tbl_user_roles_user]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_user_roles_user] ON [dbo].[tbl_user_roles]
(
	[user_id] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ux_tbl_user_roles_unique]    Script Date: 30-06-2026 19:59:29 ******/
CREATE UNIQUE NONCLUSTERED INDEX [ux_tbl_user_roles_unique] ON [dbo].[tbl_user_roles]
(
	[user_id] ASC,
	[role_id] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_tbl_users_email]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_users_email] ON [dbo].[tbl_users]
(
	[email] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [ix_tbl_users_last_login]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_users_last_login] ON [dbo].[tbl_users]
(
	[last_login] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_tbl_users_phone]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_users_phone] ON [dbo].[tbl_users]
(
	[phone_number] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_tbl_wishlist_items_product]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_wishlist_items_product] ON [dbo].[tbl_wishlist_items]
(
	[product_id] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_tbl_wishlist_items_variant]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_wishlist_items_variant] ON [dbo].[tbl_wishlist_items]
(
	[product_variant_id] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_tbl_wishlist_items_wishlist]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_wishlist_items_wishlist] ON [dbo].[tbl_wishlist_items]
(
	[wishlist_id] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ux_tbl_wishlist_items_unique]    Script Date: 30-06-2026 19:59:29 ******/
CREATE UNIQUE NONCLUSTERED INDEX [ux_tbl_wishlist_items_unique] ON [dbo].[tbl_wishlist_items]
(
	[wishlist_id] ASC,
	[product_id] ASC,
	[product_variant_id] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_tbl_wishlists_user]    Script Date: 30-06-2026 19:59:29 ******/
CREATE NONCLUSTERED INDEX [ix_tbl_wishlists_user] ON [dbo].[tbl_wishlists]
(
	[user_id] ASC
)
WHERE ([isdeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbl_addresses] ADD  DEFAULT (CONVERT([varchar](36),newid())) FOR [address_id]
GO
ALTER TABLE [dbo].[tbl_addresses] ADD  DEFAULT ((0)) FOR [isdefault]
GO
ALTER TABLE [dbo].[tbl_addresses] ADD  DEFAULT ((1)) FOR [isactive]
GO
ALTER TABLE [dbo].[tbl_addresses] ADD  DEFAULT ((0)) FOR [isdeleted]
GO
ALTER TABLE [dbo].[tbl_addresses] ADD  DEFAULT (getdate()) FOR [rcm]
GO
ALTER TABLE [dbo].[tbl_appointment_date_slots] ADD  DEFAULT (newid()) FOR [appointment_date_slot_id]
GO
ALTER TABLE [dbo].[tbl_appointment_date_slots] ADD  CONSTRAINT [DF_tbl_appointment_date_slots_duration]  DEFAULT ((30)) FOR [slot_duration_minutes]
GO
ALTER TABLE [dbo].[tbl_appointment_date_slots] ADD  CONSTRAINT [DF_tbl_appointment_date_slots_isavailable]  DEFAULT ((1)) FOR [isavailable]
GO
ALTER TABLE [dbo].[tbl_appointment_date_slots] ADD  CONSTRAINT [DF_tbl_appointment_date_slots_isactive]  DEFAULT ((1)) FOR [isactive]
GO
ALTER TABLE [dbo].[tbl_appointment_date_slots] ADD  CONSTRAINT [DF_tbl_appointment_date_slots_isdeleted]  DEFAULT ((0)) FOR [isdeleted]
GO
ALTER TABLE [dbo].[tbl_appointment_date_slots] ADD  CONSTRAINT [DF_tbl_appointment_date_slots_rcm]  DEFAULT (getdate()) FOR [rcm]
GO
ALTER TABLE [dbo].[tbl_appointment_slot_blocks] ADD  DEFAULT (newid()) FOR [appointment_slot_block_id]
GO
ALTER TABLE [dbo].[tbl_appointment_slot_blocks] ADD  CONSTRAINT [DF_tbl_appointment_slot_blocks_isactive]  DEFAULT ((1)) FOR [isactive]
GO
ALTER TABLE [dbo].[tbl_appointment_slot_blocks] ADD  CONSTRAINT [DF_tbl_appointment_slot_blocks_isdeleted]  DEFAULT ((0)) FOR [isdeleted]
GO
ALTER TABLE [dbo].[tbl_appointment_slot_blocks] ADD  CONSTRAINT [DF_tbl_appointment_slot_blocks_rcm]  DEFAULT (getdate()) FOR [rcm]
GO
ALTER TABLE [dbo].[tbl_appointment_time_slots] ADD  DEFAULT (newid()) FOR [appointment_time_slot_id]
GO
ALTER TABLE [dbo].[tbl_appointment_time_slots] ADD  CONSTRAINT [DF_tbl_appointment_time_slots_isavailable]  DEFAULT ((1)) FOR [isavailable]
GO
ALTER TABLE [dbo].[tbl_appointment_time_slots] ADD  CONSTRAINT [DF_tbl_appointment_time_slots_isbooked]  DEFAULT ((0)) FOR [isbooked]
GO
ALTER TABLE [dbo].[tbl_appointment_time_slots] ADD  CONSTRAINT [DF_tbl_appointment_time_slots_display_order]  DEFAULT ((1)) FOR [display_order]
GO
ALTER TABLE [dbo].[tbl_appointment_time_slots] ADD  CONSTRAINT [DF_tbl_appointment_time_slots_isactive]  DEFAULT ((1)) FOR [isactive]
GO
ALTER TABLE [dbo].[tbl_appointment_time_slots] ADD  CONSTRAINT [DF_tbl_appointment_time_slots_isdeleted]  DEFAULT ((0)) FOR [isdeleted]
GO
ALTER TABLE [dbo].[tbl_appointment_time_slots] ADD  CONSTRAINT [DF_tbl_appointment_time_slots_rcm]  DEFAULT (getdate()) FOR [rcm]
GO
ALTER TABLE [dbo].[tbl_attributes] ADD  DEFAULT (CONVERT([varchar](36),newid())) FOR [attribute_id]
GO
ALTER TABLE [dbo].[tbl_attributes] ADD  DEFAULT ((1)) FOR [display_order]
GO
ALTER TABLE [dbo].[tbl_attributes] ADD  DEFAULT ((1)) FOR [isactive]
GO
ALTER TABLE [dbo].[tbl_attributes] ADD  DEFAULT ((0)) FOR [isdeleted]
GO
ALTER TABLE [dbo].[tbl_attributes] ADD  DEFAULT (getdate()) FOR [rcm]
GO
ALTER TABLE [dbo].[tbl_care_instructions] ADD  DEFAULT (CONVERT([varchar](36),newid())) FOR [care_instruction_id]
GO
ALTER TABLE [dbo].[tbl_care_instructions] ADD  DEFAULT ((1)) FOR [display_order]
GO
ALTER TABLE [dbo].[tbl_care_instructions] ADD  DEFAULT ((1)) FOR [isactive]
GO
ALTER TABLE [dbo].[tbl_care_instructions] ADD  DEFAULT ((0)) FOR [isdeleted]
GO
ALTER TABLE [dbo].[tbl_care_instructions] ADD  DEFAULT (getdate()) FOR [rcm]
GO
ALTER TABLE [dbo].[tbl_cart_items] ADD  DEFAULT (CONVERT([varchar](36),newid())) FOR [cart_item_id]
GO
ALTER TABLE [dbo].[tbl_cart_items] ADD  DEFAULT ((1)) FOR [qty]
GO
ALTER TABLE [dbo].[tbl_cart_items] ADD  DEFAULT (getdate()) FOR [added_at]
GO
ALTER TABLE [dbo].[tbl_cart_items] ADD  DEFAULT ((1)) FOR [isactive]
GO
ALTER TABLE [dbo].[tbl_cart_items] ADD  DEFAULT ((0)) FOR [isdeleted]
GO
ALTER TABLE [dbo].[tbl_cart_items] ADD  DEFAULT (getdate()) FOR [rcm]
GO
ALTER TABLE [dbo].[tbl_carts] ADD  DEFAULT (CONVERT([varchar](36),newid())) FOR [cart_id]
GO
ALTER TABLE [dbo].[tbl_carts] ADD  DEFAULT ('active') FOR [cart_status]
GO
ALTER TABLE [dbo].[tbl_carts] ADD  DEFAULT ((1)) FOR [isactive]
GO
ALTER TABLE [dbo].[tbl_carts] ADD  DEFAULT ((0)) FOR [isdeleted]
GO
ALTER TABLE [dbo].[tbl_carts] ADD  DEFAULT (getdate()) FOR [rcm]
GO
ALTER TABLE [dbo].[tbl_cloth_type_care_instructions] ADD  DEFAULT (CONVERT([varchar](36),newid())) FOR [cloth_type_care_instruction_id]
GO
ALTER TABLE [dbo].[tbl_cloth_type_care_instructions] ADD  DEFAULT ((1)) FOR [display_order]
GO
ALTER TABLE [dbo].[tbl_cloth_type_care_instructions] ADD  DEFAULT ((1)) FOR [isactive]
GO
ALTER TABLE [dbo].[tbl_cloth_type_care_instructions] ADD  DEFAULT ((0)) FOR [isdeleted]
GO
ALTER TABLE [dbo].[tbl_cloth_type_care_instructions] ADD  DEFAULT (getdate()) FOR [rcm]
GO
ALTER TABLE [dbo].[tbl_cloth_types] ADD  DEFAULT (CONVERT([varchar](36),newid())) FOR [cloth_type_id]
GO
ALTER TABLE [dbo].[tbl_cloth_types] ADD  DEFAULT ((1)) FOR [display_order]
GO
ALTER TABLE [dbo].[tbl_cloth_types] ADD  DEFAULT ((1)) FOR [isactive]
GO
ALTER TABLE [dbo].[tbl_cloth_types] ADD  DEFAULT ((0)) FOR [isdeleted]
GO
ALTER TABLE [dbo].[tbl_cloth_types] ADD  DEFAULT (getdate()) FOR [rcm]
GO
ALTER TABLE [dbo].[tbl_coupon_usage] ADD  DEFAULT (CONVERT([varchar](36),newid())) FOR [coupon_usage_id]
GO
ALTER TABLE [dbo].[tbl_coupon_usage] ADD  DEFAULT (getdate()) FOR [used_at]
GO
ALTER TABLE [dbo].[tbl_coupon_usage] ADD  DEFAULT ((1)) FOR [isactive]
GO
ALTER TABLE [dbo].[tbl_coupon_usage] ADD  DEFAULT ((0)) FOR [isdeleted]
GO
ALTER TABLE [dbo].[tbl_coupon_usage] ADD  DEFAULT (getdate()) FOR [rcm]
GO
ALTER TABLE [dbo].[tbl_coupons] ADD  DEFAULT (CONVERT([varchar](36),newid())) FOR [coupon_id]
GO
ALTER TABLE [dbo].[tbl_coupons] ADD  DEFAULT ((0)) FOR [usage_count]
GO
ALTER TABLE [dbo].[tbl_coupons] ADD  DEFAULT ((1)) FOR [per_user_limit]
GO
ALTER TABLE [dbo].[tbl_coupons] ADD  DEFAULT ((1)) FOR [isactive]
GO
ALTER TABLE [dbo].[tbl_coupons] ADD  DEFAULT ((0)) FOR [isdeleted]
GO
ALTER TABLE [dbo].[tbl_coupons] ADD  DEFAULT (getdate()) FOR [rcm]
GO
ALTER TABLE [dbo].[tbl_courier_partners] ADD  DEFAULT (CONVERT([varchar](36),newid())) FOR [courier_partner_id]
GO
ALTER TABLE [dbo].[tbl_courier_partners] ADD  DEFAULT ((1)) FOR [isactive]
GO
ALTER TABLE [dbo].[tbl_courier_partners] ADD  DEFAULT ((0)) FOR [isdeleted]
GO
ALTER TABLE [dbo].[tbl_courier_partners] ADD  DEFAULT (getdate()) FOR [rcm]
GO
ALTER TABLE [dbo].[tbl_custom_appointments] ADD  DEFAULT (newid()) FOR [appointment_id]
GO
ALTER TABLE [dbo].[tbl_custom_appointments] ADD  CONSTRAINT [DF_tbl_custom_appointments_status]  DEFAULT ('requested') FOR [appointment_status]
GO
ALTER TABLE [dbo].[tbl_custom_appointments] ADD  CONSTRAINT [DF_tbl_custom_appointments_isrejected]  DEFAULT ((0)) FOR [isrejected]
GO
ALTER TABLE [dbo].[tbl_custom_appointments] ADD  CONSTRAINT [DF_tbl_custom_appointments_requested_at]  DEFAULT (getdate()) FOR [requested_at]
GO
ALTER TABLE [dbo].[tbl_custom_appointments] ADD  CONSTRAINT [DF_tbl_custom_appointments_isactive]  DEFAULT ((1)) FOR [isactive]
GO
ALTER TABLE [dbo].[tbl_custom_appointments] ADD  CONSTRAINT [DF_tbl_custom_appointments_isdeleted]  DEFAULT ((0)) FOR [isdeleted]
GO
ALTER TABLE [dbo].[tbl_custom_appointments] ADD  CONSTRAINT [DF_tbl_custom_appointments_rcm]  DEFAULT (getdate()) FOR [rcm]
GO
ALTER TABLE [dbo].[tbl_customer_profiles] ADD  DEFAULT (CONVERT([varchar](36),newid())) FOR [profile_id]
GO
ALTER TABLE [dbo].[tbl_customer_profiles] ADD  DEFAULT ((0)) FOR [newsletter_subscription]
GO
ALTER TABLE [dbo].[tbl_customer_profiles] ADD  DEFAULT ((1)) FOR [sms_notifications]
GO
ALTER TABLE [dbo].[tbl_customer_profiles] ADD  DEFAULT ((1)) FOR [email_notifications]
GO
ALTER TABLE [dbo].[tbl_customer_profiles] ADD  DEFAULT ((1)) FOR [push_notifications]
GO
ALTER TABLE [dbo].[tbl_customer_profiles] ADD  DEFAULT ((0)) FOR [loyalty_points]
GO
ALTER TABLE [dbo].[tbl_customer_profiles] ADD  DEFAULT ((1)) FOR [isactive]
GO
ALTER TABLE [dbo].[tbl_customer_profiles] ADD  DEFAULT ((0)) FOR [isdeleted]
GO
ALTER TABLE [dbo].[tbl_customer_profiles] ADD  DEFAULT (getdate()) FOR [rcm]
GO
ALTER TABLE [dbo].[tbl_discount_targets] ADD  DEFAULT (CONVERT([varchar](36),newid())) FOR [discount_target_id]
GO
ALTER TABLE [dbo].[tbl_discount_targets] ADD  DEFAULT ((1)) FOR [isactive]
GO
ALTER TABLE [dbo].[tbl_discount_targets] ADD  DEFAULT ((0)) FOR [isdeleted]
GO
ALTER TABLE [dbo].[tbl_discount_targets] ADD  DEFAULT (getdate()) FOR [rcm]
GO
ALTER TABLE [dbo].[tbl_discounts] ADD  DEFAULT (CONVERT([varchar](36),newid())) FOR [discount_id]
GO
ALTER TABLE [dbo].[tbl_discounts] ADD  DEFAULT ((0)) FOR [usage_count]
GO
ALTER TABLE [dbo].[tbl_discounts] ADD  DEFAULT ((1)) FOR [discount_priority]
GO
ALTER TABLE [dbo].[tbl_discounts] ADD  DEFAULT ((1)) FOR [isactive]
GO
ALTER TABLE [dbo].[tbl_discounts] ADD  DEFAULT ((0)) FOR [isdeleted]
GO
ALTER TABLE [dbo].[tbl_discounts] ADD  DEFAULT (getdate()) FOR [rcm]
GO
ALTER TABLE [dbo].[tbl_faqs] ADD  DEFAULT (CONVERT([varchar](36),newid())) FOR [faq_id]
GO
ALTER TABLE [dbo].[tbl_faqs] ADD  DEFAULT ((1)) FOR [display_order]
GO
ALTER TABLE [dbo].[tbl_faqs] ADD  DEFAULT ((1)) FOR [isactive]
GO
ALTER TABLE [dbo].[tbl_faqs] ADD  DEFAULT ((0)) FOR [isdeleted]
GO
ALTER TABLE [dbo].[tbl_faqs] ADD  DEFAULT (getdate()) FOR [rcm]
GO
ALTER TABLE [dbo].[tbl_image_sliders] ADD  DEFAULT (newid()) FOR [image_slider_id]
GO
ALTER TABLE [dbo].[tbl_image_sliders] ADD  DEFAULT ('shop now') FOR [button_text]
GO
ALTER TABLE [dbo].[tbl_image_sliders] ADD  DEFAULT ((1)) FOR [display_order]
GO
ALTER TABLE [dbo].[tbl_image_sliders] ADD  DEFAULT ((5)) FOR [auto_slide_interval_seconds]
GO
ALTER TABLE [dbo].[tbl_image_sliders] ADD  DEFAULT ((1)) FOR [isactive]
GO
ALTER TABLE [dbo].[tbl_image_sliders] ADD  DEFAULT ((0)) FOR [isdeleted]
GO
ALTER TABLE [dbo].[tbl_image_sliders] ADD  DEFAULT (getdate()) FOR [rcm]
GO
ALTER TABLE [dbo].[tbl_invoices] ADD  DEFAULT (CONVERT([varchar](36),newid())) FOR [invoice_id]
GO
ALTER TABLE [dbo].[tbl_invoices] ADD  DEFAULT (getdate()) FOR [invoice_date]
GO
ALTER TABLE [dbo].[tbl_invoices] ADD  DEFAULT ((1)) FOR [isactive]
GO
ALTER TABLE [dbo].[tbl_invoices] ADD  DEFAULT ((0)) FOR [isdeleted]
GO
ALTER TABLE [dbo].[tbl_invoices] ADD  DEFAULT (getdate()) FOR [rcm]
GO
ALTER TABLE [dbo].[tbl_legal_page_header] ADD  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[tbl_legal_page_header] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[tbl_legal_page_sections] ADD  DEFAULT ((0)) FOR [section_order]
GO
ALTER TABLE [dbo].[tbl_legal_page_sections] ADD  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[tbl_legal_page_sections] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[tbl_menu_categories] ADD  DEFAULT (CONVERT([varchar](36),newid())) FOR [menu_category_id]
GO
ALTER TABLE [dbo].[tbl_menu_categories] ADD  DEFAULT ((1)) FOR [display_order]
GO
ALTER TABLE [dbo].[tbl_menu_categories] ADD  DEFAULT ((1)) FOR [isactive]
GO
ALTER TABLE [dbo].[tbl_menu_categories] ADD  DEFAULT ((0)) FOR [isdeleted]
GO
ALTER TABLE [dbo].[tbl_menu_categories] ADD  DEFAULT (getdate()) FOR [rcm]
GO
ALTER TABLE [dbo].[tbl_menu_subcategories] ADD  DEFAULT (CONVERT([varchar](36),newid())) FOR [menu_subcategory_id]
GO
ALTER TABLE [dbo].[tbl_menu_subcategories] ADD  DEFAULT ((1)) FOR [display_order]
GO
ALTER TABLE [dbo].[tbl_menu_subcategories] ADD  DEFAULT ((1)) FOR [isactive]
GO
ALTER TABLE [dbo].[tbl_menu_subcategories] ADD  DEFAULT ((0)) FOR [isdeleted]
GO
ALTER TABLE [dbo].[tbl_menu_subcategories] ADD  DEFAULT (getdate()) FOR [rcm]
GO
ALTER TABLE [dbo].[tbl_menu_video] ADD  DEFAULT (newid()) FOR [menu_video_id]
GO
ALTER TABLE [dbo].[tbl_menu_video] ADD  DEFAULT ('youtube') FOR [video_type]
GO
ALTER TABLE [dbo].[tbl_menu_video] ADD  DEFAULT ((1)) FOR [autoplay]
GO
ALTER TABLE [dbo].[tbl_menu_video] ADD  DEFAULT ((1)) FOR [loop_video]
GO
ALTER TABLE [dbo].[tbl_menu_video] ADD  DEFAULT ((1)) FOR [mute_default]
GO
ALTER TABLE [dbo].[tbl_menu_video] ADD  DEFAULT ((1)) FOR [display_order]
GO
ALTER TABLE [dbo].[tbl_menu_video] ADD  DEFAULT ((1)) FOR [isactive]
GO
ALTER TABLE [dbo].[tbl_menu_video] ADD  DEFAULT ((0)) FOR [isdeleted]
GO
ALTER TABLE [dbo].[tbl_menu_video] ADD  DEFAULT (getdate()) FOR [rcm]
GO
ALTER TABLE [dbo].[tbl_newsletter_subscriptions] ADD  DEFAULT (CONVERT([varchar](36),newid())) FOR [newsletter_subscription_id]
GO
ALTER TABLE [dbo].[tbl_newsletter_subscriptions] ADD  DEFAULT (getdate()) FOR [subscribed_at]
GO
ALTER TABLE [dbo].[tbl_newsletter_subscriptions] ADD  DEFAULT ('subscribed') FOR [subscription_status]
GO
ALTER TABLE [dbo].[tbl_newsletter_subscriptions] ADD  DEFAULT ((1)) FOR [isactive]
GO
ALTER TABLE [dbo].[tbl_newsletter_subscriptions] ADD  DEFAULT ((0)) FOR [isdeleted]
GO
ALTER TABLE [dbo].[tbl_newsletter_subscriptions] ADD  DEFAULT (getdate()) FOR [rcm]
GO
ALTER TABLE [dbo].[tbl_order_addresses] ADD  DEFAULT (CONVERT([varchar](36),newid())) FOR [order_address_id]
GO
ALTER TABLE [dbo].[tbl_order_addresses] ADD  DEFAULT ((1)) FOR [isactive]
GO
ALTER TABLE [dbo].[tbl_order_addresses] ADD  DEFAULT ((0)) FOR [isdeleted]
GO
ALTER TABLE [dbo].[tbl_order_addresses] ADD  DEFAULT (getdate()) FOR [rcm]
GO
ALTER TABLE [dbo].[tbl_order_cancellations] ADD  DEFAULT (CONVERT([varchar](36),newid())) FOR [order_cancellation_id]
GO
ALTER TABLE [dbo].[tbl_order_cancellations] ADD  DEFAULT (getdate()) FOR [cancelled_at]
GO
ALTER TABLE [dbo].[tbl_order_cancellations] ADD  DEFAULT ((1)) FOR [isactive]
GO
ALTER TABLE [dbo].[tbl_order_cancellations] ADD  DEFAULT ((0)) FOR [isdeleted]
GO
ALTER TABLE [dbo].[tbl_order_cancellations] ADD  DEFAULT (getdate()) FOR [rcm]
GO
ALTER TABLE [dbo].[tbl_order_items] ADD  DEFAULT (CONVERT([varchar](36),newid())) FOR [order_item_id]
GO
ALTER TABLE [dbo].[tbl_order_items] ADD  DEFAULT ((1)) FOR [qty]
GO
ALTER TABLE [dbo].[tbl_order_items] ADD  DEFAULT ((1)) FOR [isactive]
GO
ALTER TABLE [dbo].[tbl_order_items] ADD  DEFAULT ((0)) FOR [isdeleted]
GO
ALTER TABLE [dbo].[tbl_order_items] ADD  DEFAULT (getdate()) FOR [rcm]
GO
ALTER TABLE [dbo].[tbl_order_promotions] ADD  DEFAULT (CONVERT([varchar](36),newid())) FOR [order_promotion_id]
GO
ALTER TABLE [dbo].[tbl_order_promotions] ADD  DEFAULT (getdate()) FOR [applied_at]
GO
ALTER TABLE [dbo].[tbl_order_promotions] ADD  DEFAULT ((1)) FOR [isactive]
GO
ALTER TABLE [dbo].[tbl_order_promotions] ADD  DEFAULT ((0)) FOR [isdeleted]
GO
ALTER TABLE [dbo].[tbl_order_promotions] ADD  DEFAULT (getdate()) FOR [rcm]
GO
ALTER TABLE [dbo].[tbl_order_status_history] ADD  DEFAULT (CONVERT([varchar](36),newid())) FOR [order_status_history_id]
GO
ALTER TABLE [dbo].[tbl_order_status_history] ADD  DEFAULT (getdate()) FOR [orderstatustime]
GO
ALTER TABLE [dbo].[tbl_order_status_history] ADD  DEFAULT ((1)) FOR [isactive]
GO
ALTER TABLE [dbo].[tbl_order_status_history] ADD  DEFAULT ((0)) FOR [isdeleted]
GO
ALTER TABLE [dbo].[tbl_order_status_history] ADD  DEFAULT (getdate()) FOR [rcm]
GO
ALTER TABLE [dbo].[tbl_order_status_master] ADD  DEFAULT (CONVERT([varchar](36),newid())) FOR [order_status_id]
GO
ALTER TABLE [dbo].[tbl_order_status_master] ADD  DEFAULT ((1)) FOR [display_order]
GO
ALTER TABLE [dbo].[tbl_order_status_master] ADD  DEFAULT ((0)) FOR [iscancelled_status]
GO
ALTER TABLE [dbo].[tbl_order_status_master] ADD  DEFAULT ((1)) FOR [isactive]
GO
ALTER TABLE [dbo].[tbl_order_status_master] ADD  DEFAULT ((0)) FOR [isdeleted]
GO
ALTER TABLE [dbo].[tbl_order_status_master] ADD  DEFAULT (getdate()) FOR [rcm]
GO
ALTER TABLE [dbo].[tbl_orders] ADD  DEFAULT (CONVERT([varchar](36),newid())) FOR [order_id]
GO
ALTER TABLE [dbo].[tbl_orders] ADD  DEFAULT (getdate()) FOR [placed_at]
GO
ALTER TABLE [dbo].[tbl_orders] ADD  DEFAULT ((1)) FOR [isactive]
GO
ALTER TABLE [dbo].[tbl_orders] ADD  DEFAULT ((0)) FOR [isdeleted]
GO
ALTER TABLE [dbo].[tbl_orders] ADD  DEFAULT (getdate()) FOR [rcm]
GO
ALTER TABLE [dbo].[tbl_payments] ADD  DEFAULT (CONVERT([varchar](36),newid())) FOR [payment_id]
GO
ALTER TABLE [dbo].[tbl_payments] ADD  DEFAULT ('razorpay') FOR [payment_provider]
GO
ALTER TABLE [dbo].[tbl_payments] ADD  DEFAULT ('pending') FOR [payment_status]
GO
ALTER TABLE [dbo].[tbl_payments] ADD  DEFAULT ('inr') FOR [currency_code]
GO
ALTER TABLE [dbo].[tbl_payments] ADD  DEFAULT ((1)) FOR [isactive]
GO
ALTER TABLE [dbo].[tbl_payments] ADD  DEFAULT ((0)) FOR [isdeleted]
GO
ALTER TABLE [dbo].[tbl_payments] ADD  DEFAULT (getdate()) FOR [rcm]
GO
ALTER TABLE [dbo].[tbl_product_attribute_values] ADD  DEFAULT (CONVERT([varchar](36),newid())) FOR [product_attribute_value_id]
GO
ALTER TABLE [dbo].[tbl_product_attribute_values] ADD  DEFAULT ((1)) FOR [isactive]
GO
ALTER TABLE [dbo].[tbl_product_attribute_values] ADD  DEFAULT ((0)) FOR [isdeleted]
GO
ALTER TABLE [dbo].[tbl_product_attribute_values] ADD  DEFAULT (getdate()) FOR [rcm]
GO
ALTER TABLE [dbo].[tbl_product_media] ADD  DEFAULT (CONVERT([varchar](36),newid())) FOR [product_media_id]
GO
ALTER TABLE [dbo].[tbl_product_media] ADD  DEFAULT ((1)) FOR [display_order]
GO
ALTER TABLE [dbo].[tbl_product_media] ADD  DEFAULT ((0)) FOR [isprimary]
GO
ALTER TABLE [dbo].[tbl_product_media] ADD  DEFAULT ((1)) FOR [isactive]
GO
ALTER TABLE [dbo].[tbl_product_media] ADD  DEFAULT ((0)) FOR [isdeleted]
GO
ALTER TABLE [dbo].[tbl_product_media] ADD  DEFAULT (getdate()) FOR [rcm]
GO
ALTER TABLE [dbo].[tbl_product_rating_summary] ADD  DEFAULT ((0)) FOR [avg_rating]
GO
ALTER TABLE [dbo].[tbl_product_rating_summary] ADD  DEFAULT ((0)) FOR [total_reviews]
GO
ALTER TABLE [dbo].[tbl_product_rating_summary] ADD  DEFAULT ((0)) FOR [rating_1_count]
GO
ALTER TABLE [dbo].[tbl_product_rating_summary] ADD  DEFAULT ((0)) FOR [rating_2_count]
GO
ALTER TABLE [dbo].[tbl_product_rating_summary] ADD  DEFAULT ((0)) FOR [rating_3_count]
GO
ALTER TABLE [dbo].[tbl_product_rating_summary] ADD  DEFAULT ((0)) FOR [rating_4_count]
GO
ALTER TABLE [dbo].[tbl_product_rating_summary] ADD  DEFAULT ((0)) FOR [rating_5_count]
GO
ALTER TABLE [dbo].[tbl_product_rating_summary] ADD  DEFAULT (getdate()) FOR [rcm]
GO
ALTER TABLE [dbo].[tbl_product_reviews] ADD  DEFAULT (CONVERT([varchar](36),newid())) FOR [product_review_id]
GO
ALTER TABLE [dbo].[tbl_product_reviews] ADD  DEFAULT ((0)) FOR [helpful_count]
GO
ALTER TABLE [dbo].[tbl_product_reviews] ADD  DEFAULT ((0)) FOR [unhelpful_count]
GO
ALTER TABLE [dbo].[tbl_product_reviews] ADD  DEFAULT ((0)) FOR [is_verified_purchase]
GO
ALTER TABLE [dbo].[tbl_product_reviews] ADD  DEFAULT ('pending') FOR [review_status]
GO
ALTER TABLE [dbo].[tbl_product_reviews] ADD  DEFAULT (getdate()) FOR [reviewed_date]
GO
ALTER TABLE [dbo].[tbl_product_reviews] ADD  DEFAULT ((1)) FOR [isactive]
GO
ALTER TABLE [dbo].[tbl_product_reviews] ADD  DEFAULT ((0)) FOR [isdeleted]
GO
ALTER TABLE [dbo].[tbl_product_reviews] ADD  DEFAULT (getdate()) FOR [rcm]
GO
ALTER TABLE [dbo].[tbl_product_seo] ADD  DEFAULT (CONVERT([varchar](36),newid())) FOR [product_seo_id]
GO
ALTER TABLE [dbo].[tbl_product_seo] ADD  DEFAULT ((1)) FOR [isactive]
GO
ALTER TABLE [dbo].[tbl_product_seo] ADD  DEFAULT ((0)) FOR [isdeleted]
GO
ALTER TABLE [dbo].[tbl_product_seo] ADD  DEFAULT (getdate()) FOR [rcm]
GO
ALTER TABLE [dbo].[tbl_product_variants] ADD  DEFAULT (CONVERT([varchar](36),newid())) FOR [product_variant_id]
GO
ALTER TABLE [dbo].[tbl_product_variants] ADD  DEFAULT ((0)) FOR [stock_qty]
GO
ALTER TABLE [dbo].[tbl_product_variants] ADD  DEFAULT ((0)) FOR [isdefault]
GO
ALTER TABLE [dbo].[tbl_product_variants] ADD  DEFAULT ((1)) FOR [isactive]
GO
ALTER TABLE [dbo].[tbl_product_variants] ADD  DEFAULT ((0)) FOR [isdeleted]
GO
ALTER TABLE [dbo].[tbl_product_variants] ADD  DEFAULT (getdate()) FOR [rcm]
GO
ALTER TABLE [dbo].[tbl_products] ADD  DEFAULT (CONVERT([varchar](36),newid())) FOR [product_id]
GO
ALTER TABLE [dbo].[tbl_products] ADD  DEFAULT ('inr') FOR [currency_code]
GO
ALTER TABLE [dbo].[tbl_products] ADD  DEFAULT ((1)) FOR [isactive]
GO
ALTER TABLE [dbo].[tbl_products] ADD  DEFAULT ((0)) FOR [isdeleted]
GO
ALTER TABLE [dbo].[tbl_products] ADD  DEFAULT (getdate()) FOR [rcm]
GO
ALTER TABLE [dbo].[tbl_profiles] ADD  DEFAULT (CONVERT([varchar](36),newid())) FOR [profile_id]
GO
ALTER TABLE [dbo].[tbl_profiles] ADD  DEFAULT ((1)) FOR [isactive]
GO
ALTER TABLE [dbo].[tbl_profiles] ADD  DEFAULT ((0)) FOR [isdeleted]
GO
ALTER TABLE [dbo].[tbl_profiles] ADD  DEFAULT (getdate()) FOR [rcm]
GO
ALTER TABLE [dbo].[tbl_refunds] ADD  DEFAULT (CONVERT([varchar](36),newid())) FOR [refund_id]
GO
ALTER TABLE [dbo].[tbl_refunds] ADD  DEFAULT ('initiated') FOR [refund_status]
GO
ALTER TABLE [dbo].[tbl_refunds] ADD  DEFAULT (getdate()) FOR [initiated_date]
GO
ALTER TABLE [dbo].[tbl_refunds] ADD  DEFAULT ((1)) FOR [isactive]
GO
ALTER TABLE [dbo].[tbl_refunds] ADD  DEFAULT ((0)) FOR [isdeleted]
GO
ALTER TABLE [dbo].[tbl_refunds] ADD  DEFAULT (getdate()) FOR [rcm]
GO
ALTER TABLE [dbo].[tbl_returns] ADD  DEFAULT (CONVERT([varchar](36),newid())) FOR [return_id]
GO
ALTER TABLE [dbo].[tbl_returns] ADD  DEFAULT ('requested') FOR [return_status]
GO
ALTER TABLE [dbo].[tbl_returns] ADD  DEFAULT ((1)) FOR [return_items_count]
GO
ALTER TABLE [dbo].[tbl_returns] ADD  DEFAULT (getdate()) FOR [requested_date]
GO
ALTER TABLE [dbo].[tbl_returns] ADD  DEFAULT ((1)) FOR [isactive]
GO
ALTER TABLE [dbo].[tbl_returns] ADD  DEFAULT ((0)) FOR [isdeleted]
GO
ALTER TABLE [dbo].[tbl_returns] ADD  DEFAULT (getdate()) FOR [rcm]
GO
ALTER TABLE [dbo].[tbl_review_media] ADD  DEFAULT (newid()) FOR [media_id]
GO
ALTER TABLE [dbo].[tbl_review_media] ADD  DEFAULT ((1)) FOR [isactive]
GO
ALTER TABLE [dbo].[tbl_review_media] ADD  DEFAULT ((0)) FOR [isdeleted]
GO
ALTER TABLE [dbo].[tbl_review_media] ADD  DEFAULT (getdate()) FOR [rcm]
GO
ALTER TABLE [dbo].[tbl_review_responses] ADD  DEFAULT (CONVERT([varchar](36),newid())) FOR [review_response_id]
GO
ALTER TABLE [dbo].[tbl_review_responses] ADD  DEFAULT (getdate()) FOR [response_date]
GO
ALTER TABLE [dbo].[tbl_review_responses] ADD  DEFAULT ((1)) FOR [isactive]
GO
ALTER TABLE [dbo].[tbl_review_responses] ADD  DEFAULT ((0)) FOR [isdeleted]
GO
ALTER TABLE [dbo].[tbl_review_responses] ADD  DEFAULT (getdate()) FOR [rcm]
GO
ALTER TABLE [dbo].[tbl_review_votes] ADD  DEFAULT (newid()) FOR [vote_id]
GO
ALTER TABLE [dbo].[tbl_review_votes] ADD  DEFAULT ((1)) FOR [isactive]
GO
ALTER TABLE [dbo].[tbl_review_votes] ADD  DEFAULT ((0)) FOR [isdeleted]
GO
ALTER TABLE [dbo].[tbl_review_votes] ADD  DEFAULT (getdate()) FOR [rcm]
GO
ALTER TABLE [dbo].[tbl_reviews] ADD  DEFAULT (newid()) FOR [review_id]
GO
ALTER TABLE [dbo].[tbl_reviews] ADD  DEFAULT ((0)) FOR [is_verified]
GO
ALTER TABLE [dbo].[tbl_reviews] ADD  DEFAULT ((1)) FOR [is_approved]
GO
ALTER TABLE [dbo].[tbl_reviews] ADD  DEFAULT ((1)) FOR [isactive]
GO
ALTER TABLE [dbo].[tbl_reviews] ADD  DEFAULT ((0)) FOR [isdeleted]
GO
ALTER TABLE [dbo].[tbl_reviews] ADD  DEFAULT (getdate()) FOR [rcm]
GO
ALTER TABLE [dbo].[tbl_roles] ADD  DEFAULT (CONVERT([varchar](36),newid())) FOR [role_id]
GO
ALTER TABLE [dbo].[tbl_roles] ADD  DEFAULT ((1)) FOR [isactive]
GO
ALTER TABLE [dbo].[tbl_roles] ADD  DEFAULT ((0)) FOR [isdeleted]
GO
ALTER TABLE [dbo].[tbl_roles] ADD  DEFAULT (getdate()) FOR [rcm]
GO
ALTER TABLE [dbo].[tbl_running_bar_items] ADD  DEFAULT (CONVERT([varchar](36),newid())) FOR [running_bar_item_id]
GO
ALTER TABLE [dbo].[tbl_running_bar_items] ADD  DEFAULT ((5)) FOR [duration_seconds]
GO
ALTER TABLE [dbo].[tbl_running_bar_items] ADD  DEFAULT ((1)) FOR [display_order]
GO
ALTER TABLE [dbo].[tbl_running_bar_items] ADD  DEFAULT ((1)) FOR [isactive]
GO
ALTER TABLE [dbo].[tbl_running_bar_items] ADD  DEFAULT ((0)) FOR [isdeleted]
GO
ALTER TABLE [dbo].[tbl_running_bar_items] ADD  DEFAULT (getdate()) FOR [rcm]
GO
ALTER TABLE [dbo].[tbl_running_bars] ADD  DEFAULT (CONVERT([varchar](36),newid())) FOR [running_bar_id]
GO
ALTER TABLE [dbo].[tbl_running_bars] ADD  DEFAULT ((1)) FOR [isactive]
GO
ALTER TABLE [dbo].[tbl_running_bars] ADD  DEFAULT ((0)) FOR [isdeleted]
GO
ALTER TABLE [dbo].[tbl_running_bars] ADD  DEFAULT (getdate()) FOR [rcm]
GO
ALTER TABLE [dbo].[tbl_settings] ADD  DEFAULT (CONVERT([varchar](36),newid())) FOR [setting_id]
GO
ALTER TABLE [dbo].[tbl_settings] ADD  DEFAULT ((0)) FOR [ismaintenance_mode]
GO
ALTER TABLE [dbo].[tbl_settings] ADD  DEFAULT ((1)) FOR [isactive]
GO
ALTER TABLE [dbo].[tbl_settings] ADD  DEFAULT ((0)) FOR [isdeleted]
GO
ALTER TABLE [dbo].[tbl_settings] ADD  DEFAULT (getdate()) FOR [rcm]
GO
ALTER TABLE [dbo].[tbl_shipment_events] ADD  DEFAULT (CONVERT([varchar](36),newid())) FOR [shipment_event_id]
GO
ALTER TABLE [dbo].[tbl_shipment_events] ADD  DEFAULT (getdate()) FOR [event_timestamp]
GO
ALTER TABLE [dbo].[tbl_shipment_events] ADD  DEFAULT ((1)) FOR [isactive]
GO
ALTER TABLE [dbo].[tbl_shipment_events] ADD  DEFAULT ((0)) FOR [isdeleted]
GO
ALTER TABLE [dbo].[tbl_shipment_events] ADD  DEFAULT (getdate()) FOR [rcm]
GO
ALTER TABLE [dbo].[tbl_shipments] ADD  DEFAULT (CONVERT([varchar](36),newid())) FOR [shipment_id]
GO
ALTER TABLE [dbo].[tbl_shipments] ADD  DEFAULT ('pending') FOR [shipment_status]
GO
ALTER TABLE [dbo].[tbl_shipments] ADD  DEFAULT ((1)) FOR [isactive]
GO
ALTER TABLE [dbo].[tbl_shipments] ADD  DEFAULT ((0)) FOR [isdeleted]
GO
ALTER TABLE [dbo].[tbl_shipments] ADD  DEFAULT (getdate()) FOR [rcm]
GO
ALTER TABLE [dbo].[tbl_sizes] ADD  DEFAULT (CONVERT([varchar](36),newid())) FOR [size_id]
GO
ALTER TABLE [dbo].[tbl_sizes] ADD  DEFAULT ((1)) FOR [display_order]
GO
ALTER TABLE [dbo].[tbl_sizes] ADD  DEFAULT ((1)) FOR [isactive]
GO
ALTER TABLE [dbo].[tbl_sizes] ADD  DEFAULT ((0)) FOR [isdeleted]
GO
ALTER TABLE [dbo].[tbl_sizes] ADD  DEFAULT (getdate()) FOR [rcm]
GO
ALTER TABLE [dbo].[tbl_spotlight_entries] ADD  DEFAULT (newid()) FOR [spotlight_entry_id]
GO
ALTER TABLE [dbo].[tbl_spotlight_entries] ADD  DEFAULT ('shop now/explore') FOR [cta_text]
GO
ALTER TABLE [dbo].[tbl_spotlight_entries] ADD  DEFAULT ((1)) FOR [display_order]
GO
ALTER TABLE [dbo].[tbl_spotlight_entries] ADD  DEFAULT ((1)) FOR [isactive]
GO
ALTER TABLE [dbo].[tbl_spotlight_entries] ADD  DEFAULT ((0)) FOR [isdeleted]
GO
ALTER TABLE [dbo].[tbl_spotlight_entries] ADD  DEFAULT (getdate()) FOR [rcm]
GO
ALTER TABLE [dbo].[tbl_spotlight_media] ADD  DEFAULT (newid()) FOR [spotlight_media_id]
GO
ALTER TABLE [dbo].[tbl_spotlight_media] ADD  DEFAULT ((1)) FOR [display_order]
GO
ALTER TABLE [dbo].[tbl_spotlight_media] ADD  DEFAULT ((0)) FOR [isprimary]
GO
ALTER TABLE [dbo].[tbl_spotlight_media] ADD  DEFAULT ((1)) FOR [isactive]
GO
ALTER TABLE [dbo].[tbl_spotlight_media] ADD  DEFAULT ((0)) FOR [isdeleted]
GO
ALTER TABLE [dbo].[tbl_spotlight_media] ADD  DEFAULT (getdate()) FOR [rcm]
GO
ALTER TABLE [dbo].[tbl_style_collection_media] ADD  DEFAULT (newid()) FOR [style_collection_media_id]
GO
ALTER TABLE [dbo].[tbl_style_collection_media] ADD  DEFAULT ((1)) FOR [display_order]
GO
ALTER TABLE [dbo].[tbl_style_collection_media] ADD  DEFAULT ((0)) FOR [isprimary]
GO
ALTER TABLE [dbo].[tbl_style_collection_media] ADD  DEFAULT ((1)) FOR [isactive]
GO
ALTER TABLE [dbo].[tbl_style_collection_media] ADD  DEFAULT ((0)) FOR [isdeleted]
GO
ALTER TABLE [dbo].[tbl_style_collection_media] ADD  DEFAULT (getdate()) FOR [rcm]
GO
ALTER TABLE [dbo].[tbl_style_collections] ADD  DEFAULT (newid()) FOR [style_collection_id]
GO
ALTER TABLE [dbo].[tbl_style_collections] ADD  DEFAULT ((1)) FOR [display_order]
GO
ALTER TABLE [dbo].[tbl_style_collections] ADD  DEFAULT ((1)) FOR [isactive]
GO
ALTER TABLE [dbo].[tbl_style_collections] ADD  DEFAULT ((0)) FOR [isdeleted]
GO
ALTER TABLE [dbo].[tbl_style_collections] ADD  DEFAULT (getdate()) FOR [rcm]
GO
ALTER TABLE [dbo].[tbl_support_contacts] ADD  DEFAULT (CONVERT([varchar](36),newid())) FOR [support_contact_id]
GO
ALTER TABLE [dbo].[tbl_support_contacts] ADD  DEFAULT ((1)) FOR [isactive]
GO
ALTER TABLE [dbo].[tbl_support_contacts] ADD  DEFAULT ((0)) FOR [isdeleted]
GO
ALTER TABLE [dbo].[tbl_support_contacts] ADD  DEFAULT (getdate()) FOR [rcm]
GO
ALTER TABLE [dbo].[tbl_user_roles] ADD  DEFAULT (CONVERT([varchar](36),newid())) FOR [user_role_id]
GO
ALTER TABLE [dbo].[tbl_user_roles] ADD  DEFAULT (getdate()) FOR [assigned_at]
GO
ALTER TABLE [dbo].[tbl_user_roles] ADD  DEFAULT ((1)) FOR [isactive]
GO
ALTER TABLE [dbo].[tbl_user_roles] ADD  DEFAULT ((0)) FOR [isdeleted]
GO
ALTER TABLE [dbo].[tbl_user_roles] ADD  DEFAULT (getdate()) FOR [rcm]
GO
ALTER TABLE [dbo].[tbl_users] ADD  DEFAULT (CONVERT([varchar](36),newid())) FOR [user_id]
GO
ALTER TABLE [dbo].[tbl_users] ADD  DEFAULT ((0)) FOR [email_verified]
GO
ALTER TABLE [dbo].[tbl_users] ADD  DEFAULT ((0)) FOR [phone_verified]
GO
ALTER TABLE [dbo].[tbl_users] ADD  DEFAULT ((1)) FOR [isactive]
GO
ALTER TABLE [dbo].[tbl_users] ADD  DEFAULT ((0)) FOR [isdeleted]
GO
ALTER TABLE [dbo].[tbl_users] ADD  DEFAULT (getdate()) FOR [rcm]
GO
ALTER TABLE [dbo].[tbl_variant_rating_summary] ADD  DEFAULT ((0)) FOR [avg_rating]
GO
ALTER TABLE [dbo].[tbl_variant_rating_summary] ADD  DEFAULT ((0)) FOR [total_reviews]
GO
ALTER TABLE [dbo].[tbl_variant_rating_summary] ADD  DEFAULT (getdate()) FOR [rcm]
GO
ALTER TABLE [dbo].[tbl_wishlist_items] ADD  DEFAULT (CONVERT([varchar](36),newid())) FOR [wishlist_item_id]
GO
ALTER TABLE [dbo].[tbl_wishlist_items] ADD  DEFAULT (getdate()) FOR [added_at]
GO
ALTER TABLE [dbo].[tbl_wishlist_items] ADD  DEFAULT ((1)) FOR [isactive]
GO
ALTER TABLE [dbo].[tbl_wishlist_items] ADD  DEFAULT ((0)) FOR [isdeleted]
GO
ALTER TABLE [dbo].[tbl_wishlist_items] ADD  DEFAULT (getdate()) FOR [rcm]
GO
ALTER TABLE [dbo].[tbl_wishlists] ADD  DEFAULT (CONVERT([varchar](36),newid())) FOR [wishlist_id]
GO
ALTER TABLE [dbo].[tbl_wishlists] ADD  DEFAULT ('my wishlist') FOR [wishlist_name]
GO
ALTER TABLE [dbo].[tbl_wishlists] ADD  DEFAULT ((1)) FOR [isactive]
GO
ALTER TABLE [dbo].[tbl_wishlists] ADD  DEFAULT ((0)) FOR [isdeleted]
GO
ALTER TABLE [dbo].[tbl_wishlists] ADD  DEFAULT (getdate()) FOR [rcm]
GO
ALTER TABLE [dbo].[tbl_appointment_slot_blocks]  WITH CHECK ADD  CONSTRAINT [FK_slot_blocks_date_slots] FOREIGN KEY([appointment_date_slot_id])
REFERENCES [dbo].[tbl_appointment_date_slots] ([appointment_date_slot_id])
GO
ALTER TABLE [dbo].[tbl_appointment_slot_blocks] CHECK CONSTRAINT [FK_slot_blocks_date_slots]
GO
ALTER TABLE [dbo].[tbl_appointment_time_slots]  WITH NOCHECK ADD  CONSTRAINT [FK_time_slots_appointments] FOREIGN KEY([appointment_id])
REFERENCES [dbo].[tbl_custom_appointments] ([appointment_id])
GO
ALTER TABLE [dbo].[tbl_appointment_time_slots] CHECK CONSTRAINT [FK_time_slots_appointments]
GO
ALTER TABLE [dbo].[tbl_appointment_time_slots]  WITH CHECK ADD  CONSTRAINT [FK_time_slots_date_slots] FOREIGN KEY([appointment_date_slot_id])
REFERENCES [dbo].[tbl_appointment_date_slots] ([appointment_date_slot_id])
GO
ALTER TABLE [dbo].[tbl_appointment_time_slots] CHECK CONSTRAINT [FK_time_slots_date_slots]
GO
ALTER TABLE [dbo].[tbl_cart_items]  WITH CHECK ADD  CONSTRAINT [fk_tbl_cart_items_cart] FOREIGN KEY([cart_id])
REFERENCES [dbo].[tbl_carts] ([cart_id])
GO
ALTER TABLE [dbo].[tbl_cart_items] CHECK CONSTRAINT [fk_tbl_cart_items_cart]
GO
ALTER TABLE [dbo].[tbl_cart_items]  WITH CHECK ADD  CONSTRAINT [fk_tbl_cart_items_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[tbl_products] ([product_id])
GO
ALTER TABLE [dbo].[tbl_cart_items] CHECK CONSTRAINT [fk_tbl_cart_items_product]
GO
ALTER TABLE [dbo].[tbl_cart_items]  WITH CHECK ADD  CONSTRAINT [fk_tbl_cart_items_variant] FOREIGN KEY([product_variant_id])
REFERENCES [dbo].[tbl_product_variants] ([product_variant_id])
GO
ALTER TABLE [dbo].[tbl_cart_items] CHECK CONSTRAINT [fk_tbl_cart_items_variant]
GO
ALTER TABLE [dbo].[tbl_cloth_type_care_instructions]  WITH CHECK ADD  CONSTRAINT [fk_tbl_ctci_care_instruction] FOREIGN KEY([care_instruction_id])
REFERENCES [dbo].[tbl_care_instructions] ([care_instruction_id])
GO
ALTER TABLE [dbo].[tbl_cloth_type_care_instructions] CHECK CONSTRAINT [fk_tbl_ctci_care_instruction]
GO
ALTER TABLE [dbo].[tbl_cloth_type_care_instructions]  WITH CHECK ADD  CONSTRAINT [fk_tbl_ctci_cloth_type] FOREIGN KEY([cloth_type_id])
REFERENCES [dbo].[tbl_cloth_types] ([cloth_type_id])
GO
ALTER TABLE [dbo].[tbl_cloth_type_care_instructions] CHECK CONSTRAINT [fk_tbl_ctci_cloth_type]
GO
ALTER TABLE [dbo].[tbl_coupon_usage]  WITH CHECK ADD  CONSTRAINT [fk_tbl_coupon_usage_coupon] FOREIGN KEY([coupon_id])
REFERENCES [dbo].[tbl_coupons] ([coupon_id])
GO
ALTER TABLE [dbo].[tbl_coupon_usage] CHECK CONSTRAINT [fk_tbl_coupon_usage_coupon]
GO
ALTER TABLE [dbo].[tbl_coupon_usage]  WITH CHECK ADD  CONSTRAINT [fk_tbl_coupon_usage_order] FOREIGN KEY([order_id])
REFERENCES [dbo].[tbl_orders] ([order_id])
GO
ALTER TABLE [dbo].[tbl_coupon_usage] CHECK CONSTRAINT [fk_tbl_coupon_usage_order]
GO
ALTER TABLE [dbo].[tbl_custom_appointments]  WITH CHECK ADD  CONSTRAINT [FK_custom_appointments_date_slots] FOREIGN KEY([appointment_date_slot_id])
REFERENCES [dbo].[tbl_appointment_date_slots] ([appointment_date_slot_id])
GO
ALTER TABLE [dbo].[tbl_custom_appointments] CHECK CONSTRAINT [FK_custom_appointments_date_slots]
GO
ALTER TABLE [dbo].[tbl_custom_appointments]  WITH CHECK ADD  CONSTRAINT [FK_custom_appointments_time_slots] FOREIGN KEY([appointment_time_slot_id])
REFERENCES [dbo].[tbl_appointment_time_slots] ([appointment_time_slot_id])
GO
ALTER TABLE [dbo].[tbl_custom_appointments] CHECK CONSTRAINT [FK_custom_appointments_time_slots]
GO
ALTER TABLE [dbo].[tbl_customer_profiles]  WITH CHECK ADD  CONSTRAINT [fk_tbl_customer_profiles_user] FOREIGN KEY([user_id])
REFERENCES [dbo].[tbl_users] ([user_id])
GO
ALTER TABLE [dbo].[tbl_customer_profiles] CHECK CONSTRAINT [fk_tbl_customer_profiles_user]
GO
ALTER TABLE [dbo].[tbl_discount_targets]  WITH CHECK ADD  CONSTRAINT [fk_tbl_discount_targets_discount] FOREIGN KEY([discount_id])
REFERENCES [dbo].[tbl_discounts] ([discount_id])
GO
ALTER TABLE [dbo].[tbl_discount_targets] CHECK CONSTRAINT [fk_tbl_discount_targets_discount]
GO
ALTER TABLE [dbo].[tbl_invoices]  WITH CHECK ADD  CONSTRAINT [fk_tbl_invoices_order] FOREIGN KEY([order_id])
REFERENCES [dbo].[tbl_orders] ([order_id])
GO
ALTER TABLE [dbo].[tbl_invoices] CHECK CONSTRAINT [fk_tbl_invoices_order]
GO
ALTER TABLE [dbo].[tbl_menu_subcategories]  WITH CHECK ADD  CONSTRAINT [fk_tbl_menu_subcategories_category] FOREIGN KEY([menu_category_id])
REFERENCES [dbo].[tbl_menu_categories] ([menu_category_id])
GO
ALTER TABLE [dbo].[tbl_menu_subcategories] CHECK CONSTRAINT [fk_tbl_menu_subcategories_category]
GO
ALTER TABLE [dbo].[tbl_newsletter_subscriptions]  WITH CHECK ADD  CONSTRAINT [FK_tbl_newsletter_subscriptions_users] FOREIGN KEY([user_id])
REFERENCES [dbo].[tbl_users] ([user_id])
GO
ALTER TABLE [dbo].[tbl_newsletter_subscriptions] CHECK CONSTRAINT [FK_tbl_newsletter_subscriptions_users]
GO
ALTER TABLE [dbo].[tbl_order_addresses]  WITH CHECK ADD  CONSTRAINT [fk_tbl_order_addresses_order] FOREIGN KEY([order_id])
REFERENCES [dbo].[tbl_orders] ([order_id])
GO
ALTER TABLE [dbo].[tbl_order_addresses] CHECK CONSTRAINT [fk_tbl_order_addresses_order]
GO
ALTER TABLE [dbo].[tbl_order_cancellations]  WITH CHECK ADD  CONSTRAINT [fk_tbl_order_cancellations_order] FOREIGN KEY([order_id])
REFERENCES [dbo].[tbl_orders] ([order_id])
GO
ALTER TABLE [dbo].[tbl_order_cancellations] CHECK CONSTRAINT [fk_tbl_order_cancellations_order]
GO
ALTER TABLE [dbo].[tbl_order_items]  WITH CHECK ADD  CONSTRAINT [fk_tbl_order_items_order] FOREIGN KEY([order_id])
REFERENCES [dbo].[tbl_orders] ([order_id])
GO
ALTER TABLE [dbo].[tbl_order_items] CHECK CONSTRAINT [fk_tbl_order_items_order]
GO
ALTER TABLE [dbo].[tbl_order_items]  WITH CHECK ADD  CONSTRAINT [fk_tbl_order_items_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[tbl_products] ([product_id])
GO
ALTER TABLE [dbo].[tbl_order_items] CHECK CONSTRAINT [fk_tbl_order_items_product]
GO
ALTER TABLE [dbo].[tbl_order_items]  WITH CHECK ADD  CONSTRAINT [fk_tbl_order_items_variant] FOREIGN KEY([product_variant_id])
REFERENCES [dbo].[tbl_product_variants] ([product_variant_id])
GO
ALTER TABLE [dbo].[tbl_order_items] CHECK CONSTRAINT [fk_tbl_order_items_variant]
GO
ALTER TABLE [dbo].[tbl_order_promotions]  WITH CHECK ADD  CONSTRAINT [fk_tbl_order_promotions_order] FOREIGN KEY([order_id])
REFERENCES [dbo].[tbl_orders] ([order_id])
GO
ALTER TABLE [dbo].[tbl_order_promotions] CHECK CONSTRAINT [fk_tbl_order_promotions_order]
GO
ALTER TABLE [dbo].[tbl_order_status_history]  WITH CHECK ADD  CONSTRAINT [fk_tbl_order_status_history_order] FOREIGN KEY([order_id])
REFERENCES [dbo].[tbl_orders] ([order_id])
GO
ALTER TABLE [dbo].[tbl_order_status_history] CHECK CONSTRAINT [fk_tbl_order_status_history_order]
GO
ALTER TABLE [dbo].[tbl_order_status_history]  WITH CHECK ADD  CONSTRAINT [fk_tbl_order_status_history_status] FOREIGN KEY([order_status_id])
REFERENCES [dbo].[tbl_order_status_master] ([order_status_id])
GO
ALTER TABLE [dbo].[tbl_order_status_history] CHECK CONSTRAINT [fk_tbl_order_status_history_status]
GO
ALTER TABLE [dbo].[tbl_orders]  WITH CHECK ADD  CONSTRAINT [fk_tbl_orders_cart] FOREIGN KEY([cart_id])
REFERENCES [dbo].[tbl_carts] ([cart_id])
GO
ALTER TABLE [dbo].[tbl_orders] CHECK CONSTRAINT [fk_tbl_orders_cart]
GO
ALTER TABLE [dbo].[tbl_orders]  WITH CHECK ADD  CONSTRAINT [fk_tbl_orders_status] FOREIGN KEY([order_status_id])
REFERENCES [dbo].[tbl_order_status_master] ([order_status_id])
GO
ALTER TABLE [dbo].[tbl_orders] CHECK CONSTRAINT [fk_tbl_orders_status]
GO
ALTER TABLE [dbo].[tbl_payments]  WITH CHECK ADD  CONSTRAINT [fk_tbl_payments_order] FOREIGN KEY([order_id])
REFERENCES [dbo].[tbl_orders] ([order_id])
GO
ALTER TABLE [dbo].[tbl_payments] CHECK CONSTRAINT [fk_tbl_payments_order]
GO
ALTER TABLE [dbo].[tbl_product_attribute_values]  WITH CHECK ADD  CONSTRAINT [fk_tbl_pav_attribute] FOREIGN KEY([attribute_id])
REFERENCES [dbo].[tbl_attributes] ([attribute_id])
GO
ALTER TABLE [dbo].[tbl_product_attribute_values] CHECK CONSTRAINT [fk_tbl_pav_attribute]
GO
ALTER TABLE [dbo].[tbl_product_attribute_values]  WITH CHECK ADD  CONSTRAINT [fk_tbl_pav_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[tbl_products] ([product_id])
GO
ALTER TABLE [dbo].[tbl_product_attribute_values] CHECK CONSTRAINT [fk_tbl_pav_product]
GO
ALTER TABLE [dbo].[tbl_product_attribute_values]  WITH CHECK ADD  CONSTRAINT [fk_tbl_pav_variant] FOREIGN KEY([product_variant_id])
REFERENCES [dbo].[tbl_product_variants] ([product_variant_id])
GO
ALTER TABLE [dbo].[tbl_product_attribute_values] CHECK CONSTRAINT [fk_tbl_pav_variant]
GO
ALTER TABLE [dbo].[tbl_product_media]  WITH CHECK ADD  CONSTRAINT [fk_tbl_product_media_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[tbl_products] ([product_id])
GO
ALTER TABLE [dbo].[tbl_product_media] CHECK CONSTRAINT [fk_tbl_product_media_product]
GO
ALTER TABLE [dbo].[tbl_product_media]  WITH CHECK ADD  CONSTRAINT [fk_tbl_product_media_variant] FOREIGN KEY([product_variant_id])
REFERENCES [dbo].[tbl_product_variants] ([product_variant_id])
GO
ALTER TABLE [dbo].[tbl_product_media] CHECK CONSTRAINT [fk_tbl_product_media_variant]
GO
ALTER TABLE [dbo].[tbl_product_reviews]  WITH CHECK ADD  CONSTRAINT [fk_tbl_product_reviews_order_item] FOREIGN KEY([order_item_id])
REFERENCES [dbo].[tbl_order_items] ([order_item_id])
GO
ALTER TABLE [dbo].[tbl_product_reviews] CHECK CONSTRAINT [fk_tbl_product_reviews_order_item]
GO
ALTER TABLE [dbo].[tbl_product_reviews]  WITH CHECK ADD  CONSTRAINT [fk_tbl_product_reviews_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[tbl_products] ([product_id])
GO
ALTER TABLE [dbo].[tbl_product_reviews] CHECK CONSTRAINT [fk_tbl_product_reviews_product]
GO
ALTER TABLE [dbo].[tbl_product_reviews]  WITH CHECK ADD  CONSTRAINT [fk_tbl_product_reviews_user] FOREIGN KEY([user_id])
REFERENCES [dbo].[tbl_users] ([user_id])
GO
ALTER TABLE [dbo].[tbl_product_reviews] CHECK CONSTRAINT [fk_tbl_product_reviews_user]
GO
ALTER TABLE [dbo].[tbl_product_seo]  WITH CHECK ADD  CONSTRAINT [fk_tbl_product_seo_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[tbl_products] ([product_id])
GO
ALTER TABLE [dbo].[tbl_product_seo] CHECK CONSTRAINT [fk_tbl_product_seo_product]
GO
ALTER TABLE [dbo].[tbl_product_variants]  WITH CHECK ADD  CONSTRAINT [fk_tbl_product_variants_cloth_type] FOREIGN KEY([cloth_type_id])
REFERENCES [dbo].[tbl_cloth_types] ([cloth_type_id])
GO
ALTER TABLE [dbo].[tbl_product_variants] CHECK CONSTRAINT [fk_tbl_product_variants_cloth_type]
GO
ALTER TABLE [dbo].[tbl_product_variants]  WITH CHECK ADD  CONSTRAINT [fk_tbl_product_variants_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[tbl_products] ([product_id])
GO
ALTER TABLE [dbo].[tbl_product_variants] CHECK CONSTRAINT [fk_tbl_product_variants_product]
GO
ALTER TABLE [dbo].[tbl_product_variants]  WITH CHECK ADD  CONSTRAINT [fk_tbl_product_variants_size] FOREIGN KEY([size_id])
REFERENCES [dbo].[tbl_sizes] ([size_id])
GO
ALTER TABLE [dbo].[tbl_product_variants] CHECK CONSTRAINT [fk_tbl_product_variants_size]
GO
ALTER TABLE [dbo].[tbl_refunds]  WITH CHECK ADD  CONSTRAINT [fk_tbl_refunds_order] FOREIGN KEY([order_id])
REFERENCES [dbo].[tbl_orders] ([order_id])
GO
ALTER TABLE [dbo].[tbl_refunds] CHECK CONSTRAINT [fk_tbl_refunds_order]
GO
ALTER TABLE [dbo].[tbl_refunds]  WITH CHECK ADD  CONSTRAINT [fk_tbl_refunds_payment] FOREIGN KEY([payment_id])
REFERENCES [dbo].[tbl_payments] ([payment_id])
GO
ALTER TABLE [dbo].[tbl_refunds] CHECK CONSTRAINT [fk_tbl_refunds_payment]
GO
ALTER TABLE [dbo].[tbl_refunds]  WITH CHECK ADD  CONSTRAINT [fk_tbl_refunds_return] FOREIGN KEY([return_id])
REFERENCES [dbo].[tbl_returns] ([return_id])
GO
ALTER TABLE [dbo].[tbl_refunds] CHECK CONSTRAINT [fk_tbl_refunds_return]
GO
ALTER TABLE [dbo].[tbl_returns]  WITH CHECK ADD  CONSTRAINT [fk_tbl_returns_order] FOREIGN KEY([order_id])
REFERENCES [dbo].[tbl_orders] ([order_id])
GO
ALTER TABLE [dbo].[tbl_returns] CHECK CONSTRAINT [fk_tbl_returns_order]
GO
ALTER TABLE [dbo].[tbl_review_media]  WITH CHECK ADD  CONSTRAINT [FK_review_media_review] FOREIGN KEY([review_id])
REFERENCES [dbo].[tbl_reviews] ([review_id])
GO
ALTER TABLE [dbo].[tbl_review_media] CHECK CONSTRAINT [FK_review_media_review]
GO
ALTER TABLE [dbo].[tbl_review_responses]  WITH CHECK ADD  CONSTRAINT [fk_tbl_review_responses_review] FOREIGN KEY([product_review_id])
REFERENCES [dbo].[tbl_product_reviews] ([product_review_id])
GO
ALTER TABLE [dbo].[tbl_review_responses] CHECK CONSTRAINT [fk_tbl_review_responses_review]
GO
ALTER TABLE [dbo].[tbl_review_responses]  WITH CHECK ADD  CONSTRAINT [fk_tbl_review_responses_user] FOREIGN KEY([responder_user_id])
REFERENCES [dbo].[tbl_users] ([user_id])
GO
ALTER TABLE [dbo].[tbl_review_responses] CHECK CONSTRAINT [fk_tbl_review_responses_user]
GO
ALTER TABLE [dbo].[tbl_review_votes]  WITH CHECK ADD  CONSTRAINT [FK_review_votes_review] FOREIGN KEY([review_id])
REFERENCES [dbo].[tbl_reviews] ([review_id])
GO
ALTER TABLE [dbo].[tbl_review_votes] CHECK CONSTRAINT [FK_review_votes_review]
GO
ALTER TABLE [dbo].[tbl_running_bar_items]  WITH CHECK ADD  CONSTRAINT [fk_tbl_running_bar_items_bar] FOREIGN KEY([running_bar_id])
REFERENCES [dbo].[tbl_running_bars] ([running_bar_id])
GO
ALTER TABLE [dbo].[tbl_running_bar_items] CHECK CONSTRAINT [fk_tbl_running_bar_items_bar]
GO
ALTER TABLE [dbo].[tbl_shipments]  WITH CHECK ADD  CONSTRAINT [fk_tbl_shipments_courier] FOREIGN KEY([courier_partner_id])
REFERENCES [dbo].[tbl_courier_partners] ([courier_partner_id])
GO
ALTER TABLE [dbo].[tbl_shipments] CHECK CONSTRAINT [fk_tbl_shipments_courier]
GO
ALTER TABLE [dbo].[tbl_shipments]  WITH CHECK ADD  CONSTRAINT [fk_tbl_shipments_order] FOREIGN KEY([order_id])
REFERENCES [dbo].[tbl_orders] ([order_id])
GO
ALTER TABLE [dbo].[tbl_shipments] CHECK CONSTRAINT [fk_tbl_shipments_order]
GO
ALTER TABLE [dbo].[tbl_user_roles]  WITH CHECK ADD  CONSTRAINT [fk_tbl_user_roles_role] FOREIGN KEY([role_id])
REFERENCES [dbo].[tbl_roles] ([role_id])
GO
ALTER TABLE [dbo].[tbl_user_roles] CHECK CONSTRAINT [fk_tbl_user_roles_role]
GO
ALTER TABLE [dbo].[tbl_wishlist_items]  WITH CHECK ADD  CONSTRAINT [fk_tbl_wishlist_items_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[tbl_products] ([product_id])
GO
ALTER TABLE [dbo].[tbl_wishlist_items] CHECK CONSTRAINT [fk_tbl_wishlist_items_product]
GO
ALTER TABLE [dbo].[tbl_wishlist_items]  WITH CHECK ADD  CONSTRAINT [fk_tbl_wishlist_items_variant] FOREIGN KEY([product_variant_id])
REFERENCES [dbo].[tbl_product_variants] ([product_variant_id])
GO
ALTER TABLE [dbo].[tbl_wishlist_items] CHECK CONSTRAINT [fk_tbl_wishlist_items_variant]
GO
ALTER TABLE [dbo].[tbl_wishlist_items]  WITH CHECK ADD  CONSTRAINT [fk_tbl_wishlist_items_wishlist] FOREIGN KEY([wishlist_id])
REFERENCES [dbo].[tbl_wishlists] ([wishlist_id])
GO
ALTER TABLE [dbo].[tbl_wishlist_items] CHECK CONSTRAINT [fk_tbl_wishlist_items_wishlist]
GO
ALTER TABLE [dbo].[tbl_appointment_date_slots]  WITH CHECK ADD  CONSTRAINT [CK_tbl_appointment_date_slots_duration] CHECK  (([slot_duration_minutes]=(120) OR [slot_duration_minutes]=(90) OR [slot_duration_minutes]=(60) OR [slot_duration_minutes]=(45) OR [slot_duration_minutes]=(30) OR [slot_duration_minutes]=(15)))
GO
ALTER TABLE [dbo].[tbl_appointment_date_slots] CHECK CONSTRAINT [CK_tbl_appointment_date_slots_duration]
GO
ALTER TABLE [dbo].[tbl_appointment_slot_blocks]  WITH CHECK ADD  CONSTRAINT [CK_tbl_appointment_slot_blocks_time_range] CHECK  (([block_end_time]>[block_start_time]))
GO
ALTER TABLE [dbo].[tbl_appointment_slot_blocks] CHECK CONSTRAINT [CK_tbl_appointment_slot_blocks_time_range]
GO
ALTER TABLE [dbo].[tbl_appointment_time_slots]  WITH CHECK ADD  CONSTRAINT [CK_tbl_appointment_time_slots_time_range] CHECK  (([slot_end_time]>[slot_start_time]))
GO
ALTER TABLE [dbo].[tbl_appointment_time_slots] CHECK CONSTRAINT [CK_tbl_appointment_time_slots_time_range]
GO
ALTER TABLE [dbo].[tbl_cart_items]  WITH CHECK ADD  CONSTRAINT [ck_tbl_cart_items_qty] CHECK  (([qty]>(0)))
GO
ALTER TABLE [dbo].[tbl_cart_items] CHECK CONSTRAINT [ck_tbl_cart_items_qty]
GO
ALTER TABLE [dbo].[tbl_carts]  WITH CHECK ADD  CONSTRAINT [ck_tbl_carts_status] CHECK  (([cart_status]='abandoned' OR [cart_status]='checkedout' OR [cart_status]='active'))
GO
ALTER TABLE [dbo].[tbl_carts] CHECK CONSTRAINT [ck_tbl_carts_status]
GO
ALTER TABLE [dbo].[tbl_coupons]  WITH CHECK ADD  CONSTRAINT [ck_tbl_coupons_discount_type] CHECK  (([discount_type]='fixed' OR [discount_type]='percentage'))
GO
ALTER TABLE [dbo].[tbl_coupons] CHECK CONSTRAINT [ck_tbl_coupons_discount_type]
GO
ALTER TABLE [dbo].[tbl_coupons]  WITH CHECK ADD  CONSTRAINT [ck_tbl_coupons_discount_value] CHECK  (([discount_value]>(0)))
GO
ALTER TABLE [dbo].[tbl_coupons] CHECK CONSTRAINT [ck_tbl_coupons_discount_value]
GO
ALTER TABLE [dbo].[tbl_custom_appointments]  WITH CHECK ADD  CONSTRAINT [CK_tbl_custom_appointments_status] CHECK  (([appointment_status]='completed' OR [appointment_status]='cancelled' OR [appointment_status]='rejected' OR [appointment_status]='approved' OR [appointment_status]='requested'))
GO
ALTER TABLE [dbo].[tbl_custom_appointments] CHECK CONSTRAINT [CK_tbl_custom_appointments_status]
GO
ALTER TABLE [dbo].[tbl_discount_targets]  WITH CHECK ADD  CONSTRAINT [ck_tbl_discount_targets_type] CHECK  (([target_type]='all' OR [target_type]='collection' OR [target_type]='category' OR [target_type]='product'))
GO
ALTER TABLE [dbo].[tbl_discount_targets] CHECK CONSTRAINT [ck_tbl_discount_targets_type]
GO
ALTER TABLE [dbo].[tbl_discounts]  WITH CHECK ADD  CONSTRAINT [ck_tbl_discounts_discount_type] CHECK  (([discount_type]='fixed' OR [discount_type]='percentage'))
GO
ALTER TABLE [dbo].[tbl_discounts] CHECK CONSTRAINT [ck_tbl_discounts_discount_type]
GO
ALTER TABLE [dbo].[tbl_discounts]  WITH CHECK ADD  CONSTRAINT [ck_tbl_discounts_discount_value] CHECK  (([discount_value]>(0)))
GO
ALTER TABLE [dbo].[tbl_discounts] CHECK CONSTRAINT [ck_tbl_discounts_discount_value]
GO
ALTER TABLE [dbo].[tbl_discounts]  WITH CHECK ADD  CONSTRAINT [ck_tbl_discounts_priority] CHECK  (([discount_priority]>(0)))
GO
ALTER TABLE [dbo].[tbl_discounts] CHECK CONSTRAINT [ck_tbl_discounts_priority]
GO
ALTER TABLE [dbo].[tbl_order_addresses]  WITH CHECK ADD  CONSTRAINT [ck_tbl_order_addresses_type] CHECK  (([address_type]='billing' OR [address_type]='shipping'))
GO
ALTER TABLE [dbo].[tbl_order_addresses] CHECK CONSTRAINT [ck_tbl_order_addresses_type]
GO
ALTER TABLE [dbo].[tbl_order_promotions]  WITH CHECK ADD  CONSTRAINT [ck_tbl_order_promotions_type] CHECK  (([promotion_type]='referral' OR [promotion_type]='automatic' OR [promotion_type]='discount' OR [promotion_type]='coupon'))
GO
ALTER TABLE [dbo].[tbl_order_promotions] CHECK CONSTRAINT [ck_tbl_order_promotions_type]
GO
ALTER TABLE [dbo].[tbl_payments]  WITH CHECK ADD  CONSTRAINT [ck_tbl_payments_amount] CHECK  (([amount]>(0)))
GO
ALTER TABLE [dbo].[tbl_payments] CHECK CONSTRAINT [ck_tbl_payments_amount]
GO
ALTER TABLE [dbo].[tbl_payments]  WITH CHECK ADD  CONSTRAINT [ck_tbl_payments_status] CHECK  (([payment_status]='refunded' OR [payment_status]='failed' OR [payment_status]='paid' OR [payment_status]='pending'))
GO
ALTER TABLE [dbo].[tbl_payments] CHECK CONSTRAINT [ck_tbl_payments_status]
GO
ALTER TABLE [dbo].[tbl_product_reviews]  WITH CHECK ADD  CONSTRAINT [ck_tbl_product_reviews_rating] CHECK  (([rating]>=(1) AND [rating]<=(5)))
GO
ALTER TABLE [dbo].[tbl_product_reviews] CHECK CONSTRAINT [ck_tbl_product_reviews_rating]
GO
ALTER TABLE [dbo].[tbl_product_reviews]  WITH CHECK ADD  CONSTRAINT [ck_tbl_product_reviews_status] CHECK  (([review_status]='rejected' OR [review_status]='approved' OR [review_status]='pending'))
GO
ALTER TABLE [dbo].[tbl_product_reviews] CHECK CONSTRAINT [ck_tbl_product_reviews_status]
GO
ALTER TABLE [dbo].[tbl_refunds]  WITH CHECK ADD  CONSTRAINT [ck_tbl_refunds_amount] CHECK  (([refund_amount]>(0)))
GO
ALTER TABLE [dbo].[tbl_refunds] CHECK CONSTRAINT [ck_tbl_refunds_amount]
GO
ALTER TABLE [dbo].[tbl_refunds]  WITH CHECK ADD  CONSTRAINT [ck_tbl_refunds_method] CHECK  (([refund_method]='bank_transfer' OR [refund_method]='wallet' OR [refund_method]='original_payment'))
GO
ALTER TABLE [dbo].[tbl_refunds] CHECK CONSTRAINT [ck_tbl_refunds_method]
GO
ALTER TABLE [dbo].[tbl_refunds]  WITH CHECK ADD  CONSTRAINT [ck_tbl_refunds_status] CHECK  (([refund_status]='cancelled' OR [refund_status]='failed' OR [refund_status]='completed' OR [refund_status]='processed' OR [refund_status]='initiated'))
GO
ALTER TABLE [dbo].[tbl_refunds] CHECK CONSTRAINT [ck_tbl_refunds_status]
GO
ALTER TABLE [dbo].[tbl_refunds]  WITH CHECK ADD  CONSTRAINT [ck_tbl_refunds_type] CHECK  (([refund_type]='partial' OR [refund_type]='full'))
GO
ALTER TABLE [dbo].[tbl_refunds] CHECK CONSTRAINT [ck_tbl_refunds_type]
GO
ALTER TABLE [dbo].[tbl_returns]  WITH CHECK ADD  CONSTRAINT [ck_tbl_returns_reason] CHECK  (([return_reason_code]='other' OR [return_reason_code]='not_as_described' OR [return_reason_code]='changed_mind' OR [return_reason_code]='damaged' OR [return_reason_code]='wrong_size' OR [return_reason_code]='defective'))
GO
ALTER TABLE [dbo].[tbl_returns] CHECK CONSTRAINT [ck_tbl_returns_reason]
GO
ALTER TABLE [dbo].[tbl_returns]  WITH CHECK ADD  CONSTRAINT [ck_tbl_returns_status] CHECK  (([return_status]='processed' OR [return_status]='received' OR [return_status]='rejected' OR [return_status]='approved' OR [return_status]='requested'))
GO
ALTER TABLE [dbo].[tbl_returns] CHECK CONSTRAINT [ck_tbl_returns_status]
GO
ALTER TABLE [dbo].[tbl_returns]  WITH CHECK ADD  CONSTRAINT [ck_tbl_returns_type] CHECK  (([return_type]='partial' OR [return_type]='full'))
GO
ALTER TABLE [dbo].[tbl_returns] CHECK CONSTRAINT [ck_tbl_returns_type]
GO
ALTER TABLE [dbo].[tbl_reviews]  WITH CHECK ADD CHECK  (([rating]>=(1) AND [rating]<=(5)))
GO
ALTER TABLE [dbo].[tbl_shipment_events]  WITH CHECK ADD  CONSTRAINT [ck_tbl_shipment_events_status] CHECK  (([event_status]='exception' OR [event_status]='returned' OR [event_status]='failed' OR [event_status]='delivered' OR [event_status]='out_for_delivery' OR [event_status]='in_transit' OR [event_status]='dispatched' OR [event_status]='pickup_scheduled'))
GO
ALTER TABLE [dbo].[tbl_shipment_events] CHECK CONSTRAINT [ck_tbl_shipment_events_status]
GO
ALTER TABLE [dbo].[tbl_shipments]  WITH CHECK ADD  CONSTRAINT [ck_tbl_shipments_status] CHECK  (([shipment_status]='cancelled' OR [shipment_status]='failed' OR [shipment_status]='delivered' OR [shipment_status]='in-transit' OR [shipment_status]='shipped' OR [shipment_status]='pending'))
GO
ALTER TABLE [dbo].[tbl_shipments] CHECK CONSTRAINT [ck_tbl_shipments_status]
GO
/****** Object:  StoredProcedure [dbo].[sp_check_email_exists]    Script Date: 30-06-2026 19:59:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_check_email_exists]
    @email_id VARCHAR(255),
    @exists BIT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT 1 FROM dbo.tbl_users
        WHERE email = @email_id AND isdeleted = 0 AND isactive = 1
    )
        SET @exists = 1;
    ELSE
        SET @exists = 0;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_get_user_password]    Script Date: 30-06-2026 19:59:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_get_user_password]
    @email_id VARCHAR(255),
    @success BIT OUTPUT,
    @message VARCHAR(500) OUTPUT,
    @password_hash VARCHAR(255) OUTPUT
AS
BEGIN
    BEGIN TRY
        IF NOT EXISTS (SELECT 1 FROM tbl_users WHERE email = @email_id AND isdeleted = 0 AND isactive = 1)
        BEGIN
            SET @success = 0;
            SET @message = 'User not found';
            SET @password_hash = NULL;
            RETURN;
        END

        SELECT @password_hash = password_hash
        FROM tbl_users
        WHERE email = @email_id AND isdeleted = 0 AND isactive = 1;

        IF @password_hash IS NULL
        BEGIN
            SET @success = 0;
            SET @message = 'Password not set for this user';
            RETURN;
        END

        SET @success = 1;
        SET @message = 'Password retrieved successfully';
    END TRY
    BEGIN CATCH
        SET @success = 0;
        SET @message = ERROR_MESSAGE();
        SET @password_hash = NULL;
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_login_user]    Script Date: 30-06-2026 19:59:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_login_user]
    @email_id VARCHAR(255),
    @password_hash VARCHAR(255),
    @success BIT OUTPUT,
    @message VARCHAR(500) OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        -- Check user exists
        IF NOT EXISTS (
            SELECT 1 FROM dbo.tbl_users
            WHERE email = @email_id AND isdeleted = 0 AND isactive = 1
        )
        BEGIN
            SET @success = 0;
            SET @message = 'User not found.';
            RETURN;
        END

        -- Validate password
        IF NOT EXISTS (
            SELECT 1 FROM dbo.tbl_users
            WHERE email = @email_id AND password_hash = @password_hash
              AND isdeleted = 0 AND isactive = 1
        )
        BEGIN
            SET @success = 0;
            SET @message = 'Invalid password.';
            RETURN;
        END

        -- Update last login timestamp
        UPDATE dbo.tbl_users
        SET last_login = GETDATE()
        WHERE email = @email_id AND isdeleted = 0 AND isactive = 1;

        -- Return user row (aliased for API compatibility)
        SELECT
            user_id,
            full_name,
            email        AS email_id,
            phone_number AS mobile_number,
            profile_picture_url AS profile_url,
            email_verified,
            phone_verified  AS mobile_verified,
            isactive        AS is_active,
            last_login      AS last_login_at,
            rcu, rcm, luu, lcm
        FROM dbo.tbl_users
        WHERE email = @email_id AND isdeleted = 0 AND isactive = 1;

        DECLARE @USER_ID VARCHAR(MAX);
        SELECT @USER_ID = user_id FROM dbo.tbl_users
        WHERE email = @email_id AND isdeleted = 0 AND isactive = 1;

        -- Return user roles
        SELECT roles.*
        FROM tbl_user_roles user_roles
        INNER JOIN tbl_roles roles ON roles.role_id = user_roles.role_id
        WHERE user_roles.user_id = @USER_ID AND user_roles.isdeleted = 0;

        SET @success = 1;
        SET @message = 'Login successful.';
    END TRY
    BEGIN CATCH
        SET @success = 0;
        SET @message = 'Error during login: ' + ERROR_MESSAGE();
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_otp_login_user]    Script Date: 30-06-2026 19:59:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_otp_login_user]
    @email_id VARCHAR(255),
    @success BIT OUTPUT,
    @message VARCHAR(500) OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        -- Check user exists
        IF NOT EXISTS (
            SELECT 1 FROM dbo.tbl_users
            WHERE email = @email_id AND isdeleted = 0 AND isactive = 1
        )
        BEGIN
            SET @success = 0;
            SET @message = 'User not found.';
            RETURN;
        END

        -- Update last login timestamp
        UPDATE dbo.tbl_users
        SET last_login = GETDATE()
        WHERE email = @email_id AND isdeleted = 0 AND isactive = 1;

        -- Return user row (aliased for API compatibility)
        SELECT TOP 1
            user_id,
            full_name,
            email        AS email_id,
            phone_number AS mobile_number,
            profile_picture_url AS profile_url,
            email_verified,
            phone_verified  AS mobile_verified,
            isactive        AS is_active,
            last_login      AS last_login_at,
            rcu, rcm, luu, lcm
        FROM dbo.tbl_users
        WHERE email = @email_id AND isdeleted = 0 AND isactive = 1;

        SET @success = 1;
        SET @message = 'Login successful.';
    END TRY
    BEGIN CATCH
        SET @success = 0;
        SET @message = 'Error during login: ' + ERROR_MESSAGE();
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_register_user]    Script Date: 30-06-2026 19:59:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_register_user]
    @full_name VARCHAR(255),
    @email_id VARCHAR(255),
    @mobile_number VARCHAR(50) = NULL,
    @profile_url VARCHAR(50) = NULL,
    @password_hash VARCHAR(255),
    @rcu VARCHAR(100),
    @user_id VARCHAR(36) OUTPUT,
    @success BIT OUTPUT,
    @message VARCHAR(500) OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    
    BEGIN TRY
        -- Check if email already exists
        IF EXISTS (SELECT 1 FROM dbo.tbl_users WHERE email = @email_id AND isdeleted = 0)
        BEGIN
            SET @success = 0;
            SET @message = 'Email already registered.';
            RETURN;
        END
        
        -- Check if phone number already exists (if provided)
        IF @mobile_number IS NOT NULL AND EXISTS (SELECT 1 FROM dbo.tbl_users WHERE phone_number = @mobile_number AND isdeleted = 0)
        BEGIN
            SET @success = 0;
            SET @message = 'Mobile number already registered.';
            RETURN;
        END
        
        -- Generate new user ID
        SET @user_id = CONVERT(VARCHAR(36), NEWID());

        DECLARE @CUSTOMER_ROLE_ID VARCHAR(MAX);
        SELECT @CUSTOMER_ROLE_ID = role_id FROM tbl_roles WHERE role_code = 'CUSTOMER';

        -- Insert new user
        INSERT INTO dbo.tbl_users (
            user_id, full_name, email, phone_number, profile_picture_url,
            password_hash, email_verified, phone_verified, isactive, isdeleted, rcu, rcm
        )
        VALUES (
            @user_id, @full_name, @email_id, @mobile_number, @profile_url,
            @password_hash, 0, 0, 1, 0, @rcu, GETDATE()
        );
        
        INSERT INTO tbl_user_roles (user_id, role_id, rcu)
        VALUES (@user_id, @CUSTOMER_ROLE_ID, @rcu);

        SET @success = 1;
        SET @message = 'User registered successfully.';
    END TRY
    BEGIN CATCH
        SET @success = 0;
        SET @message = 'Error during registration: ' + ERROR_MESSAGE();
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_reset_password]    Script Date: 30-06-2026 19:59:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_reset_password]
    @email_id VARCHAR(255),
    @old_password_hash VARCHAR(255),
    @new_password_hash VARCHAR(255),
    @luu VARCHAR(100),
    @success BIT OUTPUT,
    @message VARCHAR(500) OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        IF NOT EXISTS (
            SELECT 1 FROM dbo.tbl_users
            WHERE email = @email_id AND isdeleted = 0 AND isactive = 1
        )
        BEGIN
            SET @success = 0;
            SET @message = 'User not found.';
            RETURN;
        END

        IF NOT EXISTS (
            SELECT 1 FROM dbo.tbl_users
            WHERE email = @email_id AND password_hash = @old_password_hash
              AND isdeleted = 0 AND isactive = 1
        )
        BEGIN
            SET @success = 0;
            SET @message = 'Old password is incorrect.';
            RETURN;
        END

        UPDATE dbo.tbl_users
        SET password_hash = @new_password_hash,
            luu = @luu,
            lcm = GETDATE()
        WHERE email = @email_id AND isdeleted = 0 AND isactive = 1;

        SET @success = 1;
        SET @message = 'Password reset successfully.';
    END TRY
    BEGIN CATCH
        SET @success = 0;
        SET @message = 'Error during password reset: ' + ERROR_MESSAGE();
    END CATCH
END;
GO
USE [master]
GO
ALTER DATABASE [db_harry_clinton] SET  READ_WRITE 
GO
