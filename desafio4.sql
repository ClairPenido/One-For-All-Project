SELECT u.nome_usuario AS usuario,
IF (YEAR(MAX(r.data_reproducao)) >= '2021', 'Usuário ativo', 'Usuário inativo') AS condicao_usuario
FROM SpotifyClone.Reproducao AS r 
INNER JOIN SpotifyClone.Usuario AS u
ON r.id_usuario = u.id_usuario
GROUP BY usuario
ORDER BY u.nome_usuario;

-- http://www.bosontreinamentos.com.br/mysql/mysql-funcoes-de-agregacao-max-min-avg-count-sum-18/ --
-- ORDER BY  precisa ter uma função de agregação para funcionar -- 
-- https://docs.microsoft.com/pt-br/sql/t-sql/functions/date-and-time-data-types-and-functions-transact-sql?view=sql-server-ver16 --