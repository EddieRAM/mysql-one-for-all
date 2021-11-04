USE SpotifyClone;
DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico(usuario_input VARCHAR(100))
RETURNS INT READS SQL DATA
BEGIN
    DECLARE cancoes_total INT;
    SELECT COUNT(DISTINCT hr.cancao_id)
    FROM SpotifyClone.historico_de_reproducoes hr
    INNER JOIN 
    SpotifyClone.usuarios u
    ON hr.usuario_id = u.usuario_id
    WHERE u.usuario_id LIKE CONCAT('%', `usuario_input`, '%') INTO cancoes_total;
    
    RETURN cancoes_total;
END $$

DELIMITER ;
