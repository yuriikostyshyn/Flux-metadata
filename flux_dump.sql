SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

DROP SCHEMA IF EXISTS `flux` ;
CREATE SCHEMA IF NOT EXISTS `flux` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
USE `flux` ;

-- -----------------------------------------------------
-- Table `flux`.`User`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `flux`.`User` ;

CREATE  TABLE IF NOT EXISTS `flux`.`User` (
  `idUser` BIGINT NOT NULL AUTO_INCREMENT ,
  `login` VARCHAR(45) NOT NULL ,
  `password` VARCHAR(45) NOT NULL ,
  `name` VARCHAR(45) NOT NULL ,
  `surname` VARCHAR(45) NOT NULL ,
  `keyBank` BIGINT NOT NULL ,
  PRIMARY KEY (`idUser`) )
ENGINE = InnoDB;

CREATE UNIQUE INDEX `idUser_UNIQUE` ON `flux`.`User` (`idUser` ASC) ;

CREATE UNIQUE INDEX `login_UNIQUE` ON `flux`.`User` (`login` ASC) ;


-- -----------------------------------------------------
-- Table `flux`.`Currency`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `flux`.`Currency` ;

CREATE  TABLE IF NOT EXISTS `flux`.`Currency` (
  `idCurrency` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(45) NOT NULL ,
  `fullName` VARCHAR(45) NOT NULL DEFAULT '\"\"' ,
  PRIMARY KEY (`idCurrency`) )
ENGINE = InnoDB;

CREATE UNIQUE INDEX `idCurrency_UNIQUE` ON `flux`.`Currency` (`idCurrency` ASC) ;

CREATE UNIQUE INDEX `name_UNIQUE` ON `flux`.`Currency` (`name` ASC) ;

CREATE UNIQUE INDEX `fullName_UNIQUE` ON `flux`.`Currency` (`fullName` ASC) ;


-- -----------------------------------------------------
-- Table `flux`.`Account`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `flux`.`Account` ;

CREATE  TABLE IF NOT EXISTS `flux`.`Account` (
  `idAccount` BIGINT NOT NULL AUTO_INCREMENT ,
  `idBank` BIGINT NOT NULL ,
  `idUser` BIGINT NOT NULL ,
  `idCurrency` INT NOT NULL ,
  PRIMARY KEY (`idAccount`, `idCurrency`) ,
  CONSTRAINT `fk_Account_User`
    FOREIGN KEY (`idUser` )
    REFERENCES `flux`.`User` (`idUser` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Account_Currency`
    FOREIGN KEY (`idCurrency` )
    REFERENCES `flux`.`Currency` (`idCurrency` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `idAccount_UNIQUE` ON `flux`.`Account` (`idAccount` ASC) ;


-- -----------------------------------------------------
-- Table `flux`.`Status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `flux`.`Status` ;

CREATE  TABLE IF NOT EXISTS `flux`.`Status` (
  `idStatus` INT NOT NULL AUTO_INCREMENT ,
  `message` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`idStatus`) )
ENGINE = InnoDB;

CREATE UNIQUE INDEX `idStatus_UNIQUE` ON `flux`.`Status` (`idStatus` ASC) ;


-- -----------------------------------------------------
-- Table `flux`.`Transaction`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `flux`.`Transaction` ;

CREATE  TABLE IF NOT EXISTS `flux`.`Transaction` (
  `idTransaction` BIGINT NOT NULL AUTO_INCREMENT ,
  `idAccountFrom` BIGINT NOT NULL ,
  `idAccountTo` BIGINT NOT NULL ,
  `dateStart` DATETIME NOT NULL ,
  `dateEnd` DATETIME NOT NULL ,
  `idStatus` INT NOT NULL ,
  `idAccount` BIGINT NOT NULL ,
  `idCurrency` INT NOT NULL ,
  `Status_idStatus` INT NOT NULL ,
  PRIMARY KEY (`idTransaction`) ,
  CONSTRAINT `fk_Transaction_Account1`
    FOREIGN KEY (`idAccount` , `idCurrency` )
    REFERENCES `flux`.`Account` (`idAccount` , `idCurrency` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Transaction_Status1`
    FOREIGN KEY (`Status_idStatus` )
    REFERENCES `flux`.`Status` (`idStatus` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `idTransaction_UNIQUE` ON `flux`.`Transaction` (`idTransaction` ASC) ;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
