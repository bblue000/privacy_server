-- MySQL Script generated by MySQL Workbench
-- 06/17/14 11:13:58
-- Model: New Model    Version: 1.0
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema privacy_app
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `privacy_app` ;
CREATE SCHEMA IF NOT EXISTS `privacy_app` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `privacy_app` ;

-- -----------------------------------------------------
-- Table `privacy_app`.`privacy_user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `privacy_app`.`privacy_user` ;

CREATE TABLE IF NOT EXISTS `privacy_app`.`privacy_user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `truename` VARCHAR(45) NOT NULL,
  `create_at` DATETIME NOT NULL,
  `update_at` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE INDEX `INDEX_CREATE_AT` ON `privacy_app`.`privacy_user` (`create_at` ASC);

CREATE INDEX `INDEX_UPDATE_AT` ON `privacy_app`.`privacy_user` (`update_at` ASC);

CREATE UNIQUE INDEX `user_name_UNIQUE` ON `privacy_app`.`privacy_user` (`username` ASC);


-- -----------------------------------------------------
-- Table `privacy_app`.`privacy_location`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `privacy_app`.`privacy_location` ;

CREATE TABLE IF NOT EXISTS `privacy_app`.`privacy_location` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `location_info` VARCHAR(500) NULL,
  `lat` VARCHAR(20) NULL,
  `lng` VARCHAR(20) NULL,
  `location_date` BIGINT NULL,
  `create_at` DATETIME NOT NULL,
  `update_at` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_privacy_location_privacy_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `privacy_app`.`privacy_user` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION);

CREATE INDEX `fk_privacy_location_privacy_user_idx` ON `privacy_app`.`privacy_location` (`user_id` ASC);

CREATE INDEX `INDEX_LOCATION_CREATE_AT` ON `privacy_app`.`privacy_location` (`create_at` ASC);

CREATE INDEX `INDEX_LOCATION_UPDATE_AT` ON `privacy_app`.`privacy_location` (`update_at` ASC);

CREATE INDEX `INDEX_LOCATION_DATETIME` ON `privacy_app`.`privacy_location` (`location_date` ASC);


-- -----------------------------------------------------
-- Table `privacy_app`.`privacy_monitor_user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `privacy_app`.`privacy_monitor_user` ;

CREATE TABLE IF NOT EXISTS `privacy_app`.`privacy_monitor_user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `truename` VARCHAR(45) NULL,
  `phonenumber` VARCHAR(45) NULL,
  `create_at` DATETIME NOT NULL,
  `update_at` DATETIME NOT NULL,
  PRIMARY KEY (`id`));

CREATE UNIQUE INDEX `username_UNIQUE` ON `privacy_app`.`privacy_monitor_user` (`username` ASC);


-- -----------------------------------------------------
-- Table `privacy_app`.`privacy_user_token`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `privacy_app`.`privacy_user_token` ;

CREATE TABLE IF NOT EXISTS `privacy_app`.`privacy_user_token` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `monitor_user_id` INT NOT NULL,
  `user_token` VARCHAR(500) NOT NULL,
  `expire_date` DATETIME NOT NULL,
  `create_at` DATETIME NOT NULL,
  `update_at` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_privacy_user_token_privacy_monitor_user1`
    FOREIGN KEY (`monitor_user_id`)
    REFERENCES `privacy_app`.`privacy_monitor_user` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION);

CREATE INDEX `fk_privacy_user_token_privacy_monitor_user1_idx` ON `privacy_app`.`privacy_user_token` (`monitor_user_id` ASC);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
USE `privacy_app`;

DELIMITER $$


USE `privacy_app`$$
DROP TRIGGER IF EXISTS `privacy_app`.`privacy_user_BINT` $$
USE `privacy_app`$$
CREATE TRIGGER `privacy_user_BINT` BEFORE INSERT ON `privacy_user` FOR EACH ROW
begin set new.`create_at` = now() ;
end;$$


USE `privacy_app`$$
DROP TRIGGER IF EXISTS `privacy_app`.`privacy_user_BUPD` $$
USE `privacy_app`$$
CREATE TRIGGER `privacy_user_BUPD` BEFORE UPDATE ON `privacy_user` FOR EACH ROW
begin set new.`update_at` = now() ;
end;$$




USE `privacy_app`$$
DROP TRIGGER IF EXISTS `privacy_app`.`privacy_location_BINT` $$
USE `privacy_app`$$
CREATE TRIGGER `privacy_location_BINT` BEFORE INSERT ON `privacy_location` FOR EACH ROW
begin set new.`create_at` = now() ;
end;$$

USE `privacy_app`$$
DROP TRIGGER IF EXISTS `privacy_app`.`privacy_location_BUPD` $$
USE `privacy_app`$$
CREATE TRIGGER `privacy_location_BUPD` BEFORE UPDATE ON `privacy_location` FOR EACH ROW
begin set new.`update_at` = now() ;
end;$$





USE `privacy_app`$$
DROP TRIGGER IF EXISTS `privacy_app`.`privacy_monitor_user_BINT` $$
USE `privacy_app`$$
CREATE TRIGGER `privacy_monitor_user_BINT` BEFORE INSERT ON `privacy_monitor_user` FOR EACH ROW
begin set new.`create_at` = now() ;
end;$$

USE `privacy_app`$$
DROP TRIGGER IF EXISTS `privacy_app`.`privacy_monitor_user_BUPD` $$
USE `privacy_app`$$
CREATE TRIGGER `privacy_monitor_user_BUPD` BEFORE UPDATE ON `privacy_monitor_user` FOR EACH ROW
begin set new.`update_at` = now() ;
end;$$




USE `privacy_app`$$
DROP TRIGGER IF EXISTS `privacy_app`.`privacy_user_token_BINT` $$
USE `privacy_app`$$
CREATE TRIGGER `privacy_user_token_BINT` BEFORE INSERT ON `privacy_user_token` FOR EACH ROW
begin set new.`create_at` = now() ;
end;$$

USE `privacy_app`$$
DROP TRIGGER IF EXISTS `privacy_app`.`privacy_user_token_BUPD` $$
USE `privacy_app`$$
CREATE TRIGGER `privacy_user_token_BUPD` BEFORE UPDATE ON `privacy_user_token` FOR EACH ROW
begin set new.`update_at` = now() ;
end;$$


DELIMITER ;