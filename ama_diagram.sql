-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Amazon_clone
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Amazon_clone
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Amazon_clone` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema school_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema school_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `school_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `Amazon_clone` ;

-- -----------------------------------------------------
-- Table `Amazon_clone`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Amazon_clone`.`Customers` (
  `idCustomers` INT NOT NULL AUTO_INCREMENT,
  `email_address` VARCHAR(45) NULL,
  `full_name` VARCHAR(45) NULL,
	PRIMARY KEY (`idCustomers`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Amazon_clone`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Amazon_clone`.`Orders` (
  `idOrders` INT NOT NULL AUTO_INCREMENT,
  `Order_number` VARCHAR(45) NULL,
  `order_date` DATETIME NULL,
  `customerid` INT NULL,
  PRIMARY KEY (`idOrders`))
ENGINE = InnoDB;

USE `school_db` ;

-- -----------------------------------------------------
-- Table `school_db`.`courses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school_db`.`courses` (
  `courseid` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(50) CHARACTER SET 'utf8' NOT NULL,
  `number_of_credits` INT NULL DEFAULT NULL,
  `course_code` VARCHAR(10) CHARACTER SET 'utf8' NOT NULL,
  PRIMARY KEY (`courseid`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `school_db`.`lecturers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school_db`.`lecturers` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `last_name` VARCHAR(45) NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `Degree` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `school_db`.`students`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school_db`.`students` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `lastname` VARCHAR(50) CHARACTER SET 'utf8' NOT NULL,
  `firstname` VARCHAR(50) CHARACTER SET 'utf8' NOT NULL,
  `date_of_birth` DATE NOT NULL,
  `enrollment_date` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
