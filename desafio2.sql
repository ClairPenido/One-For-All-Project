SELECT COUNT( m.id_musica ) AS cancoes,
COUNT( ar.id_artista ) AS artistas,
COUNT( al.ano_album ) AS albuns
FROM SpotifyClone.Artista AS ar
INNER JOIN SpotifyClone.Album AS al
ON ar.id_artista = al.id_artista
INNER JOIN SpotifyClone.Musica as m
ON al.id_album = m.id_album;

-- https://pt.stackoverflow.com/questions/262424/column-xxx-in-field-list-is-ambiguous --