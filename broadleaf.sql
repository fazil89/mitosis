blc_additional_offer_info-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.5.23


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema broadleaf
--

CREATE DATABASE IF NOT EXISTS broadleaf;
USE broadleaf;

--
-- Definition of table `blc_additional_offer_info`
--

DROP TABLE IF EXISTS `blc_additional_offer_info`;
CREATE TABLE `blc_additional_offer_info` (
  `BLC_ORDER_ORDER_ID` bigint(20) NOT NULL,
  `OFFER_INFO_ID` bigint(20) NOT NULL,
  `OFFER_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`BLC_ORDER_ORDER_ID`,`OFFER_ID`),
  KEY `FK3BFDBD63D5F3FAF4` (`OFFER_ID`),
  KEY `FK3BFDBD63B5D9C34D` (`OFFER_INFO_ID`),
  KEY `FK3BFDBD631891FF79` (`BLC_ORDER_ORDER_ID`),
  CONSTRAINT `FK3BFDBD631891FF79` FOREIGN KEY (`BLC_ORDER_ORDER_ID`) REFERENCES `blc_order` (`ORDER_ID`),
  CONSTRAINT `FK3BFDBD63B5D9C34D` FOREIGN KEY (`OFFER_INFO_ID`) REFERENCES `blc_offer_info` (`OFFER_INFO_ID`),
  CONSTRAINT `FK3BFDBD63D5F3FAF4` FOREIGN KEY (`OFFER_ID`) REFERENCES `blc_offer` (`OFFER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_additional_offer_info`
--

/*!40000 ALTER TABLE `blc_additional_offer_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_additional_offer_info` ENABLE KEYS */;


--
-- Definition of table `blc_address`
--

DROP TABLE IF EXISTS `blc_address`;
CREATE TABLE `blc_address` (
  `ADDRESS_ID` bigint(20) NOT NULL,
  `ADDRESS_LINE1` varchar(255) NOT NULL,
  `ADDRESS_LINE2` varchar(255) DEFAULT NULL,
  `CITY` varchar(255) NOT NULL,
  `COMPANY_NAME` varchar(255) DEFAULT NULL,
  `COUNTY` varchar(255) DEFAULT NULL,
  `EMAIL_ADDRESS` varchar(255) DEFAULT NULL,
  `FAX` varchar(255) DEFAULT NULL,
  `FIRST_NAME` varchar(255) DEFAULT NULL,
  `IS_ACTIVE` bit(1) DEFAULT NULL,
  `IS_BUSINESS` bit(1) DEFAULT NULL,
  `IS_DEFAULT` bit(1) DEFAULT NULL,
  `LAST_NAME` varchar(255) DEFAULT NULL,
  `POSTAL_CODE` varchar(255) NOT NULL,
  `PRIMARY_PHONE` varchar(255) DEFAULT NULL,
  `SECONDARY_PHONE` varchar(255) DEFAULT NULL,
  `STANDARDIZED` bit(1) DEFAULT NULL,
  `TOKENIZED_ADDRESS` varchar(255) DEFAULT NULL,
  `VERIFICATION_LEVEL` varchar(255) DEFAULT NULL,
  `ZIP_FOUR` varchar(255) DEFAULT NULL,
  `COUNTRY` varchar(255) NOT NULL,
  `STATE_PROV_REGION` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ADDRESS_ID`),
  KEY `ADDRESS_STATE_INDEX` (`STATE_PROV_REGION`),
  KEY `ADDRESS_COUNTRY_INDEX` (`COUNTRY`),
  KEY `FK299F86CE337C4D50` (`STATE_PROV_REGION`),
  KEY `FK299F86CEA46E16CF` (`COUNTRY`),
  CONSTRAINT `FK299F86CE337C4D50` FOREIGN KEY (`STATE_PROV_REGION`) REFERENCES `blc_state` (`ABBREVIATION`),
  CONSTRAINT `FK299F86CEA46E16CF` FOREIGN KEY (`COUNTRY`) REFERENCES `blc_country` (`ABBREVIATION`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_address`
--

/*!40000 ALTER TABLE `blc_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_address` ENABLE KEYS */;


--
-- Definition of table `blc_admin_password_token`
--

DROP TABLE IF EXISTS `blc_admin_password_token`;
CREATE TABLE `blc_admin_password_token` (
  `PASSWORD_TOKEN` varchar(255) NOT NULL,
  `ADMIN_USER_ID` bigint(20) NOT NULL,
  `CREATE_DATE` datetime NOT NULL,
  `TOKEN_USED_DATE` datetime DEFAULT NULL,
  `TOKEN_USED_FLAG` bit(1) NOT NULL,
  PRIMARY KEY (`PASSWORD_TOKEN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_admin_password_token`
--

/*!40000 ALTER TABLE `blc_admin_password_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_admin_password_token` ENABLE KEYS */;


--
-- Definition of table `blc_admin_permission`
--

DROP TABLE IF EXISTS `blc_admin_permission`;
CREATE TABLE `blc_admin_permission` (
  `ADMIN_PERMISSION_ID` bigint(20) NOT NULL,
  `DESCRIPTION` varchar(255) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `PERMISSION_TYPE` varchar(255) NOT NULL,
  PRIMARY KEY (`ADMIN_PERMISSION_ID`),
  KEY `ADMINPERM_TYPE_INDEX` (`PERMISSION_TYPE`),
  KEY `ADMINPERM_NAME_INDEX` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_admin_permission`
--

/*!40000 ALTER TABLE `blc_admin_permission` DISABLE KEYS */;
INSERT INTO `blc_admin_permission` (`ADMIN_PERMISSION_ID`,`DESCRIPTION`,`NAME`,`PERMISSION_TYPE`) VALUES 
 (1,'Default Permission','PERMISSION_OTHER_DEFAULT','OTHER'),
 (2,'Create Category','PERMISSION_CREATE_CATEGORY','CREATE'),
 (3,'Update Category','PERMISSION_UPDATE_CATEGORY','UPDATE'),
 (4,'Delete Category','PERMISSION_DELETE_CATEGORY','DELETE'),
 (5,'Read Category','PERMISSION_READ_CATEGORY','READ'),
 (6,'Create Product','PERMISSION_CREATE_PRODUCT','CREATE'),
 (7,'Update Product','PERMISSION_UPDATE_PRODUCT','UPDATE'),
 (8,'Delete Product','PERMISSION_DELETE_PRODUCT','DELETE'),
 (9,'Read Product','PERMISSION_READ_PRODUCT','READ'),
 (10,'Create Promotion','PERMISSION_CREATE_PROMOTION','CREATE'),
 (11,'Update Promotion','PERMISSION_UPDATE_PROMOTION','UPDATE'),
 (12,'Delete Promotion','PERMISSION_DELETE_PROMOTION','DELETE'),
 (13,'Read Promotion','PERMISSION_READ_PROMOTION','READ'),
 (14,'Create Order','PERMISSION_CREATE_ORDER','CREATE'),
 (15,'Update Order','PERMISSION_UPDATE_ORDER','UPDATE'),
 (16,'Delete Order','PERMISSION_DELETE_ORDER','DELETE'),
 (17,'Read Order','PERMISSION_READ_ORDER','READ'),
 (18,'Create Customer','PERMISSION_CREATE_CUSTOMER','CREATE'),
 (19,'Update Customer','PERMISSION_UPDATE_CUSTOMER','UPDATE'),
 (20,'Delete Customer','PERMISSION_DELETE_CUSTOMER','DELETE'),
 (21,'Read Customer','PERMISSION_READ_CUSTOMER','READ'),
 (22,'Create Page','PERMISSION_CREATE_PAGE','CREATE'),
 (23,'Update Page','PERMISSION_UPDATE_PAGE','UPDATE'),
 (24,'Delete Page','PERMISSION_DELETE_PAGE','DELETE'),
 (25,'Read Page','PERMISSION_READ_PAGE','READ'),
 (26,'Create Asset','PERMISSION_CREATE_ASSET','CREATE'),
 (27,'Update Asset','PERMISSION_UPDATE_ASSET','UPDATE'),
 (28,'Delete Asset','PERMISSION_DELETE_ASSET','DELETE'),
 (29,'Read Asset','PERMISSION_READ_ASSET','READ'),
 (30,'Create Structured Content','PERMISSION_CREATE_STRUCTURED_CONTENT','CREATE'),
 (31,'Update Structured Content','PERMISSION_UPDATE_STRUCTURED_CONTENT','UPDATE'),
 (32,'Delete Structured Content','PERMISSION_DELETE_STRUCTURED_CONTENT','DELETE'),
 (33,'Read Structured Content','PERMISSION_READ_STRUCTURED_CONTENT','READ'),
 (34,'User SandBox','PERMISSION_ALL_USER_SANDBOX','ALL'),
 (35,'Approver SandBox','PERMISSION_ALL_APPROVER_SANDBOX','ALL'),
 (36,'Create Admin User','PERMISSION_CREATE_ADMIN_USER','CREATE'),
 (37,'Update Admin User','PERMISSION_UPDATE_ADMIN_USER','UPDATE'),
 (38,'Delete Admin User','PERMISSION_DELETE_ADMIN_USER','DELETE'),
 (39,'Read Admin User','PERMISSION_READ_ADMIN_USER','READ'),
 (40,'All Category','PERMISSION_ALL_CATEGORY','ALL'),
 (41,'All Product','PERMISSION_ALL_PRODUCT','ALL'),
 (42,'All Promotion','PERMISSION_ALL_PROMOTION','ALL'),
 (43,'All Order','PERMISSION_ALL_ORDER','ALL'),
 (44,'All Customer','PERMISSION_ALL_CUSTOMER','ALL'),
 (45,'All Page','PERMISSION_ALL_PAGE','ALL'),
 (46,'All Asset','PERMISSION_ALL_ASSET','ALL'),
 (47,'All Structured Content','PERMISSION_ALL_STRUCTURED_CONTENT','ALL'),
 (48,'All Admin User','PERMISSION_ALL_ADMIN_USER','ALL'),
 (49,'Create URLHandler','PERMISSION_CREATE_URLHANDLER','CREATE'),
 (50,'Update URLHandler','PERMISSION_UPDATE_URLHANDLER','UPDATE'),
 (51,'Delete URLHandler','PERMISSION_DELETE_URLHANDLER','DELETE'),
 (52,'Read URLHandler','PERMISSION_READ_URLHANDLER','READ'),
 (53,'All URLHandler','PERMISSION_ALL_URLHANDLER','ALL'),
 (54,'Create SearchRedirect','PERMISSION_CREATE_SEARCHREDIRECT','CREATE'),
 (55,'Update SearchRedirect','PERMISSION_UPDATE_SEARCHREDIRECT','UPDATE'),
 (56,'Delete SearchRedirect','PERMISSION_DELETE_SEARCHREDIRECT','DELETE'),
 (57,'Read SearchRedirect','PERMISSION_READ_SEARCHREDIRECT','READ'),
 (58,'All SearchRedirect','PERMISSION_ALL_SEARCHREDIRECT','ALL'),
 (59,'Create SearchFacet','PERMISSION_CREATE_SEARCHFACET','CREATE'),
 (60,'Update SearchFacet','PERMISSION_UPDATE_SEARCHFACET','UPDATE'),
 (61,'Delete SearchFacet','PERMISSION_DELETE_SEARCHFACET','DELETE'),
 (62,'Read SearchFacet','PERMISSION_READ_SEARCHFACET','READ'),
 (63,'All SearchFacet','PERMISSION_ALL_SEARCHFACET','ALL');
/*!40000 ALTER TABLE `blc_admin_permission` ENABLE KEYS */;


--
-- Definition of table `blc_admin_permission_entity`
--

DROP TABLE IF EXISTS `blc_admin_permission_entity`;
CREATE TABLE `blc_admin_permission_entity` (
  `ADMIN_PERMISSION_ENTITY_ID` bigint(20) NOT NULL,
  `CEILING_ENTITY` varchar(255) NOT NULL,
  `ADMIN_PERMISSION_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ADMIN_PERMISSION_ENTITY_ID`),
  KEY `FK23C09E3DE88B7D38` (`ADMIN_PERMISSION_ID`),
  CONSTRAINT `FK23C09E3DE88B7D38` FOREIGN KEY (`ADMIN_PERMISSION_ID`) REFERENCES `blc_admin_permission` (`ADMIN_PERMISSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_admin_permission_entity`
--

/*!40000 ALTER TABLE `blc_admin_permission_entity` DISABLE KEYS */;
INSERT INTO `blc_admin_permission_entity` (`ADMIN_PERMISSION_ENTITY_ID`,`CEILING_ENTITY`,`ADMIN_PERMISSION_ID`) VALUES 
 (1,'org.broadleafcommerce.core.catalog.domain.Category',2),
 (2,'org.broadleafcommerce.core.catalog.domain.Category',3),
 (3,'org.broadleafcommerce.core.catalog.domain.Product',3),
 (4,'org.broadleafcommerce.core.catalog.domain.Category',4),
 (5,'org.broadleafcommerce.core.catalog.domain.Product',4),
 (6,'org.broadleafcommerce.core.catalog.domain.Category',5),
 (7,'org.broadleafcommerce.core.catalog.domain.Product',5),
 (8,'org.broadleafcommerce.core.catalog.domain.Product',6),
 (9,'org.broadleafcommerce.core.catalog.domain.ProductAttribute',6),
 (10,'org.broadleafcommerce.core.catalog.domain.Product',7),
 (11,'org.broadleafcommerce.core.catalog.domain.Category',7),
 (12,'org.broadleafcommerce.core.catalog.domain.ProductAttribute',7),
 (13,'org.broadleafcommerce.core.catalog.domain.Product',8),
 (14,'org.broadleafcommerce.core.catalog.domain.Category',8),
 (15,'org.broadleafcommerce.core.catalog.domain.ProductAttribute',8),
 (16,'org.broadleafcommerce.core.catalog.domain.Product',9),
 (17,'org.broadleafcommerce.core.catalog.domain.Category',9),
 (18,'org.broadleafcommerce.core.catalog.domain.ProductAttribute',9),
 (19,'org.broadleafcommerce.core.offer.domain.Offer',10),
 (20,'org.broadleafcommerce.core.offer.domain.OfferItemCriteria',10),
 (21,'org.broadleafcommerce.core.offer.domain.Offer',11),
 (22,'org.broadleafcommerce.core.offer.domain.OfferItemCriteria',11),
 (23,'org.broadleafcommerce.core.offer.domain.Offer',12),
 (24,'org.broadleafcommerce.core.offer.domain.OfferItemCriteria',12),
 (25,'org.broadleafcommerce.core.offer.domain.Offer',13),
 (26,'org.broadleafcommerce.core.offer.domain.OfferItemCriteria',13),
 (27,'org.broadleafcommerce.profile.core.domain.Customer',13),
 (28,'org.broadleafcommerce.core.order.domain.FulfillmentGroup',13),
 (29,'org.broadleafcommerce.core.order.domain.OrderItem',13),
 (30,'org.broadleafcommerce.core.order.domain.Order',13),
 (31,'org.broadleafcommerce.core.order.domain.Order',14),
 (32,'org.broadleafcommerce.core.order.domain.OrderItem',14),
 (33,'org.broadleafcommerce.core.order.domain.DiscreteOrderItemFeePrice',14),
 (34,'org.broadleafcommerce.core.offer.domain.FulfillmentGroupAdjustment',14),
 (35,'org.broadleafcommerce.core.order.domain.FulfillmentGroup',14),
 (36,'org.broadleafcommerce.core.offer.domain.OfferCode',14),
 (37,'org.broadleafcommerce.core.offer.domain.OrderAdjustment',14),
 (38,'org.broadleafcommerce.core.offer.domain.OrderItemAdjustment',14),
 (39,'org.broadleafcommerce.core.payment.domain.PaymentInfo',14),
 (40,'org.broadleafcommerce.core.order.domain.Order',15),
 (41,'org.broadleafcommerce.core.order.domain.OrderItem',15),
 (42,'org.broadleafcommerce.core.order.domain.DiscreteOrderItemFeePrice',15),
 (43,'org.broadleafcommerce.core.offer.domain.FulfillmentGroupAdjustment',15),
 (44,'org.broadleafcommerce.core.order.domain.FulfillmentGroup',15),
 (45,'org.broadleafcommerce.core.offer.domain.OfferCode',15),
 (46,'org.broadleafcommerce.core.offer.domain.OrderAdjustment',15),
 (47,'org.broadleafcommerce.core.offer.domain.OrderItemAdjustment',15),
 (48,'org.broadleafcommerce.core.payment.domain.PaymentInfo',15),
 (49,'org.broadleafcommerce.core.order.domain.Order',16),
 (50,'org.broadleafcommerce.core.order.domain.OrderItem',16),
 (51,'org.broadleafcommerce.core.order.domain.DiscreteOrderItemFeePrice',16),
 (52,'org.broadleafcommerce.core.offer.domain.FulfillmentGroupAdjustment',16),
 (53,'org.broadleafcommerce.core.order.domain.FulfillmentGroup',16),
 (54,'org.broadleafcommerce.core.offer.domain.OfferCode',16),
 (55,'org.broadleafcommerce.core.offer.domain.OrderAdjustment',16),
 (56,'org.broadleafcommerce.core.offer.domain.OrderItemAdjustment',16),
 (57,'org.broadleafcommerce.core.payment.domain.PaymentInfo',16),
 (58,'org.broadleafcommerce.core.order.domain.Order',17),
 (59,'org.broadleafcommerce.core.order.domain.OrderItem',17),
 (60,'org.broadleafcommerce.core.order.domain.DiscreteOrderItemFeePrice',17),
 (61,'org.broadleafcommerce.core.offer.domain.FulfillmentGroupAdjustment',17),
 (62,'org.broadleafcommerce.core.order.domain.FulfillmentGroup',17),
 (63,'org.broadleafcommerce.core.offer.domain.OfferCode',17),
 (64,'org.broadleafcommerce.core.offer.domain.OrderAdjustment',17),
 (65,'org.broadleafcommerce.core.offer.domain.OrderItemAdjustment',17),
 (66,'org.broadleafcommerce.core.payment.domain.PaymentInfo',17),
 (67,'org.broadleafcommerce.profile.core.domain.Country',17),
 (68,'org.broadleafcommerce.profile.core.domain.State',17),
 (69,'org.broadleafcommerce.profile.core.domain.Customer',18),
 (70,'org.broadleafcommerce.profile.core.domain.Customer',19),
 (71,'org.broadleafcommerce.profile.core.domain.Customer',20),
 (72,'org.broadleafcommerce.profile.core.domain.Customer',21),
 (73,'org.broadleafcommerce.profile.core.domain.ChallengeQuestion',21),
 (74,'org.broadleafcommerce.cms.page.domain.Page',22),
 (75,'org.broadleafcommerce.cms.page.domain.PageTemplate',22),
 (76,'org.broadleafcommerce.cms.page.domain.Page',23),
 (77,'org.broadleafcommerce.cms.page.domain.PageTemplate',23),
 (78,'org.broadleafcommerce.cms.page.domain.Page',24),
 (79,'org.broadleafcommerce.cms.page.domain.PageTemplate',24),
 (80,'org.broadleafcommerce.cms.page.domain.Page',25),
 (81,'org.broadleafcommerce.cms.page.domain.PageTemplate',25),
 (82,'org.broadleafcommerce.common.locale.domain.Locale',25),
 (83,'org.broadleafcommerce.cms.file.domain.StaticAsset',26),
 (84,'org.broadleafcommerce.cms.file.domain.StaticAssetFolder',26),
 (85,'org.broadleafcommerce.cms.file.domain.StaticAsset',27),
 (86,'org.broadleafcommerce.cms.file.domain.StaticAssetFolder',27),
 (87,'org.broadleafcommerce.cms.file.domain.StaticAsset',28),
 (88,'org.broadleafcommerce.cms.file.domain.StaticAssetFolder',28),
 (89,'org.broadleafcommerce.cms.file.domain.StaticAsset',29),
 (90,'org.broadleafcommerce.cms.file.domain.StaticAssetFolder',29),
 (91,'org.broadleafcommerce.common.locale.domain.Locale',29),
 (92,'org.broadleafcommerce.cms.structure.domain.StructuredContent',30),
 (93,'org.broadleafcommerce.cms.structure.domain.StructuredContentType',30),
 (94,'org.broadleafcommerce.cms.structure.domain.StructuredContent',31),
 (95,'org.broadleafcommerce.cms.structure.domain.StructuredContentType',31),
 (96,'org.broadleafcommerce.cms.structure.domain.StructuredContent',32),
 (97,'org.broadleafcommerce.cms.structure.domain.StructuredContentType',32),
 (98,'org.broadleafcommerce.cms.structure.domain.StructuredContent',33),
 (99,'org.broadleafcommerce.cms.structure.domain.StructuredContentType',33),
 (100,'org.broadleafcommerce.common.locale.domain.Locale',33),
 (101,'org.broadleafcommerce.openadmin.server.domain.SandBoxItem',34),
 (102,'org.broadleafcommerce.openadmin.server.domain.SandBoxItem',35),
 (103,'org.broadleafcommerce.openadmin.server.security.domain.AdminUser',36),
 (104,'org.broadleafcommerce.openadmin.server.security.domain.AdminRole',36),
 (105,'org.broadleafcommerce.openadmin.server.security.domain.AdminPermission',36),
 (106,'org.broadleafcommerce.openadmin.server.security.domain.AdminUser',37),
 (107,'org.broadleafcommerce.openadmin.server.security.domain.AdminRole',37),
 (108,'org.broadleafcommerce.openadmin.server.security.domain.AdminPermission',37),
 (109,'org.broadleafcommerce.openadmin.server.security.domain.AdminUser',38),
 (110,'org.broadleafcommerce.openadmin.server.security.domain.AdminRole',38),
 (111,'org.broadleafcommerce.openadmin.server.security.domain.AdminPermission',38),
 (112,'org.broadleafcommerce.openadmin.server.security.domain.AdminUser',39),
 (113,'org.broadleafcommerce.openadmin.server.security.domain.AdminRole',39),
 (114,'org.broadleafcommerce.openadmin.server.security.domain.AdminPermission',39),
 (115,'org.broadleafcommerce.profile.core.domain.Customer',33),
 (116,'org.broadleafcommerce.core.order.domain.OrderItem',33),
 (117,'org.broadleafcommerce.common.RequestDTOImpl',33),
 (118,'org.broadleafcommerce.common.TimeDTO',33),
 (119,'org.broadleafcommerce.core.catalog.domain.Product',33),
 (120,'org.broadleafcommerce.cms.structure.domain.StructuredContentItemCriteria',30),
 (121,'org.broadleafcommerce.cms.structure.domain.StructuredContentItemCriteria',31),
 (122,'org.broadleafcommerce.cms.structure.domain.StructuredContentItemCriteria',32),
 (123,'org.broadleafcommerce.cms.structure.domain.StructuredContentItemCriteria',33),
 (124,'org.broadleafcommerce.cms.structure.domain.StructuredContentFieldTemplate',30),
 (125,'org.broadleafcommerce.cms.structure.domain.StructuredContentFieldTemplate',31),
 (126,'org.broadleafcommerce.cms.structure.domain.StructuredContentFieldTemplate',32),
 (127,'org.broadleafcommerce.cms.structure.domain.StructuredContentFieldTemplate',33),
 (128,'org.broadleafcommerce.cms.file.domain.StaticAsset',5),
 (129,'org.broadleafcommerce.cms.file.domain.StaticAsset',9),
 (130,'org.broadleafcommerce.core.catalog.domain.Category',40),
 (131,'org.broadleafcommerce.core.catalog.domain.Product',40),
 (132,'org.broadleafcommerce.core.catalog.domain.Category',41),
 (133,'org.broadleafcommerce.core.catalog.domain.Product',41),
 (134,'org.broadleafcommerce.core.catalog.domain.ProductAttribute',41),
 (135,'org.broadleafcommerce.core.offer.domain.Offer',42),
 (136,'org.broadleafcommerce.core.offer.domain.OfferItemCriteria',42),
 (137,'org.broadleafcommerce.profile.core.domain.Customer',42),
 (138,'org.broadleafcommerce.core.order.domain.FulfillmentGroup',42),
 (139,'org.broadleafcommerce.core.order.domain.OrderItem',42),
 (140,'org.broadleafcommerce.core.order.domain.Order',42),
 (141,'org.broadleafcommerce.core.order.domain.Order',43),
 (142,'org.broadleafcommerce.core.order.domain.OrderItem',43),
 (143,'org.broadleafcommerce.core.order.domain.DiscreteOrderItemFeePrice',43),
 (144,'org.broadleafcommerce.core.offer.domain.FulfillmentGroupAdjustment',43),
 (145,'org.broadleafcommerce.core.order.domain.FulfillmentGroup',43),
 (146,'org.broadleafcommerce.core.offer.domain.OfferCode',43),
 (147,'org.broadleafcommerce.core.offer.domain.OrderAdjustment',43),
 (148,'org.broadleafcommerce.core.offer.domain.OrderItemAdjustment',43),
 (149,'org.broadleafcommerce.core.payment.domain.PaymentInfo',43),
 (150,'org.broadleafcommerce.profile.core.domain.Country',43),
 (151,'org.broadleafcommerce.profile.core.domain.State',43),
 (152,'org.broadleafcommerce.profile.core.domain.Customer',44),
 (153,'org.broadleafcommerce.profile.core.domain.ChallengeQuestion',44),
 (154,'org.broadleafcommerce.cms.page.domain.Page',45),
 (155,'org.broadleafcommerce.cms.page.domain.PageTemplate',45),
 (156,'org.broadleafcommerce.common.locale.domain.Locale',45),
 (157,'org.broadleafcommerce.cms.file.domain.StaticAsset',46),
 (158,'org.broadleafcommerce.cms.file.domain.StaticAssetFolder',46),
 (159,'org.broadleafcommerce.common.locale.domain.Locale',46),
 (160,'org.broadleafcommerce.cms.structure.domain.StructuredContent',47),
 (161,'org.broadleafcommerce.cms.structure.domain.StructuredContentType',47),
 (162,'org.broadleafcommerce.common.locale.domain.Locale',47),
 (165,'org.broadleafcommerce.openadmin.server.security.domain.AdminUser',48),
 (166,'org.broadleafcommerce.openadmin.server.security.domain.AdminRole',48),
 (167,'org.broadleafcommerce.openadmin.server.security.domain.AdminPermission',48),
 (168,'org.broadleafcommerce.profile.core.domain.Customer',47),
 (169,'org.broadleafcommerce.core.order.domain.OrderItem',47),
 (170,'org.broadleafcommerce.common.RequestDTOImpl',47),
 (171,'org.broadleafcommerce.common.TimeDTO',47),
 (172,'org.broadleafcommerce.core.catalog.domain.Product',47),
 (173,'org.broadleafcommerce.cms.structure.domain.StructuredContentItemCriteria',47),
 (174,'org.broadleafcommerce.cms.structure.domain.StructuredContentFieldTemplate',47),
 (175,'org.broadleafcommerce.cms.file.domain.StaticAsset',40),
 (176,'org.broadleafcommerce.cms.file.domain.StaticAsset',41),
 (177,'org.broadleafcommerce.cms.url.domain.URLHandler',49),
 (178,'org.broadleafcommerce.cms.url.domain.URLHandler',50),
 (179,'org.broadleafcommerce.cms.url.domain.URLHandler',51),
 (180,'org.broadleafcommerce.cms.url.domain.URLHandler',52),
 (181,'org.broadleafcommerce.common.locale.domain.Locale',49),
 (182,'org.broadleafcommerce.common.locale.domain.Locale',50),
 (183,'org.broadleafcommerce.common.locale.domain.Locale',51),
 (184,'org.broadleafcommerce.common.locale.domain.Locale',52),
 (185,'org.broadleafcommerce.cms.url.domain.URLHandler',53),
 (186,'org.broadleafcommerce.common.locale.domain.Locale',53),
 (187,'org.broadleafcommerce.cms.page.domain.PageItemCriteria',22),
 (188,'org.broadleafcommerce.cms.page.domain.PageItemCriteria',23),
 (189,'org.broadleafcommerce.cms.page.domain.PageItemCriteria',24),
 (190,'org.broadleafcommerce.cms.page.domain.PageItemCriteria',25),
 (191,'org.broadleafcommerce.cms.page.domain.PageItemCriteria',45),
 (192,'org.broadleafcommerce.core.searchRedirect.domain.SearchRedirect',54),
 (193,'org.broadleafcommerce.core.searchRedirect.domain.SearchRedirect',55),
 (194,'org.broadleafcommerce.core.searchRedirect.domain.SearchRedirect',56),
 (195,'org.broadleafcommerce.core.searchRedirect.domain.SearchRedirect',57),
 (196,'org.broadleafcommerce.core.searchRedirect.domain.SearchRedirect',58),
 (197,'org.broadleafcommerce.core.search.domain.SearchFacet',59),
 (198,'org.broadleafcommerce.core.search.domain.SearchFacet',60),
 (199,'org.broadleafcommerce.core.search.domain.SearchFacet',61),
 (200,'org.broadleafcommerce.core.search.domain.SearchFacet',62),
 (201,'org.broadleafcommerce.core.search.domain.SearchFacet',63),
 (202,'org.broadleafcommerce.core.search.domain.Field',59),
 (203,'org.broadleafcommerce.core.search.domain.Field',60),
 (204,'org.broadleafcommerce.core.search.domain.Field',61),
 (205,'org.broadleafcommerce.core.search.domain.Field',62),
 (206,'org.broadleafcommerce.core.search.domain.Field',63),
 (207,'org.broadleafcommerce.core.search.domain.CategorySearchFacet',59),
 (208,'org.broadleafcommerce.core.search.domain.CategorySearchFacet',60),
 (209,'org.broadleafcommerce.core.search.domain.CategorySearchFacet',61),
 (210,'org.broadleafcommerce.core.search.domain.CategorySearchFacet',62),
 (211,'org.broadleafcommerce.core.search.domain.CategorySearchFacet',63),
 (212,'org.broadleafcommerce.core.search.domain.SearchFacetRange',59),
 (213,'org.broadleafcommerce.core.search.domain.SearchFacetRange',60),
 (214,'org.broadleafcommerce.core.search.domain.SearchFacetRange',61),
 (215,'org.broadleafcommerce.core.search.domain.SearchFacetRange',62),
 (216,'org.broadleafcommerce.core.search.domain.SearchFacetRange',63),
 (217,'org.broadleafcommerce.core.search.domain.CategoryExcludedSearchFacet',59),
 (218,'org.broadleafcommerce.core.search.domain.CategoryExcludedSearchFacet',60),
 (219,'org.broadleafcommerce.core.search.domain.CategoryExcludedSearchFacet',61),
 (220,'org.broadleafcommerce.core.search.domain.CategoryExcludedSearchFacet',62),
 (221,'org.broadleafcommerce.core.search.domain.CategoryExcludedSearchFacet',63),
 (222,'org.broadleafcommerce.profile.core.domain.CustomerAttribute',19),
 (223,'org.broadleafcommerce.profile.core.domain.CustomerAttribute',21),
 (224,'org.broadleafcommerce.profile.core.domain.CustomerAttribute',44);
/*!40000 ALTER TABLE `blc_admin_permission_entity` ENABLE KEYS */;


--
-- Definition of table `blc_admin_role`
--

DROP TABLE IF EXISTS `blc_admin_role`;
CREATE TABLE `blc_admin_role` (
  `ADMIN_ROLE_ID` bigint(20) NOT NULL,
  `DESCRIPTION` varchar(255) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`ADMIN_ROLE_ID`),
  UNIQUE KEY `NAME` (`NAME`),
  KEY `ADMINROLE_NAME_INDEX` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_admin_role`
--

/*!40000 ALTER TABLE `blc_admin_role` DISABLE KEYS */;
INSERT INTO `blc_admin_role` (`ADMIN_ROLE_ID`,`DESCRIPTION`,`NAME`) VALUES 
 (1,'Admin Master Access','ROLE_ADMIN'),
 (2,'Merchandiser','ROLE_MERCHANDISE_MANAGER'),
 (3,'Promotion Manager','ROLE_PROMOTION_MANAGER'),
 (4,'CSR','ROLE_CUSTOMER_SERVICE_REP'),
 (5,'CMS Editor','ROLE_CONTENT_EDITOR'),
 (6,'CMS Approver','ROLE_CONTENT_APPROVER');
/*!40000 ALTER TABLE `blc_admin_role` ENABLE KEYS */;


--
-- Definition of table `blc_admin_role_permission_xref`
--

DROP TABLE IF EXISTS `blc_admin_role_permission_xref`;
CREATE TABLE `blc_admin_role_permission_xref` (
  `ADMIN_ROLE_ID` bigint(20) NOT NULL,
  `ADMIN_PERMISSION_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ADMIN_PERMISSION_ID`,`ADMIN_ROLE_ID`),
  KEY `FK4A819D985F43AAD8` (`ADMIN_ROLE_ID`),
  KEY `FK4A819D98E88B7D38` (`ADMIN_PERMISSION_ID`),
  CONSTRAINT `FK4A819D985F43AAD8` FOREIGN KEY (`ADMIN_ROLE_ID`) REFERENCES `blc_admin_role` (`ADMIN_ROLE_ID`),
  CONSTRAINT `FK4A819D98E88B7D38` FOREIGN KEY (`ADMIN_PERMISSION_ID`) REFERENCES `blc_admin_permission` (`ADMIN_PERMISSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_admin_role_permission_xref`
--

/*!40000 ALTER TABLE `blc_admin_role_permission_xref` DISABLE KEYS */;
INSERT INTO `blc_admin_role_permission_xref` (`ADMIN_ROLE_ID`,`ADMIN_PERMISSION_ID`) VALUES 
 (1,1),
 (1,34),
 (1,35),
 (1,40),
 (1,41),
 (1,42),
 (1,43),
 (1,44),
 (1,45),
 (1,46),
 (1,47),
 (1,48),
 (1,53),
 (1,58),
 (1,63),
 (2,1),
 (2,40),
 (2,41),
 (3,1),
 (3,42),
 (4,1),
 (4,43),
 (4,44),
 (5,1),
 (5,34),
 (5,45),
 (5,46),
 (5,47),
 (5,48),
 (6,1),
 (6,34),
 (6,35),
 (6,45),
 (6,46),
 (6,47),
 (6,48);
/*!40000 ALTER TABLE `blc_admin_role_permission_xref` ENABLE KEYS */;


--
-- Definition of table `blc_admin_user`
--

DROP TABLE IF EXISTS `blc_admin_user`;
CREATE TABLE `blc_admin_user` (
  `ADMIN_USER_ID` bigint(20) NOT NULL,
  `ACTIVE_STATUS_FLAG` bit(1) DEFAULT NULL,
  `EMAIL` varchar(255) NOT NULL,
  `LOGIN` varchar(255) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `PASSWORD` varchar(255) NOT NULL,
  `PHONE_NUMBER` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ADMIN_USER_ID`),
  KEY `ADMINPERM_EMAIL_INDEX` (`EMAIL`),
  KEY `ADMINUSER_NAME_INDEX` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_admin_user`
--

/*!40000 ALTER TABLE `blc_admin_user` DISABLE KEYS */;
INSERT INTO `blc_admin_user` (`ADMIN_USER_ID`,`ACTIVE_STATUS_FLAG`,`EMAIL`,`LOGIN`,`NAME`,`PASSWORD`,`PHONE_NUMBER`) VALUES 
 (1,0x01,'admin@yourdomain.com','admin','Administrator','admin',NULL),
 (2,0x01,'merchandise@yourdomain.com','merchandise','Merchandise Manager','admin',NULL),
 (3,0x01,'promo@yourdomain.com','promo','Promotion Manager','admin',NULL),
 (4,0x01,'csr@yourdomain.com','csr','CSR','admin',NULL),
 (5,0x01,'cms_edit@yourdomain.com','cmsEditor','CMS Editor','admin',NULL),
 (6,0x01,'cms_approver@yourdomain.com','cmsApprover','CMS Approver','admin',NULL);
/*!40000 ALTER TABLE `blc_admin_user` ENABLE KEYS */;


--
-- Definition of table `blc_admin_user_permission_xref`
--

DROP TABLE IF EXISTS `blc_admin_user_permission_xref`;
CREATE TABLE `blc_admin_user_permission_xref` (
  `ADMIN_USER_ID` bigint(20) NOT NULL,
  `ADMIN_PERMISSION_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ADMIN_PERMISSION_ID`,`ADMIN_USER_ID`),
  KEY `FKF0B3BEED46EBC38` (`ADMIN_USER_ID`),
  KEY `FKF0B3BEEDE88B7D38` (`ADMIN_PERMISSION_ID`),
  CONSTRAINT `FKF0B3BEED46EBC38` FOREIGN KEY (`ADMIN_USER_ID`) REFERENCES `blc_admin_user` (`ADMIN_USER_ID`),
  CONSTRAINT `FKF0B3BEEDE88B7D38` FOREIGN KEY (`ADMIN_PERMISSION_ID`) REFERENCES `blc_admin_permission` (`ADMIN_PERMISSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_admin_user_permission_xref`
--

/*!40000 ALTER TABLE `blc_admin_user_permission_xref` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_admin_user_permission_xref` ENABLE KEYS */;


--
-- Definition of table `blc_admin_user_role_xref`
--

DROP TABLE IF EXISTS `blc_admin_user_role_xref`;
CREATE TABLE `blc_admin_user_role_xref` (
  `ADMIN_USER_ID` bigint(20) NOT NULL,
  `ADMIN_ROLE_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ADMIN_ROLE_ID`,`ADMIN_USER_ID`),
  KEY `FKFFD33A265F43AAD8` (`ADMIN_ROLE_ID`),
  KEY `FKFFD33A2646EBC38` (`ADMIN_USER_ID`),
  CONSTRAINT `FKFFD33A2646EBC38` FOREIGN KEY (`ADMIN_USER_ID`) REFERENCES `blc_admin_user` (`ADMIN_USER_ID`),
  CONSTRAINT `FKFFD33A265F43AAD8` FOREIGN KEY (`ADMIN_ROLE_ID`) REFERENCES `blc_admin_role` (`ADMIN_ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_admin_user_role_xref`
--

/*!40000 ALTER TABLE `blc_admin_user_role_xref` DISABLE KEYS */;
INSERT INTO `blc_admin_user_role_xref` (`ADMIN_USER_ID`,`ADMIN_ROLE_ID`) VALUES 
 (1,1),
 (2,2),
 (3,3),
 (4,4),
 (5,5),
 (6,6);
/*!40000 ALTER TABLE `blc_admin_user_role_xref` ENABLE KEYS */;


--
-- Definition of table `blc_admin_user_sandbox`
--

DROP TABLE IF EXISTS `blc_admin_user_sandbox`;
CREATE TABLE `blc_admin_user_sandbox` (
  `SANDBOX_ID` bigint(20) DEFAULT NULL,
  `ADMIN_USER_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ADMIN_USER_ID`),
  KEY `FKD0A97E0946EBC38` (`ADMIN_USER_ID`),
  KEY `FKD0A97E09579FE59D` (`SANDBOX_ID`),
  CONSTRAINT `FKD0A97E0946EBC38` FOREIGN KEY (`ADMIN_USER_ID`) REFERENCES `blc_admin_user` (`ADMIN_USER_ID`),
  CONSTRAINT `FKD0A97E09579FE59D` FOREIGN KEY (`SANDBOX_ID`) REFERENCES `blc_sandbox` (`SANDBOX_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_admin_user_sandbox`
--

/*!40000 ALTER TABLE `blc_admin_user_sandbox` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_admin_user_sandbox` ENABLE KEYS */;


--
-- Definition of table `blc_amount_item`
--

DROP TABLE IF EXISTS `blc_amount_item`;
CREATE TABLE `blc_amount_item` (
  `AMOUNT_ITEM_ID` bigint(20) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `QUANTITY` bigint(20) NOT NULL,
  `SHORT_DESCRIPTION` varchar(255) DEFAULT NULL,
  `SYSTEM_ID` varchar(255) DEFAULT NULL,
  `UNIT_PRICE` decimal(19,5) NOT NULL,
  `PAYMENT_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`AMOUNT_ITEM_ID`),
  KEY `SHORT_DESCRIPTION_INDEX` (`SHORT_DESCRIPTION`),
  KEY `AMOUNTITEM_PAYMENTINFO_INDEX` (`PAYMENT_ID`),
  KEY `FKB98530944BC71D98` (`PAYMENT_ID`),
  CONSTRAINT `FKB98530944BC71D98` FOREIGN KEY (`PAYMENT_ID`) REFERENCES `blc_order_payment` (`PAYMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_amount_item`
--

/*!40000 ALTER TABLE `blc_amount_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_amount_item` ENABLE KEYS */;


--
-- Definition of table `blc_asset_desc_map`
--

DROP TABLE IF EXISTS `blc_asset_desc_map`;
CREATE TABLE `blc_asset_desc_map` (
  `STATIC_ASSET_ID` bigint(20) NOT NULL,
  `STATIC_ASSET_DESC_ID` bigint(20) NOT NULL,
  `MAP_KEY` varchar(255) NOT NULL,
  PRIMARY KEY (`STATIC_ASSET_ID`,`MAP_KEY`),
  KEY `FKE886BAE367F70B63` (`STATIC_ASSET_ID`),
  KEY `FKE886BAE3E2BA0C9D` (`STATIC_ASSET_DESC_ID`),
  CONSTRAINT `FKE886BAE367F70B63` FOREIGN KEY (`STATIC_ASSET_ID`) REFERENCES `blc_static_asset` (`STATIC_ASSET_ID`),
  CONSTRAINT `FKE886BAE3E2BA0C9D` FOREIGN KEY (`STATIC_ASSET_DESC_ID`) REFERENCES `blc_static_asset_desc` (`STATIC_ASSET_DESC_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_asset_desc_map`
--

/*!40000 ALTER TABLE `blc_asset_desc_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_asset_desc_map` ENABLE KEYS */;


--
-- Definition of table `blc_bank_account_payment`
--

DROP TABLE IF EXISTS `blc_bank_account_payment`;
CREATE TABLE `blc_bank_account_payment` (
  `PAYMENT_ID` bigint(20) NOT NULL,
  `ACCOUNT_NUMBER` varchar(255) NOT NULL,
  `REFERENCE_NUMBER` varchar(255) NOT NULL,
  `ROUTING_NUMBER` varchar(255) NOT NULL,
  PRIMARY KEY (`PAYMENT_ID`),
  KEY `BANKACCOUNT_INDEX` (`REFERENCE_NUMBER`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_bank_account_payment`
--

/*!40000 ALTER TABLE `blc_bank_account_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_bank_account_payment` ENABLE KEYS */;


--
-- Definition of table `blc_bund_item_fee_price`
--

DROP TABLE IF EXISTS `blc_bund_item_fee_price`;
CREATE TABLE `blc_bund_item_fee_price` (
  `BUND_ITEM_FEE_PRICE_ID` bigint(20) NOT NULL,
  `AMOUNT` decimal(19,5) DEFAULT NULL,
  `IS_TAXABLE` bit(1) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REPORTING_CODE` varchar(255) DEFAULT NULL,
  `BUND_ORDER_ITEM_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`BUND_ITEM_FEE_PRICE_ID`),
  KEY `FK14267A943FC68307` (`BUND_ORDER_ITEM_ID`),
  CONSTRAINT `FK14267A943FC68307` FOREIGN KEY (`BUND_ORDER_ITEM_ID`) REFERENCES `blc_bundle_order_item` (`ORDER_ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_bund_item_fee_price`
--

/*!40000 ALTER TABLE `blc_bund_item_fee_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_bund_item_fee_price` ENABLE KEYS */;


--
-- Definition of table `blc_bundle_order_item`
--

DROP TABLE IF EXISTS `blc_bundle_order_item`;
CREATE TABLE `blc_bundle_order_item` (
  `BASE_RETAIL_PRICE` decimal(19,5) DEFAULT NULL,
  `BASE_SALE_PRICE` decimal(19,5) DEFAULT NULL,
  `ORDER_ITEM_ID` bigint(20) NOT NULL,
  `PRODUCT_BUNDLE_ID` bigint(20) DEFAULT NULL,
  `SKU_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ORDER_ITEM_ID`),
  KEY `FK489703DB9AF166DF` (`ORDER_ITEM_ID`),
  KEY `FK489703DBB78C9977` (`SKU_ID`),
  KEY `FK489703DBCCF29B96` (`PRODUCT_BUNDLE_ID`),
  CONSTRAINT `FK489703DB9AF166DF` FOREIGN KEY (`ORDER_ITEM_ID`) REFERENCES `blc_order_item` (`ORDER_ITEM_ID`),
  CONSTRAINT `FK489703DBB78C9977` FOREIGN KEY (`SKU_ID`) REFERENCES `blc_sku` (`SKU_ID`),
  CONSTRAINT `FK489703DBCCF29B96` FOREIGN KEY (`PRODUCT_BUNDLE_ID`) REFERENCES `blc_product_bundle` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_bundle_order_item`
--

/*!40000 ALTER TABLE `blc_bundle_order_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_bundle_order_item` ENABLE KEYS */;


--
-- Definition of table `blc_candidate_fg_offer`
--

DROP TABLE IF EXISTS `blc_candidate_fg_offer`;
CREATE TABLE `blc_candidate_fg_offer` (
  `CANDIDATE_FG_OFFER_ID` bigint(20) NOT NULL,
  `DISCOUNTED_PRICE` decimal(19,5) DEFAULT NULL,
  `FULFILLMENT_GROUP_ID` bigint(20) DEFAULT NULL,
  `OFFER_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`CANDIDATE_FG_OFFER_ID`),
  KEY `CANDIDATE_FG_INDEX` (`FULFILLMENT_GROUP_ID`),
  KEY `CANDIDATE_FGOFFER_INDEX` (`OFFER_ID`),
  KEY `FKCE78560D5F3FAF4` (`OFFER_ID`),
  KEY `FKCE785605028DC55` (`FULFILLMENT_GROUP_ID`),
  CONSTRAINT `FKCE785605028DC55` FOREIGN KEY (`FULFILLMENT_GROUP_ID`) REFERENCES `blc_fulfillment_group` (`FULFILLMENT_GROUP_ID`),
  CONSTRAINT `FKCE78560D5F3FAF4` FOREIGN KEY (`OFFER_ID`) REFERENCES `blc_offer` (`OFFER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_candidate_fg_offer`
--

/*!40000 ALTER TABLE `blc_candidate_fg_offer` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_candidate_fg_offer` ENABLE KEYS */;


--
-- Definition of table `blc_candidate_item_offer`
--

DROP TABLE IF EXISTS `blc_candidate_item_offer`;
CREATE TABLE `blc_candidate_item_offer` (
  `CANDIDATE_ITEM_OFFER_ID` bigint(20) NOT NULL,
  `DISCOUNTED_PRICE` decimal(19,5) DEFAULT NULL,
  `OFFER_ID` bigint(20) NOT NULL,
  `ORDER_ITEM_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`CANDIDATE_ITEM_OFFER_ID`),
  KEY `CANDIDATE_ITEMOFFER_INDEX` (`OFFER_ID`),
  KEY `CANDIDATE_ITEM_INDEX` (`ORDER_ITEM_ID`),
  KEY `FK9EEE9B29AF166DF` (`ORDER_ITEM_ID`),
  KEY `FK9EEE9B2D5F3FAF4` (`OFFER_ID`),
  CONSTRAINT `FK9EEE9B29AF166DF` FOREIGN KEY (`ORDER_ITEM_ID`) REFERENCES `blc_order_item` (`ORDER_ITEM_ID`),
  CONSTRAINT `FK9EEE9B2D5F3FAF4` FOREIGN KEY (`OFFER_ID`) REFERENCES `blc_offer` (`OFFER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_candidate_item_offer`
--

/*!40000 ALTER TABLE `blc_candidate_item_offer` DISABLE KEYS */;
INSERT INTO `blc_candidate_item_offer` (`CANDIDATE_ITEM_OFFER_ID`,`DISCOUNTED_PRICE`,`OFFER_ID`,`ORDER_ITEM_ID`) VALUES 
 (1,NULL,1,1),
 (51,NULL,1,301);
/*!40000 ALTER TABLE `blc_candidate_item_offer` ENABLE KEYS */;


--
-- Definition of table `blc_candidate_order_offer`
--

DROP TABLE IF EXISTS `blc_candidate_order_offer`;
CREATE TABLE `blc_candidate_order_offer` (
  `CANDIDATE_ORDER_OFFER_ID` bigint(20) NOT NULL,
  `DISCOUNTED_PRICE` decimal(19,5) DEFAULT NULL,
  `OFFER_ID` bigint(20) NOT NULL,
  `ORDER_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`CANDIDATE_ORDER_OFFER_ID`),
  KEY `CANDIDATE_ORDEROFFER_INDEX` (`OFFER_ID`),
  KEY `CANDIDATE_ORDER_INDEX` (`ORDER_ID`),
  KEY `FK61852289D5F3FAF4` (`OFFER_ID`),
  KEY `FK6185228989FE8A02` (`ORDER_ID`),
  CONSTRAINT `FK6185228989FE8A02` FOREIGN KEY (`ORDER_ID`) REFERENCES `blc_order` (`ORDER_ID`),
  CONSTRAINT `FK61852289D5F3FAF4` FOREIGN KEY (`OFFER_ID`) REFERENCES `blc_offer` (`OFFER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_candidate_order_offer`
--

/*!40000 ALTER TABLE `blc_candidate_order_offer` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_candidate_order_offer` ENABLE KEYS */;


--
-- Definition of table `blc_cat_search_facet_excl_xref`
--

DROP TABLE IF EXISTS `blc_cat_search_facet_excl_xref`;
CREATE TABLE `blc_cat_search_facet_excl_xref` (
  `CAT_EXCL_SEARCH_FACET_ID` bigint(20) NOT NULL,
  `CATEGORY_ID` bigint(20) DEFAULT NULL,
  `SEARCH_FACET_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`CAT_EXCL_SEARCH_FACET_ID`),
  KEY `FK8361EF4EB96B1C93` (`SEARCH_FACET_ID`),
  KEY `FK8361EF4E15D1A13D` (`CATEGORY_ID`),
  CONSTRAINT `FK8361EF4E15D1A13D` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `blc_category` (`CATEGORY_ID`),
  CONSTRAINT `FK8361EF4EB96B1C93` FOREIGN KEY (`SEARCH_FACET_ID`) REFERENCES `blc_search_facet` (`SEARCH_FACET_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_cat_search_facet_excl_xref`
--

/*!40000 ALTER TABLE `blc_cat_search_facet_excl_xref` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_cat_search_facet_excl_xref` ENABLE KEYS */;


--
-- Definition of table `blc_cat_search_facet_xref`
--

DROP TABLE IF EXISTS `blc_cat_search_facet_xref`;
CREATE TABLE `blc_cat_search_facet_xref` (
  `CATEGORY_SEARCH_FACET_ID` bigint(20) NOT NULL,
  `SEQUENCE` bigint(20) NOT NULL,
  `CATEGORY_ID` bigint(20) DEFAULT NULL,
  `SEARCH_FACET_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`CATEGORY_SEARCH_FACET_ID`),
  KEY `FK32210EEBB96B1C93` (`SEARCH_FACET_ID`),
  KEY `FK32210EEB15D1A13D` (`CATEGORY_ID`),
  CONSTRAINT `FK32210EEB15D1A13D` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `blc_category` (`CATEGORY_ID`),
  CONSTRAINT `FK32210EEBB96B1C93` FOREIGN KEY (`SEARCH_FACET_ID`) REFERENCES `blc_search_facet` (`SEARCH_FACET_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_cat_search_facet_xref`
--

/*!40000 ALTER TABLE `blc_cat_search_facet_xref` DISABLE KEYS */;
INSERT INTO `blc_cat_search_facet_xref` (`CATEGORY_SEARCH_FACET_ID`,`SEQUENCE`,`CATEGORY_ID`,`SEARCH_FACET_ID`) VALUES 
 (1,1,2002,1),
 (2,2,2002,2),
 (3,3,1,3);
/*!40000 ALTER TABLE `blc_cat_search_facet_xref` ENABLE KEYS */;


--
-- Definition of table `blc_category`
--

DROP TABLE IF EXISTS `blc_category`;
CREATE TABLE `blc_category` (
  `CATEGORY_ID` bigint(20) NOT NULL,
  `ACTIVE_END_DATE` datetime DEFAULT NULL,
  `ACTIVE_START_DATE` datetime DEFAULT NULL,
  `ARCHIVED` char(1) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `DISPLAY_TEMPLATE` varchar(255) DEFAULT NULL,
  `LONG_DESCRIPTION` longtext,
  `NAME` varchar(255) NOT NULL,
  `URL` varchar(255) DEFAULT NULL,
  `URL_KEY` varchar(255) DEFAULT NULL,
  `DEFAULT_PARENT_CATEGORY_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`CATEGORY_ID`),
  KEY `CATEGORY_NAME_INDEX` (`NAME`),
  KEY `CATEGORY_URLKEY_INDEX` (`URL_KEY`),
  KEY `CATEGORY_PARENT_INDEX` (`DEFAULT_PARENT_CATEGORY_ID`),
  KEY `FK55F82D44B177E6` (`DEFAULT_PARENT_CATEGORY_ID`),
  CONSTRAINT `FK55F82D44B177E6` FOREIGN KEY (`DEFAULT_PARENT_CATEGORY_ID`) REFERENCES `blc_category` (`CATEGORY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_category`
--

/*!40000 ALTER TABLE `blc_category` DISABLE KEYS */;
INSERT INTO `blc_category` (`CATEGORY_ID`,`ACTIVE_END_DATE`,`ACTIVE_START_DATE`,`ARCHIVED`,`DESCRIPTION`,`DISPLAY_TEMPLATE`,`LONG_DESCRIPTION`,`NAME`,`URL`,`URL_KEY`,`DEFAULT_PARENT_CATEGORY_ID`) VALUES 
 (1,NULL,'2013-01-21 22:04:57',NULL,'Root',NULL,NULL,'Root',NULL,NULL,NULL),
 (2,NULL,'2013-01-21 22:04:57',NULL,'Primary Nav',NULL,NULL,'Primary Nav',NULL,NULL,1),
 (2001,NULL,'2013-01-21 22:04:57',NULL,'Home','layout/home',NULL,'Home','/',NULL,2),
 (2002,NULL,'2013-01-21 22:04:57',NULL,'Hot Sauces',NULL,NULL,'Hot Sauces','/hot-sauces',NULL,2),
 (2003,NULL,'2013-01-21 22:04:57',NULL,'Merchandise',NULL,NULL,'Merchandise','/merchandise',NULL,2),
 (2004,NULL,'2013-01-21 22:04:57',NULL,'Clearance',NULL,NULL,'Clearance','/clearance',NULL,2),
 (2005,NULL,'2013-01-21 22:04:57',NULL,'New to Hot Sauce?',NULL,NULL,'New to Hot Sauce?','/new-to-hot-sauce',NULL,2),
 (2006,NULL,'2013-01-21 22:04:57',NULL,'FAQs',NULL,NULL,'FAQs','/faq',NULL,2);
/*!40000 ALTER TABLE `blc_category` ENABLE KEYS */;


--
-- Definition of table `blc_category_attribute`
--

DROP TABLE IF EXISTS `blc_category_attribute`;
CREATE TABLE `blc_category_attribute` (
  `CATEGORY_ATTRIBUTE_ID` bigint(20) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `SEARCHABLE` bit(1) DEFAULT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `CATEGORY_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`CATEGORY_ATTRIBUTE_ID`),
  KEY `CATEGORYATTRIBUTE_INDEX` (`CATEGORY_ID`),
  KEY `CATEGORYATTRIBUTE_NAME_INDEX` (`NAME`),
  KEY `FK4E441D4115D1A13D` (`CATEGORY_ID`),
  CONSTRAINT `FK4E441D4115D1A13D` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `blc_category` (`CATEGORY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_category_attribute`
--

/*!40000 ALTER TABLE `blc_category_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_category_attribute` ENABLE KEYS */;


--
-- Definition of table `blc_category_image`
--

DROP TABLE IF EXISTS `blc_category_image`;
CREATE TABLE `blc_category_image` (
  `CATEGORY_ID` bigint(20) NOT NULL,
  `URL` varchar(255) DEFAULT NULL,
  `NAME` varchar(5) NOT NULL,
  PRIMARY KEY (`CATEGORY_ID`,`NAME`),
  KEY `FK27CF3E8015D1A13D` (`CATEGORY_ID`),
  CONSTRAINT `FK27CF3E8015D1A13D` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `blc_category` (`CATEGORY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_category_image`
--

/*!40000 ALTER TABLE `blc_category_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_category_image` ENABLE KEYS */;


--
-- Definition of table `blc_category_media_map`
--

DROP TABLE IF EXISTS `blc_category_media_map`;
CREATE TABLE `blc_category_media_map` (
  `BLC_CATEGORY_CATEGORY_ID` bigint(20) NOT NULL,
  `MEDIA_ID` bigint(20) NOT NULL,
  `MAP_KEY` varchar(255) NOT NULL,
  PRIMARY KEY (`BLC_CATEGORY_CATEGORY_ID`,`MAP_KEY`),
  KEY `FKCD24B106D786CEA2` (`BLC_CATEGORY_CATEGORY_ID`),
  KEY `FKCD24B10619D1156C` (`MEDIA_ID`),
  CONSTRAINT `FKCD24B10619D1156C` FOREIGN KEY (`MEDIA_ID`) REFERENCES `blc_media` (`MEDIA_ID`),
  CONSTRAINT `FKCD24B106D786CEA2` FOREIGN KEY (`BLC_CATEGORY_CATEGORY_ID`) REFERENCES `blc_category` (`CATEGORY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_category_media_map`
--

/*!40000 ALTER TABLE `blc_category_media_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_category_media_map` ENABLE KEYS */;


--
-- Definition of table `blc_category_product_xref`
--

DROP TABLE IF EXISTS `blc_category_product_xref`;
CREATE TABLE `blc_category_product_xref` (
  `DISPLAY_ORDER` bigint(20) DEFAULT NULL,
  `CATEGORY_ID` bigint(20) NOT NULL,
  `PRODUCT_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`CATEGORY_ID`,`PRODUCT_ID`),
  KEY `FK635EB1A615D1A13D` (`CATEGORY_ID`),
  KEY `FK635EB1A65F11A0B7` (`PRODUCT_ID`),
  CONSTRAINT `FK635EB1A615D1A13D` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `blc_category` (`CATEGORY_ID`),
  CONSTRAINT `FK635EB1A65F11A0B7` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `blc_product` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_category_product_xref`
--

/*!40000 ALTER TABLE `blc_category_product_xref` DISABLE KEYS */;
INSERT INTO `blc_category_product_xref` (`DISPLAY_ORDER`,`CATEGORY_ID`,`PRODUCT_ID`) VALUES 
 (1,2001,3),
 (2,2001,6),
 (3,2001,9),
 (4,2001,12),
 (1,2002,1),
 (2,2002,2),
 (3,2002,3),
 (4,2002,4),
 (5,2002,5),
 (6,2002,6),
 (7,2002,7),
 (8,2002,8),
 (9,2002,9),
 (10,2002,10),
 (11,2002,11),
 (12,2002,12),
 (13,2002,13),
 (14,2002,14),
 (15,2002,15),
 (16,2002,16),
 (17,2002,17),
 (18,2002,18),
 (19,2002,19),
 (1,2003,100),
 (2,2003,200),
 (3,2003,300),
 (4,2003,400),
 (5,2003,500),
 (6,2003,600),
 (1,2004,7),
 (2,2004,8),
 (3,2004,10),
 (4,2004,11),
 (5,2004,18);
/*!40000 ALTER TABLE `blc_category_product_xref` ENABLE KEYS */;


--
-- Definition of table `blc_category_xref`
--

DROP TABLE IF EXISTS `blc_category_xref`;
CREATE TABLE `blc_category_xref` (
  `DISPLAY_ORDER` bigint(20) DEFAULT NULL,
  `SUB_CATEGORY_ID` bigint(20) NOT NULL,
  `CATEGORY_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`CATEGORY_ID`,`SUB_CATEGORY_ID`),
  KEY `FKE889733615D1A13D` (`CATEGORY_ID`),
  KEY `FKE8897336D6D45DBE` (`SUB_CATEGORY_ID`),
  CONSTRAINT `FKE889733615D1A13D` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `blc_category` (`CATEGORY_ID`),
  CONSTRAINT `FKE8897336D6D45DBE` FOREIGN KEY (`SUB_CATEGORY_ID`) REFERENCES `blc_category` (`CATEGORY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_category_xref`
--

/*!40000 ALTER TABLE `blc_category_xref` DISABLE KEYS */;
INSERT INTO `blc_category_xref` (`DISPLAY_ORDER`,`SUB_CATEGORY_ID`,`CATEGORY_ID`) VALUES 
 (1,2,1),
 (1,2001,2),
 (2,2002,2),
 (3,2003,2),
 (4,2004,2),
 (5,2005,2),
 (6,2006,2);
/*!40000 ALTER TABLE `blc_category_xref` ENABLE KEYS */;


--
-- Definition of table `blc_challenge_question`
--

DROP TABLE IF EXISTS `blc_challenge_question`;
CREATE TABLE `blc_challenge_question` (
  `QUESTION_ID` bigint(20) NOT NULL,
  `QUESTION` varchar(255) NOT NULL,
  PRIMARY KEY (`QUESTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_challenge_question`
--

/*!40000 ALTER TABLE `blc_challenge_question` DISABLE KEYS */;
INSERT INTO `blc_challenge_question` (`QUESTION_ID`,`QUESTION`) VALUES 
 (1,'What is your favorite sports team?'),
 (2,'What was your high school name?'),
 (3,'What was your childhood nickname?'),
 (4,'What street did you live on in third grade?'),
 (5,'What is your oldest sibling\'s middle name?'),
 (6,'What school did you attend for sixth grade?'),
 (7,'Where does your nearest sibling live?'),
 (8,'What is your youngest brother\'s birthday?'),
 (9,'In what city or town was your first job?');
/*!40000 ALTER TABLE `blc_challenge_question` ENABLE KEYS */;


--
-- Definition of table `blc_code_types`
--

DROP TABLE IF EXISTS `blc_code_types`;
CREATE TABLE `blc_code_types` (
  `CODE_ID` bigint(20) NOT NULL,
  `CODE_TYPE` varchar(255) NOT NULL,
  `CODE_DESC` varchar(255) DEFAULT NULL,
  `CODE_KEY` varchar(255) NOT NULL,
  `MODIFIABLE` char(1) DEFAULT NULL,
  PRIMARY KEY (`CODE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_code_types`
--

/*!40000 ALTER TABLE `blc_code_types` DISABLE KEYS */;
INSERT INTO `blc_code_types` (`CODE_ID`,`CODE_TYPE`,`CODE_DESC`,`CODE_KEY`,`MODIFIABLE`) VALUES 
 (1,'CATEGORY_MEDIA','Large Category Media','large','N'),
 (2,'CATEGORY_MEDIA','Small Category Media','small','N'),
 (3,'PRODUCT_MEDIA','Large Product Media','large','N'),
 (4,'PRODUCT_MEDIA','Small Product Media','small','N');
/*!40000 ALTER TABLE `blc_code_types` ENABLE KEYS */;


--
-- Definition of table `blc_content`
--

DROP TABLE IF EXISTS `blc_content`;
CREATE TABLE `blc_content` (
  `ID` int(11) NOT NULL,
  `ACTIVE_END_DATE` datetime DEFAULT NULL,
  `ACTIVE_START_DATE` datetime DEFAULT NULL,
  `APPROVED_BY` varchar(255) DEFAULT NULL,
  `APPROVED_DATE` datetime DEFAULT NULL,
  `BROWSER_TITLE` varchar(255) DEFAULT NULL,
  `CONTENT_DATE` datetime DEFAULT NULL,
  `CONTENT_TYPE` varchar(255) DEFAULT NULL,
  `DEPLOYED` bit(1) DEFAULT NULL,
  `DESCRIPTION` longtext,
  `DISPLAY_RULE` varchar(255) DEFAULT NULL,
  `KEYWORDS` varchar(255) DEFAULT NULL,
  `LANGUAGE_CODE` varchar(255) DEFAULT NULL,
  `LAST_MODIFIED_BY` varchar(255) DEFAULT NULL,
  `LAST_MODIFIED_DATE` datetime DEFAULT NULL,
  `META_DESCRIPTION` varchar(255) DEFAULT NULL,
  `NOTE` varchar(255) DEFAULT NULL,
  `ONLINE_STATE` bit(1) DEFAULT NULL,
  `PARENT_CONTENT_ID` int(11) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `REJECTED_BY` varchar(255) DEFAULT NULL,
  `REJECTED_DATE` datetime DEFAULT NULL,
  `RENDER_TEMPLATE` varchar(255) DEFAULT NULL,
  `SANDBOX` varchar(255) DEFAULT NULL,
  `SUBMITTED_BY` varchar(255) DEFAULT NULL,
  `SUBMITTED_DATE` datetime DEFAULT NULL,
  `TITLE` varchar(255) DEFAULT NULL,
  `URL_TITLE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `CONTENT_INDEX` (`SANDBOX`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_content`
--

/*!40000 ALTER TABLE `blc_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_content` ENABLE KEYS */;


--
-- Definition of table `blc_content_details`
--

DROP TABLE IF EXISTS `blc_content_details`;
CREATE TABLE `blc_content_details` (
  `CONTENT_HASH` varchar(255) DEFAULT NULL,
  `XML_CONTENT` longtext,
  `ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKE7944136158B8591` (`ID`),
  CONSTRAINT `FKE7944136158B8591` FOREIGN KEY (`ID`) REFERENCES `blc_content` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_content_details`
--

/*!40000 ALTER TABLE `blc_content_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_content_details` ENABLE KEYS */;


--
-- Definition of table `blc_country`
--

DROP TABLE IF EXISTS `blc_country`;
CREATE TABLE `blc_country` (
  `ABBREVIATION` varchar(255) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`ABBREVIATION`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_country`
--

/*!40000 ALTER TABLE `blc_country` DISABLE KEYS */;
INSERT INTO `blc_country` (`ABBREVIATION`,`NAME`) VALUES 
 ('CA','Canada'),
 ('MX','Mexico'),
 ('US','United States');
/*!40000 ALTER TABLE `blc_country` ENABLE KEYS */;


--
-- Definition of table `blc_credit_card_payment`
--

DROP TABLE IF EXISTS `blc_credit_card_payment`;
CREATE TABLE `blc_credit_card_payment` (
  `PAYMENT_ID` bigint(20) NOT NULL,
  `EXPIRATION_MONTH` int(11) NOT NULL,
  `EXPIRATION_YEAR` int(11) NOT NULL,
  `NAME_ON_CARD` varchar(255) NOT NULL,
  `PAN` varchar(255) NOT NULL,
  `REFERENCE_NUMBER` varchar(255) NOT NULL,
  PRIMARY KEY (`PAYMENT_ID`),
  KEY `CREDITCARD_INDEX` (`REFERENCE_NUMBER`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_credit_card_payment`
--

/*!40000 ALTER TABLE `blc_credit_card_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_credit_card_payment` ENABLE KEYS */;


--
-- Definition of table `blc_customer`
--

DROP TABLE IF EXISTS `blc_customer`;
CREATE TABLE `blc_customer` (
  `CUSTOMER_ID` bigint(20) NOT NULL,
  `CREATED_BY` bigint(20) DEFAULT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_UPDATED` datetime DEFAULT NULL,
  `UPDATED_BY` bigint(20) DEFAULT NULL,
  `CHALLENGE_ANSWER` varchar(255) DEFAULT NULL,
  `DEACTIVATED` bit(1) DEFAULT NULL,
  `EMAIL_ADDRESS` varchar(255) DEFAULT NULL,
  `FIRST_NAME` varchar(255) DEFAULT NULL,
  `LAST_NAME` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `PASSWORD_CHANGE_REQUIRED` bit(1) DEFAULT NULL,
  `RECEIVE_EMAIL` bit(1) DEFAULT NULL,
  `IS_REGISTERED` bit(1) DEFAULT NULL,
  `USER_NAME` varchar(255) DEFAULT NULL,
  `CHALLENGE_QUESTION_ID` bigint(20) DEFAULT NULL,
  `LOCALE_CODE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CUSTOMER_ID`),
  UNIQUE KEY `USER_NAME` (`USER_NAME`),
  KEY `CUSTOMER_CHALLENGE_INDEX` (`CHALLENGE_QUESTION_ID`),
  KEY `CUSTOMER_EMAIL_INDEX` (`EMAIL_ADDRESS`),
  KEY `FK7716F024A1E1C128` (`LOCALE_CODE`),
  KEY `FK7716F0241422B204` (`CHALLENGE_QUESTION_ID`),
  CONSTRAINT `FK7716F0241422B204` FOREIGN KEY (`CHALLENGE_QUESTION_ID`) REFERENCES `blc_challenge_question` (`QUESTION_ID`),
  CONSTRAINT `FK7716F024A1E1C128` FOREIGN KEY (`LOCALE_CODE`) REFERENCES `blc_locale` (`LOCALE_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_customer`
--

/*!40000 ALTER TABLE `blc_customer` DISABLE KEYS */;
INSERT INTO `blc_customer` (`CUSTOMER_ID`,`CREATED_BY`,`DATE_CREATED`,`DATE_UPDATED`,`UPDATED_BY`,`CHALLENGE_ANSWER`,`DEACTIVATED`,`EMAIL_ADDRESS`,`FIRST_NAME`,`LAST_NAME`,`PASSWORD`,`PASSWORD_CHANGE_REQUIRED`,`RECEIVE_EMAIL`,`IS_REGISTERED`,`USER_NAME`,`CHALLENGE_QUESTION_ID`,`LOCALE_CODE`) VALUES 
 (100,100,'2013-01-21 22:08:20',NULL,NULL,NULL,0x00,NULL,NULL,NULL,NULL,0x00,0x01,0x00,'100',NULL,NULL),
 (300,300,'2013-01-22 12:16:03',NULL,NULL,NULL,0x00,NULL,NULL,NULL,NULL,0x00,0x01,0x00,'300',NULL,NULL),
 (600,600,'2013-01-25 19:08:12',NULL,NULL,NULL,0x00,NULL,NULL,NULL,NULL,0x00,0x01,0x00,'600',NULL,NULL);
/*!40000 ALTER TABLE `blc_customer` ENABLE KEYS */;


--
-- Definition of table `blc_customer_address`
--

DROP TABLE IF EXISTS `blc_customer_address`;
CREATE TABLE `blc_customer_address` (
  `CUSTOMER_ADDRESS_ID` bigint(20) NOT NULL,
  `ADDRESS_NAME` varchar(255) DEFAULT NULL,
  `ADDRESS_ID` bigint(20) NOT NULL,
  `CUSTOMER_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`CUSTOMER_ADDRESS_ID`),
  UNIQUE KEY `CUSTOMER_ID` (`CUSTOMER_ID`,`ADDRESS_NAME`),
  KEY `CUSTOMERADDRESS_ADDRESS_INDEX` (`ADDRESS_ID`),
  KEY `FK75B95AB9C13085DD` (`ADDRESS_ID`),
  KEY `FK75B95AB97470F437` (`CUSTOMER_ID`),
  CONSTRAINT `FK75B95AB97470F437` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `blc_customer` (`CUSTOMER_ID`),
  CONSTRAINT `FK75B95AB9C13085DD` FOREIGN KEY (`ADDRESS_ID`) REFERENCES `blc_address` (`ADDRESS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_customer_address`
--

/*!40000 ALTER TABLE `blc_customer_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_customer_address` ENABLE KEYS */;


--
-- Definition of table `blc_customer_attribute`
--

DROP TABLE IF EXISTS `blc_customer_attribute`;
CREATE TABLE `blc_customer_attribute` (
  `CUSTOMER_ATTR_ID` bigint(20) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `CUSTOMER_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`CUSTOMER_ATTR_ID`),
  KEY `FKB974C8217470F437` (`CUSTOMER_ID`),
  CONSTRAINT `FKB974C8217470F437` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `blc_customer` (`CUSTOMER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_customer_attribute`
--

/*!40000 ALTER TABLE `blc_customer_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_customer_attribute` ENABLE KEYS */;


--
-- Definition of table `blc_customer_offer_xref`
--

DROP TABLE IF EXISTS `blc_customer_offer_xref`;
CREATE TABLE `blc_customer_offer_xref` (
  `CUSTOMER_OFFER_ID` bigint(20) NOT NULL,
  `CUSTOMER_ID` bigint(20) NOT NULL,
  `OFFER_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`CUSTOMER_OFFER_ID`),
  KEY `CUSTOFFER_CUSTOMER_INDEX` (`CUSTOMER_ID`),
  KEY `CUSTOFFER_OFFER_INDEX` (`OFFER_ID`),
  KEY `FK685E8039D5F3FAF4` (`OFFER_ID`),
  KEY `FK685E80397470F437` (`CUSTOMER_ID`),
  CONSTRAINT `FK685E80397470F437` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `blc_customer` (`CUSTOMER_ID`),
  CONSTRAINT `FK685E8039D5F3FAF4` FOREIGN KEY (`OFFER_ID`) REFERENCES `blc_offer` (`OFFER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_customer_offer_xref`
--

/*!40000 ALTER TABLE `blc_customer_offer_xref` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_customer_offer_xref` ENABLE KEYS */;


--
-- Definition of table `blc_customer_password_token`
--

DROP TABLE IF EXISTS `blc_customer_password_token`;
CREATE TABLE `blc_customer_password_token` (
  `PASSWORD_TOKEN` varchar(255) NOT NULL,
  `CREATE_DATE` datetime NOT NULL,
  `CUSTOMER_ID` bigint(20) NOT NULL,
  `TOKEN_USED_DATE` datetime DEFAULT NULL,
  `TOKEN_USED_FLAG` bit(1) NOT NULL,
  PRIMARY KEY (`PASSWORD_TOKEN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_customer_password_token`
--

/*!40000 ALTER TABLE `blc_customer_password_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_customer_password_token` ENABLE KEYS */;


--
-- Definition of table `blc_customer_payment`
--

DROP TABLE IF EXISTS `blc_customer_payment`;
CREATE TABLE `blc_customer_payment` (
  `CUSTOMER_PAYMENT_ID` bigint(20) NOT NULL,
  `PAYMENT_TOKEN` varchar(255) DEFAULT NULL,
  `ADDRESS_ID` bigint(20) NOT NULL,
  `CUSTOMER_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`CUSTOMER_PAYMENT_ID`),
  UNIQUE KEY `CUSTOMER_ID` (`CUSTOMER_ID`,`PAYMENT_TOKEN`),
  KEY `CUSTOMERPAYMENT_ADDRESS_INDEX` (`ADDRESS_ID`),
  KEY `FK8B3DF0CBC13085DD` (`ADDRESS_ID`),
  KEY `FK8B3DF0CB7470F437` (`CUSTOMER_ID`),
  CONSTRAINT `FK8B3DF0CB7470F437` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `blc_customer` (`CUSTOMER_ID`),
  CONSTRAINT `FK8B3DF0CBC13085DD` FOREIGN KEY (`ADDRESS_ID`) REFERENCES `blc_address` (`ADDRESS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_customer_payment`
--

/*!40000 ALTER TABLE `blc_customer_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_customer_payment` ENABLE KEYS */;


--
-- Definition of table `blc_customer_payment_fields`
--

DROP TABLE IF EXISTS `blc_customer_payment_fields`;
CREATE TABLE `blc_customer_payment_fields` (
  `CUSTOMER_PAYMENT_ID` bigint(20) NOT NULL,
  `FIELD_VALUE` varchar(255) DEFAULT NULL,
  `FIELD_NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CUSTOMER_PAYMENT_ID`,`FIELD_NAME`),
  KEY `FK5CCB14ADCA0B98E0` (`CUSTOMER_PAYMENT_ID`),
  CONSTRAINT `FK5CCB14ADCA0B98E0` FOREIGN KEY (`CUSTOMER_PAYMENT_ID`) REFERENCES `blc_customer_payment` (`CUSTOMER_PAYMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_customer_payment_fields`
--

/*!40000 ALTER TABLE `blc_customer_payment_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_customer_payment_fields` ENABLE KEYS */;


--
-- Definition of table `blc_customer_phone`
--

DROP TABLE IF EXISTS `blc_customer_phone`;
CREATE TABLE `blc_customer_phone` (
  `CUSTOMER_PHONE_ID` bigint(20) NOT NULL,
  `PHONE_NAME` varchar(255) DEFAULT NULL,
  `CUSTOMER_ID` bigint(20) NOT NULL,
  `PHONE_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`CUSTOMER_PHONE_ID`),
  UNIQUE KEY `CUSTOMER_ID` (`CUSTOMER_ID`,`PHONE_NAME`),
  KEY `CUSTPHONE_PHONE_INDEX` (`PHONE_ID`),
  KEY `FK3D28ED73D894CB5D` (`PHONE_ID`),
  KEY `FK3D28ED737470F437` (`CUSTOMER_ID`),
  CONSTRAINT `FK3D28ED737470F437` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `blc_customer` (`CUSTOMER_ID`),
  CONSTRAINT `FK3D28ED73D894CB5D` FOREIGN KEY (`PHONE_ID`) REFERENCES `blc_phone` (`PHONE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_customer_phone`
--

/*!40000 ALTER TABLE `blc_customer_phone` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_customer_phone` ENABLE KEYS */;


--
-- Definition of table `blc_customer_role`
--

DROP TABLE IF EXISTS `blc_customer_role`;
CREATE TABLE `blc_customer_role` (
  `CUSTOMER_ROLE_ID` bigint(20) NOT NULL,
  `CUSTOMER_ID` bigint(20) NOT NULL,
  `ROLE_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`CUSTOMER_ROLE_ID`),
  KEY `CUSTROLE_CUSTOMER_INDEX` (`CUSTOMER_ID`),
  KEY `CUSTROLE_ROLE_INDEX` (`ROLE_ID`),
  KEY `FK548EB7B1B8587B7` (`ROLE_ID`),
  KEY `FK548EB7B17470F437` (`CUSTOMER_ID`),
  CONSTRAINT `FK548EB7B17470F437` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `blc_customer` (`CUSTOMER_ID`),
  CONSTRAINT `FK548EB7B1B8587B7` FOREIGN KEY (`ROLE_ID`) REFERENCES `blc_role` (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_customer_role`
--

/*!40000 ALTER TABLE `blc_customer_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_customer_role` ENABLE KEYS */;


--
-- Definition of table `blc_data_drvn_enum`
--

DROP TABLE IF EXISTS `blc_data_drvn_enum`;
CREATE TABLE `blc_data_drvn_enum` (
  `ENUM_ID` bigint(20) NOT NULL,
  `ENUM_KEY` varchar(255) DEFAULT NULL,
  `MODIFIABLE` bit(1) DEFAULT NULL,
  PRIMARY KEY (`ENUM_ID`),
  KEY `ENUM_KEY_INDEX` (`ENUM_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_data_drvn_enum`
--

/*!40000 ALTER TABLE `blc_data_drvn_enum` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_data_drvn_enum` ENABLE KEYS */;


--
-- Definition of table `blc_data_drvn_enum_val`
--

DROP TABLE IF EXISTS `blc_data_drvn_enum_val`;
CREATE TABLE `blc_data_drvn_enum_val` (
  `ENUM_VAL_ID` bigint(20) NOT NULL,
  `DISPLAY` varchar(255) DEFAULT NULL,
  `HIDDEN` bit(1) DEFAULT NULL,
  `ENUM_KEY` varchar(255) DEFAULT NULL,
  `ENUM_TYPE` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ENUM_VAL_ID`),
  KEY `HIDDEN_INDEX` (`HIDDEN`),
  KEY `ENUM_VAL_KEY_INDEX` (`ENUM_KEY`),
  KEY `FKB2D5700DA60E0554` (`ENUM_TYPE`),
  CONSTRAINT `FKB2D5700DA60E0554` FOREIGN KEY (`ENUM_TYPE`) REFERENCES `blc_data_drvn_enum` (`ENUM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_data_drvn_enum_val`
--

/*!40000 ALTER TABLE `blc_data_drvn_enum_val` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_data_drvn_enum_val` ENABLE KEYS */;


--
-- Definition of table `blc_disc_item_fee_price`
--

DROP TABLE IF EXISTS `blc_disc_item_fee_price`;
CREATE TABLE `blc_disc_item_fee_price` (
  `DISC_ITEM_FEE_PRICE_ID` bigint(20) NOT NULL,
  `AMOUNT` decimal(19,5) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REPORTING_CODE` varchar(255) DEFAULT NULL,
  `ORDER_ITEM_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`DISC_ITEM_FEE_PRICE_ID`),
  KEY `FK2A641CC8B76B9466` (`ORDER_ITEM_ID`),
  CONSTRAINT `FK2A641CC8B76B9466` FOREIGN KEY (`ORDER_ITEM_ID`) REFERENCES `blc_discrete_order_item` (`ORDER_ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_disc_item_fee_price`
--

/*!40000 ALTER TABLE `blc_disc_item_fee_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_disc_item_fee_price` ENABLE KEYS */;


--
-- Definition of table `blc_discrete_order_item`
--

DROP TABLE IF EXISTS `blc_discrete_order_item`;
CREATE TABLE `blc_discrete_order_item` (
  `BASE_RETAIL_PRICE` decimal(19,5) DEFAULT NULL,
  `BASE_SALE_PRICE` decimal(19,5) DEFAULT NULL,
  `ORDER_ITEM_ID` bigint(20) NOT NULL,
  `BUNDLE_ORDER_ITEM_ID` bigint(20) DEFAULT NULL,
  `PRODUCT_ID` bigint(20) DEFAULT NULL,
  `SKU_ID` bigint(20) NOT NULL,
  `SKU_BUNDLE_ITEM_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ORDER_ITEM_ID`),
  KEY `DISCRETE_SKU_INDEX` (`SKU_ID`),
  KEY `DISCRETE_PRODUCT_INDEX` (`PRODUCT_ID`),
  KEY `FKBC3A8A849AF166DF` (`ORDER_ITEM_ID`),
  KEY `FKBC3A8A841285903B` (`SKU_BUNDLE_ITEM_ID`),
  KEY `FKBC3A8A84B78C9977` (`SKU_ID`),
  KEY `FKBC3A8A845F11A0B7` (`PRODUCT_ID`),
  KEY `FKBC3A8A845CDFCA80` (`BUNDLE_ORDER_ITEM_ID`),
  CONSTRAINT `FKBC3A8A841285903B` FOREIGN KEY (`SKU_BUNDLE_ITEM_ID`) REFERENCES `blc_sku_bundle_item` (`SKU_BUNDLE_ITEM_ID`),
  CONSTRAINT `FKBC3A8A845CDFCA80` FOREIGN KEY (`BUNDLE_ORDER_ITEM_ID`) REFERENCES `blc_bundle_order_item` (`ORDER_ITEM_ID`),
  CONSTRAINT `FKBC3A8A845F11A0B7` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `blc_product` (`PRODUCT_ID`),
  CONSTRAINT `FKBC3A8A849AF166DF` FOREIGN KEY (`ORDER_ITEM_ID`) REFERENCES `blc_order_item` (`ORDER_ITEM_ID`),
  CONSTRAINT `FKBC3A8A84B78C9977` FOREIGN KEY (`SKU_ID`) REFERENCES `blc_sku` (`SKU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_discrete_order_item`
--

/*!40000 ALTER TABLE `blc_discrete_order_item` DISABLE KEYS */;
INSERT INTO `blc_discrete_order_item` (`BASE_RETAIL_PRICE`,`BASE_SALE_PRICE`,`ORDER_ITEM_ID`,`BUNDLE_ORDER_ITEM_ID`,`PRODUCT_ID`,`SKU_ID`,`SKU_BUNDLE_ITEM_ID`) VALUES 
 ('14.99000',NULL,1,NULL,200,212,NULL),
 ('10.99000',NULL,151,NULL,1,1,NULL),
 ('14.99000',NULL,301,NULL,100,122,NULL);
/*!40000 ALTER TABLE `blc_discrete_order_item` ENABLE KEYS */;


--
-- Definition of table `blc_dyn_discrete_order_item`
--

DROP TABLE IF EXISTS `blc_dyn_discrete_order_item`;
CREATE TABLE `blc_dyn_discrete_order_item` (
  `ORDER_ITEM_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ORDER_ITEM_ID`),
  KEY `FK209DEE9EB76B9466` (`ORDER_ITEM_ID`),
  CONSTRAINT `FK209DEE9EB76B9466` FOREIGN KEY (`ORDER_ITEM_ID`) REFERENCES `blc_discrete_order_item` (`ORDER_ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_dyn_discrete_order_item`
--

/*!40000 ALTER TABLE `blc_dyn_discrete_order_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_dyn_discrete_order_item` ENABLE KEYS */;


--
-- Definition of table `blc_email_tracking`
--

DROP TABLE IF EXISTS `blc_email_tracking`;
CREATE TABLE `blc_email_tracking` (
  `EMAIL_TRACKING_ID` bigint(20) NOT NULL,
  `DATE_SENT` datetime DEFAULT NULL,
  `EMAIL_ADDRESS` varchar(255) DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`EMAIL_TRACKING_ID`),
  KEY `EMAILTRACKING_INDEX` (`EMAIL_ADDRESS`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_email_tracking`
--

/*!40000 ALTER TABLE `blc_email_tracking` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_email_tracking` ENABLE KEYS */;


--
-- Definition of table `blc_email_tracking_clicks`
--

DROP TABLE IF EXISTS `blc_email_tracking_clicks`;
CREATE TABLE `blc_email_tracking_clicks` (
  `CLICK_ID` bigint(20) NOT NULL,
  `CUSTOMER_ID` varchar(255) DEFAULT NULL,
  `DATE_CLICKED` datetime NOT NULL,
  `DESTINATION_URI` varchar(255) DEFAULT NULL,
  `QUERY_STRING` varchar(255) DEFAULT NULL,
  `EMAIL_TRACKING_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`CLICK_ID`),
  KEY `TRACKINGCLICKS_CUSTOMER_INDEX` (`CUSTOMER_ID`),
  KEY `TRACKINGCLICKS_TRACKING_INDEX` (`EMAIL_TRACKING_ID`),
  KEY `FKFDF9F52AFA1E5D61` (`EMAIL_TRACKING_ID`),
  CONSTRAINT `FKFDF9F52AFA1E5D61` FOREIGN KEY (`EMAIL_TRACKING_ID`) REFERENCES `blc_email_tracking` (`EMAIL_TRACKING_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_email_tracking_clicks`
--

/*!40000 ALTER TABLE `blc_email_tracking_clicks` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_email_tracking_clicks` ENABLE KEYS */;


--
-- Definition of table `blc_email_tracking_opens`
--

DROP TABLE IF EXISTS `blc_email_tracking_opens`;
CREATE TABLE `blc_email_tracking_opens` (
  `OPEN_ID` bigint(20) NOT NULL,
  `DATE_OPENED` datetime DEFAULT NULL,
  `USER_AGENT` varchar(255) DEFAULT NULL,
  `EMAIL_TRACKING_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`OPEN_ID`),
  KEY `TRACKINGOPEN_TRACKING` (`EMAIL_TRACKING_ID`),
  KEY `FKA5C3722AFA1E5D61` (`EMAIL_TRACKING_ID`),
  CONSTRAINT `FKA5C3722AFA1E5D61` FOREIGN KEY (`EMAIL_TRACKING_ID`) REFERENCES `blc_email_tracking` (`EMAIL_TRACKING_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_email_tracking_opens`
--

/*!40000 ALTER TABLE `blc_email_tracking_opens` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_email_tracking_opens` ENABLE KEYS */;


--
-- Definition of table `blc_fg_adjustment`
--

DROP TABLE IF EXISTS `blc_fg_adjustment`;
CREATE TABLE `blc_fg_adjustment` (
  `FG_ADJUSTMENT_ID` bigint(20) NOT NULL,
  `ADJUSTMENT_REASON` varchar(255) NOT NULL,
  `ADJUSTMENT_VALUE` decimal(19,5) NOT NULL,
  `FULFILLMENT_GROUP_ID` bigint(20) DEFAULT NULL,
  `OFFER_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`FG_ADJUSTMENT_ID`),
  KEY `FGADJUSTMENT_OFFER_INDEX` (`OFFER_ID`),
  KEY `FGADJUSTMENT_INDEX` (`FULFILLMENT_GROUP_ID`),
  KEY `FK468C8F25D5F3FAF4` (`OFFER_ID`),
  KEY `FK468C8F255028DC55` (`FULFILLMENT_GROUP_ID`),
  CONSTRAINT `FK468C8F255028DC55` FOREIGN KEY (`FULFILLMENT_GROUP_ID`) REFERENCES `blc_fulfillment_group` (`FULFILLMENT_GROUP_ID`),
  CONSTRAINT `FK468C8F25D5F3FAF4` FOREIGN KEY (`OFFER_ID`) REFERENCES `blc_offer` (`OFFER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_fg_adjustment`
--

/*!40000 ALTER TABLE `blc_fg_adjustment` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_fg_adjustment` ENABLE KEYS */;


--
-- Definition of table `blc_fg_fee_tax_xref`
--

DROP TABLE IF EXISTS `blc_fg_fee_tax_xref`;
CREATE TABLE `blc_fg_fee_tax_xref` (
  `FULFILLMENT_GROUP_FEE_ID` bigint(20) NOT NULL,
  `TAX_DETAIL_ID` bigint(20) NOT NULL,
  UNIQUE KEY `TAX_DETAIL_ID` (`TAX_DETAIL_ID`),
  KEY `FK25426DC0598F6D02` (`FULFILLMENT_GROUP_FEE_ID`),
  KEY `FK25426DC071448C19` (`TAX_DETAIL_ID`),
  CONSTRAINT `FK25426DC0598F6D02` FOREIGN KEY (`FULFILLMENT_GROUP_FEE_ID`) REFERENCES `blc_fulfillment_group_fee` (`FULFILLMENT_GROUP_FEE_ID`),
  CONSTRAINT `FK25426DC071448C19` FOREIGN KEY (`TAX_DETAIL_ID`) REFERENCES `blc_tax_detail` (`TAX_DETAIL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_fg_fee_tax_xref`
--

/*!40000 ALTER TABLE `blc_fg_fee_tax_xref` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_fg_fee_tax_xref` ENABLE KEYS */;


--
-- Definition of table `blc_fg_fg_tax_xref`
--

DROP TABLE IF EXISTS `blc_fg_fg_tax_xref`;
CREATE TABLE `blc_fg_fg_tax_xref` (
  `FULFILLMENT_GROUP_ID` bigint(20) NOT NULL,
  `TAX_DETAIL_ID` bigint(20) NOT NULL,
  UNIQUE KEY `TAX_DETAIL_ID` (`TAX_DETAIL_ID`),
  KEY `FK61BEA45571448C19` (`TAX_DETAIL_ID`),
  KEY `FK61BEA4555028DC55` (`FULFILLMENT_GROUP_ID`),
  CONSTRAINT `FK61BEA4555028DC55` FOREIGN KEY (`FULFILLMENT_GROUP_ID`) REFERENCES `blc_fulfillment_group` (`FULFILLMENT_GROUP_ID`),
  CONSTRAINT `FK61BEA45571448C19` FOREIGN KEY (`TAX_DETAIL_ID`) REFERENCES `blc_tax_detail` (`TAX_DETAIL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_fg_fg_tax_xref`
--

/*!40000 ALTER TABLE `blc_fg_fg_tax_xref` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_fg_fg_tax_xref` ENABLE KEYS */;


--
-- Definition of table `blc_fg_item_tax_xref`
--

DROP TABLE IF EXISTS `blc_fg_item_tax_xref`;
CREATE TABLE `blc_fg_item_tax_xref` (
  `FULFILLMENT_GROUP_ITEM_ID` bigint(20) NOT NULL,
  `TAX_DETAIL_ID` bigint(20) NOT NULL,
  UNIQUE KEY `TAX_DETAIL_ID` (`TAX_DETAIL_ID`),
  KEY `FKDD3E8443E3BBB4D2` (`FULFILLMENT_GROUP_ITEM_ID`),
  KEY `FKDD3E844371448C19` (`TAX_DETAIL_ID`),
  CONSTRAINT `FKDD3E844371448C19` FOREIGN KEY (`TAX_DETAIL_ID`) REFERENCES `blc_tax_detail` (`TAX_DETAIL_ID`),
  CONSTRAINT `FKDD3E8443E3BBB4D2` FOREIGN KEY (`FULFILLMENT_GROUP_ITEM_ID`) REFERENCES `blc_fulfillment_group_item` (`FULFILLMENT_GROUP_ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_fg_item_tax_xref`
--

/*!40000 ALTER TABLE `blc_fg_item_tax_xref` DISABLE KEYS */;
INSERT INTO `blc_fg_item_tax_xref` (`FULFILLMENT_GROUP_ITEM_ID`,`TAX_DETAIL_ID`) VALUES 
 (1,1),
 (151,151),
 (301,301);
/*!40000 ALTER TABLE `blc_fg_item_tax_xref` ENABLE KEYS */;


--
-- Definition of table `blc_field`
--

DROP TABLE IF EXISTS `blc_field`;
CREATE TABLE `blc_field` (
  `FIELD_ID` bigint(20) NOT NULL,
  `ABBREVIATION` varchar(255) DEFAULT NULL,
  `ENTITY_TYPE` varchar(255) NOT NULL,
  `FACET_FIELD_TYPE` varchar(255) DEFAULT NULL,
  `PROPERTY_NAME` varchar(255) NOT NULL,
  `SEARCHABLE` bit(1) DEFAULT NULL,
  PRIMARY KEY (`FIELD_ID`),
  UNIQUE KEY `ABBREVIATION` (`ABBREVIATION`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_field`
--

/*!40000 ALTER TABLE `blc_field` DISABLE KEYS */;
INSERT INTO `blc_field` (`FIELD_ID`,`ABBREVIATION`,`ENTITY_TYPE`,`FACET_FIELD_TYPE`,`PROPERTY_NAME`,`SEARCHABLE`) VALUES 
 (1,'mfg','PRODUCT','s','manufacturer',0x01),
 (2,'heatRange','PRODUCT','i','productAttributes.heatRange',0x00),
 (3,'price','PRODUCT','p','defaultSku.retailPrice',0x00),
 (4,'name','PRODUCT','s','defaultSku.name',0x01),
 (5,'model','PRODUCT','s','model',0x01),
 (6,'desc','PRODUCT',NULL,'defaultSku.description',0x01),
 (7,'ldesc','PRODUCT',NULL,'defaultSku.longDescription',0x01);
/*!40000 ALTER TABLE `blc_field` ENABLE KEYS */;


--
-- Definition of table `blc_field_search_types`
--

DROP TABLE IF EXISTS `blc_field_search_types`;
CREATE TABLE `blc_field_search_types` (
  `FIELD_ID` bigint(20) NOT NULL,
  `SEARCHABLE_FIELD_TYPE` varchar(255) DEFAULT NULL,
  KEY `FKF52D130D3C3907C4` (`FIELD_ID`),
  CONSTRAINT `FKF52D130D3C3907C4` FOREIGN KEY (`FIELD_ID`) REFERENCES `blc_field` (`FIELD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_field_search_types`
--

/*!40000 ALTER TABLE `blc_field_search_types` DISABLE KEYS */;
INSERT INTO `blc_field_search_types` (`FIELD_ID`,`SEARCHABLE_FIELD_TYPE`) VALUES 
 (1,'t'),
 (4,'t'),
 (5,'t'),
 (6,'t'),
 (7,'t');
/*!40000 ALTER TABLE `blc_field_search_types` ENABLE KEYS */;


--
-- Definition of table `blc_fld_def`
--

DROP TABLE IF EXISTS `blc_fld_def`;
CREATE TABLE `blc_fld_def` (
  `FLD_DEF_ID` bigint(20) NOT NULL,
  `ALLOW_MULTIPLES` bit(1) DEFAULT NULL,
  `COLUMN_WIDTH` varchar(255) DEFAULT NULL,
  `FLD_ORDER` int(11) DEFAULT NULL,
  `FLD_TYPE` varchar(255) DEFAULT NULL,
  `FRIENDLY_NAME` varchar(255) DEFAULT NULL,
  `HIDDEN_FLAG` bit(1) DEFAULT NULL,
  `MAX_LENGTH` int(11) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `SECURITY_LEVEL` varchar(255) DEFAULT NULL,
  `TEXT_AREA_FLAG` bit(1) DEFAULT NULL,
  `VLDTN_ERROR_MSSG_KEY` varchar(255) DEFAULT NULL,
  `VLDTN_REGEX` varchar(255) DEFAULT NULL,
  `FLD_ENUM_ID` bigint(20) DEFAULT NULL,
  `FLD_GROUP_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`FLD_DEF_ID`),
  KEY `FK3FCB575EFD2EA299` (`FLD_ENUM_ID`),
  KEY `FK3FCB575E6A79BDB5` (`FLD_GROUP_ID`),
  CONSTRAINT `FK3FCB575E6A79BDB5` FOREIGN KEY (`FLD_GROUP_ID`) REFERENCES `blc_fld_group` (`FLD_GROUP_ID`),
  CONSTRAINT `FK3FCB575EFD2EA299` FOREIGN KEY (`FLD_ENUM_ID`) REFERENCES `blc_fld_enum` (`FLD_ENUM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_fld_def`
--

/*!40000 ALTER TABLE `blc_fld_def` DISABLE KEYS */;
INSERT INTO `blc_fld_def` (`FLD_DEF_ID`,`ALLOW_MULTIPLES`,`COLUMN_WIDTH`,`FLD_ORDER`,`FLD_TYPE`,`FRIENDLY_NAME`,`HIDDEN_FLAG`,`MAX_LENGTH`,`NAME`,`SECURITY_LEVEL`,`TEXT_AREA_FLAG`,`VLDTN_ERROR_MSSG_KEY`,`VLDTN_REGEX`,`FLD_ENUM_ID`,`FLD_GROUP_ID`) VALUES 
 (2,0x00,'*',5,'HTML','Body',0x00,NULL,'body',NULL,0x00,NULL,NULL,NULL,1),
 (3,0x00,'*',0,'STRING','Title',0x00,NULL,'title',NULL,0x00,NULL,NULL,NULL,1),
 (4,0x00,'*',1,'STRING','Meta-Description',0x00,NULL,'metaDescription',NULL,0x00,NULL,NULL,NULL,1),
 (5,0x00,'*',2,'STRING','Meta-Keywords',0x00,NULL,'metaKeywords',NULL,0x00,NULL,NULL,NULL,1),
 (6,0x00,'*',3,'STRING','Meta-Robot',0x00,NULL,'metaRobot',NULL,0x00,NULL,NULL,NULL,1),
 (7,0x00,'*',4,'STRING','Title-Fragment',0x00,NULL,'titleFragment',NULL,0x00,NULL,NULL,NULL,1),
 (8,0x00,'*',0,'STRING','Image URL',0x00,150,'imageUrl',NULL,0x00,NULL,NULL,NULL,4),
 (9,0x00,'*',1,'STRING','Target URL',0x00,150,'targetUrl',NULL,0x00,NULL,NULL,NULL,4),
 (10,0x00,'*',0,'STRING','Message Text',0x00,150,'messageText',NULL,0x00,NULL,NULL,NULL,6),
 (11,0x00,'*',0,'HTML','HTML Content',0x00,NULL,'htmlContent',NULL,0x00,NULL,NULL,NULL,5);
/*!40000 ALTER TABLE `blc_fld_def` ENABLE KEYS */;


--
-- Definition of table `blc_fld_enum`
--

DROP TABLE IF EXISTS `blc_fld_enum`;
CREATE TABLE `blc_fld_enum` (
  `FLD_ENUM_ID` bigint(20) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`FLD_ENUM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_fld_enum`
--

/*!40000 ALTER TABLE `blc_fld_enum` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_fld_enum` ENABLE KEYS */;


--
-- Definition of table `blc_fld_enum_item`
--

DROP TABLE IF EXISTS `blc_fld_enum_item`;
CREATE TABLE `blc_fld_enum_item` (
  `FLD_ENUM_ITEM_ID` bigint(20) NOT NULL,
  `FLD_ORDER` int(11) DEFAULT NULL,
  `FRIENDLY_NAME` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `FLD_ENUM_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`FLD_ENUM_ITEM_ID`),
  KEY `FK83A6A84AFD2EA299` (`FLD_ENUM_ID`),
  CONSTRAINT `FK83A6A84AFD2EA299` FOREIGN KEY (`FLD_ENUM_ID`) REFERENCES `blc_fld_enum` (`FLD_ENUM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_fld_enum_item`
--

/*!40000 ALTER TABLE `blc_fld_enum_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_fld_enum_item` ENABLE KEYS */;


--
-- Definition of table `blc_fld_group`
--

DROP TABLE IF EXISTS `blc_fld_group`;
CREATE TABLE `blc_fld_group` (
  `FLD_GROUP_ID` bigint(20) NOT NULL,
  `INIT_COLLAPSED_FLAG` bit(1) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`FLD_GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_fld_group`
--

/*!40000 ALTER TABLE `blc_fld_group` DISABLE KEYS */;
INSERT INTO `blc_fld_group` (`FLD_GROUP_ID`,`INIT_COLLAPSED_FLAG`,`NAME`) VALUES 
 (1,0x00,'Content'),
 (4,0x00,'Ad Fields'),
 (5,0x00,'HTML Fields'),
 (6,0x00,'Message Fields');
/*!40000 ALTER TABLE `blc_fld_group` ENABLE KEYS */;


--
-- Definition of table `blc_fulfillment_group`
--

DROP TABLE IF EXISTS `blc_fulfillment_group`;
CREATE TABLE `blc_fulfillment_group` (
  `FULFILLMENT_GROUP_ID` bigint(20) NOT NULL,
  `DELIVERY_INSTRUCTION` varchar(255) DEFAULT NULL,
  `SHIPPING_PRICE_TAXABLE` bit(1) DEFAULT NULL,
  `MERCHANDISE_TOTAL` decimal(19,5) DEFAULT NULL,
  `METHOD` varchar(255) DEFAULT NULL,
  `IS_PRIMARY` bit(1) DEFAULT NULL,
  `REFERENCE_NUMBER` varchar(255) DEFAULT NULL,
  `RETAIL_PRICE` decimal(19,5) DEFAULT NULL,
  `SALE_PRICE` decimal(19,5) DEFAULT NULL,
  `SERVICE` varchar(255) DEFAULT NULL,
  `PRICE` decimal(19,5) DEFAULT NULL,
  `STATUS` varchar(255) DEFAULT NULL,
  `TOTAL` decimal(19,5) DEFAULT NULL,
  `TOTAL_FEE_TAX` decimal(19,5) DEFAULT NULL,
  `TOTAL_FG_TAX` decimal(19,5) DEFAULT NULL,
  `TOTAL_ITEM_TAX` decimal(19,5) DEFAULT NULL,
  `TOTAL_TAX` decimal(19,5) DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `ADDRESS_ID` bigint(20) DEFAULT NULL,
  `FULFILLMENT_OPTION_ID` bigint(20) DEFAULT NULL,
  `ORDER_ID` bigint(20) NOT NULL,
  `PERSONAL_MESSAGE_ID` bigint(20) DEFAULT NULL,
  `PHONE_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`FULFILLMENT_GROUP_ID`),
  KEY `FG_PHONE_INDEX` (`PHONE_ID`),
  KEY `FG_MESSAGE_INDEX` (`PERSONAL_MESSAGE_ID`),
  KEY `FG_SERVICE_INDEX` (`SERVICE`),
  KEY `FG_METHOD_INDEX` (`METHOD`),
  KEY `FG_ADDRESS_INDEX` (`ADDRESS_ID`),
  KEY `FG_PRIMARY_INDEX` (`IS_PRIMARY`),
  KEY `FG_REFERENCE_INDEX` (`REFERENCE_NUMBER`),
  KEY `FG_STATUS_INDEX` (`STATUS`),
  KEY `FG_ORDER_INDEX` (`ORDER_ID`),
  KEY `FKC5B9EF1877F565E1` (`PERSONAL_MESSAGE_ID`),
  KEY `FKC5B9EF18D894CB5D` (`PHONE_ID`),
  KEY `FKC5B9EF18C13085DD` (`ADDRESS_ID`),
  KEY `FKC5B9EF1889FE8A02` (`ORDER_ID`),
  KEY `FKC5B9EF1881F34C7F` (`FULFILLMENT_OPTION_ID`),
  CONSTRAINT `FKC5B9EF1877F565E1` FOREIGN KEY (`PERSONAL_MESSAGE_ID`) REFERENCES `blc_personal_message` (`PERSONAL_MESSAGE_ID`),
  CONSTRAINT `FKC5B9EF1881F34C7F` FOREIGN KEY (`FULFILLMENT_OPTION_ID`) REFERENCES `blc_fulfillment_option` (`FULFILLMENT_OPTION_ID`),
  CONSTRAINT `FKC5B9EF1889FE8A02` FOREIGN KEY (`ORDER_ID`) REFERENCES `blc_order` (`ORDER_ID`),
  CONSTRAINT `FKC5B9EF18C13085DD` FOREIGN KEY (`ADDRESS_ID`) REFERENCES `blc_address` (`ADDRESS_ID`),
  CONSTRAINT `FKC5B9EF18D894CB5D` FOREIGN KEY (`PHONE_ID`) REFERENCES `blc_phone` (`PHONE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_fulfillment_group`
--

/*!40000 ALTER TABLE `blc_fulfillment_group` DISABLE KEYS */;
INSERT INTO `blc_fulfillment_group` (`FULFILLMENT_GROUP_ID`,`DELIVERY_INSTRUCTION`,`SHIPPING_PRICE_TAXABLE`,`MERCHANDISE_TOTAL`,`METHOD`,`IS_PRIMARY`,`REFERENCE_NUMBER`,`RETAIL_PRICE`,`SALE_PRICE`,`SERVICE`,`PRICE`,`STATUS`,`TOTAL`,`TOTAL_FEE_TAX`,`TOTAL_FG_TAX`,`TOTAL_ITEM_TAX`,`TOTAL_TAX`,`TYPE`,`ADDRESS_ID`,`FULFILLMENT_OPTION_ID`,`ORDER_ID`,`PERSONAL_MESSAGE_ID`,`PHONE_ID`) VALUES 
 (1,NULL,0x00,'11.99000',NULL,0x00,NULL,'0.00000','0.00000',NULL,'0.00000',NULL,'12.59000','0.00000','0.00000','0.60000','0.60000','PHYSICAL',NULL,NULL,1,NULL,NULL),
 (51,NULL,0x00,'10.99000',NULL,0x00,NULL,'0.00000','0.00000',NULL,'0.00000',NULL,'11.54000','0.00000','0.00000','0.55000','0.55000','PHYSICAL',NULL,NULL,51,NULL,NULL),
 (101,NULL,0x00,'11.99000',NULL,0x00,NULL,'0.00000','0.00000',NULL,'0.00000',NULL,'12.59000','0.00000','0.00000','0.60000','0.60000','PHYSICAL',NULL,NULL,101,NULL,NULL);
/*!40000 ALTER TABLE `blc_fulfillment_group` ENABLE KEYS */;


--
-- Definition of table `blc_fulfillment_group_fee`
--

DROP TABLE IF EXISTS `blc_fulfillment_group_fee`;
CREATE TABLE `blc_fulfillment_group_fee` (
  `FULFILLMENT_GROUP_FEE_ID` bigint(20) NOT NULL,
  `AMOUNT` decimal(19,5) DEFAULT NULL,
  `FEE_TAXABLE_FLAG` bit(1) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REPORTING_CODE` varchar(255) DEFAULT NULL,
  `TOTAL_FEE_TAX` decimal(19,5) DEFAULT NULL,
  `FULFILLMENT_GROUP_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`FULFILLMENT_GROUP_FEE_ID`),
  KEY `FK6AA8E1BF5028DC55` (`FULFILLMENT_GROUP_ID`),
  CONSTRAINT `FK6AA8E1BF5028DC55` FOREIGN KEY (`FULFILLMENT_GROUP_ID`) REFERENCES `blc_fulfillment_group` (`FULFILLMENT_GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_fulfillment_group_fee`
--

/*!40000 ALTER TABLE `blc_fulfillment_group_fee` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_fulfillment_group_fee` ENABLE KEYS */;


--
-- Definition of table `blc_fulfillment_group_item`
--

DROP TABLE IF EXISTS `blc_fulfillment_group_item`;
CREATE TABLE `blc_fulfillment_group_item` (
  `FULFILLMENT_GROUP_ITEM_ID` bigint(20) NOT NULL,
  `QUANTITY` int(11) NOT NULL,
  `STATUS` varchar(255) DEFAULT NULL,
  `TOTAL_ITEM_TAX` decimal(19,5) DEFAULT NULL,
  `FULFILLMENT_GROUP_ID` bigint(20) NOT NULL,
  `ORDER_ITEM_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`FULFILLMENT_GROUP_ITEM_ID`),
  KEY `FGITEM_STATUS_INDEX` (`STATUS`),
  KEY `FGITEM_FG_INDEX` (`FULFILLMENT_GROUP_ID`),
  KEY `FKEA74EBDA9AF166DF` (`ORDER_ITEM_ID`),
  KEY `FKEA74EBDA5028DC55` (`FULFILLMENT_GROUP_ID`),
  CONSTRAINT `FKEA74EBDA5028DC55` FOREIGN KEY (`FULFILLMENT_GROUP_ID`) REFERENCES `blc_fulfillment_group` (`FULFILLMENT_GROUP_ID`),
  CONSTRAINT `FKEA74EBDA9AF166DF` FOREIGN KEY (`ORDER_ITEM_ID`) REFERENCES `blc_order_item` (`ORDER_ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_fulfillment_group_item`
--

/*!40000 ALTER TABLE `blc_fulfillment_group_item` DISABLE KEYS */;
INSERT INTO `blc_fulfillment_group_item` (`FULFILLMENT_GROUP_ITEM_ID`,`QUANTITY`,`STATUS`,`TOTAL_ITEM_TAX`,`FULFILLMENT_GROUP_ID`,`ORDER_ITEM_ID`) VALUES 
 (1,1,NULL,'0.60000',1,1),
 (151,1,NULL,'0.55000',51,151),
 (301,1,NULL,'0.60000',101,301);
/*!40000 ALTER TABLE `blc_fulfillment_group_item` ENABLE KEYS */;


--
-- Definition of table `blc_fulfillment_opt_banded_prc`
--

DROP TABLE IF EXISTS `blc_fulfillment_opt_banded_prc`;
CREATE TABLE `blc_fulfillment_opt_banded_prc` (
  `FULFILLMENT_OPTION_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`FULFILLMENT_OPTION_ID`),
  KEY `FKB1FD71E981F34C7F` (`FULFILLMENT_OPTION_ID`),
  CONSTRAINT `FKB1FD71E981F34C7F` FOREIGN KEY (`FULFILLMENT_OPTION_ID`) REFERENCES `blc_fulfillment_option` (`FULFILLMENT_OPTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_fulfillment_opt_banded_prc`
--

/*!40000 ALTER TABLE `blc_fulfillment_opt_banded_prc` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_fulfillment_opt_banded_prc` ENABLE KEYS */;


--
-- Definition of table `blc_fulfillment_opt_banded_wgt`
--

DROP TABLE IF EXISTS `blc_fulfillment_opt_banded_wgt`;
CREATE TABLE `blc_fulfillment_opt_banded_wgt` (
  `FULFILLMENT_OPTION_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`FULFILLMENT_OPTION_ID`),
  KEY `FKB1FD8AEC81F34C7F` (`FULFILLMENT_OPTION_ID`),
  CONSTRAINT `FKB1FD8AEC81F34C7F` FOREIGN KEY (`FULFILLMENT_OPTION_ID`) REFERENCES `blc_fulfillment_option` (`FULFILLMENT_OPTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_fulfillment_opt_banded_wgt`
--

/*!40000 ALTER TABLE `blc_fulfillment_opt_banded_wgt` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_fulfillment_opt_banded_wgt` ENABLE KEYS */;


--
-- Definition of table `blc_fulfillment_option`
--

DROP TABLE IF EXISTS `blc_fulfillment_option`;
CREATE TABLE `blc_fulfillment_option` (
  `FULFILLMENT_OPTION_ID` bigint(20) NOT NULL,
  `FULFILLMENT_TYPE` varchar(255) NOT NULL,
  `LONG_DESCRIPTION` longtext,
  `NAME` varchar(255) DEFAULT NULL,
  `USE_FLAT_RATES` bit(1) DEFAULT NULL,
  PRIMARY KEY (`FULFILLMENT_OPTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_fulfillment_option`
--

/*!40000 ALTER TABLE `blc_fulfillment_option` DISABLE KEYS */;
INSERT INTO `blc_fulfillment_option` (`FULFILLMENT_OPTION_ID`,`FULFILLMENT_TYPE`,`LONG_DESCRIPTION`,`NAME`,`USE_FLAT_RATES`) VALUES 
 (1,'PHYSICAL','2 - 7 Days','First Class',0x00),
 (2,'PHYSICAL','2 - 5 Days','Priority',0x00),
 (3,'PHYSICAL','1 - 2 Days','Express',0x00);
/*!40000 ALTER TABLE `blc_fulfillment_option` ENABLE KEYS */;


--
-- Definition of table `blc_fulfillment_option_fixed`
--

DROP TABLE IF EXISTS `blc_fulfillment_option_fixed`;
CREATE TABLE `blc_fulfillment_option_fixed` (
  `PRICE` decimal(19,5) NOT NULL,
  `FULFILLMENT_OPTION_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`FULFILLMENT_OPTION_ID`),
  KEY `FK4083603181F34C7F` (`FULFILLMENT_OPTION_ID`),
  CONSTRAINT `FK4083603181F34C7F` FOREIGN KEY (`FULFILLMENT_OPTION_ID`) REFERENCES `blc_fulfillment_option` (`FULFILLMENT_OPTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_fulfillment_option_fixed`
--

/*!40000 ALTER TABLE `blc_fulfillment_option_fixed` DISABLE KEYS */;
INSERT INTO `blc_fulfillment_option_fixed` (`PRICE`,`FULFILLMENT_OPTION_ID`) VALUES 
 ('5.00000',1),
 ('10.00000',2),
 ('20.00000',3);
/*!40000 ALTER TABLE `blc_fulfillment_option_fixed` ENABLE KEYS */;


--
-- Definition of table `blc_fulfillment_price_band`
--

DROP TABLE IF EXISTS `blc_fulfillment_price_band`;
CREATE TABLE `blc_fulfillment_price_band` (
  `FULFILLMENT_PRICE_BAND_ID` bigint(20) NOT NULL,
  `RESULT_AMOUNT` decimal(19,5) NOT NULL,
  `RESULT_AMOUNT_TYPE` varchar(255) NOT NULL,
  `RETAIL_PRICE_MINIMUM_AMOUNT` decimal(19,5) NOT NULL,
  `FULFILLMENT_OPTION_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`FULFILLMENT_PRICE_BAND_ID`),
  KEY `FK46C9EA726CDF59CA` (`FULFILLMENT_OPTION_ID`),
  CONSTRAINT `FK46C9EA726CDF59CA` FOREIGN KEY (`FULFILLMENT_OPTION_ID`) REFERENCES `blc_fulfillment_opt_banded_prc` (`FULFILLMENT_OPTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_fulfillment_price_band`
--

/*!40000 ALTER TABLE `blc_fulfillment_price_band` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_fulfillment_price_band` ENABLE KEYS */;


--
-- Definition of table `blc_fulfillment_weight_band`
--

DROP TABLE IF EXISTS `blc_fulfillment_weight_band`;
CREATE TABLE `blc_fulfillment_weight_band` (
  `FULFILLMENT_WEIGHT_BAND_ID` bigint(20) NOT NULL,
  `RESULT_AMOUNT` decimal(19,5) NOT NULL,
  `RESULT_AMOUNT_TYPE` varchar(255) NOT NULL,
  `MINIMUM_WEIGHT` decimal(19,5) DEFAULT NULL,
  `WEIGHT_UNIT_OF_MEASURE` varchar(255) DEFAULT NULL,
  `FULFILLMENT_OPTION_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`FULFILLMENT_WEIGHT_BAND_ID`),
  KEY `FK6A048D95A0B429C3` (`FULFILLMENT_OPTION_ID`),
  CONSTRAINT `FK6A048D95A0B429C3` FOREIGN KEY (`FULFILLMENT_OPTION_ID`) REFERENCES `blc_fulfillment_opt_banded_wgt` (`FULFILLMENT_OPTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_fulfillment_weight_band`
--

/*!40000 ALTER TABLE `blc_fulfillment_weight_band` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_fulfillment_weight_band` ENABLE KEYS */;


--
-- Definition of table `blc_gift_card_payment`
--

DROP TABLE IF EXISTS `blc_gift_card_payment`;
CREATE TABLE `blc_gift_card_payment` (
  `PAYMENT_ID` bigint(20) NOT NULL,
  `PAN` varchar(255) NOT NULL,
  `PIN` varchar(255) DEFAULT NULL,
  `REFERENCE_NUMBER` varchar(255) NOT NULL,
  PRIMARY KEY (`PAYMENT_ID`),
  KEY `GIFTCARD_INDEX` (`REFERENCE_NUMBER`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_gift_card_payment`
--

/*!40000 ALTER TABLE `blc_gift_card_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_gift_card_payment` ENABLE KEYS */;


--
-- Definition of table `blc_giftwrap_order_item`
--

DROP TABLE IF EXISTS `blc_giftwrap_order_item`;
CREATE TABLE `blc_giftwrap_order_item` (
  `ORDER_ITEM_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ORDER_ITEM_ID`),
  KEY `FKE1BE1563B76B9466` (`ORDER_ITEM_ID`),
  CONSTRAINT `FKE1BE1563B76B9466` FOREIGN KEY (`ORDER_ITEM_ID`) REFERENCES `blc_discrete_order_item` (`ORDER_ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_giftwrap_order_item`
--

/*!40000 ALTER TABLE `blc_giftwrap_order_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_giftwrap_order_item` ENABLE KEYS */;


--
-- Definition of table `blc_id_generation`
--

DROP TABLE IF EXISTS `blc_id_generation`;
CREATE TABLE `blc_id_generation` (
  `ID_TYPE` varchar(255) NOT NULL,
  `BATCH_SIZE` bigint(20) NOT NULL,
  `BATCH_START` bigint(20) NOT NULL,
  `ID_MIN` bigint(20) DEFAULT NULL,
  `ID_MAX` bigint(20) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_id_generation`
--

/*!40000 ALTER TABLE `blc_id_generation` DISABLE KEYS */;
INSERT INTO `blc_id_generation` (`ID_TYPE`,`BATCH_SIZE`,`BATCH_START`,`ID_MIN`,`ID_MAX`,`version`) VALUES 
 ('org.broadleafcommerce.profile.core.domain.Customer',100,800,NULL,NULL,8);
/*!40000 ALTER TABLE `blc_id_generation` ENABLE KEYS */;


--
-- Definition of table `blc_img_static_asset`
--

DROP TABLE IF EXISTS `blc_img_static_asset`;
CREATE TABLE `blc_img_static_asset` (
  `HEIGHT` int(11) DEFAULT NULL,
  `WIDTH` int(11) DEFAULT NULL,
  `STATIC_ASSET_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`STATIC_ASSET_ID`),
  KEY `FKCC4B772167F70B63` (`STATIC_ASSET_ID`),
  CONSTRAINT `FKCC4B772167F70B63` FOREIGN KEY (`STATIC_ASSET_ID`) REFERENCES `blc_static_asset` (`STATIC_ASSET_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_img_static_asset`
--

/*!40000 ALTER TABLE `blc_img_static_asset` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_img_static_asset` ENABLE KEYS */;


--
-- Definition of table `blc_locale`
--

DROP TABLE IF EXISTS `blc_locale`;
CREATE TABLE `blc_locale` (
  `LOCALE_CODE` varchar(255) NOT NULL,
  `DEFAULT_FLAG` bit(1) DEFAULT NULL,
  `FRIENDLY_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`LOCALE_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_locale`
--

/*!40000 ALTER TABLE `blc_locale` DISABLE KEYS */;
INSERT INTO `blc_locale` (`LOCALE_CODE`,`DEFAULT_FLAG`,`FRIENDLY_NAME`) VALUES 
 ('en',0x01,'English'),
 ('es',0x00,'Spanish');
/*!40000 ALTER TABLE `blc_locale` ENABLE KEYS */;


--
-- Definition of table `blc_media`
--

DROP TABLE IF EXISTS `blc_media`;
CREATE TABLE `blc_media` (
  `MEDIA_ID` bigint(20) NOT NULL,
  `ALT_TEXT` varchar(255) DEFAULT NULL,
  `TAGS` varchar(255) DEFAULT NULL,
  `TITLE` varchar(255) DEFAULT NULL,
  `URL` varchar(255) NOT NULL,
  PRIMARY KEY (`MEDIA_ID`),
  KEY `MEDIA_URL_INDEX` (`URL`),
  KEY `MEDIA_TITLE_INDEX` (`TITLE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_media`
--

/*!40000 ALTER TABLE `blc_media` DISABLE KEYS */;
INSERT INTO `blc_media` (`MEDIA_ID`,`ALT_TEXT`,`TAGS`,`TITLE`,`URL`) VALUES 
 (101,'primary',NULL,'Sudden Death Sauce Bottle','/img/sauces/Sudden-Death-Sauce-Bottle.jpg'),
 (102,'alt1',NULL,'Sudden Death Sauce Close-up','/img/sauces/Sudden-Death-Sauce-Close.jpg'),
 (201,'primary',NULL,'Sweet Death Sauce Bottle','/img/sauces/Sweet-Death-Sauce-Bottle.jpg'),
 (202,'alt1',NULL,'Sweet Death Sauce Close-up','/img/sauces/Sweet-Death-Sauce-Close.jpg'),
 (203,'alt2',NULL,'Sweet Death Sauce Close-up','/img/sauces/Sweet-Death-Sauce-Skull.jpg'),
 (204,'alt3',NULL,'Sweet Death Sauce Close-up','/img/sauces/Sweet-Death-Sauce-Tile.jpg'),
 (205,'alt4',NULL,'Sweet Death Sauce Close-up','/img/sauces/Sweet-Death-Sauce-Grass.jpg'),
 (206,'alt5',NULL,'Sweet Death Sauce Close-up','/img/sauces/Sweet-Death-Sauce-Logo.jpg'),
 (301,'primary',NULL,'Hoppin Hot Sauce Bottle','/img/sauces/Hoppin-Hot-Sauce-Bottle.jpg'),
 (302,'alt1',NULL,'Hoppin Hot Sauce Close-up','/img/sauces/Hoppin-Hot-Sauce-Close.jpg'),
 (401,'primary',NULL,'Day of the Dead Chipotle Hot Sauce Bottle','/img/sauces/Day-of-the-Dead-Chipotle-Hot-Sauce-Bottle.jpg'),
 (402,'alt1',NULL,'Day of the Dead Chipotle Hot Sauce Close-up','/img/sauces/Day-of-the-Dead-Chipotle-Hot-Sauce-Close.jpg'),
 (501,'primary',NULL,'Day of the Dead Habanero Hot Sauce Bottle','/img/sauces/Day-of-the-Dead-Habanero-Hot-Sauce-Bottle.jpg'),
 (502,'alt1',NULL,'Day of the Dead Habanero Hot Sauce Close-up','/img/sauces/Day-of-the-Dead-Habanero-Hot-Sauce-Close.jpg'),
 (601,'primary',NULL,'Day of the Dead Scotch Bonnet Hot Sauce Bottle','/img/sauces/Day-of-the-Dead-Scotch-Bonnet-Hot-Sauce-Bottle.jpg'),
 (602,'alt1',NULL,'Day of the Dead Scotch Bonnet Hot Sauce Close-up','/img/sauces/Day-of-the-Dead-Scotch-Bonnet-Hot-Sauce-Close.jpg'),
 (701,'primary',NULL,'Green Ghost Bottle','/img/sauces/Green-Ghost-Bottle.jpg'),
 (702,'alt1',NULL,'Green Ghost Close-up','/img/sauces/Green-Ghost-Close.jpg'),
 (801,'primary',NULL,'Blazin Saddle XXX Hot Habanero Pepper Sauce Bottle','/img/sauces/Blazin-Saddle-XXX-Hot-Habanero-Pepper-Sauce-Bottle.jpg'),
 (802,'alt1',NULL,'Blazin Saddle XXX Hot Habanero Pepper Sauce Close-up','/img/sauces/Blazin-Saddle-XXX-Hot-Habanero-Pepper-Sauce-Close.jpg'),
 (901,'primary',NULL,'Armageddon The Hot Sauce To End All Bottle','/img/sauces/Armageddon-The-Hot-Sauce-To-End-All-Bottle.jpg'),
 (902,'alt1',NULL,'Armageddon The Hot Sauce To End All Close-up','/img/sauces/Armageddon-The-Hot-Sauce-To-End-All-Close.jpg'),
 (1001,'primary',NULL,'Dr. Chilemeisters Insane Hot Sauce Bottle','/img/sauces/Dr.-Chilemeisters-Insane-Hot-Sauce-Bottle.jpg'),
 (1002,'alt1',NULL,'Dr. Chilemeisters Insane Hot Sauce Close-up','/img/sauces/Dr.-Chilemeisters-Insane-Hot-Sauce-Close.jpg'),
 (1101,'primary',NULL,'Bull Snort Cowboy Cayenne Pepper Hot Sauce Bottle','/img/sauces/Bull-Snort-Cowboy-Cayenne-Pepper-Hot-Sauce-Bottle.jpg'),
 (1102,'alt1',NULL,'Bull Snort Cowboy Cayenne Pepper Hot Sauce Close-up','/img/sauces/Bull-Snort-Cowboy-Cayenne-Pepper-Hot-Sauce-Close.jpg'),
 (1201,'primary',NULL,'Cafe Louisiane Sweet Cajun Blackening Sauce Bottle','/img/sauces/Cafe-Louisiane-Sweet-Cajun-Blackening-Sauce-Bottle.jpg'),
 (1202,'alt1',NULL,'Cafe Louisiane Sweet Cajun Blackening Sauce Close-up','/img/sauces/Cafe-Louisiane-Sweet-Cajun-Blackening-Sauce-Close.jpg'),
 (1301,'primary',NULL,'Bull Snort Smokin Toncils Hot Sauce Bottle','/img/sauces/Bull-Snort-Smokin-Toncils-Hot-Sauce-Bottle.jpg'),
 (1302,'alt1',NULL,'Bull Snort Smokin Toncils Hot Sauce Close-up','/img/sauces/Bull-Snort-Smokin-Toncils-Hot-Sauce-Close.jpg'),
 (1401,'primary',NULL,'Cool Cayenne Pepper Hot Sauce Bottle','/img/sauces/Cool-Cayenne-Pepper-Hot-Sauce-Bottle.jpg'),
 (1402,'alt1',NULL,'Cool Cayenne Pepper Hot Sauce Close-up','/img/sauces/Cool-Cayenne-Pepper-Hot-Sauce-Close.jpg'),
 (1501,'primary',NULL,'Roasted Garlic Hot Sauce Bottle','/img/sauces/Roasted-Garlic-Hot-Sauce-Bottle.jpg'),
 (1502,'alt1',NULL,'Roasted Garlic Hot Sauce Close-up','/img/sauces/Roasted-Garlic-Hot-Sauce-Close.jpg'),
 (1601,'primary',NULL,'Scotch Bonnet Hot Sauce Bottle','/img/sauces/Scotch-Bonnet-Hot-Sauce-Bottle.jpg'),
 (1602,'alt1',NULL,'Scotch Bonnet Hot Sauce Close-up','/img/sauces/Scotch-Bonnet-Hot-Sauce-Close.jpg'),
 (1701,'primary',NULL,'Insanity Sauce Bottle','/img/sauces/Insanity-Sauce-Bottle.jpg'),
 (1702,'alt1',NULL,'Insanity Sauce Close-up','/img/sauces/Insanity-Sauce-Close.jpg'),
 (1801,'primary',NULL,'Hurtin Jalepeno Hot Sauce Bottle','/img/sauces/Hurtin-Jalepeno-Hot-Sauce-Bottle.jpg'),
 (1802,'alt1',NULL,'Hurtin Jalepeno Hot Sauce Close-up','/img/sauces/Hurtin-Jalepeno-Hot-Sauce-Close.jpg'),
 (1901,'primary',NULL,'Roasted Red Pepper and Chipotle Hot Sauce Bottle','/img/sauces/Roasted-Red-Pepper-and-Chipotle-Hot-Sauce-Bottle.jpg'),
 (1902,'alt1',NULL,'Roasted Red Pepper and Chipotle Hot Sauce Close-up','/img/sauces/Roasted-Red-Pepper-and-Chipotle-Hot-Sauce-Close.jpg'),
 (10001,'primary','Black','Hawt Like a Habanero Men\'s Black','/img/merch/habanero_mens_black.jpg'),
 (10002,'primary','Red','Hawt Like a Habanero Men\'s Red','/img/merch/habanero_mens_red.jpg'),
 (10003,'primary','Silver','Hawt Like a Habanero Men\'s Silver','/img/merch/habanero_mens_silver.jpg'),
 (20001,'primary','Black','Hawt Like a Habanero Women\'s Black','/img/merch/habanero_womens_black.jpg'),
 (20002,'primary','Red','Hawt Like a Habanero Women\'s Red','/img/merch/habanero_womens_red.jpg'),
 (20003,'primary','Silver','Hawt Like a Habanero Women\'s Silver','/img/merch/habanero_womens_silver.jpg'),
 (30001,'primary',NULL,'Heat Clinic Hand-Drawn Men\'s Black','/img/merch/heat_clinic_handdrawn_mens_black.jpg'),
 (30002,'primary',NULL,'Heat Clinic Hand-Drawn Men\'s Red','/img/merch/heat_clinic_handdrawn_mens_red.jpg'),
 (30003,'primary',NULL,'Heat Clinic Hand-Drawn Men\'s Silver','/img/merch/heat_clinic_handdrawn_mens_silver.jpg'),
 (40001,'primary',NULL,'Heat Clinic Hand-Drawn Women\'s Black','/img/merch/heat_clinic_handdrawn_womens_black.jpg'),
 (40002,'primary',NULL,'Heat Clinic Hand-Drawn Women\'s Red','/img/merch/heat_clinic_handdrawn_womens_red.jpg'),
 (40003,'primary',NULL,'Heat Clinic Hand-Drawn Women\'s Silver','/img/merch/heat_clinic_handdrawn_womens_silver.jpg'),
 (50001,'primary',NULL,'Heat Clinic Mascot Men\'s Black','/img/merch/heat_clinic_mascot_mens_black.jpg'),
 (50002,'primary',NULL,'Heat Clinic Mascot Men\'s Red','/img/merch/heat_clinic_mascot_mens_red.jpg'),
 (50003,'primary',NULL,'Heat Clinic Mascot Men\'s Silver','/img/merch/heat_clinic_mascot_mens_silver.jpg'),
 (60001,'primary',NULL,'Heat Clinic Mascot Women\'s Black','/img/merch/heat_clinic_mascot_womens_black.jpg'),
 (60002,'primary',NULL,'Heat Clinic Mascot Women\'s Red','/img/merch/heat_clinic_mascot_womens_red.jpg'),
 (60003,'primary',NULL,'Heat Clinic Mascot Women\'s Silver','/img/merch/heat_clinic_mascot_womens_silver.jpg');
/*!40000 ALTER TABLE `blc_media` ENABLE KEYS */;


--
-- Definition of table `blc_offer`
--

DROP TABLE IF EXISTS `blc_offer`;
CREATE TABLE `blc_offer` (
  `OFFER_ID` bigint(20) NOT NULL,
  `APPLIES_WHEN_RULES` longtext,
  `APPLIES_TO_RULES` longtext,
  `APPLY_OFFER_TO_MARKED_ITEMS` bit(1) DEFAULT NULL,
  `APPLY_TO_SALE_PRICE` bit(1) DEFAULT NULL,
  `ARCHIVED` char(1) DEFAULT NULL,
  `COMBINABLE_WITH_OTHER_OFFERS` bit(1) DEFAULT NULL,
  `OFFER_DELIVERY_TYPE` varchar(255) NOT NULL,
  `OFFER_DESCRIPTION` varchar(255) DEFAULT NULL,
  `OFFER_DISCOUNT_TYPE` varchar(255) DEFAULT NULL,
  `END_DATE` datetime DEFAULT NULL,
  `MAX_USES_PER_CUSTOMER` bigint(20) DEFAULT NULL,
  `MAX_USES` int(11) DEFAULT NULL,
  `OFFER_NAME` varchar(255) NOT NULL,
  `OFFER_ITEM_QUALIFIER_RULE` varchar(255) DEFAULT NULL,
  `OFFER_ITEM_TARGET_RULE` varchar(255) DEFAULT NULL,
  `OFFER_PRIORITY` int(11) DEFAULT NULL,
  `QUALIFYING_ITEM_MIN_TOTAL` decimal(19,5) DEFAULT NULL,
  `STACKABLE` bit(1) DEFAULT NULL,
  `START_DATE` datetime DEFAULT NULL,
  `TARGET_SYSTEM` varchar(255) DEFAULT NULL,
  `TOTALITARIAN_OFFER` bit(1) DEFAULT NULL,
  `USE_NEW_FORMAT` bit(1) DEFAULT NULL,
  `OFFER_TYPE` varchar(255) NOT NULL,
  `USES` int(11) DEFAULT NULL,
  `OFFER_VALUE` decimal(19,5) NOT NULL,
  PRIMARY KEY (`OFFER_ID`),
  KEY `OFFER_DELIVERY_INDEX` (`OFFER_DELIVERY_TYPE`),
  KEY `OFFER_DISCOUNT_INDEX` (`OFFER_DISCOUNT_TYPE`),
  KEY `OFFER_TYPE_INDEX` (`OFFER_TYPE`),
  KEY `OFFER_NAME_INDEX` (`OFFER_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_offer`
--

/*!40000 ALTER TABLE `blc_offer` DISABLE KEYS */;
INSERT INTO `blc_offer` (`OFFER_ID`,`APPLIES_WHEN_RULES`,`APPLIES_TO_RULES`,`APPLY_OFFER_TO_MARKED_ITEMS`,`APPLY_TO_SALE_PRICE`,`ARCHIVED`,`COMBINABLE_WITH_OTHER_OFFERS`,`OFFER_DELIVERY_TYPE`,`OFFER_DESCRIPTION`,`OFFER_DISCOUNT_TYPE`,`END_DATE`,`MAX_USES_PER_CUSTOMER`,`MAX_USES`,`OFFER_NAME`,`OFFER_ITEM_QUALIFIER_RULE`,`OFFER_ITEM_TARGET_RULE`,`OFFER_PRIORITY`,`QUALIFYING_ITEM_MIN_TOTAL`,`STACKABLE`,`START_DATE`,`TARGET_SYSTEM`,`TOTALITARIAN_OFFER`,`USE_NEW_FORMAT`,`OFFER_TYPE`,`USES`,`OFFER_VALUE`) VALUES 
 (1,NULL,NULL,0x00,0x00,'N',0x01,'AUTOMATIC',NULL,'PERCENT_OFF','2020-01-01 00:00:00',NULL,0,'Shirts Special',NULL,NULL,10,NULL,0x01,'2013-01-21 00:00:00',NULL,NULL,NULL,'ORDER_ITEM',0,'20.00000');
/*!40000 ALTER TABLE `blc_offer` ENABLE KEYS */;


--
-- Definition of table `blc_offer_audit`
--

DROP TABLE IF EXISTS `blc_offer_audit`;
CREATE TABLE `blc_offer_audit` (
  `OFFER_AUDIT_ID` bigint(20) NOT NULL,
  `CUSTOMER_ID` bigint(20) DEFAULT NULL,
  `OFFER_ID` bigint(20) DEFAULT NULL,
  `ORDER_ID` bigint(20) DEFAULT NULL,
  `REDEEMED_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`OFFER_AUDIT_ID`),
  KEY `OFFERAUDIT_OFFER_INDEX` (`OFFER_ID`),
  KEY `OFFERAUDIT_CUSTOMER_INDEX` (`CUSTOMER_ID`),
  KEY `OFFERAUDIT_ORDER_INDEX` (`ORDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_offer_audit`
--

/*!40000 ALTER TABLE `blc_offer_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_offer_audit` ENABLE KEYS */;


--
-- Definition of table `blc_offer_code`
--

DROP TABLE IF EXISTS `blc_offer_code`;
CREATE TABLE `blc_offer_code` (
  `OFFER_CODE_ID` bigint(20) NOT NULL,
  `END_DATE` datetime DEFAULT NULL,
  `MAX_USES` int(11) DEFAULT NULL,
  `OFFER_CODE` varchar(255) NOT NULL,
  `START_DATE` datetime DEFAULT NULL,
  `USES` int(11) DEFAULT NULL,
  `OFFER_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`OFFER_CODE_ID`),
  KEY `OFFERCODE_OFFER_INDEX` (`OFFER_ID`),
  KEY `OFFERCODE_CODE_INDEX` (`OFFER_CODE`),
  KEY `FK76B8C8D6D5F3FAF4` (`OFFER_ID`),
  CONSTRAINT `FK76B8C8D6D5F3FAF4` FOREIGN KEY (`OFFER_ID`) REFERENCES `blc_offer` (`OFFER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_offer_code`
--

/*!40000 ALTER TABLE `blc_offer_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_offer_code` ENABLE KEYS */;


--
-- Definition of table `blc_offer_info`
--

DROP TABLE IF EXISTS `blc_offer_info`;
CREATE TABLE `blc_offer_info` (
  `OFFER_INFO_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`OFFER_INFO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_offer_info`
--

/*!40000 ALTER TABLE `blc_offer_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_offer_info` ENABLE KEYS */;


--
-- Definition of table `blc_offer_info_fields`
--

DROP TABLE IF EXISTS `blc_offer_info_fields`;
CREATE TABLE `blc_offer_info_fields` (
  `OFFER_INFO_FIELDS_ID` bigint(20) NOT NULL,
  `FIELD_VALUE` varchar(255) DEFAULT NULL,
  `FIELD_NAME` varchar(150) NOT NULL,
  PRIMARY KEY (`OFFER_INFO_FIELDS_ID`,`FIELD_NAME`),
  KEY `FKA901886183AE7237` (`OFFER_INFO_FIELDS_ID`),
  CONSTRAINT `FKA901886183AE7237` FOREIGN KEY (`OFFER_INFO_FIELDS_ID`) REFERENCES `blc_offer_info` (`OFFER_INFO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_offer_info_fields`
--

/*!40000 ALTER TABLE `blc_offer_info_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_offer_info_fields` ENABLE KEYS */;


--
-- Definition of table `blc_offer_item_criteria`
--

DROP TABLE IF EXISTS `blc_offer_item_criteria`;
CREATE TABLE `blc_offer_item_criteria` (
  `OFFER_ITEM_CRITERIA_ID` bigint(20) NOT NULL,
  `ORDER_ITEM_MATCH_RULE` longtext,
  `QUANTITY` int(11) NOT NULL,
  PRIMARY KEY (`OFFER_ITEM_CRITERIA_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_offer_item_criteria`
--

/*!40000 ALTER TABLE `blc_offer_item_criteria` DISABLE KEYS */;
INSERT INTO `blc_offer_item_criteria` (`OFFER_ITEM_CRITERIA_ID`,`ORDER_ITEM_MATCH_RULE`,`QUANTITY`) VALUES 
 (1,'MVEL.eval(\"toUpperCase()\",discreteOrderItem.category.name)==MVEL.eval(\"toUpperCase()\",\"merchandise\")',1);
/*!40000 ALTER TABLE `blc_offer_item_criteria` ENABLE KEYS */;


--
-- Definition of table `blc_offer_rule`
--

DROP TABLE IF EXISTS `blc_offer_rule`;
CREATE TABLE `blc_offer_rule` (
  `OFFER_RULE_ID` bigint(20) NOT NULL,
  `MATCH_RULE` longtext,
  PRIMARY KEY (`OFFER_RULE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_offer_rule`
--

/*!40000 ALTER TABLE `blc_offer_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_offer_rule` ENABLE KEYS */;


--
-- Definition of table `blc_offer_rule_map`
--

DROP TABLE IF EXISTS `blc_offer_rule_map`;
CREATE TABLE `blc_offer_rule_map` (
  `BLC_OFFER_OFFER_ID` bigint(20) NOT NULL,
  `OFFER_RULE_ID` bigint(20) NOT NULL,
  `MAP_KEY` varchar(255) NOT NULL,
  PRIMARY KEY (`BLC_OFFER_OFFER_ID`,`MAP_KEY`),
  KEY `FKCA468FE245C66D1D` (`BLC_OFFER_OFFER_ID`),
  KEY `FKCA468FE2C11A218D` (`OFFER_RULE_ID`),
  CONSTRAINT `FKCA468FE245C66D1D` FOREIGN KEY (`BLC_OFFER_OFFER_ID`) REFERENCES `blc_offer` (`OFFER_ID`),
  CONSTRAINT `FKCA468FE2C11A218D` FOREIGN KEY (`OFFER_RULE_ID`) REFERENCES `blc_offer_rule` (`OFFER_RULE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_offer_rule_map`
--

/*!40000 ALTER TABLE `blc_offer_rule_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_offer_rule_map` ENABLE KEYS */;


--
-- Definition of table `blc_order`
--

DROP TABLE IF EXISTS `blc_order`;
CREATE TABLE `blc_order` (
  `ORDER_ID` bigint(20) NOT NULL,
  `CREATED_BY` bigint(20) DEFAULT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_UPDATED` datetime DEFAULT NULL,
  `UPDATED_BY` bigint(20) DEFAULT NULL,
  `EMAIL_ADDRESS` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `ORDER_NUMBER` varchar(255) DEFAULT NULL,
  `ORDER_STATUS` varchar(255) DEFAULT NULL,
  `ORDER_SUBTOTAL` decimal(19,5) DEFAULT NULL,
  `SUBMIT_DATE` datetime DEFAULT NULL,
  `ORDER_TOTAL` decimal(19,5) DEFAULT NULL,
  `TOTAL_SHIPPING` decimal(19,5) DEFAULT NULL,
  `TOTAL_TAX` decimal(19,5) DEFAULT NULL,
  `CUSTOMER_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ORDER_ID`),
  KEY `ORDER_NAME_INDEX` (`NAME`),
  KEY `ORDER_STATUS_INDEX` (`ORDER_STATUS`),
  KEY `ORDER_CUSTOMER_INDEX` (`CUSTOMER_ID`),
  KEY `ORDER_EMAIL_INDEX` (`EMAIL_ADDRESS`),
  KEY `ORDER_NUMBER_INDEX` (`ORDER_NUMBER`),
  KEY `FK8F5B64A87470F437` (`CUSTOMER_ID`),
  CONSTRAINT `FK8F5B64A87470F437` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `blc_customer` (`CUSTOMER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_order`
--

/*!40000 ALTER TABLE `blc_order` DISABLE KEYS */;
INSERT INTO `blc_order` (`ORDER_ID`,`CREATED_BY`,`DATE_CREATED`,`DATE_UPDATED`,`UPDATED_BY`,`EMAIL_ADDRESS`,`NAME`,`ORDER_NUMBER`,`ORDER_STATUS`,`ORDER_SUBTOTAL`,`SUBMIT_DATE`,`ORDER_TOTAL`,`TOTAL_SHIPPING`,`TOTAL_TAX`,`CUSTOMER_ID`) VALUES 
 (1,100,'2013-01-21 22:08:20','2013-01-21 22:08:21',100,NULL,NULL,NULL,'IN_PROCESS','11.99000',NULL,'12.59000','0.00000','0.60000',100),
 (51,300,'2013-01-22 12:16:03','2013-01-22 12:16:04',300,NULL,NULL,NULL,'IN_PROCESS','10.99000',NULL,'11.54000','0.00000','0.55000',300),
 (101,600,'2013-01-25 19:08:12','2013-01-25 19:08:13',600,NULL,NULL,NULL,'IN_PROCESS','11.99000',NULL,'12.59000','0.00000','0.60000',600);
/*!40000 ALTER TABLE `blc_order` ENABLE KEYS */;


--
-- Definition of table `blc_order_adjustment`
--

DROP TABLE IF EXISTS `blc_order_adjustment`;
CREATE TABLE `blc_order_adjustment` (
  `ORDER_ADJUSTMENT_ID` bigint(20) NOT NULL,
  `ADJUSTMENT_REASON` varchar(255) NOT NULL,
  `ADJUSTMENT_VALUE` decimal(19,5) NOT NULL,
  `OFFER_ID` bigint(20) NOT NULL,
  `ORDER_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ORDER_ADJUSTMENT_ID`),
  KEY `ORDERADJUST_OFFER_INDEX` (`OFFER_ID`),
  KEY `ORDERADJUST_ORDER_INDEX` (`ORDER_ID`),
  KEY `FK1E92D164D5F3FAF4` (`OFFER_ID`),
  KEY `FK1E92D16489FE8A02` (`ORDER_ID`),
  CONSTRAINT `FK1E92D16489FE8A02` FOREIGN KEY (`ORDER_ID`) REFERENCES `blc_order` (`ORDER_ID`),
  CONSTRAINT `FK1E92D164D5F3FAF4` FOREIGN KEY (`OFFER_ID`) REFERENCES `blc_offer` (`OFFER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_order_adjustment`
--

/*!40000 ALTER TABLE `blc_order_adjustment` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_order_adjustment` ENABLE KEYS */;


--
-- Definition of table `blc_order_attribute`
--

DROP TABLE IF EXISTS `blc_order_attribute`;
CREATE TABLE `blc_order_attribute` (
  `ORDER_ATTRIBUTE_ID` bigint(20) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `ORDER_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ORDER_ATTRIBUTE_ID`),
  KEY `FKB3A467A589FE8A02` (`ORDER_ID`),
  CONSTRAINT `FKB3A467A589FE8A02` FOREIGN KEY (`ORDER_ID`) REFERENCES `blc_order` (`ORDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_order_attribute`
--

/*!40000 ALTER TABLE `blc_order_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_order_attribute` ENABLE KEYS */;


--
-- Definition of table `blc_order_item`
--

DROP TABLE IF EXISTS `blc_order_item`;
CREATE TABLE `blc_order_item` (
  `ORDER_ITEM_ID` bigint(20) NOT NULL,
  `ITEM_TAXABLE_FLAG` bit(1) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `ORDER_ITEM_TYPE` varchar(255) DEFAULT NULL,
  `PRICE` decimal(19,5) DEFAULT NULL,
  `QUANTITY` int(11) NOT NULL,
  `RETAIL_PRICE` decimal(19,5) DEFAULT NULL,
  `SALE_PRICE` decimal(19,5) DEFAULT NULL,
  `SPLIT_PARENT_ITEM_ID` bigint(20) DEFAULT NULL,
  `CATEGORY_ID` bigint(20) DEFAULT NULL,
  `GIFT_WRAP_ITEM_ID` bigint(20) DEFAULT NULL,
  `ORDER_ID` bigint(20) DEFAULT NULL,
  `PERSONAL_MESSAGE_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ORDER_ITEM_ID`),
  KEY `ORDERITEM_GIFT_INDEX` (`GIFT_WRAP_ITEM_ID`),
  KEY `ORDERITEM_MESSAGE_INDEX` (`PERSONAL_MESSAGE_ID`),
  KEY `ORDERITEM_ORDER_INDEX` (`ORDER_ID`),
  KEY `ORDERITEM_TYPE_INDEX` (`ORDER_ITEM_TYPE`),
  KEY `ORDERITEM_CATEGORY_INDEX` (`CATEGORY_ID`),
  KEY `FK9A2E704A77F565E1` (`PERSONAL_MESSAGE_ID`),
  KEY `FK9A2E704A15D1A13D` (`CATEGORY_ID`),
  KEY `FK9A2E704A89FE8A02` (`ORDER_ID`),
  KEY `FK9A2E704AFD2F1F10` (`GIFT_WRAP_ITEM_ID`),
  CONSTRAINT `FK9A2E704A15D1A13D` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `blc_category` (`CATEGORY_ID`),
  CONSTRAINT `FK9A2E704A77F565E1` FOREIGN KEY (`PERSONAL_MESSAGE_ID`) REFERENCES `blc_personal_message` (`PERSONAL_MESSAGE_ID`),
  CONSTRAINT `FK9A2E704A89FE8A02` FOREIGN KEY (`ORDER_ID`) REFERENCES `blc_order` (`ORDER_ID`),
  CONSTRAINT `FK9A2E704AFD2F1F10` FOREIGN KEY (`GIFT_WRAP_ITEM_ID`) REFERENCES `blc_giftwrap_order_item` (`ORDER_ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_order_item`
--

/*!40000 ALTER TABLE `blc_order_item` DISABLE KEYS */;
INSERT INTO `blc_order_item` (`ORDER_ITEM_ID`,`ITEM_TAXABLE_FLAG`,`NAME`,`ORDER_ITEM_TYPE`,`PRICE`,`QUANTITY`,`RETAIL_PRICE`,`SALE_PRICE`,`SPLIT_PARENT_ITEM_ID`,`CATEGORY_ID`,`GIFT_WRAP_ITEM_ID`,`ORDER_ID`,`PERSONAL_MESSAGE_ID`) VALUES 
 (1,0x01,'Hawt Like a Habanero Shirt (Women\'s)','org.broadleafcommerce.core.order.domain.DiscreteOrderItem','11.99000',1,'14.99000',NULL,NULL,2003,NULL,1,NULL),
 (151,0x01,'Sudden Death Sauce','org.broadleafcommerce.core.order.domain.DiscreteOrderItem','10.99000',1,'10.99000',NULL,NULL,2002,NULL,51,NULL),
 (301,0x01,'Hawt Like a Habanero Shirt (Men\'s)','org.broadleafcommerce.core.order.domain.DiscreteOrderItem','11.99000',1,'14.99000',NULL,NULL,2003,NULL,101,NULL);
/*!40000 ALTER TABLE `blc_order_item` ENABLE KEYS */;


--
-- Definition of table `blc_order_item_add_attr`
--

DROP TABLE IF EXISTS `blc_order_item_add_attr`;
CREATE TABLE `blc_order_item_add_attr` (
  `ORDER_ITEM_ID` bigint(20) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`ORDER_ITEM_ID`,`NAME`),
  KEY `FKA466AB44B76B9466` (`ORDER_ITEM_ID`),
  CONSTRAINT `FKA466AB44B76B9466` FOREIGN KEY (`ORDER_ITEM_ID`) REFERENCES `blc_discrete_order_item` (`ORDER_ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_order_item_add_attr`
--

/*!40000 ALTER TABLE `blc_order_item_add_attr` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_order_item_add_attr` ENABLE KEYS */;


--
-- Definition of table `blc_order_item_adjustment`
--

DROP TABLE IF EXISTS `blc_order_item_adjustment`;
CREATE TABLE `blc_order_item_adjustment` (
  `ORDER_ITEM_ADJUSTMENT_ID` bigint(20) NOT NULL,
  `APPLIED_TO_SALE_PRICE` bit(1) DEFAULT NULL,
  `ADJUSTMENT_REASON` varchar(255) NOT NULL,
  `ADJUSTMENT_VALUE` decimal(19,5) NOT NULL,
  `OFFER_ID` bigint(20) NOT NULL,
  `ORDER_ITEM_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ORDER_ITEM_ADJUSTMENT_ID`),
  KEY `OIADJUST_OFFER_INDEX` (`OFFER_ID`),
  KEY `OIADJUST_ITEM_INDEX` (`ORDER_ITEM_ID`),
  KEY `FKA2658C829AF166DF` (`ORDER_ITEM_ID`),
  KEY `FKA2658C82D5F3FAF4` (`OFFER_ID`),
  CONSTRAINT `FKA2658C829AF166DF` FOREIGN KEY (`ORDER_ITEM_ID`) REFERENCES `blc_order_item` (`ORDER_ITEM_ID`),
  CONSTRAINT `FKA2658C82D5F3FAF4` FOREIGN KEY (`OFFER_ID`) REFERENCES `blc_offer` (`OFFER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_order_item_adjustment`
--

/*!40000 ALTER TABLE `blc_order_item_adjustment` DISABLE KEYS */;
INSERT INTO `blc_order_item_adjustment` (`ORDER_ITEM_ADJUSTMENT_ID`,`APPLIED_TO_SALE_PRICE`,`ADJUSTMENT_REASON`,`ADJUSTMENT_VALUE`,`OFFER_ID`,`ORDER_ITEM_ID`) VALUES 
 (1,0x00,'Shirts Special','3.00000',1,1),
 (51,0x00,'Shirts Special','3.00000',1,301);
/*!40000 ALTER TABLE `blc_order_item_adjustment` ENABLE KEYS */;


--
-- Definition of table `blc_order_item_attribute`
--

DROP TABLE IF EXISTS `blc_order_item_attribute`;
CREATE TABLE `blc_order_item_attribute` (
  `ORDER_ITEM_ATTRIBUTE_ID` bigint(20) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  `ORDER_ITEM_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ORDER_ITEM_ATTRIBUTE_ID`),
  KEY `FK9F1ED0C79AF166DF` (`ORDER_ITEM_ID`),
  CONSTRAINT `FK9F1ED0C79AF166DF` FOREIGN KEY (`ORDER_ITEM_ID`) REFERENCES `blc_order_item` (`ORDER_ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_order_item_attribute`
--

/*!40000 ALTER TABLE `blc_order_item_attribute` DISABLE KEYS */;
INSERT INTO `blc_order_item_attribute` (`ORDER_ITEM_ATTRIBUTE_ID`,`NAME`,`VALUE`,`ORDER_ITEM_ID`) VALUES 
 (1,'COLOR','Black',1),
 (2,'SIZE','M',1),
 (51,'COLOR','Red',301),
 (52,'SIZE','M',301);
/*!40000 ALTER TABLE `blc_order_item_attribute` ENABLE KEYS */;


--
-- Definition of table `blc_order_multiship_option`
--

DROP TABLE IF EXISTS `blc_order_multiship_option`;
CREATE TABLE `blc_order_multiship_option` (
  `ORDER_MULTISHIP_OPTION_ID` bigint(20) NOT NULL,
  `ADDRESS_ID` bigint(20) DEFAULT NULL,
  `FULFILLMENT_OPTION_ID` bigint(20) DEFAULT NULL,
  `ORDER_ID` bigint(20) DEFAULT NULL,
  `ORDER_ITEM_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ORDER_MULTISHIP_OPTION_ID`),
  KEY `MULTISHIP_OPTION_ORDER_INDEX` (`ORDER_ID`),
  KEY `FKB3D3F7D69AF166DF` (`ORDER_ITEM_ID`),
  KEY `FKB3D3F7D6C13085DD` (`ADDRESS_ID`),
  KEY `FKB3D3F7D689FE8A02` (`ORDER_ID`),
  KEY `FKB3D3F7D681F34C7F` (`FULFILLMENT_OPTION_ID`),
  CONSTRAINT `FKB3D3F7D681F34C7F` FOREIGN KEY (`FULFILLMENT_OPTION_ID`) REFERENCES `blc_fulfillment_option` (`FULFILLMENT_OPTION_ID`),
  CONSTRAINT `FKB3D3F7D689FE8A02` FOREIGN KEY (`ORDER_ID`) REFERENCES `blc_order` (`ORDER_ID`),
  CONSTRAINT `FKB3D3F7D69AF166DF` FOREIGN KEY (`ORDER_ITEM_ID`) REFERENCES `blc_order_item` (`ORDER_ITEM_ID`),
  CONSTRAINT `FKB3D3F7D6C13085DD` FOREIGN KEY (`ADDRESS_ID`) REFERENCES `blc_address` (`ADDRESS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_order_multiship_option`
--

/*!40000 ALTER TABLE `blc_order_multiship_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_order_multiship_option` ENABLE KEYS */;


--
-- Definition of table `blc_order_offer_code_xref`
--

DROP TABLE IF EXISTS `blc_order_offer_code_xref`;
CREATE TABLE `blc_order_offer_code_xref` (
  `ORDER_ID` bigint(20) NOT NULL,
  `OFFER_CODE_ID` bigint(20) NOT NULL,
  KEY `FKFDF0E8533BB10F6D` (`OFFER_CODE_ID`),
  KEY `FKFDF0E85389FE8A02` (`ORDER_ID`),
  CONSTRAINT `FKFDF0E8533BB10F6D` FOREIGN KEY (`OFFER_CODE_ID`) REFERENCES `blc_offer_code` (`OFFER_CODE_ID`),
  CONSTRAINT `FKFDF0E85389FE8A02` FOREIGN KEY (`ORDER_ID`) REFERENCES `blc_order` (`ORDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_order_offer_code_xref`
--

/*!40000 ALTER TABLE `blc_order_offer_code_xref` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_order_offer_code_xref` ENABLE KEYS */;


--
-- Definition of table `blc_order_payment`
--

DROP TABLE IF EXISTS `blc_order_payment`;
CREATE TABLE `blc_order_payment` (
  `PAYMENT_ID` bigint(20) NOT NULL,
  `AMOUNT` decimal(19,5) DEFAULT NULL,
  `CUSTOMER_IP_ADDRESS` varchar(255) DEFAULT NULL,
  `REFERENCE_NUMBER` varchar(255) DEFAULT NULL,
  `PAYMENT_TYPE` varchar(255) NOT NULL,
  `ADDRESS_ID` bigint(20) DEFAULT NULL,
  `ORDER_ID` bigint(20) NOT NULL,
  `PHONE_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`PAYMENT_ID`),
  KEY `ORDERPAYMENT_ADDRESS_INDEX` (`ADDRESS_ID`),
  KEY `ORDERPAYMENT_PHONE_INDEX` (`PHONE_ID`),
  KEY `ORDERPAYMENT_TYPE_INDEX` (`PAYMENT_TYPE`),
  KEY `ORDERPAYMENT_REFERENCE_INDEX` (`REFERENCE_NUMBER`),
  KEY `ORDERPAYMENT_ORDER_INDEX` (`ORDER_ID`),
  KEY `FK9517A14FD894CB5D` (`PHONE_ID`),
  KEY `FK9517A14FC13085DD` (`ADDRESS_ID`),
  KEY `FK9517A14F89FE8A02` (`ORDER_ID`),
  CONSTRAINT `FK9517A14F89FE8A02` FOREIGN KEY (`ORDER_ID`) REFERENCES `blc_order` (`ORDER_ID`),
  CONSTRAINT `FK9517A14FC13085DD` FOREIGN KEY (`ADDRESS_ID`) REFERENCES `blc_address` (`ADDRESS_ID`),
  CONSTRAINT `FK9517A14FD894CB5D` FOREIGN KEY (`PHONE_ID`) REFERENCES `blc_phone` (`PHONE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_order_payment`
--

/*!40000 ALTER TABLE `blc_order_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_order_payment` ENABLE KEYS */;


--
-- Definition of table `blc_page`
--

DROP TABLE IF EXISTS `blc_page`;
CREATE TABLE `blc_page` (
  `PAGE_ID` bigint(20) NOT NULL,
  `ARCHIVED_FLAG` bit(1) DEFAULT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_UPDATED` datetime DEFAULT NULL,
  `DELETED_FLAG` bit(1) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `FULL_URL` varchar(255) DEFAULT NULL,
  `LOCKED_FLAG` bit(1) DEFAULT NULL,
  `OFFLINE_FLAG` bit(1) DEFAULT NULL,
  `ORIG_PAGE_ID` bigint(20) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `CREATED_BY` bigint(20) DEFAULT NULL,
  `UPDATED_BY` bigint(20) DEFAULT NULL,
  `ORIG_SANDBOX_ID` bigint(20) DEFAULT NULL,
  `PAGE_TMPLT_ID` bigint(20) DEFAULT NULL,
  `SANDBOX_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`PAGE_ID`),
  KEY `PAGE_ARCHVD_FLG_INDX` (`ARCHIVED_FLAG`),
  KEY `ORIG_PAGE_ID_INDX` (`ORIG_PAGE_ID`),
  KEY `PAGE_FULL_URL_INDEX` (`FULL_URL`),
  KEY `PAGE_DLTD_FLG_INDX` (`DELETED_FLAG`),
  KEY `PAGE_LCKD_FLG_INDX` (`LOCKED_FLAG`),
  KEY `FKF41BEDD524568C27` (`CREATED_BY`),
  KEY `FKF41BEDD5579FE59D` (`SANDBOX_ID`),
  KEY `FKF41BEDD5F9C4A5B` (`ORIG_SANDBOX_ID`),
  KEY `FKF41BEDD5D49D3961` (`PAGE_TMPLT_ID`),
  KEY `FKF41BEDD5C1167574` (`UPDATED_BY`),
  CONSTRAINT `FKF41BEDD524568C27` FOREIGN KEY (`CREATED_BY`) REFERENCES `blc_admin_user` (`ADMIN_USER_ID`),
  CONSTRAINT `FKF41BEDD5579FE59D` FOREIGN KEY (`SANDBOX_ID`) REFERENCES `blc_sandbox` (`SANDBOX_ID`),
  CONSTRAINT `FKF41BEDD5C1167574` FOREIGN KEY (`UPDATED_BY`) REFERENCES `blc_admin_user` (`ADMIN_USER_ID`),
  CONSTRAINT `FKF41BEDD5D49D3961` FOREIGN KEY (`PAGE_TMPLT_ID`) REFERENCES `blc_page_tmplt` (`PAGE_TMPLT_ID`),
  CONSTRAINT `FKF41BEDD5F9C4A5B` FOREIGN KEY (`ORIG_SANDBOX_ID`) REFERENCES `blc_sandbox` (`SANDBOX_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_page`
--

/*!40000 ALTER TABLE `blc_page` DISABLE KEYS */;
INSERT INTO `blc_page` (`PAGE_ID`,`ARCHIVED_FLAG`,`DATE_CREATED`,`DATE_UPDATED`,`DELETED_FLAG`,`DESCRIPTION`,`FULL_URL`,`LOCKED_FLAG`,`OFFLINE_FLAG`,`ORIG_PAGE_ID`,`PRIORITY`,`CREATED_BY`,`UPDATED_BY`,`ORIG_SANDBOX_ID`,`PAGE_TMPLT_ID`,`SANDBOX_ID`) VALUES 
 (1,0x00,NULL,NULL,0x00,'About Us','/about_us',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),
 (2,0x00,NULL,NULL,0x00,'FAQ','/faq',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),
 (3,0x00,NULL,NULL,0x00,'New to Hot Sauce','/new-to-hot-sauce',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),
 (10,0x00,NULL,NULL,0x00,'Prueba de Contenido','/about_us',NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL);
/*!40000 ALTER TABLE `blc_page` ENABLE KEYS */;


--
-- Definition of table `blc_page_fld`
--

DROP TABLE IF EXISTS `blc_page_fld`;
CREATE TABLE `blc_page_fld` (
  `PAGE_FLD_ID` bigint(20) NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_UPDATED` datetime DEFAULT NULL,
  `FLD_KEY` varchar(255) DEFAULT NULL,
  `LOB_VALUE` longtext,
  `VALUE` varchar(255) DEFAULT NULL,
  `CREATED_BY` bigint(20) DEFAULT NULL,
  `UPDATED_BY` bigint(20) DEFAULT NULL,
  `PAGE_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`PAGE_FLD_ID`),
  KEY `FK86433AD424568C27` (`CREATED_BY`),
  KEY `FK86433AD4883C2667` (`PAGE_ID`),
  KEY `FK86433AD4C1167574` (`UPDATED_BY`),
  CONSTRAINT `FK86433AD424568C27` FOREIGN KEY (`CREATED_BY`) REFERENCES `blc_admin_user` (`ADMIN_USER_ID`),
  CONSTRAINT `FK86433AD4883C2667` FOREIGN KEY (`PAGE_ID`) REFERENCES `blc_page` (`PAGE_ID`),
  CONSTRAINT `FK86433AD4C1167574` FOREIGN KEY (`UPDATED_BY`) REFERENCES `blc_admin_user` (`ADMIN_USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_page_fld`
--

/*!40000 ALTER TABLE `blc_page_fld` DISABLE KEYS */;
INSERT INTO `blc_page_fld` (`PAGE_FLD_ID`,`DATE_CREATED`,`DATE_UPDATED`,`FLD_KEY`,`LOB_VALUE`,`VALUE`,`CREATED_BY`,`UPDATED_BY`,`PAGE_ID`) VALUES 
 (1,NULL,NULL,'body',NULL,'test content',NULL,NULL,1),
 (2,NULL,NULL,'title',NULL,'',NULL,NULL,1),
 (3,NULL,NULL,'body',NULL,'<h2 style=\"text-align:center;\">This is an example of a content-managed page.</h2><h4 style=\"text-align:center;\"><a href=\"http://www.broadleafcommerce.com/features/content\">Click Here</a> to see more about Content Management in Broadleaf.</h4>',NULL,NULL,2),
 (4,NULL,NULL,'body',NULL,'<h2 style=\"text-align:center;\">This is an example of a content-managed page.</h2>',NULL,NULL,3),
 (10,NULL,NULL,'body',NULL,'prueba de contenido',NULL,NULL,10),
 (11,NULL,NULL,'title',NULL,'',NULL,NULL,10),
 (12,NULL,NULL,'metaDescription',NULL,'Frequently Asked Questions',NULL,NULL,2),
 (13,NULL,NULL,'metaKeywords',NULL,'Frequently Asked Questions, FAQ, Hot Sauces',NULL,NULL,2),
 (14,NULL,NULL,'metaRobot',NULL,'INDEX,FOLLOW',NULL,NULL,2),
 (15,NULL,NULL,'titleFragment',NULL,'FAQ - Frequently Asked Questions',NULL,NULL,2);
/*!40000 ALTER TABLE `blc_page_fld` ENABLE KEYS */;


--
-- Definition of table `blc_page_fld_map`
--

DROP TABLE IF EXISTS `blc_page_fld_map`;
CREATE TABLE `blc_page_fld_map` (
  `PAGE_ID` bigint(20) NOT NULL,
  `PAGE_FLD_ID` bigint(20) NOT NULL,
  `MAP_KEY` varchar(255) NOT NULL,
  PRIMARY KEY (`PAGE_ID`,`MAP_KEY`),
  KEY `FKE9EE09515AEDD08A` (`PAGE_FLD_ID`),
  KEY `FKE9EE0951883C2667` (`PAGE_ID`),
  CONSTRAINT `FKE9EE09515AEDD08A` FOREIGN KEY (`PAGE_FLD_ID`) REFERENCES `blc_page_fld` (`PAGE_FLD_ID`),
  CONSTRAINT `FKE9EE0951883C2667` FOREIGN KEY (`PAGE_ID`) REFERENCES `blc_page` (`PAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_page_fld_map`
--

/*!40000 ALTER TABLE `blc_page_fld_map` DISABLE KEYS */;
INSERT INTO `blc_page_fld_map` (`PAGE_ID`,`PAGE_FLD_ID`,`MAP_KEY`) VALUES 
 (1,1,'body'),
 (1,2,'title'),
 (2,3,'body'),
 (3,4,'body'),
 (10,10,'body'),
 (10,11,'title'),
 (2,12,'metaDescription'),
 (2,13,'metaKeywords'),
 (2,14,'metaRobot'),
 (2,15,'titleFragment');
/*!40000 ALTER TABLE `blc_page_fld_map` ENABLE KEYS */;


--
-- Definition of table `blc_page_item_criteria`
--

DROP TABLE IF EXISTS `blc_page_item_criteria`;
CREATE TABLE `blc_page_item_criteria` (
  `PAGE_ITEM_CRITERIA_ID` bigint(20) NOT NULL,
  `ORDER_ITEM_MATCH_RULE` longtext,
  `QUANTITY` int(11) NOT NULL,
  PRIMARY KEY (`PAGE_ITEM_CRITERIA_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_page_item_criteria`
--

/*!40000 ALTER TABLE `blc_page_item_criteria` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_page_item_criteria` ENABLE KEYS */;


--
-- Definition of table `blc_page_rule`
--

DROP TABLE IF EXISTS `blc_page_rule`;
CREATE TABLE `blc_page_rule` (
  `PAGE_RULE_ID` bigint(20) NOT NULL,
  `MATCH_RULE` longtext,
  PRIMARY KEY (`PAGE_RULE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_page_rule`
--

/*!40000 ALTER TABLE `blc_page_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_page_rule` ENABLE KEYS */;


--
-- Definition of table `blc_page_rule_map`
--

DROP TABLE IF EXISTS `blc_page_rule_map`;
CREATE TABLE `blc_page_rule_map` (
  `BLC_PAGE_PAGE_ID` bigint(20) NOT NULL,
  `PAGE_RULE_ID` bigint(20) NOT NULL,
  `MAP_KEY` varchar(255) NOT NULL,
  PRIMARY KEY (`BLC_PAGE_PAGE_ID`,`MAP_KEY`),
  KEY `FK1ABA0CA336D91846` (`PAGE_RULE_ID`),
  KEY `FK1ABA0CA3C38455DD` (`BLC_PAGE_PAGE_ID`),
  CONSTRAINT `FK1ABA0CA336D91846` FOREIGN KEY (`PAGE_RULE_ID`) REFERENCES `blc_page_rule` (`PAGE_RULE_ID`),
  CONSTRAINT `FK1ABA0CA3C38455DD` FOREIGN KEY (`BLC_PAGE_PAGE_ID`) REFERENCES `blc_page` (`PAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_page_rule_map`
--

/*!40000 ALTER TABLE `blc_page_rule_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_page_rule_map` ENABLE KEYS */;


--
-- Definition of table `blc_page_tmplt`
--

DROP TABLE IF EXISTS `blc_page_tmplt`;
CREATE TABLE `blc_page_tmplt` (
  `PAGE_TMPLT_ID` bigint(20) NOT NULL,
  `TMPLT_DESCR` varchar(255) DEFAULT NULL,
  `TMPLT_NAME` varchar(255) DEFAULT NULL,
  `TMPLT_PATH` varchar(255) DEFAULT NULL,
  `LOCALE_CODE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`PAGE_TMPLT_ID`),
  KEY `FK325C9D5A1E1C128` (`LOCALE_CODE`),
  CONSTRAINT `FK325C9D5A1E1C128` FOREIGN KEY (`LOCALE_CODE`) REFERENCES `blc_locale` (`LOCALE_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_page_tmplt`
--

/*!40000 ALTER TABLE `blc_page_tmplt` DISABLE KEYS */;
INSERT INTO `blc_page_tmplt` (`PAGE_TMPLT_ID`,`TMPLT_DESCR`,`TMPLT_NAME`,`TMPLT_PATH`,`LOCALE_CODE`) VALUES 
 (1,'This template provides a basic layout with header and footer surrounding the content and title.','Basic Template','content/default','en'),
 (2,'This template provides a basic layout with header and footer surrounding the content and title.','Basic Spanish Template','content/default','es');
/*!40000 ALTER TABLE `blc_page_tmplt` ENABLE KEYS */;


--
-- Definition of table `blc_payinfo_additional_fields`
--

DROP TABLE IF EXISTS `blc_payinfo_additional_fields`;
CREATE TABLE `blc_payinfo_additional_fields` (
  `PAYMENT_ID` bigint(20) NOT NULL,
  `FIELD_VALUE` varchar(255) DEFAULT NULL,
  `FIELD_NAME` varchar(150) NOT NULL,
  PRIMARY KEY (`PAYMENT_ID`,`FIELD_NAME`),
  KEY `FKF9378B824BC71D98` (`PAYMENT_ID`),
  CONSTRAINT `FKF9378B824BC71D98` FOREIGN KEY (`PAYMENT_ID`) REFERENCES `blc_order_payment` (`PAYMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_payinfo_additional_fields`
--

/*!40000 ALTER TABLE `blc_payinfo_additional_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_payinfo_additional_fields` ENABLE KEYS */;


--
-- Definition of table `blc_payment_additional_fields`
--

DROP TABLE IF EXISTS `blc_payment_additional_fields`;
CREATE TABLE `blc_payment_additional_fields` (
  `PAYMENT_RESPONSE_ITEM_ID` bigint(20) NOT NULL,
  `FIELD_VALUE` varchar(255) DEFAULT NULL,
  `FIELD_NAME` varchar(150) NOT NULL,
  PRIMARY KEY (`PAYMENT_RESPONSE_ITEM_ID`,`FIELD_NAME`),
  KEY `FKE3507032D956B1CC` (`PAYMENT_RESPONSE_ITEM_ID`),
  CONSTRAINT `FKE3507032D956B1CC` FOREIGN KEY (`PAYMENT_RESPONSE_ITEM_ID`) REFERENCES `blc_payment_response_item` (`PAYMENT_RESPONSE_ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_payment_additional_fields`
--

/*!40000 ALTER TABLE `blc_payment_additional_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_payment_additional_fields` ENABLE KEYS */;


--
-- Definition of table `blc_payment_log`
--

DROP TABLE IF EXISTS `blc_payment_log`;
CREATE TABLE `blc_payment_log` (
  `PAYMENT_LOG_ID` bigint(20) NOT NULL,
  `AMOUNT_PAID` decimal(19,5) DEFAULT NULL,
  `EXCEPTION_MESSAGE` varchar(255) DEFAULT NULL,
  `LOG_TYPE` varchar(255) NOT NULL,
  `ORDER_PAYMENT_ID` bigint(20) DEFAULT NULL,
  `PAYMENT_INFO_REFERENCE_NUMBER` varchar(255) DEFAULT NULL,
  `TRANSACTION_SUCCESS` bit(1) DEFAULT NULL,
  `TRANSACTION_TIMESTAMP` datetime NOT NULL,
  `TRANSACTION_TYPE` varchar(255) NOT NULL,
  `USER_NAME` varchar(255) NOT NULL,
  `CUSTOMER_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`PAYMENT_LOG_ID`),
  KEY `PAYMENTLOG_ORDERPAYMENT_INDEX` (`ORDER_PAYMENT_ID`),
  KEY `PAYMENTLOG_TRANTYPE_INDEX` (`TRANSACTION_TYPE`),
  KEY `PAYMENTLOG_LOGTYPE_INDEX` (`LOG_TYPE`),
  KEY `PAYMENTLOG_CUSTOMER_INDEX` (`CUSTOMER_ID`),
  KEY `PAYMENTLOG_USER_INDEX` (`USER_NAME`),
  KEY `PAYMENTLOG_REFERENCE_INDEX` (`PAYMENT_INFO_REFERENCE_NUMBER`),
  KEY `FKA43703457470F437` (`CUSTOMER_ID`),
  CONSTRAINT `FKA43703457470F437` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `blc_customer` (`CUSTOMER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_payment_log`
--

/*!40000 ALTER TABLE `blc_payment_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_payment_log` ENABLE KEYS */;


--
-- Definition of table `blc_payment_response_item`
--

DROP TABLE IF EXISTS `blc_payment_response_item`;
CREATE TABLE `blc_payment_response_item` (
  `PAYMENT_RESPONSE_ITEM_ID` bigint(20) NOT NULL,
  `AMOUNT_PAID` decimal(19,5) DEFAULT NULL,
  `AUTHORIZATION_CODE` varchar(255) DEFAULT NULL,
  `AVS_CODE` varchar(255) DEFAULT NULL,
  `IMPLEMENTOR_RESPONSE_CODE` varchar(255) DEFAULT NULL,
  `IMPLEMENTOR_RESPONSE_TEXT` varchar(255) DEFAULT NULL,
  `MIDDLEWARE_RESPONSE_CODE` varchar(255) DEFAULT NULL,
  `MIDDLEWARE_RESPONSE_TEXT` varchar(255) DEFAULT NULL,
  `ORDER_PAYMENT_ID` bigint(20) DEFAULT NULL,
  `PAYMENT_INFO_REFERENCE_NUMBER` varchar(255) DEFAULT NULL,
  `PROCESSOR_RESPONSE_CODE` varchar(255) DEFAULT NULL,
  `PROCESSOR_RESPONSE_TEXT` varchar(255) DEFAULT NULL,
  `REFERENCE_NUMBER` varchar(255) DEFAULT NULL,
  `REMAINING_BALANCE` decimal(19,5) DEFAULT NULL,
  `TRANSACTION_ID` varchar(255) DEFAULT NULL,
  `TRANSACTION_SUCCESS` bit(1) DEFAULT NULL,
  `TRANSACTION_TIMESTAMP` datetime NOT NULL,
  `TRANSACTION_TYPE` varchar(255) NOT NULL,
  `USER_NAME` varchar(255) NOT NULL,
  `CUSTOMER_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`PAYMENT_RESPONSE_ITEM_ID`),
  KEY `PAYRESPONSE_REFERENCE_INDEX` (`PAYMENT_INFO_REFERENCE_NUMBER`,`REFERENCE_NUMBER`),
  KEY `PAYRESPONSE_ORDERPAYMENT_INDEX` (`ORDER_PAYMENT_ID`),
  KEY `PAYRESPONSE_CUSTOMER_INDEX` (`CUSTOMER_ID`),
  KEY `PAYRESPONSE_TRANTYPE_INDEX` (`TRANSACTION_TYPE`),
  KEY `FK807B8F327470F437` (`CUSTOMER_ID`),
  CONSTRAINT `FK807B8F327470F437` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `blc_customer` (`CUSTOMER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_payment_response_item`
--

/*!40000 ALTER TABLE `blc_payment_response_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_payment_response_item` ENABLE KEYS */;


--
-- Definition of table `blc_personal_message`
--

DROP TABLE IF EXISTS `blc_personal_message`;
CREATE TABLE `blc_personal_message` (
  `PERSONAL_MESSAGE_ID` bigint(20) NOT NULL,
  `MESSAGE` varchar(255) DEFAULT NULL,
  `MESSAGE_FROM` varchar(255) DEFAULT NULL,
  `MESSAGE_TO` varchar(255) DEFAULT NULL,
  `OCCASION` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`PERSONAL_MESSAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_personal_message`
--

/*!40000 ALTER TABLE `blc_personal_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_personal_message` ENABLE KEYS */;


--
-- Definition of table `blc_pgtmplt_fldgrp_xref`
--

DROP TABLE IF EXISTS `blc_pgtmplt_fldgrp_xref`;
CREATE TABLE `blc_pgtmplt_fldgrp_xref` (
  `PAGE_TMPLT_ID` bigint(20) NOT NULL,
  `FLD_GROUP_ID` bigint(20) NOT NULL,
  `GROUP_ORDER` int(11) NOT NULL,
  PRIMARY KEY (`PAGE_TMPLT_ID`,`GROUP_ORDER`),
  KEY `FK99D625F6D49D3961` (`PAGE_TMPLT_ID`),
  KEY `FK99D625F66A79BDB5` (`FLD_GROUP_ID`),
  CONSTRAINT `FK99D625F66A79BDB5` FOREIGN KEY (`FLD_GROUP_ID`) REFERENCES `blc_fld_group` (`FLD_GROUP_ID`),
  CONSTRAINT `FK99D625F6D49D3961` FOREIGN KEY (`PAGE_TMPLT_ID`) REFERENCES `blc_page_tmplt` (`PAGE_TMPLT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_pgtmplt_fldgrp_xref`
--

/*!40000 ALTER TABLE `blc_pgtmplt_fldgrp_xref` DISABLE KEYS */;
INSERT INTO `blc_pgtmplt_fldgrp_xref` (`PAGE_TMPLT_ID`,`FLD_GROUP_ID`,`GROUP_ORDER`) VALUES 
 (1,1,0),
 (2,1,0);
/*!40000 ALTER TABLE `blc_pgtmplt_fldgrp_xref` ENABLE KEYS */;


--
-- Definition of table `blc_phone`
--

DROP TABLE IF EXISTS `blc_phone`;
CREATE TABLE `blc_phone` (
  `PHONE_ID` bigint(20) NOT NULL,
  `IS_ACTIVE` bit(1) DEFAULT NULL,
  `IS_DEFAULT` bit(1) DEFAULT NULL,
  `PHONE_NUMBER` varchar(255) NOT NULL,
  PRIMARY KEY (`PHONE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_phone`
--

/*!40000 ALTER TABLE `blc_phone` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_phone` ENABLE KEYS */;


--
-- Definition of table `blc_product`
--

DROP TABLE IF EXISTS `blc_product`;
CREATE TABLE `blc_product` (
  `PRODUCT_ID` bigint(20) NOT NULL,
  `ARCHIVED` char(1) DEFAULT NULL,
  `CAN_SELL_WITHOUT_OPTIONS` bit(1) DEFAULT NULL,
  `DISPLAY_TEMPLATE` varchar(255) DEFAULT NULL,
  `IS_FEATURED_PRODUCT` bit(1) NOT NULL,
  `MANUFACTURE` varchar(255) DEFAULT NULL,
  `MODEL` varchar(255) DEFAULT NULL,
  `URL` varchar(255) DEFAULT NULL,
  `URL_KEY` varchar(255) DEFAULT NULL,
  `DEFAULT_CATEGORY_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`PRODUCT_ID`),
  KEY `PRODUCT_CATEGORY_INDEX` (`DEFAULT_CATEGORY_ID`),
  KEY `FK5B95B7C9DF057C3F` (`DEFAULT_CATEGORY_ID`),
  CONSTRAINT `FK5B95B7C9DF057C3F` FOREIGN KEY (`DEFAULT_CATEGORY_ID`) REFERENCES `blc_category` (`CATEGORY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_product`
--

/*!40000 ALTER TABLE `blc_product` DISABLE KEYS */;
INSERT INTO `blc_product` (`PRODUCT_ID`,`ARCHIVED`,`CAN_SELL_WITHOUT_OPTIONS`,`DISPLAY_TEMPLATE`,`IS_FEATURED_PRODUCT`,`MANUFACTURE`,`MODEL`,`URL`,`URL_KEY`,`DEFAULT_CATEGORY_ID`) VALUES 
 (1,NULL,NULL,NULL,0x01,'Blair\'s',NULL,'/hot-sauces/sudden_death_sauce',NULL,2002),
 (2,NULL,NULL,NULL,0x00,'Blair\'s',NULL,'/hot-sauces/sweet_death_sauce',NULL,2002),
 (3,NULL,NULL,NULL,0x00,'Salsa Express',NULL,'/hot-sauces/hoppin_hot_sauce',NULL,2002),
 (4,NULL,NULL,NULL,0x00,'Spice Exchange',NULL,'/hot-sauces/day_of_the_dead_chipotle_hot_sauce',NULL,2002),
 (5,NULL,NULL,NULL,0x00,'Spice Exchange',NULL,'/hot-sauces/day_of_the_dead_habanero_hot_sauce',NULL,2002),
 (6,NULL,NULL,NULL,0x00,'Spice Exchange',NULL,'/hot-sauces/day_of_the_dead_scotch_bonnet_sauce',NULL,2002),
 (7,NULL,NULL,NULL,0x00,'Garden Row',NULL,'/hot-sauces/green_ghost',NULL,2002),
 (8,NULL,NULL,NULL,0x00,'D. L. Jardine\'s',NULL,'/hot-sauces/blazin_saddle_hot_habanero_pepper_sauce',NULL,2002),
 (9,NULL,NULL,NULL,0x01,'Figueroa Brothers',NULL,'/hot-sauces/armageddon_hot_sauce_to_end_all',NULL,2002),
 (10,NULL,NULL,NULL,0x00,'Figueroa Brothers',NULL,'/hot-sauces/dr_chilemeisters_insane_hot_sauce',NULL,2002),
 (11,NULL,NULL,NULL,0x00,'Brazos Legends',NULL,'/hot-sauces/bull_snort_cowboy_cayenne_pepper_hot_sauce',NULL,2002),
 (12,NULL,NULL,NULL,0x00,'Garden Row',NULL,'/hot-sauces/cafe_louisiane_sweet_cajun_blackening_sauce',NULL,2002),
 (13,NULL,NULL,NULL,0x01,'Brazos Legends',NULL,'/hot-sauces/bull_snort_smokin_toncils_hot_sauce',NULL,2002),
 (14,NULL,NULL,NULL,0x00,'Dave\'s Gourmet',NULL,'/hot-sauces/cool_cayenne_pepper_hot_sauce',NULL,2002),
 (15,NULL,NULL,NULL,0x00,'Dave\'s Gourmet',NULL,'/hot-sauces/roasted_garlic_hot_sauce',NULL,2002),
 (16,NULL,NULL,NULL,0x00,'Dave\'s Gourmet',NULL,'/hot-sauces/scotch_bonnet_hot_sauce',NULL,2002),
 (17,NULL,NULL,NULL,0x00,'Dave\'s Gourmet',NULL,'/hot-sauces/insanity_sauce',NULL,2002),
 (18,NULL,NULL,NULL,0x00,'Dave\'s Gourmet',NULL,'/hot-sauces/hurtin_jalepeno_hot_sauce',NULL,2002),
 (19,NULL,NULL,NULL,0x00,'Dave\'s Gourmet',NULL,'/hot-sauces/roasted_red_pepper_chipotle_hot_sauce',NULL,2002),
 (100,NULL,NULL,NULL,0x00,'The Heat Clinic',NULL,'/merchandise/hawt_like_a_habanero_mens',NULL,2003),
 (200,NULL,NULL,NULL,0x00,'The Heat Clinic',NULL,'/merchandise/hawt_like_a_habanero_womens',NULL,2003),
 (300,NULL,NULL,NULL,0x00,'The Heat Clinic',NULL,'/merchandise/heat_clinic_hand-drawn_mens',NULL,2003),
 (400,NULL,NULL,NULL,0x00,'The Heat Clinic',NULL,'/merchandise/heat_clinic_hand-drawn_womens',NULL,2003),
 (500,NULL,NULL,NULL,0x00,'The Heat Clinic',NULL,'/merchandise/heat_clinic_mascot_mens',NULL,2003),
 (600,NULL,NULL,NULL,0x00,'The Heat Clinic',NULL,'/merchandise/heat_clinic_mascot_womens',NULL,2003);
/*!40000 ALTER TABLE `blc_product` ENABLE KEYS */;


--
-- Definition of table `blc_product_attribute`
--

DROP TABLE IF EXISTS `blc_product_attribute`;
CREATE TABLE `blc_product_attribute` (
  `PRODUCT_ATTRIBUTE_ID` bigint(20) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `SEARCHABLE` bit(1) DEFAULT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `PRODUCT_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`PRODUCT_ATTRIBUTE_ID`),
  KEY `PRODUCTATTRIBUTE_INDEX` (`PRODUCT_ID`),
  KEY `PRODUCTATTRIBUTE_NAME_INDEX` (`NAME`),
  KEY `FK56CE05865F11A0B7` (`PRODUCT_ID`),
  CONSTRAINT `FK56CE05865F11A0B7` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `blc_product` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_product_attribute`
--

/*!40000 ALTER TABLE `blc_product_attribute` DISABLE KEYS */;
INSERT INTO `blc_product_attribute` (`PRODUCT_ATTRIBUTE_ID`,`NAME`,`SEARCHABLE`,`VALUE`,`PRODUCT_ID`) VALUES 
 (1,'heatRange',NULL,'4',1),
 (2,'heatRange',NULL,'1',2),
 (3,'heatRange',NULL,'2',3),
 (4,'heatRange',NULL,'2',4),
 (5,'heatRange',NULL,'4',5),
 (6,'heatRange',NULL,'4',6),
 (7,'heatRange',NULL,'3',7),
 (8,'heatRange',NULL,'4',8),
 (9,'heatRange',NULL,'5',9),
 (10,'heatRange',NULL,'5',10),
 (11,'heatRange',NULL,'2',11),
 (12,'heatRange',NULL,'1',12),
 (13,'heatRange',NULL,'2',13),
 (14,'heatRange',NULL,'2',14),
 (15,'heatRange',NULL,'1',15),
 (16,'heatRange',NULL,'3',16),
 (17,'heatRange',NULL,'5',17),
 (18,'heatRange',NULL,'3',18),
 (19,'heatRange',NULL,'1',19);
/*!40000 ALTER TABLE `blc_product_attribute` ENABLE KEYS */;


--
-- Definition of table `blc_product_bundle`
--

DROP TABLE IF EXISTS `blc_product_bundle`;
CREATE TABLE `blc_product_bundle` (
  `AUTO_BUNDLE` bit(1) DEFAULT NULL,
  `BUNDLE_PROMOTABLE` bit(1) DEFAULT NULL,
  `ITEMS_PROMOTABLE` bit(1) DEFAULT NULL,
  `PRICING_MODEL` varchar(255) DEFAULT NULL,
  `BUNDLE_PRIORITY` int(11) DEFAULT NULL,
  `PRODUCT_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`PRODUCT_ID`),
  KEY `FK8CC5B85F11A0B7` (`PRODUCT_ID`),
  CONSTRAINT `FK8CC5B85F11A0B7` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `blc_product` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_product_bundle`
--

/*!40000 ALTER TABLE `blc_product_bundle` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_product_bundle` ENABLE KEYS */;


--
-- Definition of table `blc_product_cross_sale`
--

DROP TABLE IF EXISTS `blc_product_cross_sale`;
CREATE TABLE `blc_product_cross_sale` (
  `CROSS_SALE_PRODUCT_ID` bigint(20) NOT NULL,
  `PROMOTION_MESSAGE` varchar(255) DEFAULT NULL,
  `SEQUENCE` bigint(20) DEFAULT NULL,
  `CATEGORY_ID` bigint(20) DEFAULT NULL,
  `PRODUCT_ID` bigint(20) DEFAULT NULL,
  `RELATED_SALE_PRODUCT_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`CROSS_SALE_PRODUCT_ID`),
  KEY `CROSSSALE_INDEX` (`PRODUCT_ID`),
  KEY `CROSSSALE_CATEGORY_INDEX` (`CATEGORY_ID`),
  KEY `CROSSSALE_RELATED_INDEX` (`RELATED_SALE_PRODUCT_ID`),
  KEY `FK8324FB3C62D84F9B` (`RELATED_SALE_PRODUCT_ID`),
  KEY `FK8324FB3C15D1A13D` (`CATEGORY_ID`),
  KEY `FK8324FB3C5F11A0B7` (`PRODUCT_ID`),
  CONSTRAINT `FK8324FB3C15D1A13D` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `blc_category` (`CATEGORY_ID`),
  CONSTRAINT `FK8324FB3C5F11A0B7` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `blc_product` (`PRODUCT_ID`),
  CONSTRAINT `FK8324FB3C62D84F9B` FOREIGN KEY (`RELATED_SALE_PRODUCT_ID`) REFERENCES `blc_product` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_product_cross_sale`
--

/*!40000 ALTER TABLE `blc_product_cross_sale` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_product_cross_sale` ENABLE KEYS */;


--
-- Definition of table `blc_product_featured`
--

DROP TABLE IF EXISTS `blc_product_featured`;
CREATE TABLE `blc_product_featured` (
  `FEATURED_PRODUCT_ID` bigint(20) NOT NULL,
  `PROMOTION_MESSAGE` varchar(255) DEFAULT NULL,
  `SEQUENCE` bigint(20) DEFAULT NULL,
  `CATEGORY_ID` bigint(20) DEFAULT NULL,
  `PRODUCT_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`FEATURED_PRODUCT_ID`),
  KEY `PRODFEATURED_PRODUCT_INDEX` (`PRODUCT_ID`),
  KEY `PRODFEATURED_CATEGORY_INDEX` (`CATEGORY_ID`),
  KEY `FK4C49FFE415D1A13D` (`CATEGORY_ID`),
  KEY `FK4C49FFE45F11A0B7` (`PRODUCT_ID`),
  CONSTRAINT `FK4C49FFE415D1A13D` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `blc_category` (`CATEGORY_ID`),
  CONSTRAINT `FK4C49FFE45F11A0B7` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `blc_product` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_product_featured`
--

/*!40000 ALTER TABLE `blc_product_featured` DISABLE KEYS */;
INSERT INTO `blc_product_featured` (`FEATURED_PRODUCT_ID`,`PROMOTION_MESSAGE`,`SEQUENCE`,`CATEGORY_ID`,`PRODUCT_ID`) VALUES 
 (1,NULL,1,1,18),
 (2,NULL,2,1,15),
 (3,NULL,3,1,200),
 (4,NULL,4,1,100),
 (5,NULL,1,2003,4),
 (8,NULL,4,2002,500),
 (9,NULL,4,2002,200),
 (10,NULL,4,2002,300);
/*!40000 ALTER TABLE `blc_product_featured` ENABLE KEYS */;


--
-- Definition of table `blc_product_option`
--

DROP TABLE IF EXISTS `blc_product_option`;
CREATE TABLE `blc_product_option` (
  `PRODUCT_OPTION_ID` bigint(20) NOT NULL,
  `ATTRIBUTE_NAME` varchar(255) DEFAULT NULL,
  `DISPLAY_ORDER` int(11) DEFAULT NULL,
  `LABEL` varchar(255) DEFAULT NULL,
  `REQUIRED` bit(1) DEFAULT NULL,
  `OPTION_TYPE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`PRODUCT_OPTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_product_option`
--

/*!40000 ALTER TABLE `blc_product_option` DISABLE KEYS */;
INSERT INTO `blc_product_option` (`PRODUCT_OPTION_ID`,`ATTRIBUTE_NAME`,`DISPLAY_ORDER`,`LABEL`,`REQUIRED`,`OPTION_TYPE`) VALUES 
 (1,'COLOR',NULL,'Shirt Color',0x01,'COLOR'),
 (2,'SIZE',NULL,'Shirt Size',0x01,'SIZE');
/*!40000 ALTER TABLE `blc_product_option` ENABLE KEYS */;


--
-- Definition of table `blc_product_option_value`
--

DROP TABLE IF EXISTS `blc_product_option_value`;
CREATE TABLE `blc_product_option_value` (
  `PRODUCT_OPTION_VALUE_ID` bigint(20) NOT NULL,
  `ATTRIBUTE_VALUE` varchar(255) DEFAULT NULL,
  `DISPLAY_ORDER` bigint(20) DEFAULT NULL,
  `PRICE_ADJUSTMENT` decimal(19,5) DEFAULT NULL,
  `PRODUCT_OPTION_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`PRODUCT_OPTION_VALUE_ID`),
  KEY `FK6DEEEDBD92EA8136` (`PRODUCT_OPTION_ID`),
  CONSTRAINT `FK6DEEEDBD92EA8136` FOREIGN KEY (`PRODUCT_OPTION_ID`) REFERENCES `blc_product_option` (`PRODUCT_OPTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_product_option_value`
--

/*!40000 ALTER TABLE `blc_product_option_value` DISABLE KEYS */;
INSERT INTO `blc_product_option_value` (`PRODUCT_OPTION_VALUE_ID`,`ATTRIBUTE_VALUE`,`DISPLAY_ORDER`,`PRICE_ADJUSTMENT`,`PRODUCT_OPTION_ID`) VALUES 
 (1,'Black',1,NULL,1),
 (2,'Red',2,NULL,1),
 (3,'Silver',3,NULL,1),
 (11,'S',1,NULL,2),
 (12,'M',2,NULL,2),
 (13,'L',3,NULL,2),
 (14,'XL',4,NULL,2);
/*!40000 ALTER TABLE `blc_product_option_value` ENABLE KEYS */;


--
-- Definition of table `blc_product_option_xref`
--

DROP TABLE IF EXISTS `blc_product_option_xref`;
CREATE TABLE `blc_product_option_xref` (
  `PRODUCT_OPTION_ID` bigint(20) NOT NULL,
  `PRODUCT_ID` bigint(20) NOT NULL,
  KEY `FKDA42AB2F92EA8136` (`PRODUCT_OPTION_ID`),
  KEY `FKDA42AB2F5F11A0B7` (`PRODUCT_ID`),
  CONSTRAINT `FKDA42AB2F5F11A0B7` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `blc_product` (`PRODUCT_ID`),
  CONSTRAINT `FKDA42AB2F92EA8136` FOREIGN KEY (`PRODUCT_OPTION_ID`) REFERENCES `blc_product_option` (`PRODUCT_OPTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_product_option_xref`
--

/*!40000 ALTER TABLE `blc_product_option_xref` DISABLE KEYS */;
INSERT INTO `blc_product_option_xref` (`PRODUCT_OPTION_ID`,`PRODUCT_ID`) VALUES 
 (1,100),
 (1,200),
 (1,300),
 (1,400),
 (1,500),
 (1,600),
 (2,100),
 (2,200),
 (2,300),
 (2,400),
 (2,500),
 (2,600);
/*!40000 ALTER TABLE `blc_product_option_xref` ENABLE KEYS */;


--
-- Definition of table `blc_product_sku_xref`
--

DROP TABLE IF EXISTS `blc_product_sku_xref`;
CREATE TABLE `blc_product_sku_xref` (
  `PRODUCT_ID` bigint(20) DEFAULT NULL,
  `SKU_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`SKU_ID`),
  KEY `FKF2DBF6D3B78C9977` (`SKU_ID`),
  KEY `FKF2DBF6D35F11A0B7` (`PRODUCT_ID`),
  CONSTRAINT `FKF2DBF6D35F11A0B7` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `blc_product` (`PRODUCT_ID`),
  CONSTRAINT `FKF2DBF6D3B78C9977` FOREIGN KEY (`SKU_ID`) REFERENCES `blc_sku` (`SKU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_product_sku_xref`
--

/*!40000 ALTER TABLE `blc_product_sku_xref` DISABLE KEYS */;
INSERT INTO `blc_product_sku_xref` (`PRODUCT_ID`,`SKU_ID`) VALUES 
 (100,111),
 (100,112),
 (100,113),
 (100,114),
 (100,121),
 (100,122),
 (100,123),
 (100,124),
 (100,131),
 (100,132),
 (100,133),
 (100,134),
 (200,211),
 (200,212),
 (200,213),
 (200,214),
 (200,221),
 (200,222),
 (200,223),
 (200,224),
 (200,231),
 (200,232),
 (200,233),
 (200,234),
 (300,311),
 (300,312),
 (300,313),
 (300,314),
 (300,321),
 (300,322),
 (300,323),
 (300,324),
 (300,331),
 (300,332),
 (300,333),
 (300,334),
 (400,411),
 (400,412),
 (400,413),
 (400,414),
 (400,421),
 (400,422),
 (400,423),
 (400,424),
 (400,431),
 (400,432),
 (400,433),
 (400,434),
 (500,511),
 (500,512),
 (500,513),
 (500,514),
 (500,521),
 (500,522),
 (500,523),
 (500,524),
 (500,531),
 (500,532),
 (500,533),
 (500,534),
 (600,611),
 (600,612),
 (600,613),
 (600,614),
 (600,621),
 (600,622),
 (600,623),
 (600,624),
 (600,631),
 (600,632),
 (600,633),
 (600,634);
/*!40000 ALTER TABLE `blc_product_sku_xref` ENABLE KEYS */;


--
-- Definition of table `blc_product_up_sale`
--

DROP TABLE IF EXISTS `blc_product_up_sale`;
CREATE TABLE `blc_product_up_sale` (
  `UP_SALE_PRODUCT_ID` bigint(20) NOT NULL,
  `PROMOTION_MESSAGE` varchar(255) DEFAULT NULL,
  `SEQUENCE` bigint(20) DEFAULT NULL,
  `CATEGORY_ID` bigint(20) DEFAULT NULL,
  `PRODUCT_ID` bigint(20) DEFAULT NULL,
  `RELATED_SALE_PRODUCT_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`UP_SALE_PRODUCT_ID`),
  KEY `UPSALE_RELATED_INDEX` (`RELATED_SALE_PRODUCT_ID`),
  KEY `UPSALE_PRODUCT_INDEX` (`PRODUCT_ID`),
  KEY `UPSALE_CATEGORY_INDEX` (`CATEGORY_ID`),
  KEY `FKF69054F562D84F9B` (`RELATED_SALE_PRODUCT_ID`),
  KEY `FKF69054F515D1A13D` (`CATEGORY_ID`),
  KEY `FKF69054F55F11A0B7` (`PRODUCT_ID`),
  CONSTRAINT `FKF69054F515D1A13D` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `blc_category` (`CATEGORY_ID`),
  CONSTRAINT `FKF69054F55F11A0B7` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `blc_product` (`PRODUCT_ID`),
  CONSTRAINT `FKF69054F562D84F9B` FOREIGN KEY (`RELATED_SALE_PRODUCT_ID`) REFERENCES `blc_product` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_product_up_sale`
--

/*!40000 ALTER TABLE `blc_product_up_sale` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_product_up_sale` ENABLE KEYS */;


--
-- Definition of table `blc_qual_crit_offer_xref`
--

DROP TABLE IF EXISTS `blc_qual_crit_offer_xref`;
CREATE TABLE `blc_qual_crit_offer_xref` (
  `OFFER_ID` bigint(20) NOT NULL,
  `OFFER_ITEM_CRITERIA_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`OFFER_ID`,`OFFER_ITEM_CRITERIA_ID`),
  UNIQUE KEY `OFFER_ITEM_CRITERIA_ID` (`OFFER_ITEM_CRITERIA_ID`),
  KEY `FKD592E919D5F3FAF4` (`OFFER_ID`),
  KEY `FKD592E9193615A91A` (`OFFER_ITEM_CRITERIA_ID`),
  CONSTRAINT `FKD592E9193615A91A` FOREIGN KEY (`OFFER_ITEM_CRITERIA_ID`) REFERENCES `blc_offer_item_criteria` (`OFFER_ITEM_CRITERIA_ID`),
  CONSTRAINT `FKD592E919D5F3FAF4` FOREIGN KEY (`OFFER_ID`) REFERENCES `blc_offer` (`OFFER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_qual_crit_offer_xref`
--

/*!40000 ALTER TABLE `blc_qual_crit_offer_xref` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_qual_crit_offer_xref` ENABLE KEYS */;


--
-- Definition of table `blc_qual_crit_page_xref`
--

DROP TABLE IF EXISTS `blc_qual_crit_page_xref`;
CREATE TABLE `blc_qual_crit_page_xref` (
  `PAGE_ID` bigint(20) NOT NULL DEFAULT '0',
  `PAGE_ITEM_CRITERIA_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`PAGE_ID`,`PAGE_ITEM_CRITERIA_ID`),
  UNIQUE KEY `PAGE_ITEM_CRITERIA_ID` (`PAGE_ITEM_CRITERIA_ID`),
  KEY `FK874BE590378418CD` (`PAGE_ITEM_CRITERIA_ID`),
  KEY `FK874BE590883C2667` (`PAGE_ID`),
  CONSTRAINT `FK874BE590378418CD` FOREIGN KEY (`PAGE_ITEM_CRITERIA_ID`) REFERENCES `blc_page_item_criteria` (`PAGE_ITEM_CRITERIA_ID`),
  CONSTRAINT `FK874BE590883C2667` FOREIGN KEY (`PAGE_ID`) REFERENCES `blc_page` (`PAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_qual_crit_page_xref`
--

/*!40000 ALTER TABLE `blc_qual_crit_page_xref` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_qual_crit_page_xref` ENABLE KEYS */;


--
-- Definition of table `blc_qual_crit_sc_xref`
--

DROP TABLE IF EXISTS `blc_qual_crit_sc_xref`;
CREATE TABLE `blc_qual_crit_sc_xref` (
  `SC_ID` bigint(20) NOT NULL,
  `SC_ITEM_CRITERIA_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`SC_ID`,`SC_ITEM_CRITERIA_ID`),
  UNIQUE KEY `SC_ITEM_CRITERIA_ID` (`SC_ITEM_CRITERIA_ID`),
  KEY `FKC4A353AF85C77F2B` (`SC_ITEM_CRITERIA_ID`),
  KEY `FKC4A353AF13D95585` (`SC_ID`),
  CONSTRAINT `FKC4A353AF13D95585` FOREIGN KEY (`SC_ID`) REFERENCES `blc_sc` (`SC_ID`),
  CONSTRAINT `FKC4A353AF85C77F2B` FOREIGN KEY (`SC_ITEM_CRITERIA_ID`) REFERENCES `blc_sc_item_criteria` (`SC_ITEM_CRITERIA_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_qual_crit_sc_xref`
--

/*!40000 ALTER TABLE `blc_qual_crit_sc_xref` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_qual_crit_sc_xref` ENABLE KEYS */;


--
-- Definition of table `blc_rating_detail`
--

DROP TABLE IF EXISTS `blc_rating_detail`;
CREATE TABLE `blc_rating_detail` (
  `RATING_DETAIL_ID` bigint(20) NOT NULL,
  `RATING` double NOT NULL,
  `RATING_SUBMITTED_DATE` datetime NOT NULL,
  `CUSTOMER_ID` bigint(20) NOT NULL,
  `RATING_SUMMARY_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`RATING_DETAIL_ID`),
  KEY `RATING_CUSTOMER_INDEX` (`CUSTOMER_ID`),
  KEY `FKC9D04ADD4E76BF4` (`RATING_SUMMARY_ID`),
  KEY `FKC9D04AD7470F437` (`CUSTOMER_ID`),
  CONSTRAINT `FKC9D04AD7470F437` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `blc_customer` (`CUSTOMER_ID`),
  CONSTRAINT `FKC9D04ADD4E76BF4` FOREIGN KEY (`RATING_SUMMARY_ID`) REFERENCES `blc_rating_summary` (`RATING_SUMMARY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_rating_detail`
--

/*!40000 ALTER TABLE `blc_rating_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_rating_detail` ENABLE KEYS */;


--
-- Definition of table `blc_rating_summary`
--

DROP TABLE IF EXISTS `blc_rating_summary`;
CREATE TABLE `blc_rating_summary` (
  `RATING_SUMMARY_ID` bigint(20) NOT NULL,
  `AVERAGE_RATING` double NOT NULL,
  `ITEM_ID` varchar(255) NOT NULL,
  `RATING_TYPE` varchar(255) NOT NULL,
  PRIMARY KEY (`RATING_SUMMARY_ID`),
  KEY `RATINGSUMM_TYPE_INDEX` (`RATING_TYPE`),
  KEY `RATINGSUMM_ITEM_INDEX` (`ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_rating_summary`
--

/*!40000 ALTER TABLE `blc_rating_summary` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_rating_summary` ENABLE KEYS */;


--
-- Definition of table `blc_review_detail`
--

DROP TABLE IF EXISTS `blc_review_detail`;
CREATE TABLE `blc_review_detail` (
  `REVIEW_DETAIL_ID` bigint(20) NOT NULL,
  `HELPFUL_COUNT` int(11) NOT NULL,
  `NOT_HELPFUL_COUNT` int(11) NOT NULL,
  `REVIEW_SUBMITTED_DATE` datetime NOT NULL,
  `REVIEW_STATUS` varchar(255) NOT NULL,
  `REVIEW_TEXT` varchar(255) NOT NULL,
  `CUSTOMER_ID` bigint(20) NOT NULL,
  `RATING_DETAIL_ID` bigint(20) DEFAULT NULL,
  `RATING_SUMMARY_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`REVIEW_DETAIL_ID`),
  KEY `REVIEWDETAIL_SUMMARY_INDEX` (`RATING_SUMMARY_ID`),
  KEY `REVIEWDETAIL_RATING_INDEX` (`RATING_DETAIL_ID`),
  KEY `REVIEWDETAIL_CUSTOMER_INDEX` (`CUSTOMER_ID`),
  KEY `REVIEWDETAIL_STATUS_INDEX` (`REVIEW_STATUS`),
  KEY `FK9CD7E692D4E76BF4` (`RATING_SUMMARY_ID`),
  KEY `FK9CD7E6927470F437` (`CUSTOMER_ID`),
  KEY `FK9CD7E69245DC39E0` (`RATING_DETAIL_ID`),
  CONSTRAINT `FK9CD7E69245DC39E0` FOREIGN KEY (`RATING_DETAIL_ID`) REFERENCES `blc_rating_detail` (`RATING_DETAIL_ID`),
  CONSTRAINT `FK9CD7E6927470F437` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `blc_customer` (`CUSTOMER_ID`),
  CONSTRAINT `FK9CD7E692D4E76BF4` FOREIGN KEY (`RATING_SUMMARY_ID`) REFERENCES `blc_rating_summary` (`RATING_SUMMARY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_review_detail`
--

/*!40000 ALTER TABLE `blc_review_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_review_detail` ENABLE KEYS */;


--
-- Definition of table `blc_review_feedback`
--

DROP TABLE IF EXISTS `blc_review_feedback`;
CREATE TABLE `blc_review_feedback` (
  `REVIEW_FEEDBACK_ID` bigint(20) NOT NULL,
  `IS_HELPFUL` bit(1) NOT NULL,
  `CUSTOMER_ID` bigint(20) NOT NULL,
  `REVIEW_DETAIL_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`REVIEW_FEEDBACK_ID`),
  KEY `REVIEWFEED_CUSTOMER_INDEX` (`CUSTOMER_ID`),
  KEY `REVIEWFEED_DETAIL_INDEX` (`REVIEW_DETAIL_ID`),
  KEY `FK7CC92986AE4769D6` (`REVIEW_DETAIL_ID`),
  KEY `FK7CC929867470F437` (`CUSTOMER_ID`),
  CONSTRAINT `FK7CC929867470F437` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `blc_customer` (`CUSTOMER_ID`),
  CONSTRAINT `FK7CC92986AE4769D6` FOREIGN KEY (`REVIEW_DETAIL_ID`) REFERENCES `blc_review_detail` (`REVIEW_DETAIL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_review_feedback`
--

/*!40000 ALTER TABLE `blc_review_feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_review_feedback` ENABLE KEYS */;


--
-- Definition of table `blc_role`
--

DROP TABLE IF EXISTS `blc_role`;
CREATE TABLE `blc_role` (
  `ROLE_ID` bigint(20) NOT NULL,
  `ROLE_NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`ROLE_ID`),
  KEY `ROLE_NAME_INDEX` (`ROLE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_role`
--

/*!40000 ALTER TABLE `blc_role` DISABLE KEYS */;
INSERT INTO `blc_role` (`ROLE_ID`,`ROLE_NAME`) VALUES 
 (1,'ROLE_USER');
/*!40000 ALTER TABLE `blc_role` ENABLE KEYS */;


--
-- Definition of table `blc_sandbox`
--

DROP TABLE IF EXISTS `blc_sandbox`;
CREATE TABLE `blc_sandbox` (
  `SANDBOX_ID` bigint(20) NOT NULL,
  `AUTHOR` bigint(20) DEFAULT NULL,
  `SANDBOX_NAME` varchar(255) DEFAULT NULL,
  `SANDBOX_TYPE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`SANDBOX_ID`),
  KEY `SANDBOX_NAME_INDEX` (`SANDBOX_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_sandbox`
--

/*!40000 ALTER TABLE `blc_sandbox` DISABLE KEYS */;
INSERT INTO `blc_sandbox` (`SANDBOX_ID`,`AUTHOR`,`SANDBOX_NAME`,`SANDBOX_TYPE`) VALUES 
 (50,NULL,'admin','USER');
/*!40000 ALTER TABLE `blc_sandbox` ENABLE KEYS */;


--
-- Definition of table `blc_sandbox_action`
--

DROP TABLE IF EXISTS `blc_sandbox_action`;
CREATE TABLE `blc_sandbox_action` (
  `SANDBOX_ACTION_ID` bigint(20) NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_UPDATED` datetime DEFAULT NULL,
  `ACTION_COMMENT` varchar(255) DEFAULT NULL,
  `ACTION_TYPE` varchar(255) DEFAULT NULL,
  `CREATED_BY` bigint(20) DEFAULT NULL,
  `UPDATED_BY` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`SANDBOX_ACTION_ID`),
  KEY `FK3657DE9424568C27` (`CREATED_BY`),
  KEY `FK3657DE94C1167574` (`UPDATED_BY`),
  CONSTRAINT `FK3657DE9424568C27` FOREIGN KEY (`CREATED_BY`) REFERENCES `blc_admin_user` (`ADMIN_USER_ID`),
  CONSTRAINT `FK3657DE94C1167574` FOREIGN KEY (`UPDATED_BY`) REFERENCES `blc_admin_user` (`ADMIN_USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_sandbox_action`
--

/*!40000 ALTER TABLE `blc_sandbox_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_sandbox_action` ENABLE KEYS */;


--
-- Definition of table `blc_sandbox_item`
--

DROP TABLE IF EXISTS `blc_sandbox_item`;
CREATE TABLE `blc_sandbox_item` (
  `SANDBOX_ITEM_ID` bigint(20) NOT NULL,
  `ARCHIVED_FLAG` char(1) DEFAULT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_UPDATED` datetime DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `GRP_DESCRIPTION` varchar(255) DEFAULT NULL,
  `ORIGINAL_ITEM_ID` bigint(20) DEFAULT NULL,
  `ORIG_SANDBOX_ID` bigint(20) DEFAULT NULL,
  `SANDBOX_ID` bigint(20) DEFAULT NULL,
  `SANDBOX_ITEM_TYPE` varchar(255) DEFAULT NULL,
  `SANDBOX_OPERATION_TYPE` varchar(255) DEFAULT NULL,
  `TEMPORARY_ITEM_ID` bigint(20) DEFAULT NULL,
  `CREATED_BY` bigint(20) DEFAULT NULL,
  `UPDATED_BY` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`SANDBOX_ITEM_ID`),
  KEY `ARCHIVED_FLAG_INDEX` (`ARCHIVED_FLAG`),
  KEY `SANDBOX_ITEM_TYPE_INDEX` (`SANDBOX_ITEM_TYPE`),
  KEY `SB_ORIG_ITEM_ID_INDEX` (`ORIGINAL_ITEM_ID`),
  KEY `TEMP_ITEM_INDEX` (`TEMPORARY_ITEM_ID`),
  KEY `SANDBOX_ID_INDEX` (`SANDBOX_ID`),
  KEY `ORIG_SANDBOX_ID_INDEX` (`ORIG_SANDBOX_ID`),
  KEY `FK48435EF124568C27` (`CREATED_BY`),
  KEY `FK48435EF1C1167574` (`UPDATED_BY`),
  CONSTRAINT `FK48435EF124568C27` FOREIGN KEY (`CREATED_BY`) REFERENCES `blc_admin_user` (`ADMIN_USER_ID`),
  CONSTRAINT `FK48435EF1C1167574` FOREIGN KEY (`UPDATED_BY`) REFERENCES `blc_admin_user` (`ADMIN_USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_sandbox_item`
--

/*!40000 ALTER TABLE `blc_sandbox_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_sandbox_item` ENABLE KEYS */;


--
-- Definition of table `blc_sc`
--

DROP TABLE IF EXISTS `blc_sc`;
CREATE TABLE `blc_sc` (
  `SC_ID` bigint(20) NOT NULL,
  `ARCHIVED_FLAG` bit(1) DEFAULT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_UPDATED` datetime DEFAULT NULL,
  `CONTENT_NAME` varchar(255) NOT NULL,
  `DELETED_FLAG` bit(1) DEFAULT NULL,
  `LOCKED_FLAG` bit(1) DEFAULT NULL,
  `OFFLINE_FLAG` bit(1) DEFAULT NULL,
  `ORIG_ITEM_ID` bigint(20) DEFAULT NULL,
  `PRIORITY` int(11) NOT NULL,
  `CREATED_BY` bigint(20) DEFAULT NULL,
  `UPDATED_BY` bigint(20) DEFAULT NULL,
  `LOCALE_CODE` varchar(255) NOT NULL,
  `ORIG_SANDBOX_ID` bigint(20) DEFAULT NULL,
  `SANDBOX_ID` bigint(20) DEFAULT NULL,
  `SC_TYPE_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`SC_ID`),
  KEY `SC_ORIG_ITEM_ID_INDEX` (`ORIG_ITEM_ID`),
  KEY `SC_LCKD_FLG_INDX` (`LOCKED_FLAG`),
  KEY `SC_DLTD_FLG_INDX` (`DELETED_FLAG`),
  KEY `CONTENT_NAME_INDEX` (`CONTENT_NAME`),
  KEY `SC_OFFLN_FLG_INDX` (`OFFLINE_FLAG`),
  KEY `SC_ARCHVD_FLG_INDX` (`ARCHIVED_FLAG`),
  KEY `FK74EEB71624568C27` (`CREATED_BY`),
  KEY `FK74EEB71671EBFA46` (`SC_TYPE_ID`),
  KEY `FK74EEB716A1E1C128` (`LOCALE_CODE`),
  KEY `FK74EEB716579FE59D` (`SANDBOX_ID`),
  KEY `FK74EEB716F9C4A5B` (`ORIG_SANDBOX_ID`),
  KEY `FK74EEB716C1167574` (`UPDATED_BY`),
  CONSTRAINT `FK74EEB71624568C27` FOREIGN KEY (`CREATED_BY`) REFERENCES `blc_admin_user` (`ADMIN_USER_ID`),
  CONSTRAINT `FK74EEB716579FE59D` FOREIGN KEY (`SANDBOX_ID`) REFERENCES `blc_sandbox` (`SANDBOX_ID`),
  CONSTRAINT `FK74EEB71671EBFA46` FOREIGN KEY (`SC_TYPE_ID`) REFERENCES `blc_sc_type` (`SC_TYPE_ID`),
  CONSTRAINT `FK74EEB716A1E1C128` FOREIGN KEY (`LOCALE_CODE`) REFERENCES `blc_locale` (`LOCALE_CODE`),
  CONSTRAINT `FK74EEB716C1167574` FOREIGN KEY (`UPDATED_BY`) REFERENCES `blc_admin_user` (`ADMIN_USER_ID`),
  CONSTRAINT `FK74EEB716F9C4A5B` FOREIGN KEY (`ORIG_SANDBOX_ID`) REFERENCES `blc_sandbox` (`SANDBOX_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_sc`
--

/*!40000 ALTER TABLE `blc_sc` DISABLE KEYS */;
INSERT INTO `blc_sc` (`SC_ID`,`ARCHIVED_FLAG`,`DATE_CREATED`,`DATE_UPDATED`,`CONTENT_NAME`,`DELETED_FLAG`,`LOCKED_FLAG`,`OFFLINE_FLAG`,`ORIG_ITEM_ID`,`PRIORITY`,`CREATED_BY`,`UPDATED_BY`,`LOCALE_CODE`,`ORIG_SANDBOX_ID`,`SANDBOX_ID`,`SC_TYPE_ID`) VALUES 
 (100,0x00,'2013-01-21 22:05:10','2013-01-21 22:05:10','Buy One Get One - Twice the Burn',0x00,NULL,0x00,NULL,5,1,1,'en',NULL,NULL,1),
 (101,0x00,'2013-01-21 22:05:10','2013-01-21 22:05:10','Shirt Special - 20% off all shirts',0x00,NULL,0x00,NULL,1,1,1,'en',NULL,NULL,1),
 (102,0x00,'2013-01-21 22:05:10','2013-01-21 22:05:10','Member Special - $10 off next order over $50',0x00,NULL,0x00,NULL,5,1,1,'en',NULL,NULL,1),
 (110,0x00,'2013-01-21 22:05:11','2013-01-21 22:05:11','Home Page Snippet - Aficionado',0x00,NULL,0x00,NULL,5,1,1,'en',NULL,NULL,2),
 (130,0x00,'2013-01-21 22:05:11','2013-01-21 22:05:11','Home Page Featured Products Title',0x00,NULL,0x00,NULL,5,1,1,'en',NULL,NULL,3),
 (140,0x00,'2013-01-21 22:05:11','2013-01-21 22:05:11','RHS - The Essentials Collection',0x00,NULL,0x00,NULL,5,1,1,'en',NULL,NULL,4);
/*!40000 ALTER TABLE `blc_sc` ENABLE KEYS */;


--
-- Definition of table `blc_sc_fld`
--

DROP TABLE IF EXISTS `blc_sc_fld`;
CREATE TABLE `blc_sc_fld` (
  `SC_FLD_ID` bigint(20) NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_UPDATED` datetime DEFAULT NULL,
  `FLD_KEY` varchar(255) DEFAULT NULL,
  `LOB_VALUE` longtext,
  `VALUE` varchar(255) DEFAULT NULL,
  `CREATED_BY` bigint(20) DEFAULT NULL,
  `UPDATED_BY` bigint(20) DEFAULT NULL,
  `SC_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`SC_FLD_ID`),
  KEY `FK621D7B9524568C27` (`CREATED_BY`),
  KEY `FK621D7B95C1167574` (`UPDATED_BY`),
  KEY `FK621D7B9513D95585` (`SC_ID`),
  CONSTRAINT `FK621D7B9513D95585` FOREIGN KEY (`SC_ID`) REFERENCES `blc_sc` (`SC_ID`),
  CONSTRAINT `FK621D7B9524568C27` FOREIGN KEY (`CREATED_BY`) REFERENCES `blc_admin_user` (`ADMIN_USER_ID`),
  CONSTRAINT `FK621D7B95C1167574` FOREIGN KEY (`UPDATED_BY`) REFERENCES `blc_admin_user` (`ADMIN_USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_sc_fld`
--

/*!40000 ALTER TABLE `blc_sc_fld` DISABLE KEYS */;
INSERT INTO `blc_sc_fld` (`SC_FLD_ID`,`DATE_CREATED`,`DATE_UPDATED`,`FLD_KEY`,`LOB_VALUE`,`VALUE`,`CREATED_BY`,`UPDATED_BY`,`SC_ID`) VALUES 
 (1,'2013-01-21 22:05:10',NULL,'imageUrl',NULL,'/img/banners/buy-one-get-one-home-banner.jpg',1,NULL,100),
 (2,'2013-01-21 22:05:10',NULL,'targetUrl',NULL,'/hot-sauces',1,NULL,100),
 (3,'2013-01-21 22:05:10',NULL,'imageUrl',NULL,'/img/banners/shirt-special.jpg',1,NULL,101),
 (4,'2013-01-21 22:05:10',NULL,'targetUrl',NULL,'/merchandise',1,NULL,101),
 (5,'2013-01-21 22:05:10',NULL,'imageUrl',NULL,'/img/banners/member-special.jpg',1,NULL,102),
 (6,'2013-01-21 22:05:10',NULL,'targetUrl',NULL,'/register',1,NULL,102),
 (7,'2013-01-21 22:05:11',NULL,'htmlContent',NULL,'<h2>HOT SAUCE AFICIONADO?</h2> Click to join our Heat Clinic Frequent Care Program. The place to get all the deals on burn treatment.',1,NULL,110),
 (8,'2013-01-21 22:05:11',NULL,'messageText',NULL,'The Heat Clinic\'s Top Selling Sauces',1,NULL,130),
 (9,'2013-01-21 22:05:11',NULL,'imageUrl',NULL,'/img/rhs-ad.jpg',1,NULL,140),
 (10,'2013-01-21 22:05:11',NULL,'targetUrl',NULL,'/hot-sauces',1,NULL,140);
/*!40000 ALTER TABLE `blc_sc_fld` ENABLE KEYS */;


--
-- Definition of table `blc_sc_fld_map`
--

DROP TABLE IF EXISTS `blc_sc_fld_map`;
CREATE TABLE `blc_sc_fld_map` (
  `SC_ID` bigint(20) NOT NULL,
  `SC_FLD_ID` bigint(20) NOT NULL,
  `MAP_KEY` varchar(255) NOT NULL,
  PRIMARY KEY (`SC_ID`,`MAP_KEY`),
  KEY `FKD9480192DD6FD28A` (`SC_FLD_ID`),
  KEY `FKD948019213D95585` (`SC_ID`),
  CONSTRAINT `FKD948019213D95585` FOREIGN KEY (`SC_ID`) REFERENCES `blc_sc` (`SC_ID`),
  CONSTRAINT `FKD9480192DD6FD28A` FOREIGN KEY (`SC_FLD_ID`) REFERENCES `blc_sc_fld` (`SC_FLD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_sc_fld_map`
--

/*!40000 ALTER TABLE `blc_sc_fld_map` DISABLE KEYS */;
INSERT INTO `blc_sc_fld_map` (`SC_ID`,`SC_FLD_ID`,`MAP_KEY`) VALUES 
 (100,1,'imageUrl'),
 (100,2,'targetUrl'),
 (101,3,'imageUrl'),
 (101,4,'targetUrl'),
 (102,5,'imageUrl'),
 (102,6,'targetUrl'),
 (110,7,'htmlContent'),
 (130,8,'messageText'),
 (140,9,'imageUrl'),
 (140,10,'targetUrl');
/*!40000 ALTER TABLE `blc_sc_fld_map` ENABLE KEYS */;


--
-- Definition of table `blc_sc_fld_tmplt`
--

DROP TABLE IF EXISTS `blc_sc_fld_tmplt`;
CREATE TABLE `blc_sc_fld_tmplt` (
  `SC_FLD_TMPLT_ID` bigint(20) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`SC_FLD_TMPLT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_sc_fld_tmplt`
--

/*!40000 ALTER TABLE `blc_sc_fld_tmplt` DISABLE KEYS */;
INSERT INTO `blc_sc_fld_tmplt` (`SC_FLD_TMPLT_ID`,`NAME`) VALUES 
 (1,'Ad Template'),
 (2,'HTML Template'),
 (3,'Message Template');
/*!40000 ALTER TABLE `blc_sc_fld_tmplt` ENABLE KEYS */;


--
-- Definition of table `blc_sc_fldgrp_xref`
--

DROP TABLE IF EXISTS `blc_sc_fldgrp_xref`;
CREATE TABLE `blc_sc_fldgrp_xref` (
  `SC_FLD_TMPLT_ID` bigint(20) NOT NULL,
  `FLD_GROUP_ID` bigint(20) NOT NULL,
  `GROUP_ORDER` int(11) NOT NULL,
  PRIMARY KEY (`SC_FLD_TMPLT_ID`,`GROUP_ORDER`),
  KEY `FK71612AEAF6B0BA84` (`SC_FLD_TMPLT_ID`),
  KEY `FK71612AEA6A79BDB5` (`FLD_GROUP_ID`),
  CONSTRAINT `FK71612AEA6A79BDB5` FOREIGN KEY (`FLD_GROUP_ID`) REFERENCES `blc_fld_group` (`FLD_GROUP_ID`),
  CONSTRAINT `FK71612AEAF6B0BA84` FOREIGN KEY (`SC_FLD_TMPLT_ID`) REFERENCES `blc_sc_fld_tmplt` (`SC_FLD_TMPLT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_sc_fldgrp_xref`
--

/*!40000 ALTER TABLE `blc_sc_fldgrp_xref` DISABLE KEYS */;
INSERT INTO `blc_sc_fldgrp_xref` (`SC_FLD_TMPLT_ID`,`FLD_GROUP_ID`,`GROUP_ORDER`) VALUES 
 (1,4,0),
 (2,5,0),
 (3,6,0);
/*!40000 ALTER TABLE `blc_sc_fldgrp_xref` ENABLE KEYS */;


--
-- Definition of table `blc_sc_item_criteria`
--

DROP TABLE IF EXISTS `blc_sc_item_criteria`;
CREATE TABLE `blc_sc_item_criteria` (
  `SC_ITEM_CRITERIA_ID` bigint(20) NOT NULL,
  `ORDER_ITEM_MATCH_RULE` longtext,
  `QUANTITY` int(11) NOT NULL,
  PRIMARY KEY (`SC_ITEM_CRITERIA_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_sc_item_criteria`
--

/*!40000 ALTER TABLE `blc_sc_item_criteria` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_sc_item_criteria` ENABLE KEYS */;


--
-- Definition of table `blc_sc_rule`
--

DROP TABLE IF EXISTS `blc_sc_rule`;
CREATE TABLE `blc_sc_rule` (
  `SC_RULE_ID` bigint(20) NOT NULL,
  `MATCH_RULE` longtext,
  PRIMARY KEY (`SC_RULE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_sc_rule`
--

/*!40000 ALTER TABLE `blc_sc_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_sc_rule` ENABLE KEYS */;


--
-- Definition of table `blc_sc_rule_map`
--

DROP TABLE IF EXISTS `blc_sc_rule_map`;
CREATE TABLE `blc_sc_rule_map` (
  `BLC_SC_SC_ID` bigint(20) NOT NULL,
  `SC_RULE_ID` bigint(20) NOT NULL,
  `MAP_KEY` varchar(255) NOT NULL,
  PRIMARY KEY (`BLC_SC_SC_ID`,`MAP_KEY`),
  KEY `FK169F1C8256E51A06` (`SC_RULE_ID`),
  KEY `FK169F1C82156E72FC` (`BLC_SC_SC_ID`),
  CONSTRAINT `FK169F1C82156E72FC` FOREIGN KEY (`BLC_SC_SC_ID`) REFERENCES `blc_sc` (`SC_ID`),
  CONSTRAINT `FK169F1C8256E51A06` FOREIGN KEY (`SC_RULE_ID`) REFERENCES `blc_sc_rule` (`SC_RULE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_sc_rule_map`
--

/*!40000 ALTER TABLE `blc_sc_rule_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_sc_rule_map` ENABLE KEYS */;


--
-- Definition of table `blc_sc_type`
--

DROP TABLE IF EXISTS `blc_sc_type`;
CREATE TABLE `blc_sc_type` (
  `SC_TYPE_ID` bigint(20) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `SC_FLD_TMPLT_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`SC_TYPE_ID`),
  KEY `FKE19886C3F6B0BA84` (`SC_FLD_TMPLT_ID`),
  CONSTRAINT `FKE19886C3F6B0BA84` FOREIGN KEY (`SC_FLD_TMPLT_ID`) REFERENCES `blc_sc_fld_tmplt` (`SC_FLD_TMPLT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_sc_type`
--

/*!40000 ALTER TABLE `blc_sc_type` DISABLE KEYS */;
INSERT INTO `blc_sc_type` (`SC_TYPE_ID`,`DESCRIPTION`,`NAME`,`SC_FLD_TMPLT_ID`) VALUES 
 (1,NULL,'Homepage Banner Ad',1),
 (2,NULL,'Homepage Middle Promo Snippet',2),
 (3,NULL,'Homepage Featured Products Title',3),
 (4,NULL,'Right Hand Side Banner Ad',1);
/*!40000 ALTER TABLE `blc_sc_type` ENABLE KEYS */;


--
-- Definition of table `blc_search_facet`
--

DROP TABLE IF EXISTS `blc_search_facet`;
CREATE TABLE `blc_search_facet` (
  `SEARCH_FACET_ID` bigint(20) NOT NULL,
  `MULTISELECT` bit(1) DEFAULT NULL,
  `LABEL` varchar(255) DEFAULT NULL,
  `REQUIRES_ALL_DEPENDENT` bit(1) DEFAULT NULL,
  `SEARCH_DISPLAY_PRIORITY` int(11) DEFAULT NULL,
  `SHOW_ON_SEARCH` bit(1) DEFAULT NULL,
  `FIELD_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`SEARCH_FACET_ID`),
  KEY `FK4FFCC9863C3907C4` (`FIELD_ID`),
  CONSTRAINT `FK4FFCC9863C3907C4` FOREIGN KEY (`FIELD_ID`) REFERENCES `blc_field` (`FIELD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_search_facet`
--

/*!40000 ALTER TABLE `blc_search_facet` DISABLE KEYS */;
INSERT INTO `blc_search_facet` (`SEARCH_FACET_ID`,`MULTISELECT`,`LABEL`,`REQUIRES_ALL_DEPENDENT`,`SEARCH_DISPLAY_PRIORITY`,`SHOW_ON_SEARCH`,`FIELD_ID`) VALUES 
 (1,0x01,'Manufacturer',NULL,0,0x00,1),
 (2,0x01,'Heat Range',NULL,0,0x00,2),
 (3,0x01,'Price',NULL,1,0x01,3);
/*!40000 ALTER TABLE `blc_search_facet` ENABLE KEYS */;


--
-- Definition of table `blc_search_facet_range`
--

DROP TABLE IF EXISTS `blc_search_facet_range`;
CREATE TABLE `blc_search_facet_range` (
  `SEARCH_FACET_RANGE_ID` bigint(20) NOT NULL,
  `MAX_VALUE` decimal(19,5) DEFAULT NULL,
  `MIN_VALUE` decimal(19,5) NOT NULL,
  `SEARCH_FACET_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`SEARCH_FACET_RANGE_ID`),
  KEY `SEARCH_FACET_INDEX` (`SEARCH_FACET_ID`),
  KEY `FK7EC3B124B96B1C93` (`SEARCH_FACET_ID`),
  CONSTRAINT `FK7EC3B124B96B1C93` FOREIGN KEY (`SEARCH_FACET_ID`) REFERENCES `blc_search_facet` (`SEARCH_FACET_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_search_facet_range`
--

/*!40000 ALTER TABLE `blc_search_facet_range` DISABLE KEYS */;
INSERT INTO `blc_search_facet_range` (`SEARCH_FACET_RANGE_ID`,`MAX_VALUE`,`MIN_VALUE`,`SEARCH_FACET_ID`) VALUES 
 (1,'5.00000','0.00000',3),
 (2,'10.00000','5.00000',3),
 (3,'15.00000','10.00000',3),
 (4,NULL,'15.00000',3);
/*!40000 ALTER TABLE `blc_search_facet_range` ENABLE KEYS */;


--
-- Definition of table `blc_search_facet_xref`
--

DROP TABLE IF EXISTS `blc_search_facet_xref`;
CREATE TABLE `blc_search_facet_xref` (
  `ID` bigint(20) NOT NULL,
  `REQUIRED_FACET_ID` bigint(20) NOT NULL,
  `SEARCH_FACET_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK35A63034B96B1C93` (`SEARCH_FACET_ID`),
  KEY `FK35A63034DA7E1C7C` (`REQUIRED_FACET_ID`),
  CONSTRAINT `FK35A63034B96B1C93` FOREIGN KEY (`SEARCH_FACET_ID`) REFERENCES `blc_search_facet` (`SEARCH_FACET_ID`),
  CONSTRAINT `FK35A63034DA7E1C7C` FOREIGN KEY (`REQUIRED_FACET_ID`) REFERENCES `blc_search_facet` (`SEARCH_FACET_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_search_facet_xref`
--

/*!40000 ALTER TABLE `blc_search_facet_xref` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_search_facet_xref` ENABLE KEYS */;


--
-- Definition of table `blc_search_intercept`
--

DROP TABLE IF EXISTS `blc_search_intercept`;
CREATE TABLE `blc_search_intercept` (
  `SEARCH_REDIRECT_ID` bigint(20) NOT NULL,
  `ACTIVE_END_DATE` datetime DEFAULT NULL,
  `ACTIVE_START_DATE` datetime DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `SEARCH_TERM` varchar(255) NOT NULL,
  `URL` varchar(255) NOT NULL,
  PRIMARY KEY (`SEARCH_REDIRECT_ID`),
  KEY `SEARCH_ACTIVE_INDEX` (`ACTIVE_END_DATE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_search_intercept`
--

/*!40000 ALTER TABLE `blc_search_intercept` DISABLE KEYS */;
INSERT INTO `blc_search_intercept` (`SEARCH_REDIRECT_ID`,`ACTIVE_END_DATE`,`ACTIVE_START_DATE`,`PRIORITY`,`SEARCH_TERM`,`URL`) VALUES 
 (1,NULL,NULL,1,'insanity','/hot-sauces/insanity_sauce'),
 (2,'1999-10-15 21:28:36','1992-10-15 14:28:36',-10,'new york','/search?q=pace picante');
/*!40000 ALTER TABLE `blc_search_intercept` ENABLE KEYS */;


--
-- Definition of table `blc_search_synonym`
--

DROP TABLE IF EXISTS `blc_search_synonym`;
CREATE TABLE `blc_search_synonym` (
  `SEARCH_SYNONYM_ID` bigint(20) NOT NULL,
  `SYNONYMS` varchar(255) DEFAULT NULL,
  `TERM` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`SEARCH_SYNONYM_ID`),
  KEY `SEARCHSYNONYM_TERM_INDEX` (`TERM`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_search_synonym`
--

/*!40000 ALTER TABLE `blc_search_synonym` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_search_synonym` ENABLE KEYS */;


--
-- Definition of table `blc_shipping_rate`
--

DROP TABLE IF EXISTS `blc_shipping_rate`;
CREATE TABLE `blc_shipping_rate` (
  `ID` bigint(20) NOT NULL,
  `BAND_RESULT_PCT` int(11) NOT NULL,
  `BAND_RESULT_QTY` decimal(19,2) NOT NULL,
  `BAND_UNIT_QTY` decimal(19,2) NOT NULL,
  `FEE_BAND` int(11) NOT NULL,
  `FEE_SUB_TYPE` varchar(255) DEFAULT NULL,
  `FEE_TYPE` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `SHIPPINGRATE_FEE_INDEX` (`FEE_TYPE`),
  KEY `SHIPPINGRATE_FEESUB_INDEX` (`FEE_SUB_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_shipping_rate`
--

/*!40000 ALTER TABLE `blc_shipping_rate` DISABLE KEYS */;
INSERT INTO `blc_shipping_rate` (`ID`,`BAND_RESULT_PCT`,`BAND_RESULT_QTY`,`BAND_UNIT_QTY`,`FEE_BAND`,`FEE_SUB_TYPE`,`FEE_TYPE`) VALUES 
 (1,0,'8.50','29.99',1,'ALL','SHIPPING'),
 (2,0,'10.50','39.99',2,'ALL','EXPEDITED'),
 (3,0,'30.00','999999.00',1,'ALL','SHIPPING'),
 (4,0,'50.00','999999.00',2,'ALL','EXPEDITED');
/*!40000 ALTER TABLE `blc_shipping_rate` ENABLE KEYS */;


--
-- Definition of table `blc_site`
--

DROP TABLE IF EXISTS `blc_site`;
CREATE TABLE `blc_site` (
  `SITE_ID` bigint(20) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `SITE_IDENTIFIER_TYPE` varchar(255) DEFAULT NULL,
  `SITE_IDENTIFIER_VALUE` varchar(255) DEFAULT NULL,
  `PRODUCTION_SANDBOX_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`SITE_ID`),
  KEY `FKF41D6A8D64EBCCE3` (`PRODUCTION_SANDBOX_ID`),
  CONSTRAINT `FKF41D6A8D64EBCCE3` FOREIGN KEY (`PRODUCTION_SANDBOX_ID`) REFERENCES `blc_sandbox` (`SANDBOX_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_site`
--

/*!40000 ALTER TABLE `blc_site` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_site` ENABLE KEYS */;


--
-- Definition of table `blc_site_sandbox`
--

DROP TABLE IF EXISTS `blc_site_sandbox`;
CREATE TABLE `blc_site_sandbox` (
  `SITE_ID` bigint(20) DEFAULT NULL,
  `SANDBOX_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`SANDBOX_ID`),
  KEY `FKAD4F7EF5579FE59D` (`SANDBOX_ID`),
  KEY `FKAD4F7EF5843A8B63` (`SITE_ID`),
  CONSTRAINT `FKAD4F7EF5579FE59D` FOREIGN KEY (`SANDBOX_ID`) REFERENCES `blc_sandbox` (`SANDBOX_ID`),
  CONSTRAINT `FKAD4F7EF5843A8B63` FOREIGN KEY (`SITE_ID`) REFERENCES `blc_site` (`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_site_sandbox`
--

/*!40000 ALTER TABLE `blc_site_sandbox` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_site_sandbox` ENABLE KEYS */;


--
-- Definition of table `blc_sku`
--

DROP TABLE IF EXISTS `blc_sku`;
CREATE TABLE `blc_sku` (
  `SKU_ID` bigint(20) NOT NULL,
  `ACTIVE_END_DATE` datetime DEFAULT NULL,
  `ACTIVE_START_DATE` datetime DEFAULT NULL,
  `AVAILABLE_FLAG` char(1) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `CONTAINER_SHAPE` varchar(255) DEFAULT NULL,
  `DEPTH` decimal(19,2) DEFAULT NULL,
  `DIMENSION_UNIT_OF_MEASURE` varchar(255) DEFAULT NULL,
  `GIRTH` decimal(19,2) DEFAULT NULL,
  `HEIGHT` decimal(19,2) DEFAULT NULL,
  `CONTAINER_SIZE` varchar(255) DEFAULT NULL,
  `WIDTH` decimal(19,2) DEFAULT NULL,
  `DISCOUNTABLE_FLAG` char(1) DEFAULT NULL,
  `IS_MACHINE_SORTABLE` bit(1) DEFAULT NULL,
  `LONG_DESCRIPTION` longtext,
  `NAME` varchar(255) DEFAULT NULL,
  `RETAIL_PRICE` decimal(19,5) DEFAULT NULL,
  `SALE_PRICE` decimal(19,5) DEFAULT NULL,
  `TAXABLE_FLAG` char(1) DEFAULT NULL,
  `WEIGHT` decimal(19,2) DEFAULT NULL,
  `WEIGHT_UNIT_OF_MEASURE` varchar(255) DEFAULT NULL,
  `DEFAULT_PRODUCT_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`SKU_ID`),
  KEY `SKU_ACTIVE_INDEX` (`ACTIVE_END_DATE`),
  KEY `SKU_NAME_INDEX` (`NAME`),
  KEY `SKU_AVAILABLE_INDEX` (`AVAILABLE_FLAG`),
  KEY `SKU_TAXABLE_INDEX` (`TAXABLE_FLAG`),
  KEY `SKU_DISCOUNTABLE_INDEX` (`DISCOUNTABLE_FLAG`),
  KEY `FK28E82CF77E555D75` (`DEFAULT_PRODUCT_ID`),
  CONSTRAINT `FK28E82CF77E555D75` FOREIGN KEY (`DEFAULT_PRODUCT_ID`) REFERENCES `blc_product` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_sku`
--

/*!40000 ALTER TABLE `blc_sku` DISABLE KEYS */;
INSERT INTO `blc_sku` (`SKU_ID`,`ACTIVE_END_DATE`,`ACTIVE_START_DATE`,`AVAILABLE_FLAG`,`DESCRIPTION`,`CONTAINER_SHAPE`,`DEPTH`,`DIMENSION_UNIT_OF_MEASURE`,`GIRTH`,`HEIGHT`,`CONTAINER_SIZE`,`WIDTH`,`DISCOUNTABLE_FLAG`,`IS_MACHINE_SORTABLE`,`LONG_DESCRIPTION`,`NAME`,`RETAIL_PRICE`,`SALE_PRICE`,`TAXABLE_FLAG`,`WEIGHT`,`WEIGHT_UNIT_OF_MEASURE`,`DEFAULT_PRODUCT_ID`) VALUES 
 (1,NULL,'2013-01-21 22:04:58',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'As my Chilipals know, I am never one to be satisfied. Hence, the creation of Sudden Death. When you need to go beyond... Sudden Death will deliver! ','Sudden Death Sauce','10.99000',NULL,'Y',NULL,NULL,1),
 (2,NULL,'2013-01-21 22:04:58',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'The perfect topper for chicken, fish, burgers or pizza. A great blend of Habanero, Mango, Passion Fruit and more make this Death Sauce an amazing tropical treat.','Sweet Death Sauce','10.99000',NULL,'Y',NULL,NULL,2),
 (3,NULL,'2013-01-21 22:04:58',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'Tangy, ripe cayenne peppes flow together with garlic, onion, tomato paste and a hint of cane sugar to make this a smooth sauce with a bite.  Wonderful on eggs, poultry, pork, or fish, this sauce blends to make rich marinades and soups.','Hoppin\' Hot Sauce','4.99000',NULL,'Y',NULL,NULL,3),
 (4,NULL,'2013-01-21 22:04:58',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'When any pepper is dried and smoked, it is referred to as a Chipotle. Usually with a wrinkled, drak brown appearance, the Chipotle delivers a smokey, sweet flavor which is generally used for adding a smokey, roasted flavor to salsas, stews and marinades.','Day of the Dead Chipotle Hot Sauce','6.99000',NULL,'Y',NULL,NULL,4),
 (5,NULL,'2013-01-21 22:04:58',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'If you want hot, this is the chile to choose. Native to the Carribean, Yucatan and Northern Coast of South America, the Habanero presents itself in a variety of colors ranging from light green to a bright red. The Habanero\'s bold heat, unique flavor and aroma has made it the favorite of chile lovers.','Day of the Dead Habanero Hot Sauce','6.99000',NULL,'Y',NULL,NULL,5),
 (6,NULL,'2013-01-21 22:04:58',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'Often mistaken for the Habanero, the Scotch Bonnet has a deeply inverted tip as opposed to the pointed end of the Habanero. Ranging in many colors from green to yellow-orange, the Scotch Bonnet is a staple in West Indies and Barbados style pepper sauces.','Day of the Dead Scotch Bonnet Hot Sauce','6.99000',NULL,'Y',NULL,NULL,6),
 (7,NULL,'2013-01-21 22:04:58',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'Made with Naga Bhut Jolokia, the World\'s Hottest pepper.','Green Ghost','11.99000',NULL,'Y',NULL,NULL,7),
 (8,NULL,'2013-01-21 22:04:58',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'You bet your boots, this hot sauce earned its name from folks that appreciate an outstanding hot sauce. What you\'ll find here is a truly original zesty flavor, not an overpowering pungency that is found in those ordinary Tabasco pepper sauces - even though the pepper used in this product was tested at 285,000 Scoville units. So, saddle up for a ride to remember. To make sure we brought you only the finest Habanero pepper sauce, we went to the foothills of the Mayan mountains in Belize, Central America. This product is prepared entirely by hand using only fresh vegetables and all natural ingredients.','Blazin\' Saddle XXX Hot Habanero Pepper Sauce','4.99000',NULL,'Y',NULL,NULL,8),
 (9,NULL,'2013-01-21 22:04:58',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'All Hell is breaking loose, fire &amp; brimstone rain down? prepare to meet your maker.','Armageddon The Hot Sauce To End All','12.99000',NULL,'Y',NULL,NULL,9),
 (10,NULL,'2013-01-21 22:04:58',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'Here is the Prescription for those who enjoy intolerable heat. Dr. Chilemeister\'s sick and evil deadly brew should be used with caution. Pain can become addictive!','Dr. Chilemeister\'s Insane Hot Sauce','12.99000',NULL,'Y',NULL,NULL,10),
 (11,NULL,'2013-01-21 22:04:58',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'Been there, roped that. Hotter than a buckin\' mare in heat! Sprinkle on meat entrees, seafood and vegetables. Use as additive in barbecue sauce or any food that needs a spicy flavor. Start with a few drops and work up to the desired flavor.','Bull Snort Cowboy Cayenne Pepper Hot Sauce','3.99000',NULL,'Y',NULL,NULL,11),
 (12,NULL,'2013-01-21 22:04:58',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'One of the more unusual sauces we sell. The original was an old style Cajun sauce and this is it\'s updated blackening version. It\'s sweet but you get a great hit of cinnamon and cloves with a nice kick of cayenne heat. Use on all foods to give that Cajun flair!','Cafe Louisiane Sweet Cajun Blackening Sauce','4.99000',NULL,'Y',NULL,NULL,12),
 (13,NULL,'2013-01-21 22:04:58',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'Everything is bigger in Texas, even the burn of a Bull Snortin\' Hot Sauce! shower on that Texas sized steak they call the Ole 96er or your plane Jane vegetables. If you are a fan on making BBQ sauce from scratch like I am, you can use Bull Snort Smokin\' Tonsils Hot Sauce as an additive. Red hot habaneros and cayenne peppers give this tonsil tingler it\'s famous flavor and red hot heat. Bull Snort Smokin\' Tonsils Hot Sauce\'ll have your bowels buckin\' with just a drop!','Bull Snort Smokin\' Toncils Hot Sauce','3.99000',NULL,'Y',NULL,NULL,13),
 (14,NULL,'2013-01-21 22:04:58',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'This sauce gets its great flavor from aged peppers and cane vinegar. It will enhance the flavor of most any meal.','Cool Cayenne Pepper Hot Sauce','5.99000',NULL,'Y',NULL,NULL,14),
 (15,NULL,'2013-01-21 22:04:58',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'This sauce gets its great flavor from aged peppers and cane vinegar. It will enhance the flavor of most any meal.','Roasted Garlic Hot Sauce','5.99000',NULL,'Y',NULL,NULL,15),
 (16,NULL,'2013-01-21 22:04:58',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'This sauce gets its great flavor from aged peppers and cane vinegar. It will enhance the flavor of most any meal.','Scotch Bonnet Hot Sauce','5.99000',NULL,'Y',NULL,NULL,16),
 (17,NULL,'2013-01-21 22:04:58',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'This sauce gets its great flavor from aged peppers and cane vinegar. It will enhance the flavor of most any meal.','Insanity Sauce','5.99000','4.99000','Y',NULL,NULL,17),
 (18,NULL,'2013-01-21 22:04:58',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'This sauce gets its great flavor from aged peppers and cane vinegar. It will enhance the flavor of most any meal.','Hurtin\' Jalepeno Hot Sauce','5.99000','4.49000','Y',NULL,NULL,18),
 (19,NULL,'2013-01-21 22:04:58',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'This sauce gets its great flavor from aged peppers and cane vinegar. It will enhance the flavor of most any meal.','Roasted Red Pepper & Chipotle Hot Sauce','5.99000','4.09000','Y',NULL,NULL,19),
 (100,NULL,'2013-01-21 22:04:59',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'Men\'s Habanero collection standard short sleeve screen-printed tee shirt in soft 30 singles cotton in regular fit.','Hawt Like a Habanero Shirt (Men\'s)','14.99000',NULL,'Y',NULL,NULL,100),
 (111,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (112,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (113,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (114,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,'16.99000',NULL,NULL,NULL,NULL,NULL),
 (121,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (122,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (123,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (124,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,'16.99000',NULL,NULL,NULL,NULL,NULL),
 (131,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (132,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (133,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (134,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,'16.99000',NULL,NULL,NULL,NULL,NULL),
 (200,NULL,'2013-01-21 22:04:59',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'Women\'s Habanero collection standard short sleeve screen-printed tee shirt in soft 30 singles cotton in regular fit.','Hawt Like a Habanero Shirt (Women\'s)','14.99000',NULL,'Y',NULL,NULL,200),
 (211,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (212,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (213,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (214,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,'16.99000',NULL,NULL,NULL,NULL,NULL),
 (221,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (222,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (223,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (224,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,'16.99000',NULL,NULL,NULL,NULL,NULL),
 (231,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (232,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (233,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (234,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,'16.99000',NULL,NULL,NULL,NULL,NULL),
 (300,NULL,'2013-01-21 22:04:59',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'This hand-drawn logo shirt for men features a regular fit in three different colors','Heat Clinic Hand-Drawn (Men\'s)','15.99000',NULL,'Y',NULL,NULL,300),
 (311,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (312,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (313,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (314,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,'16.99000',NULL,NULL,NULL,NULL,NULL),
 (321,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (322,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (323,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (324,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,'16.99000',NULL,NULL,NULL,NULL,NULL),
 (331,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (332,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (333,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (334,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,'16.99000',NULL,NULL,NULL,NULL,NULL),
 (400,NULL,'2013-01-21 22:04:59',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'This hand-drawn logo shirt for women features a regular fit in three different colors','Heat Clinic Hand-Drawn (Women\'s)','15.99000',NULL,'Y',NULL,NULL,400),
 (411,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (412,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (413,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (414,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,'16.99000',NULL,NULL,NULL,NULL,NULL),
 (421,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (422,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (423,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (424,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,'16.99000',NULL,NULL,NULL,NULL,NULL),
 (431,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (432,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (433,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (434,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,'16.99000',NULL,NULL,NULL,NULL,NULL),
 (500,NULL,'2013-01-21 22:04:59',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'Don\'t you just love our mascot? Get your very own shirt today!','Heat Clinic Mascot (Men\'s)','15.99000',NULL,'Y',NULL,NULL,500),
 (511,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (512,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (513,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (514,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,'16.99000',NULL,NULL,NULL,NULL,NULL),
 (521,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (522,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (523,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (524,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,'16.99000',NULL,NULL,NULL,NULL,NULL),
 (531,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (532,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (533,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (534,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,'16.99000',NULL,NULL,NULL,NULL,NULL),
 (600,NULL,'2013-01-21 22:04:59',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'Don\'t you just love our mascot? Get your very own shirt today!','Heat Clinic Mascot (Women\'s)','15.99000',NULL,'Y',NULL,NULL,600),
 (611,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (612,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (613,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (614,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,'16.99000',NULL,NULL,NULL,NULL,NULL),
 (621,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (622,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (623,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (624,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,'16.99000',NULL,NULL,NULL,NULL,NULL),
 (631,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (632,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (633,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (634,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,'16.99000',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `blc_sku` ENABLE KEYS */;


--
-- Definition of table `blc_sku_attribute`
--

DROP TABLE IF EXISTS `blc_sku_attribute`;
CREATE TABLE `blc_sku_attribute` (
  `SKU_ATTR_ID` bigint(20) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `SEARCHABLE` bit(1) DEFAULT NULL,
  `VALUE` varchar(255) NOT NULL,
  `SKU_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`SKU_ATTR_ID`),
  KEY `SKUATTR_NAME_INDEX` (`NAME`),
  KEY `SKUATTR_SKU_INDEX` (`SKU_ID`),
  KEY `FK6C6A5934B78C9977` (`SKU_ID`),
  CONSTRAINT `FK6C6A5934B78C9977` FOREIGN KEY (`SKU_ID`) REFERENCES `blc_sku` (`SKU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_sku_attribute`
--

/*!40000 ALTER TABLE `blc_sku_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_sku_attribute` ENABLE KEYS */;


--
-- Definition of table `blc_sku_availability`
--

DROP TABLE IF EXISTS `blc_sku_availability`;
CREATE TABLE `blc_sku_availability` (
  `SKU_AVAILABILITY_ID` bigint(20) NOT NULL,
  `AVAILABILITY_DATE` datetime DEFAULT NULL,
  `AVAILABILITY_STATUS` varchar(255) DEFAULT NULL,
  `LOCATION_ID` bigint(20) DEFAULT NULL,
  `QTY_ON_HAND` int(11) DEFAULT NULL,
  `RESERVE_QTY` int(11) DEFAULT NULL,
  `SKU_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`SKU_AVAILABILITY_ID`),
  KEY `SKUAVAIL_STATUS_INDEX` (`AVAILABILITY_STATUS`),
  KEY `SKUAVAIL_LOCATION_INDEX` (`LOCATION_ID`),
  KEY `SKUAVAIL_SKU_INDEX` (`SKU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_sku_availability`
--

/*!40000 ALTER TABLE `blc_sku_availability` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_sku_availability` ENABLE KEYS */;


--
-- Definition of table `blc_sku_bundle_item`
--

DROP TABLE IF EXISTS `blc_sku_bundle_item`;
CREATE TABLE `blc_sku_bundle_item` (
  `SKU_BUNDLE_ITEM_ID` bigint(20) NOT NULL,
  `ITEM_SALE_PRICE` decimal(19,5) DEFAULT NULL,
  `QUANTITY` int(11) NOT NULL,
  `PRODUCT_BUNDLE_ID` bigint(20) NOT NULL,
  `SKU_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`SKU_BUNDLE_ITEM_ID`),
  KEY `FKD55968B78C9977` (`SKU_ID`),
  KEY `FKD55968CCF29B96` (`PRODUCT_BUNDLE_ID`),
  CONSTRAINT `FKD55968B78C9977` FOREIGN KEY (`SKU_ID`) REFERENCES `blc_sku` (`SKU_ID`),
  CONSTRAINT `FKD55968CCF29B96` FOREIGN KEY (`PRODUCT_BUNDLE_ID`) REFERENCES `blc_product_bundle` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_sku_bundle_item`
--

/*!40000 ALTER TABLE `blc_sku_bundle_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_sku_bundle_item` ENABLE KEYS */;


--
-- Definition of table `blc_sku_fee`
--

DROP TABLE IF EXISTS `blc_sku_fee`;
CREATE TABLE `blc_sku_fee` (
  `SKU_FEE_ID` bigint(20) NOT NULL,
  `AMOUNT` decimal(19,5) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `EXPRESSION` longtext,
  `FEE_TYPE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `TAXABLE` bit(1) DEFAULT NULL,
  PRIMARY KEY (`SKU_FEE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_sku_fee`
--

/*!40000 ALTER TABLE `blc_sku_fee` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_sku_fee` ENABLE KEYS */;


--
-- Definition of table `blc_sku_fee_xref`
--

DROP TABLE IF EXISTS `blc_sku_fee_xref`;
CREATE TABLE `blc_sku_fee_xref` (
  `SKU_FEE_ID` bigint(20) NOT NULL,
  `SKU_ID` bigint(20) NOT NULL,
  KEY `FKD88D409CB78C9977` (`SKU_ID`),
  KEY `FKD88D409CCF4C9A82` (`SKU_FEE_ID`),
  CONSTRAINT `FKD88D409CB78C9977` FOREIGN KEY (`SKU_ID`) REFERENCES `blc_sku` (`SKU_ID`),
  CONSTRAINT `FKD88D409CCF4C9A82` FOREIGN KEY (`SKU_FEE_ID`) REFERENCES `blc_sku_fee` (`SKU_FEE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_sku_fee_xref`
--

/*!40000 ALTER TABLE `blc_sku_fee_xref` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_sku_fee_xref` ENABLE KEYS */;


--
-- Definition of table `blc_sku_fulfillment_excluded`
--

DROP TABLE IF EXISTS `blc_sku_fulfillment_excluded`;
CREATE TABLE `blc_sku_fulfillment_excluded` (
  `SKU_ID` bigint(20) NOT NULL,
  `FULFILLMENT_OPTION_ID` bigint(20) NOT NULL,
  KEY `FK84162D73B78C9977` (`SKU_ID`),
  KEY `FK84162D7381F34C7F` (`FULFILLMENT_OPTION_ID`),
  CONSTRAINT `FK84162D7381F34C7F` FOREIGN KEY (`FULFILLMENT_OPTION_ID`) REFERENCES `blc_fulfillment_option` (`FULFILLMENT_OPTION_ID`),
  CONSTRAINT `FK84162D73B78C9977` FOREIGN KEY (`SKU_ID`) REFERENCES `blc_sku` (`SKU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_sku_fulfillment_excluded`
--

/*!40000 ALTER TABLE `blc_sku_fulfillment_excluded` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_sku_fulfillment_excluded` ENABLE KEYS */;


--
-- Definition of table `blc_sku_fulfillment_flat_rates`
--

DROP TABLE IF EXISTS `blc_sku_fulfillment_flat_rates`;
CREATE TABLE `blc_sku_fulfillment_flat_rates` (
  `SKU_ID` bigint(20) NOT NULL,
  `RATE` decimal(19,5) DEFAULT NULL,
  `FULFILLMENT_OPTION_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`SKU_ID`,`FULFILLMENT_OPTION_ID`),
  KEY `FKC1988C96B78C9977` (`SKU_ID`),
  KEY `FKC1988C9681F34C7F` (`FULFILLMENT_OPTION_ID`),
  CONSTRAINT `FKC1988C9681F34C7F` FOREIGN KEY (`FULFILLMENT_OPTION_ID`) REFERENCES `blc_fulfillment_option` (`FULFILLMENT_OPTION_ID`),
  CONSTRAINT `FKC1988C96B78C9977` FOREIGN KEY (`SKU_ID`) REFERENCES `blc_sku` (`SKU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_sku_fulfillment_flat_rates`
--

/*!40000 ALTER TABLE `blc_sku_fulfillment_flat_rates` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_sku_fulfillment_flat_rates` ENABLE KEYS */;


--
-- Definition of table `blc_sku_media_map`
--

DROP TABLE IF EXISTS `blc_sku_media_map`;
CREATE TABLE `blc_sku_media_map` (
  `BLC_SKU_SKU_ID` bigint(20) NOT NULL,
  `MEDIA_ID` bigint(20) NOT NULL,
  `MAP_KEY` varchar(255) NOT NULL,
  PRIMARY KEY (`BLC_SKU_SKU_ID`,`MAP_KEY`),
  KEY `FKEB4AECF9D93D857F` (`BLC_SKU_SKU_ID`),
  KEY `FKEB4AECF919D1156C` (`MEDIA_ID`),
  CONSTRAINT `FKEB4AECF919D1156C` FOREIGN KEY (`MEDIA_ID`) REFERENCES `blc_media` (`MEDIA_ID`),
  CONSTRAINT `FKEB4AECF9D93D857F` FOREIGN KEY (`BLC_SKU_SKU_ID`) REFERENCES `blc_sku` (`SKU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_sku_media_map`
--

/*!40000 ALTER TABLE `blc_sku_media_map` DISABLE KEYS */;
INSERT INTO `blc_sku_media_map` (`BLC_SKU_SKU_ID`,`MEDIA_ID`,`MAP_KEY`) VALUES 
 (1,101,'primary'),
 (1,102,'alt1'),
 (2,201,'primary'),
 (2,202,'alt1'),
 (2,203,'alt2'),
 (2,204,'alt3'),
 (2,205,'alt4'),
 (2,206,'alt5'),
 (3,301,'primary'),
 (3,302,'alt1'),
 (4,401,'primary'),
 (4,402,'alt1'),
 (5,501,'primary'),
 (5,502,'alt1'),
 (6,601,'primary'),
 (6,602,'alt1'),
 (7,701,'primary'),
 (7,702,'alt1'),
 (8,801,'primary'),
 (8,802,'alt1'),
 (9,901,'primary'),
 (9,902,'alt1'),
 (10,1001,'primary'),
 (10,1002,'alt1'),
 (11,1101,'primary'),
 (11,1102,'alt1'),
 (12,1201,'primary'),
 (12,1202,'alt1'),
 (13,1301,'primary'),
 (13,1302,'alt1'),
 (14,1401,'primary'),
 (14,1402,'alt1'),
 (15,1501,'primary'),
 (15,1502,'alt1'),
 (16,1601,'primary'),
 (16,1602,'alt1'),
 (17,1701,'primary'),
 (17,1702,'alt1'),
 (18,1801,'primary'),
 (18,1802,'alt1'),
 (19,1901,'primary'),
 (19,1902,'alt1'),
 (100,10001,'primary'),
 (100,10002,'alt1'),
 (100,10003,'alt2'),
 (200,20001,'alt1'),
 (200,20002,'primary'),
 (200,20003,'alt2'),
 (300,30001,'alt1'),
 (300,30002,'alt2'),
 (300,30003,'primary'),
 (400,40001,'alt1'),
 (400,40002,'primary'),
 (400,40003,'alt2'),
 (500,50001,'alt1'),
 (500,50002,'alt2'),
 (500,50003,'primary'),
 (600,60001,'primary'),
 (600,60002,'alt1'),
 (600,60003,'alt2');
/*!40000 ALTER TABLE `blc_sku_media_map` ENABLE KEYS */;


--
-- Definition of table `blc_sku_option_value_xref`
--

DROP TABLE IF EXISTS `blc_sku_option_value_xref`;
CREATE TABLE `blc_sku_option_value_xref` (
  `SKU_ID` bigint(20) NOT NULL,
  `PRODUCT_OPTION_VALUE_ID` bigint(20) NOT NULL,
  KEY `FK7B61DC0BB78C9977` (`SKU_ID`),
  KEY `FK7B61DC0BB0C16A73` (`PRODUCT_OPTION_VALUE_ID`),
  CONSTRAINT `FK7B61DC0BB0C16A73` FOREIGN KEY (`PRODUCT_OPTION_VALUE_ID`) REFERENCES `blc_product_option_value` (`PRODUCT_OPTION_VALUE_ID`),
  CONSTRAINT `FK7B61DC0BB78C9977` FOREIGN KEY (`SKU_ID`) REFERENCES `blc_sku` (`SKU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_sku_option_value_xref`
--

/*!40000 ALTER TABLE `blc_sku_option_value_xref` DISABLE KEYS */;
INSERT INTO `blc_sku_option_value_xref` (`SKU_ID`,`PRODUCT_OPTION_VALUE_ID`) VALUES 
 (111,1),
 (111,11),
 (112,1),
 (112,12),
 (113,1),
 (113,13),
 (114,1),
 (114,14),
 (121,2),
 (121,11),
 (122,2),
 (122,12),
 (123,2),
 (123,13),
 (124,2),
 (124,14),
 (131,3),
 (131,11),
 (132,3),
 (132,12),
 (133,3),
 (133,13),
 (134,3),
 (134,14),
 (211,1),
 (211,11),
 (212,1),
 (212,12),
 (213,1),
 (213,13),
 (214,1),
 (214,14),
 (221,2),
 (221,11),
 (222,2),
 (222,12),
 (223,2),
 (223,13),
 (224,2),
 (224,14),
 (231,3),
 (231,11),
 (232,3),
 (232,12),
 (233,3),
 (233,13),
 (234,3),
 (234,14),
 (311,1),
 (311,11),
 (312,1),
 (312,12),
 (313,1),
 (313,13),
 (314,1),
 (314,14),
 (321,2),
 (321,11),
 (322,2),
 (322,12),
 (323,2),
 (323,13),
 (324,2),
 (324,14),
 (331,3),
 (331,11),
 (332,3),
 (332,12),
 (333,3),
 (333,13),
 (334,3),
 (334,14),
 (411,1),
 (411,11),
 (412,1),
 (412,12),
 (413,1),
 (413,13),
 (414,1),
 (414,14),
 (421,2),
 (421,11),
 (422,2),
 (422,12),
 (423,2),
 (423,13),
 (424,2),
 (424,14),
 (431,3),
 (431,11),
 (432,3),
 (432,12),
 (433,3),
 (433,13),
 (434,3),
 (434,14),
 (511,1),
 (511,11),
 (512,1),
 (512,12),
 (513,1),
 (513,13),
 (514,1),
 (514,14),
 (521,2),
 (521,11),
 (522,2),
 (522,12),
 (523,2),
 (523,13),
 (524,2),
 (524,14),
 (531,3),
 (531,11),
 (532,3),
 (532,12),
 (533,3),
 (533,13),
 (534,3),
 (534,14),
 (611,1),
 (611,11),
 (612,1),
 (612,12),
 (613,1),
 (613,13),
 (614,1),
 (614,14),
 (621,2),
 (621,11),
 (622,2),
 (622,12),
 (623,2),
 (623,13),
 (624,2),
 (624,14),
 (631,3),
 (631,11),
 (632,3),
 (632,12),
 (633,3),
 (633,13),
 (634,3),
 (634,14);
/*!40000 ALTER TABLE `blc_sku_option_value_xref` ENABLE KEYS */;


--
-- Definition of table `blc_state`
--

DROP TABLE IF EXISTS `blc_state`;
CREATE TABLE `blc_state` (
  `ABBREVIATION` varchar(255) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `COUNTRY` varchar(255) NOT NULL,
  PRIMARY KEY (`ABBREVIATION`),
  KEY `STATE_NAME_INDEX` (`NAME`),
  KEY `FK8F94A1EBA46E16CF` (`COUNTRY`),
  CONSTRAINT `FK8F94A1EBA46E16CF` FOREIGN KEY (`COUNTRY`) REFERENCES `blc_country` (`ABBREVIATION`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_state`
--

/*!40000 ALTER TABLE `blc_state` DISABLE KEYS */;
INSERT INTO `blc_state` (`ABBREVIATION`,`NAME`,`COUNTRY`) VALUES 
 ('AK','ALASKA','US'),
 ('AL','ALABAMA','US'),
 ('AR','ARKANSAS','US'),
 ('AS','AMERICAN SAMOA','US'),
 ('AZ','ARIZONA','US'),
 ('CA','CALIFORNIA','US'),
 ('CO','COLORADO','US'),
 ('CT','CONNECTICUT','US'),
 ('DC','DISTRICT OF COLUMBIA','US'),
 ('DE','DELAWARE','US'),
 ('FL','FLORIDA','US'),
 ('FM','FEDERATED STATES OF MICRONESIA','US'),
 ('GA','GEORGIA','US'),
 ('GU','GUAM','US'),
 ('HI','HAWAII','US'),
 ('IA','IOWA','US'),
 ('ID','IDAHO','US'),
 ('IL','ILLINOIS','US'),
 ('IN','INDIANA','US'),
 ('KS','KANSAS','US'),
 ('KY','KENTUCKY','US'),
 ('LA','LOUISIANA','US'),
 ('MA','MASSACHUSETTS','US'),
 ('MD','MARYLAND','US'),
 ('ME','MAINE','US'),
 ('MH','MARSHALL ISLANDS','US'),
 ('MI','MICHIGAN','US'),
 ('MN','MINNESOTA','US'),
 ('MO','MISSOURI','US'),
 ('MP','NORTHERN MARIANA ISLANDS','US'),
 ('MS','MISSISSIPPI','US'),
 ('MT','MONTANA','US'),
 ('NC','NORTH CAROLINA','US'),
 ('ND','NORTH DAKOTA','US'),
 ('NE','NEBRASKA','US'),
 ('NH','NEW HAMPSHIRE','US'),
 ('NJ','NEW JERSEY','US'),
 ('NM','NEW MEXICO','US'),
 ('NV','NEVADA','US'),
 ('NY','NEW YORK','US'),
 ('OH','OHIO','US'),
 ('OK','OKLAHOMA','US'),
 ('OR','OREGON','US'),
 ('PA','PENNSYLVANIA','US'),
 ('PR','PUERTO RICO','US'),
 ('PW','PALAU','US'),
 ('RI','RHODE ISLAND','US'),
 ('SC','SOUTH CAROLINA','US'),
 ('SD','SOUTH DAKOTA','US'),
 ('TN','TENNESSEE','US'),
 ('TX','TEXAS','US'),
 ('UT','UTAH','US'),
 ('VA','VIRGINIA','US'),
 ('VI','VIRGIN ISLANDS','US'),
 ('VT','VERMONT','US'),
 ('WA','WASHINGTON','US'),
 ('WI','WISCONSIN','US'),
 ('WV','WEST VIRGINIA','US'),
 ('WY','WYOMING','US');
/*!40000 ALTER TABLE `blc_state` ENABLE KEYS */;


--
-- Definition of table `blc_static_asset`
--

DROP TABLE IF EXISTS `blc_static_asset`;
CREATE TABLE `blc_static_asset` (
  `STATIC_ASSET_ID` bigint(20) NOT NULL,
  `ARCHIVED_FLAG` bit(1) DEFAULT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_UPDATED` datetime DEFAULT NULL,
  `DELETED_FLAG` bit(1) DEFAULT NULL,
  `FILE_EXTENSION` varchar(255) DEFAULT NULL,
  `FILE_SIZE` bigint(20) DEFAULT NULL,
  `FULL_URL` varchar(255) NOT NULL,
  `LOCKED_FLAG` bit(1) DEFAULT NULL,
  `MIME_TYPE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  `ORIG_ASSET_ID` bigint(20) DEFAULT NULL,
  `CREATED_BY` bigint(20) DEFAULT NULL,
  `UPDATED_BY` bigint(20) DEFAULT NULL,
  `ORIG_SANDBOX_ID` bigint(20) DEFAULT NULL,
  `SANDBOX_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`STATIC_ASSET_ID`),
  KEY `ORIG_ASSET_ID_INDX` (`ORIG_ASSET_ID`),
  KEY `ASST_DLTD_FLG_INDX` (`DELETED_FLAG`),
  KEY `ASST_LCKD_FLG_INDX` (`LOCKED_FLAG`),
  KEY `ASST_ARCHVD_FLG_INDX` (`ARCHIVED_FLAG`),
  KEY `ASST_FULL_URL_INDX` (`FULL_URL`),
  KEY `FK9875FB0524568C27` (`CREATED_BY`),
  KEY `FK9875FB05579FE59D` (`SANDBOX_ID`),
  KEY `FK9875FB05F9C4A5B` (`ORIG_SANDBOX_ID`),
  KEY `FK9875FB05C1167574` (`UPDATED_BY`),
  CONSTRAINT `FK9875FB0524568C27` FOREIGN KEY (`CREATED_BY`) REFERENCES `blc_admin_user` (`ADMIN_USER_ID`),
  CONSTRAINT `FK9875FB05579FE59D` FOREIGN KEY (`SANDBOX_ID`) REFERENCES `blc_sandbox` (`SANDBOX_ID`),
  CONSTRAINT `FK9875FB05C1167574` FOREIGN KEY (`UPDATED_BY`) REFERENCES `blc_admin_user` (`ADMIN_USER_ID`),
  CONSTRAINT `FK9875FB05F9C4A5B` FOREIGN KEY (`ORIG_SANDBOX_ID`) REFERENCES `blc_sandbox` (`SANDBOX_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_static_asset`
--

/*!40000 ALTER TABLE `blc_static_asset` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_static_asset` ENABLE KEYS */;


--
-- Definition of table `blc_static_asset_desc`
--

DROP TABLE IF EXISTS `blc_static_asset_desc`;
CREATE TABLE `blc_static_asset_desc` (
  `STATIC_ASSET_DESC_ID` bigint(20) NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_UPDATED` datetime DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `LONG_DESCRIPTION` varchar(255) DEFAULT NULL,
  `CREATED_BY` bigint(20) DEFAULT NULL,
  `UPDATED_BY` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`STATIC_ASSET_DESC_ID`),
  KEY `FKC6F1CF8B24568C27` (`CREATED_BY`),
  KEY `FKC6F1CF8BC1167574` (`UPDATED_BY`),
  CONSTRAINT `FKC6F1CF8B24568C27` FOREIGN KEY (`CREATED_BY`) REFERENCES `blc_admin_user` (`ADMIN_USER_ID`),
  CONSTRAINT `FKC6F1CF8BC1167574` FOREIGN KEY (`UPDATED_BY`) REFERENCES `blc_admin_user` (`ADMIN_USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_static_asset_desc`
--

/*!40000 ALTER TABLE `blc_static_asset_desc` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_static_asset_desc` ENABLE KEYS */;


--
-- Definition of table `blc_static_asset_strg`
--

DROP TABLE IF EXISTS `blc_static_asset_strg`;
CREATE TABLE `blc_static_asset_strg` (
  `STATIC_ASSET_STRG_ID` bigint(20) NOT NULL,
  `FILE_DATA` longblob,
  `STATIC_ASSET_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`STATIC_ASSET_STRG_ID`),
  KEY `STATIC_ASSET_ID_INDEX` (`STATIC_ASSET_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_static_asset_strg`
--

/*!40000 ALTER TABLE `blc_static_asset_strg` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_static_asset_strg` ENABLE KEYS */;


--
-- Definition of table `blc_store`
--

DROP TABLE IF EXISTS `blc_store`;
CREATE TABLE `blc_store` (
  `STORE_ID` varchar(255) NOT NULL,
  `ADDRESS_1` varchar(255) DEFAULT NULL,
  `ADDRESS_2` varchar(255) DEFAULT NULL,
  `STORE_CITY` varchar(255) DEFAULT NULL,
  `STORE_COUNTRY` varchar(255) DEFAULT NULL,
  `LATITUDE` double DEFAULT NULL,
  `LONGITUDE` double DEFAULT NULL,
  `STORE_NAME` varchar(255) DEFAULT NULL,
  `STORE_PHONE` varchar(255) DEFAULT NULL,
  `STORE_STATE` varchar(255) DEFAULT NULL,
  `STORE_ZIP` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`STORE_ID`),
  KEY `STORE_STATE_INDEX` (`STORE_STATE`),
  KEY `STORE_COUNTRY_INDEX` (`STORE_COUNTRY`),
  KEY `STORE_ZIP_INDEX` (`STORE_ZIP`),
  KEY `STORE_LONGITUDE_INDEX` (`LONGITUDE`),
  KEY `STORE_LATITUDE_INDEX` (`LATITUDE`),
  KEY `STORE_NAME_INDEX` (`STORE_NAME`),
  KEY `STORE_CITY_INDEX` (`STORE_CITY`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_store`
--

/*!40000 ALTER TABLE `blc_store` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_store` ENABLE KEYS */;


--
-- Definition of table `blc_system_property`
--

DROP TABLE IF EXISTS `blc_system_property`;
CREATE TABLE `blc_system_property` (
  `BLC_SYSTEM_PROPERTY_ID` bigint(20) NOT NULL,
  `PROPERTY_NAME` varchar(255) NOT NULL,
  `PROPERTY_VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`BLC_SYSTEM_PROPERTY_ID`),
  UNIQUE KEY `PROPERTY_NAME` (`PROPERTY_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_system_property`
--

/*!40000 ALTER TABLE `blc_system_property` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_system_property` ENABLE KEYS */;


--
-- Definition of table `blc_tar_crit_offer_xref`
--

DROP TABLE IF EXISTS `blc_tar_crit_offer_xref`;
CREATE TABLE `blc_tar_crit_offer_xref` (
  `OFFER_ID` bigint(20) NOT NULL DEFAULT '0',
  `OFFER_ITEM_CRITERIA_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`OFFER_ID`,`OFFER_ITEM_CRITERIA_ID`),
  UNIQUE KEY `OFFER_ITEM_CRITERIA_ID` (`OFFER_ITEM_CRITERIA_ID`),
  KEY `FK125F5803D5F3FAF4` (`OFFER_ID`),
  KEY `FK125F58033615A91A` (`OFFER_ITEM_CRITERIA_ID`),
  CONSTRAINT `FK125F58033615A91A` FOREIGN KEY (`OFFER_ITEM_CRITERIA_ID`) REFERENCES `blc_offer_item_criteria` (`OFFER_ITEM_CRITERIA_ID`),
  CONSTRAINT `FK125F5803D5F3FAF4` FOREIGN KEY (`OFFER_ID`) REFERENCES `blc_offer` (`OFFER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_tar_crit_offer_xref`
--

/*!40000 ALTER TABLE `blc_tar_crit_offer_xref` DISABLE KEYS */;
INSERT INTO `blc_tar_crit_offer_xref` (`OFFER_ID`,`OFFER_ITEM_CRITERIA_ID`) VALUES 
 (1,1);
/*!40000 ALTER TABLE `blc_tar_crit_offer_xref` ENABLE KEYS */;


--
-- Definition of table `blc_target_content`
--

DROP TABLE IF EXISTS `blc_target_content`;
CREATE TABLE `blc_target_content` (
  `TARGET_CONTENT_ID` bigint(20) NOT NULL,
  `CONTENT` varchar(255) DEFAULT NULL,
  `CONTENT_NAME` varchar(255) NOT NULL,
  `CONTENT_TYPE` varchar(255) NOT NULL,
  `OFFLINE_DATE` datetime DEFAULT NULL,
  `ONLINE_DATE` datetime DEFAULT NULL,
  `PRIORITY` int(11) NOT NULL,
  `URL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`TARGET_CONTENT_ID`),
  KEY `TARGETCONTENT_TYPE_INDEX` (`CONTENT_TYPE`),
  KEY `TARGETCONTENT_NAME_INDEX` (`CONTENT_NAME`),
  KEY `TARGETCONTENT_URL_INDEX` (`URL`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_target_content`
--

/*!40000 ALTER TABLE `blc_target_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_target_content` ENABLE KEYS */;


--
-- Definition of table `blc_tax_detail`
--

DROP TABLE IF EXISTS `blc_tax_detail`;
CREATE TABLE `blc_tax_detail` (
  `TAX_DETAIL_ID` bigint(20) NOT NULL,
  `AMOUNT` decimal(19,5) DEFAULT NULL,
  `RATE` decimal(19,5) DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`TAX_DETAIL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_tax_detail`
--

/*!40000 ALTER TABLE `blc_tax_detail` DISABLE KEYS */;
INSERT INTO `blc_tax_detail` (`TAX_DETAIL_ID`,`AMOUNT`,`RATE`,`TYPE`) VALUES 
 (1,'0.60000','0.05000','COMBINED'),
 (151,'0.55000','0.05000','COMBINED'),
 (301,'0.60000','0.05000','COMBINED');
/*!40000 ALTER TABLE `blc_tax_detail` ENABLE KEYS */;


--
-- Definition of table `blc_url_handler`
--

DROP TABLE IF EXISTS `blc_url_handler`;
CREATE TABLE `blc_url_handler` (
  `URL_HANDLER_ID` bigint(20) NOT NULL,
  `INCOMING_URL` varchar(255) NOT NULL,
  `NEW_URL` varchar(255) NOT NULL,
  `URL_REDIRECT_TYPE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`URL_HANDLER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_url_handler`
--

/*!40000 ALTER TABLE `blc_url_handler` DISABLE KEYS */;
INSERT INTO `blc_url_handler` (`URL_HANDLER_ID`,`INCOMING_URL`,`NEW_URL`,`URL_REDIRECT_TYPE`) VALUES 
 (1,'/googlePerm','http://www.google.com','REDIRECT_PERM'),
 (2,'/googleTemp','http://www.google.com','REDIRECT_TEMP'),
 (3,'/insanity','/hot-sauces/insanity_sauce','FORWARD'),
 (4,'/jalepeno','/hot-sauces/hurtin_jalepeno_hot_sauce','REDIRECT_TEMP');
/*!40000 ALTER TABLE `blc_url_handler` ENABLE KEYS */;


--
-- Definition of table `blc_zip_code`
--

DROP TABLE IF EXISTS `blc_zip_code`;
CREATE TABLE `blc_zip_code` (
  `ZIP_CODE_ID` varchar(255) NOT NULL,
  `ZIP_CITY` varchar(255) DEFAULT NULL,
  `ZIP_LATITUDE` double DEFAULT NULL,
  `ZIP_LONGITUDE` double DEFAULT NULL,
  `ZIP_STATE` varchar(255) DEFAULT NULL,
  `ZIPCODE` int(11) DEFAULT NULL,
  PRIMARY KEY (`ZIP_CODE_ID`),
  KEY `ZIPCODE_STATE_INDEX` (`ZIP_STATE`),
  KEY `ZIPCODE_LONGITUDE_INDEX` (`ZIP_LONGITUDE`),
  KEY `ZIPCODE_CITY_INDEX` (`ZIP_CITY`),
  KEY `ZIPCODE_ZIP_INDEX` (`ZIPCODE`),
  KEY `ZIPCODE_LATITUDE_INDEX` (`ZIP_LATITUDE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blc_zip_code`
--

/*!40000 ALTER TABLE `blc_zip_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_zip_code` ENABLE KEYS */;


--
-- Definition of table `sandbox_item_action`
--

DROP TABLE IF EXISTS `sandbox_item_action`;
CREATE TABLE `sandbox_item_action` (
  `SANDBOX_ACTION_ID` bigint(20) NOT NULL,
  `SANDBOX_ITEM_ID` bigint(20) NOT NULL,
  KEY `FKB270D74A9797A024` (`SANDBOX_ACTION_ID`),
  KEY `FKB270D74AFE239304` (`SANDBOX_ITEM_ID`),
  CONSTRAINT `FKB270D74A9797A024` FOREIGN KEY (`SANDBOX_ACTION_ID`) REFERENCES `blc_sandbox_action` (`SANDBOX_ACTION_ID`),
  CONSTRAINT `FKB270D74AFE239304` FOREIGN KEY (`SANDBOX_ITEM_ID`) REFERENCES `blc_sandbox_item` (`SANDBOX_ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sandbox_item_action`
--

/*!40000 ALTER TABLE `sandbox_item_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `sandbox_item_action` ENABLE KEYS */;


--
-- Definition of table `sequence_generator`
--

DROP TABLE IF EXISTS `sequence_generator`;
CREATE TABLE `sequence_generator` (
  `ID_NAME` varchar(255) NOT NULL,
  `ID_VAL` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sequence_generator`
--

/*!40000 ALTER TABLE `sequence_generator` DISABLE KEYS */;
INSERT INTO `sequence_generator` (`ID_NAME`,`ID_VAL`) VALUES 
 ('AddressId',3),
 ('AdminPermissionImpl',100),
 ('AdminRoleImpl',100),
 ('AdminUserImpl',100),
 ('CandidateItemOfferImpl',151),
 ('CategoryExcludedSearchFacetImpl',100),
 ('CategoryImpl',10000),
 ('CategoryProductImpl',500),
 ('CategorySearchFacetImpl',100),
 ('CodeTypeId',100),
 ('CrossSaleProductImpl',5),
 ('CustomerId',1),
 ('FeaturedProductImpl',100),
 ('FieldDefinitionImpl',1000),
 ('FieldEnumerationImpl',1000),
 ('FieldEnumerationItemImpl',1000),
 ('FieldGroupImpl',1000),
 ('FieldImpl',100),
 ('FulfillmentGroupId',3),
 ('FulfillmentGroupImpl',201),
 ('FulfillmentGroupItemId',1),
 ('FulfillmentGroupItemImpl',601),
 ('MediaId',100000),
 ('OfferCodeImpl',10),
 ('OfferImpl',500),
 ('OfferItemCriteriaImpl',10),
 ('OrderId',2),
 ('OrderImpl',201),
 ('OrderItemAdjustmentImpl',151),
 ('OrderItemAttributeImpl',151),
 ('OrderItemId',9),
 ('OrderItemImpl',601),
 ('PageFieldImpl',1000),
 ('PageImpl',1000),
 ('PersonalMessageId',1),
 ('PhoneId',1),
 ('ProductAttributeImpl',1000),
 ('ProductImpl',1000),
 ('ProductOptionImpl',100),
 ('ProductOptionValueImpl',100),
 ('RatingDetailImpl',10),
 ('RatingSummaryImpl',10),
 ('ReviewDetailImpl',10),
 ('SandBoxImpl',150),
 ('SearchFacetImpl',100),
 ('SearchFacetRangeImpl',100),
 ('SearchInterceptImpl',1),
 ('SkuImpl',10000),
 ('StructuredContentFieldImpl',1000),
 ('StructuredContentImpl',1000),
 ('StructuredContentRuleImpl',1000),
 ('TaxDetailImpl',601),
 ('UpSaleProductImpl',5),
 ('URLHandlerImpl',100);
/*!40000 ALTER TABLE `sequence_generator` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
