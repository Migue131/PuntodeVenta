-- MySQL Script generated by MySQL Workbench
-- Thu Mar 23 22:59:59 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema puntoVenta
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema puntoVenta
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `puntoVenta` DEFAULT CHARACTER SET utf8 ;
USE `puntoVenta` ;

-- -----------------------------------------------------
-- Table `puntoVenta`.`Proveedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `puntoVenta`.`Proveedor` (
  `id` VARCHAR(10) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(100) NULL,
  `telefono` VARCHAR(10) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `puntoVenta`.`Perfil`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `puntoVenta`.`Perfil` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(40) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `puntoVenta`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `puntoVenta`.`Usuario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(25) NOT NULL,
  `apellido` VARCHAR(25) NOT NULL,
  `sexo` VARCHAR(1) NOT NULL,
  `fechaNacimiento` DATE NOT NULL,
  `direccion` VARCHAR(100) NOT NULL,
  `telefono` VARCHAR(10) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `usuario` VARCHAR(20) NOT NULL,
  `password` VARCHAR(20) NOT NULL,
  `Perfil_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Usuarios_Perfil1_idx` (`Perfil_id` ASC) VISIBLE,
  CONSTRAINT `fk_Usuarios_Perfil1`
    FOREIGN KEY (`Perfil_id`)
    REFERENCES `puntoVenta`.`Perfil` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `puntoVenta`.`Ingreso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `puntoVenta`.`Ingreso` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATE NOT NULL,
  `Proveedor_id` INT NOT NULL,
  `Usuario_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Ingresos_Usuarios1_idx` (`Usuario_id` ASC) VISIBLE,
  CONSTRAINT `fk_Ingresos_Usuarios1`
    FOREIGN KEY (`Usuario_id`)
    REFERENCES `puntoVenta`.`Usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `puntoVenta`.`Categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `puntoVenta`.`Categoria` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NOT NULL,
  `decripcion` VARCHAR(256) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `puntoVenta`.`Producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `puntoVenta`.`Producto` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `codigo` VARCHAR(50) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `precioCompra` DECIMAL NOT NULL,
  `precioVenta` DECIMAL NOT NULL,
  `stackInicial` INT NOT NULL,
  `stackFinal` INT NOT NULL,
  `Descripcion` VARCHAR(250) NOT NULL,
  `Ingreso_id` INT NOT NULL,
  `Categoria_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Inventario_Ingresos1_idx` (`Ingreso_id` ASC) VISIBLE,
  INDEX `fk_Producto_Categorias1_idx` (`Categoria_id` ASC) VISIBLE,
  CONSTRAINT `fk_Inventario_Ingresos1`
    FOREIGN KEY (`Ingreso_id`)
    REFERENCES `puntoVenta`.`Ingreso` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Producto_Categorias1`
    FOREIGN KEY (`Categoria_id`)
    REFERENCES `puntoVenta`.`Categoria` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `puntoVenta`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `puntoVenta`.`Cliente` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(25) NOT NULL,
  `apellido` VARCHAR(25) NOT NULL,
  `sexo` VARCHAR(1) NOT NULL,
  `fechaNacimiento` DATE NULL,
  `direccion` VARCHAR(100) NULL,
  `telefono` VARCHAR(10) NOT NULL,
  `email` VARCHAR(50) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `puntoVenta`.`Venta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `puntoVenta`.`Venta` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATE NOT NULL,
  `total` VARCHAR(5) NOT NULL,
  `Usuario_id` INT NOT NULL,
  `Cliente_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Ventas_Usuarios1_idx` (`Usuario_id` ASC) VISIBLE,
  INDEX `fk_Ventas_Cliente1_idx` (`Cliente_id` ASC) VISIBLE,
  CONSTRAINT `fk_Ventas_Usuarios1`
    FOREIGN KEY (`Usuario_id`)
    REFERENCES `puntoVenta`.`Usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ventas_Cliente1`
    FOREIGN KEY (`Cliente_id`)
    REFERENCES `puntoVenta`.`Cliente` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `puntoVenta`.`Detalle_venta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `puntoVenta`.`Detalle_venta` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombreProducto` VARCHAR(45) NOT NULL,
  `cantidad` INT NOT NULL,
  `precioVenta` INT NOT NULL,
  `totalVenta` INT NOT NULL,
  `Usuario_id` INT NOT NULL,
  `Venta_id` INT NOT NULL,
  INDEX `fk_Inventario_has_Ventas_Ventas1_idx` (`Venta_id` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_Inventario_has_Ventas_Ventas1`
    FOREIGN KEY (`Venta_id`)
    REFERENCES `puntoVenta`.`Venta` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `puntoVenta`.`Permiso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `puntoVenta`.`Permiso` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(40) NOT NULL,
  `modulo` VARCHAR(40) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `puntoVenta`.`Perfil_has_Permisos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `puntoVenta`.`Perfil_has_Permisos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Perfil_id` INT NOT NULL,
  `Permiso_id` INT NOT NULL,
  INDEX `fk_Perfil_has_Permisos_Perfil1_idx` (`Perfil_id` ASC) VISIBLE,
  INDEX `fk_Perfil_has_Permisos_Permisos1_idx` (`Permiso_id` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_Perfil_has_Permisos_Perfil1`
    FOREIGN KEY (`Perfil_id`)
    REFERENCES `puntoVenta`.`Perfil` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Perfil_has_Permisos_Permisos1`
    FOREIGN KEY (`Permiso_id`)
    REFERENCES `puntoVenta`.`Permiso` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
