-- -----------------------------------------------------
-- Schema SpotifyClone
-- -----------------------------------------------------
DROP DATABASE IF EXISTS `SpotifyClone`;

CREATE SCHEMA IF NOT EXISTS `SpotifyClone` ;
USE `SpotifyClone` ;

-- -----------------------------------------------------
-- Table `SpotifyClone`.`Assinatura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`Assinatura` (
  `id_assinatura` INT NOT NULL AUTO_INCREMENT,
  `plano` VARCHAR(45) NOT NULL,
  `valor_plano` FLOAT NOT NULL,
  PRIMARY KEY (`id_assinatura`)
  )
ENGINE = InnoDB;

INSERT INTO SpotifyClone.Assinatura ( plano, valor_plano )
  VALUES
    ('gratuito', 0.00),
    ('familiar', 7.99),
    ('universitário', 5.99),
    ('pessoal', 6.99);

    -- -----------------------------------------------------
-- Table `SpotifyClone`.`Artista`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`Artista` (
  `id_artista` INT NOT NULL AUTO_INCREMENT,
  `nome_artista` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_artista`)
  )
ENGINE = InnoDB;

INSERT INTO SpotifyClone.Artista ( nome_artista )
    VALUES
    ('Beyoncé'), 
    ('Queen'),
    ('Elis Regina'),
    ('Baco Exu do Blues'), 
    ('Blind Guardian'),
    ('Nina Simone');


-- -----------------------------------------------------
-- Table `SpotifyClone`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`Usuario` (
  `id_usuario` INT NOT NULL AUTO_INCREMENT,
  `nome_usuario` VARCHAR(45) NOT NULL,
  `idade` INT NOT NULL,
  `id_assinatura` INT NOT NULL,
  `data_assinatura` DATE NOT NULL,
  PRIMARY KEY (`id_usuario`),
    FOREIGN KEY (`id_assinatura`)
    REFERENCES `SpotifyClone`.`Assinatura` (`id_assinatura`)
  )
ENGINE = InnoDB;


INSERT INTO SpotifyClone.Usuario (id_assinatura, nome_usuario, idade, data_assinatura)
  VALUES
  (1, 'Barbara Liskov', 82, '2019-10-20'),
  (1, 'Robert Cecil Martin', 58, '2017-01-06'),
  (2,	'Ada Lovelace',	37, '2017-12-30'),
  (2,	'Martin Fowler', 46, '2017-01-17'),
  (2,	'Sandi Metz', 58, '2018-04-29'),
  (3,	'Paulo Freire', 19, '2018-02-14'),
  (3,	'Bell Hooks', 26, '2018-01-05'),
  (4,	'Christopher Alexander', 85, '2019-06-05'),
  (4,	'Judith Butler', 45, '2020-05-13'),
  (4, 'Jorge Amado', 58, '2017-02-17');



-- -----------------------------------------------------
-- Table `SpotifyClone`.`Album`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`Album` (
  `id_album` INT NOT NULL AUTO_INCREMENT,
  `nome_album` VARCHAR(45) NOT NULL,
  `id_artista` INT NOT NULL,
  `ano_album` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_album`),
    FOREIGN KEY (`id_artista`)
    REFERENCES `SpotifyClone`.`Artista` (`id_artista`)
  )
ENGINE = InnoDB;

INSERT INTO SpotifyClone.Album ( nome_album, ano_album, id_artista )
  VALUES
('Renaissance', 2022, 1),
('Jazz', 1978, 2),
('Hot Space', 1982, 2),
('Falso Brilhante', 1998, 3),
('Vento de Maio', 2001, 3),
('QVVJFA?', 2003, 4),
('Somewhere Far Beyond', 2007, 5),
('I Put A Spell On You', 2012, 6);



-- -----------------------------------------------------
-- Table `SpotifyClone`.`Musica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`Musica` (
  `id_musica` INT NOT NULL AUTO_INCREMENT,
  `nome_musica` VARCHAR(45) NOT NULL,
  `duracao_musica` INT NOT NULL,
  `ano_album` YEAR NOT NULL,
  `id_album` INT NOT NULL, 
  PRIMARY KEY (`id_musica`),
    FOREIGN KEY (`id_album`) 
    REFERENCES `SpotifyClone`.`Album` (`id_album`)
  )
ENGINE = InnoDB;


    INSERT INTO SpotifyClone.Musica ( id_album, nome_musica, duracao_musica, ano_album )
  VALUES
    (1, 'BREAK MY SOUL', 279, '2022'),
    (1, 'VIRGO’S GROOVE', 369, '2022'),
    (1, 'ALIEN SUPERSTAR', 116, '2022'),
    (2, 'Don’t Stop Me Now', 203, '1978'),
    (3, 'Under Pressure', 152, '1982'),
    (4, 'Como Nossos Pais', 105, '1998'),
    (5, 'O Medo de Amar é o Medo de Ser Livre', 207, '2001'),
    (6, 'Samba em Paris', 267, '2003'),
    (7, 'The Bard’s Song', 244, '2007'),
    (8, 'Feeling Good', 100, '2012');



-- -----------------------------------------------------
-- Table `SpotifyClone`.`Reprodução`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`Reproducao` (
  `data_reproducao` DATETIME NOT NULL,
  `id_usuario` INT NOT NULL,
  `id_musica` INT NOT NULL,
     PRIMARY KEY (`id_usuario`, `id_musica`),
    FOREIGN KEY (`id_usuario`)
    REFERENCES `SpotifyClone`.`Usuario` (`id_usuario`),
    FOREIGN KEY (`id_musica`)
    REFERENCES `SpotifyClone`.`Musica` (`id_musica`)
  )
ENGINE = InnoDB;


 INSERT INTO SpotifyClone.Reproducao (id_usuario, id_musica, data_reproducao)
   VALUES
   (1, 8,'2022-02-28 10:45:55'),
   (1, 2,'2020-05-02 05:30:35'),
   (1, 10,'2020-03-06 11:22:33'),
   (2, 10,'2022-08-05 08:05:17'),
   (2, 7,'2020-01-02 07:40:33'),
   (3, 10,'2020-11-13 16:55:13'),
   (3, 2,'2020-12-05 18:38:30'),
   (4, 8,'2021-08-15 17:10:10'),
   (5, 8,'2022-01-09 01:44:33'),
   (5, 5,'2020-08-06 15:23:43'),
   (6, 7,'2017-01-24 00:31:17'),
   (6, 1,'2017-10-12 12:35:20'),
   (7, 4,'2011-12-15 22:30:49'),
   (8, 4,'2012-03-17 14:56:41'),
   (9, 9,'2022-02-24 21:14:22'),
   (10, 3,'2015-12-13 08:30:22');



-- -----------------------------------------------------
-- Table `SpotifyClone`.`Seguindo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`Seguindo` (
  `id_usuario` INT NOT NULL,
  `id_artista` INT NOT NULL,
   PRIMARY KEY (`id_artista`, `id_usuario`),
    FOREIGN KEY (`id_artista`)
    REFERENCES `SpotifyClone`.`Artista` (`id_artista`),
    FOREIGN KEY (`id_usuario`)
    REFERENCES `SpotifyClone`.`Usuario` (`id_usuario`)
  )
ENGINE = InnoDB;


	INSERT INTO SpotifyClone.Seguindo (id_usuario, id_artista)
VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 3),
(3, 2),
(4, 4),
(5, 5),
(5, 6),
(6, 6),
(6, 1),
(7, 6),
(9, 3),
(10, 2);
