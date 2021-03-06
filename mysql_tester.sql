-- MySQL Script generated by MySQL Workbench
-- Fri Mar  8 16:04:52 2019
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

-- -----------------------------------------------------
-- Schema mysql_tester
--
-- mysql_tester . 数据自动生成
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mysql_tester` ;
USE `mysql_tester` ;

-- -----------------------------------------------------
-- Table `mysql_tester`.`individual_user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mysql_tester`.`individual_user` (
  `id` BIGINT UNSIGNED NOT NULL,
  `username` VARCHAR(45) NOT NULL COMMENT '用户名',
  `password` VARCHAR(45) NOT NULL COMMENT '密码',
  `mobile_phone` INT UNSIGNED NOT NULL DEFAULT 0 COMMENT '手机',
  `email` VARCHAR(45) NOT NULL DEFAULT '' COMMENT '邮箱',
  `status` TINYINT UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态. \n1 : 正常',
  `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_user` BIGINT UNSIGNED NOT NULL,
  `last_modify_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_modify_user` BIGINT UNSIGNED NOT NULL,
  `is_deleted` BIGINT UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `idx_mobile_phone` (`mobile_phone` ASC),
  UNIQUE INDEX `idx_email` (`email` ASC),
  UNIQUE INDEX `idx_username` (`username` ASC))
COMMENT = '个人用户－基本信息';


-- -----------------------------------------------------
-- Table `mysql_tester`.`shop`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mysql_tester`.`shop` (
  `id` BIGINT UNSIGNED NOT NULL,
  `user_id` BIGINT UNSIGNED NOT NULL COMMENT '所属用户ID.',
  `shop_name` VARCHAR(45) NOT NULL COMMENT '店铺名称',
  `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_user` BIGINT UNSIGNED NOT NULL,
  `last_modify_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_modify_user` BIGINT UNSIGNED NOT NULL,
  `is_deleted` BIGINT UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  INDEX `fk_user_id_idx` (`user_id` ASC))
COMMENT = '店铺信息';


-- -----------------------------------------------------
-- Table `mysql_tester`.`item`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mysql_tester`.`item` (
  `id` BIGINT UNSIGNED NOT NULL,
  `shop_id` BIGINT UNSIGNED NOT NULL COMMENT '所属店铺ID . fk shop.id',
  `item_type` TINYINT UNSIGNED NOT NULL DEFAULT 1 COMMENT '商品类型 .\n0 . 简单类型，比如：书\n1 . 多规格类型：比如：衣服\n参考 : https://learnwoo.com/woocommerce-different-product-types/',
  `item_name` VARCHAR(45) NOT NULL COMMENT '商品名称',
  `category_one_id` BIGINT UNSIGNED NULL COMMENT '一级分类 . fk item_category.id',
  `category_two_id` BIGINT UNSIGNED NULL COMMENT '二级分类 . fk item_category.id',
  `category_three_id` BIGINT UNSIGNED NULL COMMENT '三级分类 . fk item_category.id',
  `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_user` BIGINT UNSIGNED NOT NULL,
  `last_modify_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_modify_user` BIGINT UNSIGNED NOT NULL,
  `is_deleted` BIGINT UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  INDEX `fk_shop_id_idx` (`shop_id` ASC),
  INDEX `fk_category_one_id_idx` (`category_one_id` ASC),
  INDEX `fk_category_two_id_idx` (`category_two_id` ASC),
  INDEX `fk_category_three_id_idx` (`category_three_id` ASC))
COMMENT = '商品';

-- -----------------------------------------------------
-- Table `mysql_tester`.`warehouse`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mysql_tester`.`warehouse` (
  `id` BIGINT UNSIGNED NOT NULL,
  `user_id` BIGINT UNSIGNED NOT NULL COMMENT '所属用户ID',
  `shop_id` BIGINT UNSIGNED NOT NULL COMMENT '所属店铺ID',
  `warehouse_type` TINYINT UNSIGNED NOT NULL DEFAULT 1 COMMENT '综合仓类型 . \n\n1. virtual . 没有实际仓库\n2. solid . 实体仓库 . 没错 ,　就是这个单词 , 从美剧中学的 .  ',
  `warehouse_name` VARCHAR(45) NOT NULL COMMENT '仓库名称',
  `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_user` BIGINT UNSIGNED NOT NULL,
  `last_modify_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_modify_user` BIGINT UNSIGNED NOT NULL,
  `is_deleted` BIGINT UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  INDEX `fk_individual_user_id_idx` (`user_id` ASC),
  INDEX `fk_shop_id_idx` (`shop_id` ASC))
COMMENT = '仓库. 代表存放商品的仓库.';
