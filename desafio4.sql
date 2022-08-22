SELECT u.nome_usuario AS usuario,
IF (YEAR(MAX(r.data_reproducao)) >= 2021, 'Usuário ativo', 'Usuário inativo') AS status_usuario
FROM SpotifyClone.Usuario  AS u
LEFT JOIN  SpotifyClone.Reproducao AS r 
ON u.id_usuario = r.id_usuario
GROUP BY u.nome_usuario
ORDER BY u.nome_usuario;

-- http://www.bosontreinamentos.com.br/mysql/mysql-funcoes-de-agregacao-max-min-avg-count-sum-18/ --
-- ORDER BY  precisa ter uma função de agregação para funcionar -- 
-- https://docs.microsoft.com/pt-br/sql/t-sql/functions/date-and-time-data-types-and-functions-transact-sql?view=sql-server-ver16 --