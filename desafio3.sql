-- https://docs.microsoft.com/pt-br/sql/t-sql/functions/round-transact-sql?view=sql-server-ver16 --
-- ROUND(numeric_expression, length) -- 

SELECT u.nome_usuario AS usuario, COUNT(r.id_usuario) AS qt_de_musicas_ouvidas, ROUND(SUM(duracao_musica)/60, 2) AS total_minutos
 FROM
 SpotifyClone.Usuario AS u
 INNER JOIN SpotifyClone.Reproducao as r
 ON u.id_usuario = r.id_usuario
 INNER JOIN SpotifyClone.Musica as m
 ON r.id_musica = m.id_musica
 GROUP BY u.nome_usuario ASC;