-- MySQL Script generated by MySQL Workbench
-- Tue May 10 18:09:32 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema pharmacy
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema pharmacy
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `pharmacy` DEFAULT CHARACTER SET utf8 ;
USE `pharmacy` ;

-- -----------------------------------------------------
-- Table `pharmacy`.`pharmacy`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pharmacy`.`pharmacy` (
  `idph` INT NOT NULL AUTO_INCREMENT,
  `pharmacycol` VARCHAR(45) NOT NULL,
  `address` VARCHAR(100) NOT NULL,
  `phone` INT NOT NULL,
  `owner` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idph`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pharmacy`.`manufacturer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pharmacy`.`manufacturer` (
  `idm` INT NOT NULL AUTO_INCREMENT,
  `manufacturercol` VARCHAR(45) NOT NULL,
  `phone` INT NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idm`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pharmacy`.`preparation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pharmacy`.`preparation` (
  `idpr` INT NOT NULL AUTO_INCREMENT,
  `preparationscol` VARCHAR(45) NOT NULL,
  `price` INT NOT NULL,
  `cuantitu` INT NULL,
  `idph` INT NOT NULL,
  `idm` INT NOT NULL,
  PRIMARY KEY (`idpr`),
  INDEX `pharmacy_idx` (`idph` ASC) VISIBLE,
  INDEX `manufacturer_idx` (`idm` ASC) VISIBLE,
  CONSTRAINT `pharmacy`
    FOREIGN KEY (`idph`)
    REFERENCES `pharmacy`.`pharmacy` (`idph`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `manufacturer`
    FOREIGN KEY (`idm`)
    REFERENCES `pharmacy`.`manufacturer` (`idm`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;