DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

DROP TABLE IF EXISTS `artistas`;
CREATE TABLE `artistas` (
    artista_id INT NOT NULL PRIMARY KEY,
    artista VARCHAR(100) NOT NULL
)  ENGINE=INNODB;

DROP TABLE IF EXISTS `albuns`;
CREATE TABLE albuns (
    album_id INT NOT NULL PRIMARY KEY,
    album VARCHAR(100) NOT NULL,
    artista_id INT NOT NULL,
    FOREIGN KEY (artista_id)
        REFERENCES SpotifyClone.artistas (artista_id)    
)  ENGINE=INNODB;

DROP TABLE IF EXISTS `cancoes`;
CREATE TABLE `cancoes` (
    cancao_id INT NOT NULL PRIMARY KEY,
    cancao VARCHAR(100) NOT NULL,
    album_id INT NOT NULL,
    FOREIGN KEY (album_id)
        REFERENCES SpotifyClone.albuns (album_id) 
)  ENGINE=INNODB;

DROP TABLE IF EXISTS `planos`;
CREATE TABLE `planos` (
    plano_id INT NOT NULL PRIMARY KEY,
    plano VARCHAR(100) NOT NULL,
    valor_plano DECIMAL(10 , 2 ) NOT NULL
)  ENGINE=INNODB;

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
    usuario_id INT NOT NULL PRIMARY KEY,
    usuario VARCHAR(100) NOT NULL,
    idade INT NOT NULL,
    plano_id INT NOT NULL,
    FOREIGN KEY (plano_id)
        REFERENCES SpotifyClone.planos (plano_id)
)  ENGINE=INNODB;

DROP TABLE IF EXISTS `artista_album`;
CREATE TABLE `artista_album` (
    artista_id INT NOT NULL,
    album_id INT NOT NULL,
    CONSTRAINT artista_album_pk PRIMARY KEY (artista_id , album_id),
    CONSTRAINT FK_artista_aa FOREIGN KEY (artista_id)
        REFERENCES SpotifyClone.artistas (artista_id),
    CONSTRAINT FK_album_aa FOREIGN KEY (album_id)
        REFERENCES SpotifyClone.albuns (album_id)
)  ENGINE=INNODB;

DROP TABLE IF EXISTS `seguindo_artistas`;
CREATE TABLE seguindo_artistas (
    usuario_id INT NOT NULL,
    artista_id INT NOT NULL,
    CONSTRAINT usuario_artista_pk PRIMARY KEY (usuario_id , artista_id),
    CONSTRAINT FK_usuario_sa FOREIGN KEY (usuario_id)
        REFERENCES SpotifyClone.usuarios (usuario_id),
    CONSTRAINT FK_artista_sa FOREIGN KEY (artista_id)
        REFERENCES SpotifyClone.artistas (artista_id)
)  ENGINE=INNODB;

DROP TABLE IF EXISTS `historico_de_reproducoes`;
CREATE TABLE historico_de_reproducoes (
    usuario_id INT NOT NULL,
    cancao_id INT NOT NULL,
    CONSTRAINT usuario_cancao_pk PRIMARY KEY (usuario_id , cancao_id),
    CONSTRAINT FK_usuario_hr FOREIGN KEY (usuario_id)
        REFERENCES SpotifyClone.usuarios (usuario_id),
    CONSTRAINT FK_cancao_hr FOREIGN KEY (cancao_id)
        REFERENCES SpotifyClone.cancoes (cancao_id)
)  ENGINE=INNODB;

DROP TABLE IF EXISTS `album_cancao`;
CREATE TABLE album_cancao (
    album_id INT NOT NULL,
    cancao_id INT NOT NULL,
    CONSTRAINT album_cancao_pk PRIMARY KEY (album_id , cancao_id),
    CONSTRAINT FK_albuns_ac FOREIGN KEY (album_id)
        REFERENCES SpotifyClone.albuns (album_id),
    CONSTRAINT FK_cancao_ac FOREIGN KEY (cancao_id)
        REFERENCES SpotifyClone.cancoes (cancao_id)
)  ENGINE=INNODB;

  
INSERT INTO artistas (artista_id, artista)
VALUES
  (1, 'Walter Phoenix'),
  (2, 'Peter Strong'),
  (3, 'Lance Day'),
  (4, 'Freedie Shannon');
  
  INSERT INTO albuns (album_id, album, artista_id)
VALUES
  (1, 'Envious', 1),
  (2, 'Exuberant', 1),
  (3, 'Hallowed Steam', 2),
  (4, 'Incandescent', 3),
  (5, 'Temporary Culture', 4);

INSERT INTO cancoes (cancao_id, cancao, album_id)
VALUES
  (1, 'Soul For Us', 1),
  (2, 'Reflections Of Magic', 1),
  (3, 'Dance With Her Own', 1),
  (4, 'Troubles Of My Inner Fire', 2),
  (5, 'Time Fireworks', 2),
  (6, 'Magic Circus', 3),
  (7, 'Honey, So Do I', 3),
  (8, "Sweetie, Let's Go Wild", 3),
  (9, 'She Knows', 3),
  (10, 'Fantasy For Me', 4),
  (11, 'Celebration Of More', 4),
  (12, 'Rock His Everything', 4),
  (13, 'Home Forever', 4),
  (14, 'Diamond Power', 4),
  (15, "Honey, Let's Be Silly", 4),
  (16, "Thang Of Thunder", 3),
  (17, 'Words Of Her Life', 3),
  (18, 'Without My Streets', 3);
  
INSERT INTO planos (plano_id, plano, valor_plano)
VALUES
  (1, 'gratuito', '0'),
  (2, 'familiar', '7.99'),
  (3, 'universitario', '5.99');
  
INSERT INTO usuarios (usuario_id, usuario, idade, plano_id)
VALUES
  (1, 'Thati', '23', 1),
  (2, 'Cintia', '35', 2),
  (3, 'Bill', '20', 3),
  (4, 'Roger', '45', 1);
  
INSERT INTO artista_album (artista_id, album_id)
VALUES
  (1, 1),
  (1, 2),
  (2, 3),
  (3, 4),
  (4, 5);

INSERT INTO seguindo_artistas (usuario_id, artista_id)
VALUES
  (1, 1),
  (1, 4),
  (1, 3),
  (2, 1),
  (2, 3),
  (3, 2),
  (3, 1),
  (4, 4);
  
INSERT INTO historico_de_reproducoes (usuario_id, cancao_id)
VALUES
  (1, 1),
  (1, 6),
  (1, 14),
  (1, 16),
  (2, 13),
  (2, 17),
  (2, 2),
  (2, 15),
  (3, 4),
  (3, 16),
  (3, 6),
  (4, 3),
  (4, 18),
  (4, 11);

INSERT INTO album_cancao (album_id, cancao_id)
VALUES
  (1, 1),
  (1, 2),
  (1, 3),
  (2, 4),
  (2, 5),
  (3, 6),
  (3, 7),
  (3, 8),
  (3, 9),
  (4, 10),
  (4, 11),
  (4, 12),
  (4, 13),
  (4, 14),
  (4, 15),
  (5, 16),
  (5, 17),
  (5, 18);
