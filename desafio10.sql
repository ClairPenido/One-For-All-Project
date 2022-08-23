SELECT m.nome_musica as nome, COUNT(r.id_usuario) as reproducoes
FROM SpotifyClone.Musica AS m
INNER JOIN SpotifyClone.Reproducao AS r
ON m.id_musica = r.id_musica
INNER JOIN SpotifyClone.Usuario AS u
ON u.id_usuario = r.id_usuario
INNER JOIN SpotifyClone.Assinatura AS a
ON a.id_assinatura = u.id_assinatura
WHERE plano IN ('gratuito', 'pessoal')
GROUP BY nome ASC;
