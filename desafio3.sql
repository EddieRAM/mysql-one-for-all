CREATE VIEW historico_reproducao_usuarios AS
    SELECT 
        u.usuario AS `usuario`, c.cancao AS `nome`
    FROM
        SpotifyClone.usuarios u
            INNER JOIN
        SpotifyClone.historico_de_reproducoes hr ON u.usuario_id = hr.usuario_id
            INNER JOIN
        SpotifyClone.cancoes c ON hr.cancao_id = c.cancao_id
    ORDER BY u.usuario , c.cancao;
