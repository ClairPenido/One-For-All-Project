SELECT m.nome_musica AS cancao, COUNT(r.id_musica) AS reproducoes 
FROM SpotifyClone.Musica AS m
INNER JOIN SpotifyClone.Reproducao as r
ON m.id_musica = r.id_musica
GROUP BY r.id_musica
ORDER BY reproducoes DESC, m.nome_musica
LIMIT 2;