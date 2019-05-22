-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Patient` (
  `patientID` INT NOT NULL,
  `patient_name` VARCHAR(45) NULL,
  `patient_age` VARCHAR(45) NULL,
  `patient_gender` ENUM('M', 'F') NULL,
  `patient_syndrome` VARCHAR(45) NULL,
  PRIMARY KEY (`patientID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Gene`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Gene` (
  `Gene_ID` INT NOT NULL,
  `gene_name` VARCHAR(45) NULL,
  `gene_start` INT NULL,
  `gene_end` INT NULL,
  `gene_chromosome` INT NULL,
  `gene_description` VARCHAR(45) NULL,
  `sample_info` INT NULL,
  PRIMARY KEY (`Gene_ID`),
  INDEX `FK_sampleinfo_idx` (`sample_info` ASC) VISIBLE,
  CONSTRAINT `FK_sampleinfo`
    FOREIGN KEY (`sample_info`)
    REFERENCES `mydb`.`Patient` (`patientID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
