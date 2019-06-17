CREATE TABLE `tbl_login`(
  `login_id` int(10) AUTO_INCREMENT,
  `username` VARCHAR(100) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  `created_at`  TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT 0,
  `is_deleted` TINYINT(1) DEFAULT '0',
   primary key(`login_id`)
);
CREATE TABLE `tbl_admin_activities`(
  `activity_id` int(10) AUTO_INCREMENT,
  `login_id` VARCHAR(100) NOT NULL,
  `activity` TEXT NOT NULL,
  `created_at`  TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
   primary key(`activity_id`)
);
CREATE TABLE `tbl_category`(
  `category_id` int(10) AUTO_INCREMENT,
  `name` VARCHAR(100) DEFAULT NULL,
  `created_at`  TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT 0,
  `is_deleted` TINYINT(1) DEFAULT '0',
   primary key(`category_id`)
);
CREATE TABLE `tbl_brand`(
  `brand_id` int(10) AUTO_INCREMENT,
  `name` VARCHAR(100) DEFAULT NULL,
  `image_path` TEXT DEFAULT NULL,
  `created_at`  TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT 0,
  `is_deleted` TINYINT(1) DEFAULT '0',
   primary key(`brand_id`)
);
CREATE TABLE `tbl_product_attributes`(
  `attributes_id` int(10) AUTO_INCREMENT,
  `name` VARCHAR(100) DEFAULT NULL,
  `values` TEXT DEFAULT NULL,
  `created_at`  TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT 0,
  `is_deleted` TINYINT(1) DEFAULT '0',
   primary key(`attributes_id`)
);
CREATE TABLE `tbl_products`(
  `prod_id` int(10) AUTO_INCREMENT,
  `category_id` int(10) NOT NULL,
  `brand_id` int(10) NOT NULL,
  `name` VARCHAR(100) DEFAULT NULL,
  `description` TEXT DEFAULT NULL,
  `image_path` TEXT DEFAULT NULL,
  `created_at`  TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT 0,
  `is_deleted` TINYINT(1) DEFAULT '0',
   primary key(`prod_id`)
);
CREATE TABLE `tbl_product_price`(
  `prod_price_id` int(10) AUTO_INCREMENT,
  `prod_id` int(10) NOT NULL,
  `price` FLOAT NOT NULL,
  `attributes_id` int(10) DEFAULT 0,
  `attributes_value` VARCHAR(50) DEFAULT NULL,
  `sold_as` VARCHAR(10) NOT NULL,
  `inventory` INT(10) NOT NULL DEFAULT 0,
  `tax_rate` INT(3) NOT NULL DEFAULT 0,
  `created_at`  TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT 0,
  `is_deleted` TINYINT(1) DEFAULT '0',
   primary key(`prod_price_id`)
);
CREATE TABLE `tbl_sales`(
  `sales_id` int(10) AUTO_INCREMENT,
  `prod_id` int(10) NOT NULL,
  `price` FLOAT NOT NULL,
  `qty` int(3) NOT NULL,
  `attributes_value` VARCHAR(50) DEFAULT NULL,
  `sold_as` VARCHAR(10) NOT NULL,
  `tax_rate` INT(3) NOT NULL DEFAULT 0,
  `total` FLOAT NOT NULL ,
  `order_id` int(10) NOT NULL,
  `sales_date` date NOT NULL,
  `created_at`  TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT 0,
  `is_deleted` TINYINT(1) DEFAULT '0',
   primary key(`sales_id`)
);
INSERT INTO `tbl_login` (`login_id`, `username`, `password`, `created_at`, `updated_at`, `is_deleted`) VALUES (NULL, 'admin', '21232f297a57a5a743894a0e4a801fc3', CURRENT_TIMESTAMP, '0000-00-00 00:00:00.000000', '0');
