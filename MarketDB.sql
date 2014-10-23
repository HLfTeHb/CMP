-- Скрипт сгенерирован Devart dbForge Studio for MySQL, Версия 6.1.166.0
-- Домашняя страница продукта: http://www.devart.com/ru/dbforge/mysql/studio
-- Дата скрипта: 23.10.2014 14:10:19
-- Версия сервера: 5.5.38-log
-- Версия клиента: 4.1

CREATE DATABASE MarketDB;
USE MarketDB;

CREATE TABLE Delivery (
  id_delivery int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  name varchar(50) DEFAULT NULL,
  PRIMARY KEY (id_delivery)
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = 'Type of Delivery';

CREATE TABLE Payment (
  id_payment int(10) UNSIGNED NOT NULL,
  name varchar(50) NOT NULL COMMENT 'Card, WebMoney, Coins, Check/PayPal, Private Bank',
  recvizit varchar(255) NOT NULL,
  PRIMARY KEY (id_payment)
)
ENGINE = INNODB
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = 'money money money money';

CREATE TABLE SubCategories (
  id_subcategory int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  name varchar(50) DEFAULT NULL,
  PRIMARY KEY (id_subcategory)
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = 'Subcategories for my categories';

CREATE TABLE `Order` (
  id_order int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  status varchar(255) DEFAULT NULL COMMENT '(',
  count varchar(255) DEFAULT NULL,
  discount varchar(255) DEFAULT NULL,
  id_payment int(10) UNSIGNED NOT NULL,
  id_delivery int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (id_order),
  CONSTRAINT FK_Order_Delivery_id_delivery FOREIGN KEY (id_delivery)
  REFERENCES Delivery (id_delivery) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT FK_Order_Payment_id_payment FOREIGN KEY (id_payment)
  REFERENCES Payment (id_payment) ON DELETE NO ACTION ON UPDATE NO ACTION
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET utf8
COLLATE utf8_general_ci;

CREATE TABLE Categories (
  id_category int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  name varchar(255) DEFAULT NULL,
  id_subcategory int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (id_category),
  UNIQUE INDEX UK_Categories_name (name),
  CONSTRAINT FK_Categories_SubCategories_id_subcategory FOREIGN KEY (id_subcategory)
  REFERENCES SubCategories (id_subcategory) ON DELETE NO ACTION ON UPDATE NO ACTION
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = 'categories of product in my market';

CREATE TABLE Product (
  id_product int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  name varchar(50) NOT NULL,
  description varchar(255) DEFAULT NULL,
  price float UNSIGNED NOT NULL,
  count int(10) UNSIGNED NOT NULL,
  charackters varchar(255) NOT NULL,
  picture varchar(255) DEFAULT NULL,
  id_category int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (id_product),
  CONSTRAINT FK_Product_Categories_id_category FOREIGN KEY (id_category)
  REFERENCES Categories (id_category) ON DELETE NO ACTION ON UPDATE NO ACTION
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = 'Product that will sold in my market';

CREATE TABLE Backet (
  id_bucket int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  id_product int(10) UNSIGNED NOT NULL,
  count int(10) DEFAULT NULL,
  id_order int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (id_bucket),
  CONSTRAINT FK_Backet_Order_id_order FOREIGN KEY (id_order)
  REFERENCES `Order` (id_order) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT FK_Backet_Product_id_product FOREIGN KEY (id_product)
  REFERENCES Product (id_product) ON DELETE NO ACTION ON UPDATE NO ACTION
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = 'Backet for sale products';