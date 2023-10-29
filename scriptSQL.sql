-- MySQL Script generated by MySQL Workbench
-- Fri Oct 27 10:51:05 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema cadeMeuRango
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema cadeMeuRango
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cadeMeuRango` DEFAULT CHARACTER SET utf8 ;
USE `cadeMeuRango` ;

-- -----------------------------------------------------
-- Table `cadeMeuRango`.`user-registry`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cadeMeuRango`.`user-registry` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user-name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cadeMeuRango`.`recipe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cadeMeuRango`.`recipe` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `recipe_title` VARCHAR(45) NOT NULL,
  `recipe_description` VARCHAR(45) NOT NULL,
  `recipe_imageLink` VARCHAR(100) NOT NULL,
  `user-registry_id` INT NOT NULL,
  PRIMARY KEY (`id`, `user-registry_id`),
  INDEX `fk_recipe_user-registry1_idx` (`user-registry_id` ASC) VISIBLE,
  CONSTRAINT `fk_recipe_user-registry1`
    FOREIGN KEY (`user-registry_id`)
    REFERENCES `cadeMeuRango`.`user-registry` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cadeMeuRango`.`ingredients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cadeMeuRango`.`ingredients` (
  `id` INT NOT NULL,
  `ingredient_name` VARCHAR(45) NOT NULL,
  `ingredient_quantity` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cadeMeuRango`.`instructions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cadeMeuRango`.`instructions` (
  `id` INT NOT NULL,
  `instruction_description` VARCHAR(45) NOT NULL,
  `recipe_id` INT NOT NULL,
  PRIMARY KEY (`id`, `recipe_id`),
  INDEX `fk_instructions_recipe1_idx` (`recipe_id` ASC) VISIBLE,
  CONSTRAINT `fk_instructions_recipe1`
    FOREIGN KEY (`recipe_id`)
    REFERENCES `cadeMeuRango`.`recipe` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cadeMeuRango`.`ingredients_has_recipe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cadeMeuRango`.`ingredients_has_recipe` (
  `ingredients_id` INT NOT NULL,
  `recipe_id` INT NOT NULL,
  PRIMARY KEY (`ingredients_id`, `recipe_id`),
  INDEX `fk_ingredients_has_recipe_recipe1_idx` (`recipe_id` ASC) VISIBLE,
  INDEX `fk_ingredients_has_recipe_ingredients1_idx` (`ingredients_id` ASC) VISIBLE,
  CONSTRAINT `fk_ingredients_has_recipe_ingredients1`
    FOREIGN KEY (`ingredients_id`)
    REFERENCES `cadeMeuRango`.`ingredients` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ingredients_has_recipe_recipe1`
    FOREIGN KEY (`recipe_id`)
    REFERENCES `cadeMeuRango`.`recipe` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
