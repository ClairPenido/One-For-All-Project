SELECT COUNT(DISTINCT m.id_musica) AS cancoes,
COUNT(DISTINCT ar.id_artista) AS artistas,
COUNT(DISTINCT al.id_album) AS albuns
FROM SpotifyClone.Artista AS ar
INNER JOIN SpotifyClone.Album AS al
ON ar.id_artista = al.id_artista
INNER JOIN SpotifyClone.Musica AS m
ON al.id_album = m.id_album;
