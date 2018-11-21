-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema ins27
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ins27
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ins27` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `ins27` ;

-- -----------------------------------------------------
-- Table `ins27`.`inscripcion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ins27`.`inscripcion` (
  `INS_ID` INT(11) NOT NULL AUTO_INCREMENT,
  `INS_ALU_ID` INT(11) NOT NULL,
  `INS_CAR_ID` INT(11) NOT NULL,
  PRIMARY KEY (`INS_ID`),
  INDEX `FK_INS_ALU_idx` (`INS_ALU_ID` ASC),
  CONSTRAINT `FK_INS_ALU`
    FOREIGN KEY (`INS_ALU_ID`)
    REFERENCES `ins27`.`alumnos` (`ALU_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ins27`.`materias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ins27`.`materias` (
  `MAT_ID` INT(11) NOT NULL AUTO_INCREMENT,
  `MAT_NOMBRE` VARCHAR(45) NULL DEFAULT NULL,
  `MAT_PROFESOR` VARCHAR(45) NULL DEFAULT NULL,
  `MAT_CAR_ID` INT(11) NULL DEFAULT NULL,
  `MAT_INS_ID` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`MAT_ID`),
  INDEX `FK_MAT_INS_idx` (`MAT_INS_ID` ASC),
  CONSTRAINT `FK_MAT_INS`
    FOREIGN KEY (`MAT_INS_ID`)
    REFERENCES `ins27`.`inscripcion` (`INS_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ins27`.`carreras`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ins27`.`carreras` (
  `CAR_ID` INT(11) NOT NULL AUTO_INCREMENT,
  `CAR_NOMBRE` VARCHAR(45) NULL DEFAULT NULL,
  `CAR_TURNO` VARCHAR(45) NULL DEFAULT NULL,
  `CAR_MAT_ID` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`CAR_ID`),
  INDEX `FK_CARRERA_MATERIAS_idx` (`CAR_NOMBRE` ASC),
  INDEX `FK_CAR_MAT_idx` (`CAR_MAT_ID` ASC),
  CONSTRAINT `FK_CAR_MAT`
    FOREIGN KEY (`CAR_MAT_ID`)
    REFERENCES `ins27`.`materias` (`MAT_ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 18
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ins27`.`alumnos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ins27`.`alumnos` (
  `ALU_ID` INT(11) NOT NULL AUTO_INCREMENT,
  `ALU_NOMBRE` VARCHAR(45) NULL DEFAULT NULL,
  `ALU_APELLIDO` VARCHAR(45) NULL DEFAULT NULL,
  `ALU_DNI` VARCHAR(45) NULL DEFAULT NULL,
  `ALU_FECHA_DE_NACIMIENTO` VARCHAR(45) NULL DEFAULT NULL,
  `ALU_CELULAR` VARCHAR(45) NULL DEFAULT NULL,
  `ALU_DIRECCION` VARCHAR(45) NULL DEFAULT NULL,
  `ALU_EMAIL` VARCHAR(45) NULL DEFAULT NULL,
  `ALU_CAR_ID` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`ALU_ID`),
  INDEX `FK_ALU_CAR_idx` (`ALU_CAR_ID` ASC),
  CONSTRAINT `FK_ALU_CAR`
    FOREIGN KEY (`ALU_CAR_ID`)
    REFERENCES `ins27`.`carreras` (`CAR_ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ins27`.`profesores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ins27`.`profesores` (
  `PRO_ID` INT(11) NOT NULL AUTO_INCREMENT,
  `PRO_NOMBRE` VARCHAR(45) NOT NULL,
  `PRO_APELLIDO` VARCHAR(45) NOT NULL,
  `PRO_DIRECCION` VARCHAR(45) NULL DEFAULT NULL,
  `PRO_NUMERO` VARCHAR(4) NULL DEFAULT NULL,
  `PRO_CELULAR` VARCHAR(45) NULL DEFAULT NULL,
  `PRO_FIJO` VARCHAR(45) NULL DEFAULT NULL,
  `PRO_CUIL` VARCHAR(11) NULL DEFAULT NULL,
  `PRO_NACIMIENTO` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`PRO_ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ins27`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ins27`.`usuarios` (
  `USERNAME` VARCHAR(50) NOT NULL,
  `PASSWORD` VARCHAR(45) NOT NULL,
  `USU_NOMBRE` VARCHAR(45) NULL DEFAULT NULL,
  `USU_APELLIDO` VARCHAR(45) NULL DEFAULT NULL,
  `APELLIDO` VARCHAR(255) NULL DEFAULT NULL,
  `NOMBRE` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`USERNAME`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
