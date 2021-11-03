CREATE VIEW estatisticas_musicais AS
    SELECT 
        COUNT(ac.cancao_id) AS `cancoes`,
        COUNT(DISTINCT aa.artista_id) AS `artistas`,
        COUNT(DISTINCT aa.album_id) AS `albuns`
    FROM
        SpotifyClone.album_cancao ac
            INNER JOIN
        SpotifyClone.artista_album aa ON ac.album_id = aa.album_id;
