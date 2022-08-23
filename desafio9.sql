SELECT COUNT(id_musica) AS quantidade_musicas_no_historico
FROM SpotifyClone.Usuario AS u
INNER JOIN SpotifyClone.Reproducao AS r
ON u.id_usuario = r.id_usuario
WHERE u.nome_usuario = "Barbara Liskov";