SELECT nome_artista as artista, nome_album as album
FROM SpotifyClone.Artista as ar
INNER JOIN SpotifyClone.Album as al
ON ar.id_artista = al.id_artista
WHERE ar.nome_artista = 'Elis Regina';