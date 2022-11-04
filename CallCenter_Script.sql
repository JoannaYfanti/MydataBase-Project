-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema callCenter
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema callCenter
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `callCenter` DEFAULT CHARACTER SET utf8 ;
USE `callCenter` ;

-- -----------------------------------------------------
-- Table `callCenter`.`department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `callCenter`.`department` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `depName` VARCHAR(45) NULL,
  `numEmployees` INT NULL,
  `supervisorId` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `callCenter`.`supervisor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `callCenter`.`supervisor` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `age` INT NULL,
  `yearsOfSeniority` INT NULL,
  `departmentName` VARCHAR(45) NULL,
  `department_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_supervisor_department1_idx` (`department_id` ASC) VISIBLE,
  CONSTRAINT `fk_supervisor_department1`
    FOREIGN KEY (`department_id`)
    REFERENCES `callCenter`.`department` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `callCenter`.`team`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `callCenter`.`team` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `numberOfTeam` INT NOT NULL,
  `numberOfEmployees` INT NULL,
  `departmentName` VARCHAR(45) NULL,
  `hasAchievedGoals` TINYINT NULL,
  `supervisor_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_team_supervisor1_idx` (`supervisor_id` ASC) VISIBLE,
  CONSTRAINT `fk_team_supervisor1`
    FOREIGN KEY (`supervisor_id`)
    REFERENCES `callCenter`.`supervisor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `callCenter`.`employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `callCenter`.`employee` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `team_id` INT NULL,
  `numberOfTeam` INT NULL,
  `cardNumber` INT NULL,
  `qualityScore` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_employee_team1_idx` (`team_id` ASC) VISIBLE,
  CONSTRAINT `fk_employee_team1`
    FOREIGN KEY (`team_id`)
    REFERENCES `callCenter`.`team` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `callCenter`.`client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `callCenter`.`client` (
  `id` INT NOT NULL,
  `uniqueVerificationCode` INT NULL,
  `billingAccount` INT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `callCenter`.`employee_has_client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `callCenter`.`employee_has_client` (
  `employee_id` INT NOT NULL,
  `client_id` INT NOT NULL,
  PRIMARY KEY (`employee_id`, `client_id`),
  INDEX `fk_employee_has_client_client1_idx` (`client_id` ASC) VISIBLE,
  INDEX `fk_employee_has_client_employee1_idx` (`employee_id` ASC) VISIBLE,
  CONSTRAINT `fk_employee_has_client_employee1`
    FOREIGN KEY (`employee_id`)
    REFERENCES `callCenter`.`employee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_employee_has_client_client1`
    FOREIGN KEY (`client_id`)
    REFERENCES `callCenter`.`client` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `callCenter` ;

-- -----------------------------------------------------
-- Placeholder table for view `callCenter`.`view1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `callCenter`.`view1` (`id` INT);

-- -----------------------------------------------------
-- View `callCenter`.`view1`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `callCenter`.`view1`;
USE `callCenter`;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
