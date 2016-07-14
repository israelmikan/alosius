-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 14, 2016 at 04:35 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `pos`
--

-- --------------------------------------------------------

--
-- Table structure for table `phppos_app_config`
--

CREATE TABLE IF NOT EXISTS `phppos_app_config` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `phppos_app_config`
--

INSERT INTO `phppos_app_config` (`key`, `value`) VALUES
('address', 'Bugolobi Kampala'),
('company', 'Nuwagira Alosius'),
('default_tax_1_name', 'Sales Tax'),
('default_tax_1_rate', ''),
('default_tax_2_name', 'Sales Tax 2'),
('default_tax_2_rate', ''),
('default_tax_rate', '8'),
('email', 'alosiusnuwagira@gmail.com'),
('fax', ''),
('phone', '256-705-957020'),
('print_after_sale', 'print_after_sale'),
('return_policy', 'damage'),
('version', '10.0'),
('website', '');

-- --------------------------------------------------------

--
-- Table structure for table `phppos_customers`
--

CREATE TABLE IF NOT EXISTS `phppos_customers` (
  `person_id` int(10) NOT NULL,
  `account_number` varchar(255) DEFAULT NULL,
  `taxable` int(1) NOT NULL DEFAULT '1',
  UNIQUE KEY `account_number` (`account_number`),
  KEY `person_id` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `phppos_customers`
--

INSERT INTO `phppos_customers` (`person_id`, `account_number`, `taxable`) VALUES
(2, '123456', 0),
(4, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `phppos_employees`
--

CREATE TABLE IF NOT EXISTS `phppos_employees` (
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `person_id` int(10) NOT NULL,
  UNIQUE KEY `username` (`username`),
  KEY `person_id` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `phppos_employees`
--

INSERT INTO `phppos_employees` (`username`, `password`, `person_id`) VALUES
('admin', 'f6fdffe48c908deb0f4c3bd36c032e72', 1),
('kasingye', '6bcd7a4884ce884d507e9679504f0116', 7);

-- --------------------------------------------------------

--
-- Table structure for table `phppos_items`
--

CREATE TABLE IF NOT EXISTS `phppos_items` (
  `name` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `item_number` varchar(255) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `cost_price` double(15,2) NOT NULL,
  `unit_price` double(15,2) NOT NULL,
  `quantity` int(10) NOT NULL DEFAULT '0',
  `reorder_level` int(10) NOT NULL DEFAULT '0',
  `item_id` int(10) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`item_id`),
  UNIQUE KEY `item_number` (`item_number`),
  KEY `phppos_items_ibfk_1` (`supplier_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `phppos_items`
--

INSERT INTO `phppos_items` (`name`, `category`, `supplier_id`, `item_number`, `description`, `cost_price`, `unit_price`, `quantity`, `reorder_level`, `item_id`) VALUES
('new vision', 'news paper', NULL, '123456', 'barclays bank', 2000.00, 1000.00, 14, 0, 1),
('daily monito', 'news paper', 3, '12345', '', 2000.00, 2000.00, 7, 0, 2),
('indepedent magazine', 'magazine', 5, 'indepedent', 'The Indepedent', 4000.00, 3500.00, 48, 4, 3);

-- --------------------------------------------------------

--
-- Table structure for table `phppos_items_taxes`
--

CREATE TABLE IF NOT EXISTS `phppos_items_taxes` (
  `item_id` int(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `percent` double(15,2) NOT NULL,
  PRIMARY KEY (`item_id`,`name`,`percent`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_modules`
--

CREATE TABLE IF NOT EXISTS `phppos_modules` (
  `name_lang_key` varchar(255) NOT NULL,
  `desc_lang_key` varchar(255) NOT NULL,
  `sort` int(10) NOT NULL,
  `module_id` varchar(255) NOT NULL,
  PRIMARY KEY (`module_id`),
  UNIQUE KEY `desc_lang_key` (`desc_lang_key`),
  UNIQUE KEY `name_lang_key` (`name_lang_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `phppos_modules`
--

INSERT INTO `phppos_modules` (`name_lang_key`, `desc_lang_key`, `sort`, `module_id`) VALUES
('module_config', 'module_config_desc', 6, 'config'),
('module_customers', 'module_customers_desc', 1, 'customers'),
('module_employees', 'module_employees_desc', 5, 'employees'),
('module_items', 'module_items_desc', 2, 'items'),
('module_reports', 'module_reports_desc', 3, 'reports'),
('module_sales', 'module_sales_desc', 4, 'sales'),
('module_suppliers', 'module_suppliers_desc', 3, 'suppliers');

-- --------------------------------------------------------

--
-- Table structure for table `phppos_people`
--

CREATE TABLE IF NOT EXISTS `phppos_people` (
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address_1` varchar(255) NOT NULL,
  `address_2` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zip` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `comments` text NOT NULL,
  `person_id` int(10) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`person_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `phppos_people`
--

INSERT INTO `phppos_people` (`first_name`, `last_name`, `phone_number`, `email`, `address_1`, `address_2`, `city`, `state`, `zip`, `country`, `comments`, `person_id`) VALUES
('nuwagira', 'alosius', '256-705957020', 'alosius@gmail.com', 'Bugolobi', 'kampala', 'Kampala', '', '256', '', '', 1),
('amos kasawuli', 'kabale', '1234567', 'kabale@uganda.ug', '', '', '', '', '256', '', '', 2),
('new vision', 'uganda', '', '', '', '', '', '', '', '', '', 3),
('kasingye', 'israel', '', '', '', '', '', '', '', '', '', 4),
('Vision Group', 'kabushenga', '', 'kashenbwa@gmail.com', '', '', '', '', '', '', '', 5),
('indepedent', 'Muwenda ', '', '', '', '', '', '', '', '', '', 6),
('kasingye', 'kasingye', '', '', '', '', '', '', '', '', '', 7);

-- --------------------------------------------------------

--
-- Table structure for table `phppos_permissions`
--

CREATE TABLE IF NOT EXISTS `phppos_permissions` (
  `module_id` varchar(255) NOT NULL,
  `person_id` int(10) NOT NULL,
  PRIMARY KEY (`module_id`,`person_id`),
  KEY `person_id` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `phppos_permissions`
--

INSERT INTO `phppos_permissions` (`module_id`, `person_id`) VALUES
('config', 1),
('customers', 1),
('employees', 1),
('items', 1),
('reports', 1),
('sales', 1),
('suppliers', 1),
('customers', 7),
('reports', 7),
('sales', 7),
('suppliers', 7);

-- --------------------------------------------------------

--
-- Table structure for table `phppos_sales`
--

CREATE TABLE IF NOT EXISTS `phppos_sales` (
  `sale_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `customer_id` int(10) DEFAULT NULL,
  `employee_id` int(10) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `sale_id` int(10) NOT NULL AUTO_INCREMENT,
  `payment_type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`sale_id`),
  KEY `customer_id` (`customer_id`),
  KEY `employee_id` (`employee_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `phppos_sales`
--

INSERT INTO `phppos_sales` (`sale_time`, `customer_id`, `employee_id`, `comment`, `sale_id`, `payment_type`) VALUES
('2016-07-14 14:10:37', 4, 1, '', 1, 'Cash'),
('2016-07-14 14:16:29', 2, 1, '', 2, 'Credit Card'),
('2016-07-14 14:19:36', 4, 1, '', 3, 'Cash'),
('2016-07-14 14:29:19', 4, 7, '', 4, 'Cash');

-- --------------------------------------------------------

--
-- Table structure for table `phppos_sales_items`
--

CREATE TABLE IF NOT EXISTS `phppos_sales_items` (
  `sale_id` int(10) NOT NULL DEFAULT '0',
  `item_id` int(10) NOT NULL DEFAULT '0',
  `quantity_purchased` int(10) NOT NULL DEFAULT '0',
  `item_cost_price` decimal(15,2) NOT NULL,
  `item_unit_price` double(15,2) NOT NULL,
  `discount_percent` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sale_id`,`item_id`),
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `phppos_sales_items`
--

INSERT INTO `phppos_sales_items` (`sale_id`, `item_id`, `quantity_purchased`, `item_cost_price`, `item_unit_price`, `discount_percent`) VALUES
(1, 1, 5, '2000.00', 1000.00, 0),
(1, 2, 2, '2000.00', 2000.00, 0),
(1, 3, 1, '4000.00', 3500.00, 0),
(2, 1, 1, '2000.00', 1000.00, 0),
(2, 2, 1, '2000.00', 2000.00, 0),
(3, 2, 1, '2000.00', 2000.00, 0),
(3, 3, 1, '4000.00', 3500.00, 0),
(4, 2, -1, '2000.00', 2000.00, 0);

-- --------------------------------------------------------

--
-- Table structure for table `phppos_sales_items_taxes`
--

CREATE TABLE IF NOT EXISTS `phppos_sales_items_taxes` (
  `sale_id` int(10) NOT NULL,
  `item_id` int(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `percent` double(15,2) NOT NULL,
  PRIMARY KEY (`sale_id`,`item_id`,`name`,`percent`),
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_sessions`
--

CREATE TABLE IF NOT EXISTS `phppos_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `user_agent` varchar(50) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text NOT NULL,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `phppos_sessions`
--

INSERT INTO `phppos_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES
('42f4223fcfbb0f43b6d21930bc7c2351', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko', 1468505762, 'a:1:{s:9:"person_id";s:1:"1";}'),
('833a88494de5c2a20421ac8fc8e6f7cd', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko', 1468506573, 'a:1:{s:9:"person_id";s:1:"1";}');

-- --------------------------------------------------------

--
-- Table structure for table `phppos_suppliers`
--

CREATE TABLE IF NOT EXISTS `phppos_suppliers` (
  `person_id` int(10) NOT NULL,
  `account_number` varchar(255) DEFAULT NULL,
  UNIQUE KEY `account_number` (`account_number`),
  KEY `person_id` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `phppos_suppliers`
--

INSERT INTO `phppos_suppliers` (`person_id`, `account_number`) VALUES
(3, NULL),
(5, NULL),
(6, NULL);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `phppos_customers`
--
ALTER TABLE `phppos_customers`
  ADD CONSTRAINT `phppos_customers_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `phppos_people` (`person_id`);

--
-- Constraints for table `phppos_employees`
--
ALTER TABLE `phppos_employees`
  ADD CONSTRAINT `phppos_employees_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `phppos_people` (`person_id`);

--
-- Constraints for table `phppos_items`
--
ALTER TABLE `phppos_items`
  ADD CONSTRAINT `phppos_items_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `phppos_suppliers` (`person_id`);

--
-- Constraints for table `phppos_items_taxes`
--
ALTER TABLE `phppos_items_taxes`
  ADD CONSTRAINT `phppos_items_taxes_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `phppos_items` (`item_id`) ON DELETE CASCADE;

--
-- Constraints for table `phppos_permissions`
--
ALTER TABLE `phppos_permissions`
  ADD CONSTRAINT `phppos_permissions_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `phppos_employees` (`person_id`),
  ADD CONSTRAINT `phppos_permissions_ibfk_2` FOREIGN KEY (`module_id`) REFERENCES `phppos_modules` (`module_id`);

--
-- Constraints for table `phppos_sales`
--
ALTER TABLE `phppos_sales`
  ADD CONSTRAINT `phppos_sales_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `phppos_employees` (`person_id`),
  ADD CONSTRAINT `phppos_sales_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `phppos_customers` (`person_id`);

--
-- Constraints for table `phppos_sales_items`
--
ALTER TABLE `phppos_sales_items`
  ADD CONSTRAINT `phppos_sales_items_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `phppos_items` (`item_id`),
  ADD CONSTRAINT `phppos_sales_items_ibfk_2` FOREIGN KEY (`sale_id`) REFERENCES `phppos_sales` (`sale_id`);

--
-- Constraints for table `phppos_sales_items_taxes`
--
ALTER TABLE `phppos_sales_items_taxes`
  ADD CONSTRAINT `phppos_sales_items_taxes_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `phppos_sales_items` (`sale_id`),
  ADD CONSTRAINT `phppos_sales_items_taxes_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `phppos_sales_items` (`item_id`);

--
-- Constraints for table `phppos_suppliers`
--
ALTER TABLE `phppos_suppliers`
  ADD CONSTRAINT `phppos_suppliers_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `phppos_people` (`person_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
