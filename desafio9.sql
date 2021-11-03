DELIMITER $$
CREATE PROCEDURE albuns_do_artista(IN `nome` VARCHAR(100))
BEGIN
SELECT ar.artista AS `artista`, al.album AS `album`
FROM SpotifyClone.artistas ar
INNER JOIN SpotifyClone.albuns al
ON ar.artista_id = al.artista_id
WHERE ar.artista LIKE CONCAT('%', `nome`, '%')
ORDER BY al.album ASC;
END $$
DELIMITER ;
