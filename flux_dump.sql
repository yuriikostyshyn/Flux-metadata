SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

DROP SCHEMA IF EXISTS `mydb` ;
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`User`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`User` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`User` (
  `idUser` BIGINT NOT NULL AUTO_INCREMENT ,
  `login` VARCHAR(45) NOT NULL ,
  `password` VARCHAR(45) NOT NULL ,
  `name` VARCHAR(45) NOT NULL ,
  `surname` VARCHAR(45) NOT NULL ,
  `keyBank` BIGINT NOT NULL ,
  PRIMARY KEY (`idUser`) )
ENGINE = InnoDB;

CREATE UNIQUE INDEX `idUser_UNIQUE` ON `mydb`.`User` (`idUser` ASC) ;

CREATE UNIQUE INDEX `login_UNIQUE` ON `mydb`.`User` (`login` ASC) ;


-- -----------------------------------------------------
-- Table `mydb`.`Currency`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Currency` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`Currency` (
  `idCurrency` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(45) NOT NULL ,
  `fullName` VARCHAR(45) NOT NULL DEFAULT '\"\"' ,
  PRIMARY KEY (`idCurrency`) )
ENGINE = InnoDB;

CREATE UNIQUE INDEX `idCurrency_UNIQUE` ON `mydb`.`Currency` (`idCurrency` ASC) ;

CREATE UNIQUE INDEX `name_UNIQUE` ON `mydb`.`Currency` (`name` ASC) ;

CREATE UNIQUE INDEX `fullName_UNIQUE` ON `mydb`.`Currency` (`fullName` ASC) ;


-- -----------------------------------------------------
-- Table `mydb`.`Account`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Account` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`Account` (
  `idAccount` BIGINT NOT NULL AUTO_INCREMENT ,
  `idBank` BIGINT NOT NULL ,
  `idUser` BIGINT NOT NULL ,
  `idCurrency` INT NOT NULL ,
  PRIMARY KEY (`idAccount`, `idCurrency`) ,
  CONSTRAINT `fk_Account_User`
    FOREIGN KEY (`idUser` )
    REFERENCES `mydb`.`User` (`idUser` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Account_Currency`
    FOREIGN KEY (`idCurrency` )
    REFERENCES `mydb`.`Currency` (`idCurrency` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `idAccount_UNIQUE` ON `mydb`.`Account` (`idAccount` ASC) ;


-- -----------------------------------------------------
-- Table `mydb`.`Status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Status` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`Status` (
  `idStatus` INT NOT NULL AUTO_INCREMENT ,
  `message` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`idStatus`) )
ENGINE = InnoDB;

CREATE UNIQUE INDEX `idStatus_UNIQUE` ON `mydb`.`Status` (`idStatus` ASC) ;


-- -----------------------------------------------------
-- Table `mydb`.`Transaction`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Transaction` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`Transaction` (
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
    REFERENCES `mydb`.`Account` (`idAccount` , `idCurrency` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Transaction_Status1`
    FOREIGN KEY (`Status_idStatus` )
    REFERENCES `mydb`.`Status` (`idStatus` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `idTransaction_UNIQUE` ON `mydb`.`Transaction` (`idTransaction` ASC) ;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
