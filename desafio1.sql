DROP DATABASE IF EXISTS SpotifyClone;

CREATE SCHEMA IF NOT EXISTS `SpotifyClone` ;
USE `SpotifyClone` ;

-- -----------------------------------------------------
-- Table `SpotifyClone`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`Usuario` (
  `id_usuario` INT NOT NULL AUTO_INCREMENT,
  `nome_usuario` VARCHAR(45) NOT NULL,
  `idade` INT NOT NULL,
  PRIMARY KEY (`id_usuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SpotifyClone`.`Assinatura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`Assinatura` (
  `id_assinatura` INT NOT NULL AUTO_INCREMENT,
  `data_assinatura` DATE NOT NULL,
  `plano` VARCHAR(45) NOT NULL,
  `valor_plano` FLOAT NOT NULL,
  `id_usuario` INT NOT NULL,
  PRIMARY KEY (`id_assinatura`),
    FOREIGN KEY (`id_usuario`)
    REFERENCES `SpotifyClone`.`Usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SpotifyClone`.`Artista`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`Artista` (
  `id_artista` INT NOT NULL AUTO_INCREMENT,
  `nome_artista` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_artista`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SpotifyClone`.`Musica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`Musica` (
  `id_musica` INT NOT NULL AUTO_INCREMENT,
  `nome_musica` VARCHAR(45) NOT NULL,
  `duracao_musica` INT NOT NULL,
  `ano_musica` INT NOT NULL,
  `id_artista` INT NOT NULL,
  PRIMARY KEY (`id_musica`),
    FOREIGN KEY (`id_artista`)
    REFERENCES `SpotifyClone`.`Artista` (`id_artista`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SpotifyClone`.`Reprodução`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`Reprodução` (
  `id_reprodução` INT NOT NULL,
  `data_reprodução` DATE NOT NULL,
  `historico_reprodução` DATETIME NOT NULL,
  `id_usuario` INT NOT NULL,
  `id_musica` INT NOT NULL,
  PRIMARY KEY (`id_reprodução`),
    FOREIGN KEY (`id_usuario`)
    REFERENCES `SpotifyClone`.`Usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    FOREIGN KEY (`id_musica`)
    REFERENCES `SpotifyClone`.`Musica` (`id_musica`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SpotifyClone`.`Album`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`Album` (
  `id_album` INT NOT NULL AUTO_INCREMENT,
  `nome_album` VARCHAR(45) NOT NULL,
  `id_artista` INT NOT NULL,
  PRIMARY KEY (`id_album`),
    FOREIGN KEY (`id_artista`)
    REFERENCES `SpotifyClone`.`Artista` (`id_artista`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SpotifyClone`.`Seguindo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`Seguindo` (
  `id_seguindo` INT NOT NULL,
  `id_usuario` INT NOT NULL,
  `id_artista` INT NOT NULL,
  PRIMARY KEY (`id_seguindo`),
    FOREIGN KEY (`id_artista`)
    REFERENCES `SpotifyClone`.`Artista` (`id_artista`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    FOREIGN KEY (`id_usuario`)
    REFERENCES `SpotifyClone`.`Usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



  -- CREATE DATABASE IF NOT EXISTS SpotifyClone;

  -- CREATE TABLE SpotifyClone.tabela1(
  --     coluna1 tipo restricoes,
  --     coluna2 tipo restricoes,
  --     colunaN tipo restricoes,
  -- ) engine = InnoDB;

  -- CREATE TABLE SpotifyClone.tabela2(
  --     coluna1 tipo restricoes,
  --     coluna2 tipo restricoes,
  --     colunaN tipo restricoes,
  -- ) engine = InnoDB;

  -- INSERT INTO SpotifyClone.tabela1 (coluna1, coluna2)
  -- VALUES
  --   ('exemplo de dados 1', 'exemplo de dados A'),
  --   ('exemplo de dados 2', 'exemplo de dados B'),
  --   ('exemplo de dados 3', 'exemplo de dados C');

  -- INSERT INTO SpotifyClone.tabela2 (coluna1, coluna2)
  -- VALUES
  --   ('exemplo de dados 1', 'exemplo de dados X'),
  --   ('exemplo de dados 2', 'exemplo de dados Y');