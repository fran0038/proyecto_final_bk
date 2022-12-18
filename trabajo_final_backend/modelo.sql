-- MySQL Script generated by MySQL Workbench
-- Sat Dec 17 19:29:20 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Ventas
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Ventas
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Ventas` DEFAULT CHARACTER SET utf8 ;
USE `Ventas` ;

-- -----------------------------------------------------
-- Table `Ventas`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ventas`.`Usuario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido paterno` VARCHAR(45) NOT NULL,
  `apellido materno` VARCHAR(45) NOT NULL,
  `fecha nacimiento` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ventas`.`Vendedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ventas`.`Vendedor` (
  `usuario_id` INT NOT NULL,
  PRIMARY KEY (`usuario_id`),
  CONSTRAINT `FKvendedorusuario`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `Ventas`.`Usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ventas`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ventas`.`Cliente` (
  `usuario_id` INT NOT NULL,
  PRIMARY KEY (`usuario_id`),
  CONSTRAINT `FKclientesusuario`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `Ventas`.`Usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ventas`.`Productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ventas`.`Productos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `precio` INT NOT NULL,
  `stock` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ventas`.`Ventas_Realizadas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ventas`.`Ventas_Realizadas` (
  `producto_id` INT NOT NULL,
  `cantidad` INT NOT NULL,
  `cliente_id` INT NOT NULL,
  `vendedor_id` INT NOT NULL,
  INDEX `FKventasrealizadasproductos_idx` (`producto_id` ASC),
  INDEX `FKventasrealizadascliente_idx` (`cliente_id` ASC),
  INDEX `FKventasrealizadasvendesor_idx` (`vendedor_id` ASC),
  CONSTRAINT `FKventasrealizadasproductos`
    FOREIGN KEY (`producto_id`)
    REFERENCES `Ventas`.`Productos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FKventasrealizadascliente`
    FOREIGN KEY (`cliente_id`)
    REFERENCES `Ventas`.`Cliente` (`usuario_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FKventasrealizadasvendesor`
    FOREIGN KEY (`vendedor_id`)
    REFERENCES `Ventas`.`Vendedor` (`usuario_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
