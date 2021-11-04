CREATE VIEW cancoes_premium AS
    SELECT 
        c.cancao AS `nome`,
        COUNT(DISTINCT u.usuario_id) AS `reproducoes`
    FROM
        SpotifyClone.cancoes c
            INNER JOIN
        SpotifyClone.historico_de_reproducoes hr ON c.cancao_id = hr.cancao_id
            INNER JOIN
        SpotifyClone.usuarios u ON hr.usuario_id = u.usuario_id
            INNER JOIN
        SpotifyClone.planos p ON u.plano_id = p.plano_id
    WHERE
        p.plano_id IN (2 , 3)
    GROUP BY `nome`
    ORDER BY `nome` ASC;
