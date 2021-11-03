CREATE VIEW top_2_hits_do_momento AS
    SELECT 
        c.cancao AS `cancao`, COUNT(hr.usuario_id) AS `reproducoes`
    FROM
        SpotifyClone.cancoes c
            INNER JOIN
        SpotifyClone.historico_de_reproducoes hr ON c.cancao_id = hr.cancao_id
    GROUP BY c.cancao
    ORDER BY COUNT(hr.usuario_id) DESC , c.cancao ASC
    LIMIT 2;
    