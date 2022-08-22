SELECT ROUND(MIN(valor_plano), 2) AS faturamento_minimo,
ROUND(MAX(valor_plano), 2) AS faturamento_maximo,
ROUND(AVG(valor_plano), 2) AS faturamento_medio,
ROUND(SUM(valor_plano), 2) AS faturamento_total
FROM SpotifyClone.Assinatura AS a
INNER JOIN SpotifyClone.Usuario AS u
ON a.id_assinatura = u.id_assinatura;