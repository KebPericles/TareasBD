-- -----------------------------------------------------
-- Schema BD_Tareas
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `BD_Tareas` ;

-- -----------------------------------------------------
-- Schema BD_Tareas
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `BD_Tareas` DEFAULT CHARACTER SET utf8 ;
USE `BD_Tareas` ;

-- -----------------------------------------------------
-- Table `BD_Tareas`.`Usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BD_Tareas`.`Usuarios` (
  `idUsuario` INT NOT NULL AUTO_INCREMENT,
  `correo` VARCHAR(60) NOT NULL,
  `contrasena` VARCHAR(45) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idUsuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_Tareas`.`Carpetas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BD_Tareas`.`Carpetas` (
  `idCarpeta` INT NOT NULL AUTO_INCREMENT,
  `idUsuario` INT NOT NULL,
  `idCarpetaPadre` INT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `enPapelera` TINYINT NOT NULL,
  PRIMARY KEY (`idCarpeta`),
  INDEX `FK_CARPETAS_USUARIOS_idx` (`idUsuario` ASC),
  INDEX `FK_CARPETAS_SUBCARPETAS_idx` (`idCarpetaPadre` ASC),
  CONSTRAINT `FK_CARPETAS_USUARIOS`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `BD_Tareas`.`Usuarios` (`idUsuario`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_SUBCARPETAS_CARPETAS`
    FOREIGN KEY (`idCarpetaPadre`)
    REFERENCES `BD_Tareas`.`Carpetas` (`idCarpeta`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_Tareas`.`Tareas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BD_Tareas`.`Tareas` (
  `idTarea` INT NOT NULL AUTO_INCREMENT,
  `idUsuario` INT NOT NULL,
  `idTareaPadre` INT NULL,
  `idCarpeta` INT NOT NULL,
  `titulo` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(200) NOT NULL,
  `fechaInicio` DATETIME NULL,
  `fechaVencimiento` DATETIME NULL,
  `prioridad` ENUM('Alta', 'Media', 'Baja') NULL,
  `estado` ENUM('Completado', 'No completado') NOT NULL,
  `enPapelera` TINYINT NOT NULL,
  PRIMARY KEY (`idTarea`),
  INDEX `hola_idx` (`idUsuario` ASC),
  INDEX `FK_SUBTAREAS_TAREAS_idx` (`idTareaPadre` ASC),
  INDEX `FK_TAREAS_CARPETAS_idx` (`idCarpeta` ASC),
  CONSTRAINT `FK_TAREAS_USUARIOS`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `BD_Tareas`.`Usuarios` (`idUsuario`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_SUBTAREAS_TAREAS`
    FOREIGN KEY (`idTareaPadre`)
    REFERENCES `BD_Tareas`.`Tareas` (`idTarea`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_TAREAS_CARPETAS`
    FOREIGN KEY (`idCarpeta`)
    REFERENCES `BD_Tareas`.`Carpetas` (`idCarpeta`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_Tareas`.`Etiquetas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BD_Tareas`.`Etiquetas` (
  `idEtiqueta` INT NOT NULL AUTO_INCREMENT,
  `idUsuario` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEtiqueta`),
  INDEX `FK_ETIQUETAS_USUARIOS_idx` (`idUsuario` ASC),
  CONSTRAINT `FK_ETIQUETAS_USUARIOS`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `BD_Tareas`.`Usuarios` (`idUsuario`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_Tareas`.`CarpetasCompartidas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BD_Tareas`.`CarpetasCompartidas` (
  `idCarpeta` INT NOT NULL,
  `idUsuario` INT NOT NULL,
  `fechaCompartida` DATE NOT NULL,
  PRIMARY KEY (`idCarpeta`, `idUsuario`),
  INDEX `FK_CARPETASCOMPARTIDAS_USUARIOS_idx` (`idUsuario` ASC),
  CONSTRAINT `FK_CARPETASCOMPARTIDAS_USUARIOS`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `BD_Tareas`.`Usuarios` (`idUsuario`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_CARPETASCOMPARTIDAS_CARPETAS`
    FOREIGN KEY (`idCarpeta`)
    REFERENCES `BD_Tareas`.`Carpetas` (`idCarpeta`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_Tareas`.`TareasCompartidas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BD_Tareas`.`TareasCompartidas` (
  `idTarea` INT NOT NULL,
  `idUsuario` INT NOT NULL,
  `fechaCompartida` DATE NOT NULL,
  PRIMARY KEY (`idTarea`, `idUsuario`),
  INDEX `FK_TAREASCOMPARTIDAS_USUARIO_idx` (`idUsuario` ASC),
  CONSTRAINT `FK_TAREASCOMPARTIDAS_TARES`
    FOREIGN KEY (`idTarea`)
    REFERENCES `BD_Tareas`.`Tareas` (`idTarea`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_TAREASCOMPARTIDAS_USUARIO`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `BD_Tareas`.`Usuarios` (`idUsuario`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_Tareas`.`TareasEtiquetas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BD_Tareas`.`TareasEtiquetas` (
  `idTarea` INT NOT NULL,
  `idEtiqueta` INT NOT NULL,
  PRIMARY KEY (`idTarea`, `idEtiqueta`),
  INDEX `FK_TAREASETIQUETAS_ETIQUETAS_idx` (`idEtiqueta` ASC),
  CONSTRAINT `FK_TAREASETIQUETAS_TAREAS`
    FOREIGN KEY (`idTarea`)
    REFERENCES `BD_Tareas`.`Tareas` (`idTarea`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_TAREASETIQUETAS_ETIQUETAS`
    FOREIGN KEY (`idEtiqueta`)
    REFERENCES `BD_Tareas`.`Etiquetas` (`idEtiqueta`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;