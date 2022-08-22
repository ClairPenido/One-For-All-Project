SELECT ar.nome_artista as artista,
al.nome_album as album,
COUNT(s.id_artista) as seguidores
FROM SpotifyClone.Album as al 
INNER JOIN SpotifyClone.Artista as ar
ON ar.id_artista = al.id_artista
INNER JOIN SpotifyClone.Seguindo as s
ON al.id_artista = s.id_artista
GROUP BY al.nome_album, ar.nome_artista
ORDER BY seguidores DESC, nome_artista, nome_album;