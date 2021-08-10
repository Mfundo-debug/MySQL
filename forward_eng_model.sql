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
  `Customers_idCustomers` INT NOT NULL,
  PRIMARY KEY (`idOrders`, `Customers_idCustomers`),
  INDEX `fk_Orders_Customers_idx` (`Customers_idCustomers` ASC) VISIBLE,
  CONSTRAINT `fk_Orders_Customers`
    FOREIGN KEY (`Customers_idCustomers`)
    REFERENCES `Amazon_clone`.`Customers` (`idCustomers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Amazon_clone`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Amazon_clone`.`products` (
  `idproducts` INT NOT NULL AUTO_INCREMENT,
  `code` VARCHAR(45) NULL,
  `name` VARCHAR(45) NULL,
  `description` VARCHAR(45) NULL,
  PRIMARY KEY (`idproducts`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Amazon_clone`.`products_oders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Amazon_clone`.`products_oders` (
  `idproducts_oders` INT NOT NULL AUTO_INCREMENT,
  `products_idproducts` INT NOT NULL,
  `Orders_idOrders` INT NOT NULL,
  PRIMARY KEY (`idproducts_oders`, `products_idproducts`, `Orders_idOrders`),
  INDEX `fk_products_oders_products1_idx` (`products_idproducts` ASC) VISIBLE,
  INDEX `fk_products_oders_Orders1_idx` (`Orders_idOrders` ASC) VISIBLE,
  CONSTRAINT `fk_products_oders_products1`
    FOREIGN KEY (`products_idproducts`)
    REFERENCES `Amazon_clone`.`products` (`idproducts`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_products_oders_Orders1`
    FOREIGN KEY (`Orders_idOrders`)
    REFERENCES `Amazon_clone`.`Orders` (`idOrders`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
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
AUTO_INCREMENT = 8
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
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `school_db`.`classes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school_db`.`classes` (
  `idClasses` INT NOT NULL,
  `Lecture_id` INT NULL DEFAULT NULL,
  `courses_id` INT NULL DEFAULT NULL,
  `time` TIME NULL DEFAULT NULL,
  PRIMARY KEY (`idClasses`),
  INDEX `classes_lecturer_idx` (`Lecture_id` ASC) VISIBLE,
  INDEX `classes_courses_idx` (`courses_id` ASC) VISIBLE,
  CONSTRAINT `classes_courses`
    FOREIGN KEY (`courses_id`)
    REFERENCES `school_db`.`courses` (`courseid`),
  CONSTRAINT `classes_lecturer`
    FOREIGN KEY (`Lecture_id`)
    REFERENCES `school_db`.`lecturers` (`id`))
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


-- -----------------------------------------------------
-- Table `school_db`.`enrollments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school_db`.`enrollments` (
  `idenrollments` INT NOT NULL,
  `class_id` INT NOT NULL,
  `student_id` INT NOT NULL,
  PRIMARY KEY (`idenrollments`),
  INDEX `enrollment_student_idx` (`student_id` ASC) VISIBLE,
  INDEX `enrollment_class_idx` (`class_id` ASC) VISIBLE,
  CONSTRAINT `enrollment_class`
    FOREIGN KEY (`class_id`)
    REFERENCES `school_db`.`classes` (`idClasses`),
  CONSTRAINT `enrollment_student`
    FOREIGN KEY (`student_id`)
    REFERENCES `school_db`.`students` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
