CREATE VIEW top_3_artistas AS
    SELECT 
        a.artista AS `artista`, COUNT(sa.usuario_id) AS `seguidores`
    FROM
        SpotifyClone.artistas a
            INNER JOIN
        SpotifyClone.seguindo_artistas sa ON a.artista_id = sa.artista_id
    GROUP BY a.artista
    ORDER BY COUNT(sa.usuario_id) DESC , a.artista ASC
    LIMIT 3;
