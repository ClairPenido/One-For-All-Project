DROP DATABASE IF EXISTS SpotifyClone;

CREATE SCHEMA IF NOT EXISTS `SpotifyClone` ;
USE `SpotifyClone` ;


CREATE TABLE IF NOT EXISTS `SpotifyClone`.`Usuario` (
  `id_usuario` INT NOT NULL AUTO_INCREMENT,
  `nome_usuario` VARCHAR(45) NOT NULL,
  `idade` INT NOT NULL,
  PRIMARY KEY (`id_usuario`))
ENGINE = InnoDB;


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


CREATE TABLE IF NOT EXISTS `SpotifyClone`.`Artista` (
  `id_artista` INT NOT NULL AUTO_INCREMENT,
  `nome_artista` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_artista`))
ENGINE = InnoDB;


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


CREATE TABLE IF NOT EXISTS `SpotifyClone`.`Reprodução` (
  `id_reprodução` INT NOT NULL AUTO_INCREMENT,
  `data_reprodução` DATETIME NOT NULL,
  `historico_reprodução` VARCHAR(45) NOT NULL,
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

INSERT INTO SpotifyClone.Usuario (nome_usuario, idade)
  VALUES
    ('Barbara Liskov', '82'),
    ('Robert Cecil Martin', '58'),
    ('Ada Lovelace', '37'),
    ('Martin Fowler ', '46'),
    ('Sandi Metz', '58'),
    ('Paulo Freire', '19'),
    ('Bell Hooks', '26'),
    ('Christopher Alexander', '85'),
    ('Judith Butler', '45'),
    ('Jorge Amado ', '58');

    INSERT INTO SpotifyClone.Reprodução (data_reprodução, historico_reprodução)
  VALUES
    ('2022-02-28 10:45:55', 'Samba em Paris'),
    ('2020-05-02 05:30:35', 'VIRGO’S GROOVE'),
    ('2020-03-06 11:22:33', 'Feeling Good'),
    ('2022-08-05 08:05:17', 'Feeling Good'),
    ('2020-01-02 07:40:33', 'O Medo de Amar é o Medo de Ser Livre'),
    ('2020-11-13 16:55:13', 'Feeling Good'),
    ('2020-12-05 18:38:30', 'VIRGO’S GROOVE'),
    ('2021-08-15 17:10:10', 'Samba em Paris'),
    ('2022-01-09 01:44:33', 'Samba em Paris'),
    ('2020-08-06 15:23:43', 'Under Pressure'),
    ('2017-01-24 00:31:17', 'O Medo de Amar é o Medo de Ser Livre'),
    ('2017-10-12 12:35:20', 'BREAK MY SOUL'),
    ('2011-12-15 22:30:49', 'Don’t Stop Me Now'),
    ('2012-03-17 14:56:41', 'Don’t Stop Me Now'),
    ('2022-02-24 21:14:22', 'The Bard’s Song'),
    ('2015-12-13 08:30:22', 'ALIEN SUPERSTAR');

    INSERT INTO SpotifyClone.Assinatura ( plano, data_assinatura, valor_plano )
  VALUES
    ('gratuito', '2019-10-20', '0.00'),
    ('gratuito', '2017-01-06', '0.00'),
    ('familiar', '2017-12-30', '7.99'),
    ('familiar', '2017-12-30', '7.99'),
    ('familiar', '2017-01-17', '7.99'),
    ('familiar', '2018-04-29', '7.99'),
    ('universitário', '2018-02-14', '5.99'),
    ('universitário', '2018-01-05', '5.99'),
    ('pessoal', '2019-06-05', '6.99'),
    ('pessoal', '2020-05-13', '6.99'),
    ('pessoal', '2017-02-17', '6.99');

INSERT INTO SpotifyClone.Album ( nome_album )
  VALUES 
  ('Renaissance'), 
  ('Jazz'),
  ('Hot Space'),
  ('Renaissance'), 
  ('Falso Brilhante'),
  ('Vento de Maio'),
  ('QVVJFA?'), 
  ('Somewhere Far Beyond'),
  ('I Put A Spell On You');

    INSERT INTO SpotifyClone.Musica ( nome_musica, duracao_musica, ano_musica )
  VALUES
    ('BREAK MY SOUL', '279', '2022'),
    ('VIRGO’S GROOVE', '369', '2022'),
    ('ALIEN SUPERSTAR', '116', '2022'),
    ('Don’t Stop Me Now', '203', '1978'),
    ('Under Pressure', '152', '1982'),
    ('Como Nossos Pais', '105', '1998'),
    ('O Medo de Amar é o Medo de Ser Livre', '207', '2001'),
    ('Samba em Paris', '267', '2003'),
    ('The Bard’s Song', '244', '2007'),
    ('Feeling Good', '100', '2012');

       INSERT INTO SpotifyClone.Artista ( nome_artista )
  VALUES
   ('Beyoncé'), 
  ('Queen'),
  ('Elis Regina'),
  ('Baco Exu do Blues'), 
  ('Blind Guardian'),
  ('Nina Simone');
  

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