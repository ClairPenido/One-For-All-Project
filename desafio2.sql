SELECT COUNT(DISTINCT id_musica) AS cancoes, COUNT(DISTINCT id_artista) AS artistas, COUNT(DISTINCT ano_album) AS albuns
 FROM SpotifyClone.Musica, SpotifyClone.Artista;
-- ajuda do André + https://pt.stackoverflow.com/questions/262424/column-xxx-in-field-list-is-ambiguous --