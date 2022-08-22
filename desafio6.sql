SELECT MIN(valor_plano) as faturamento_minimo,
ROUND(MAX(valor_plano), 2) as faturamento_maximo,
ROUND(AVG(valor_plano), 2) as faturamento_medio,
ROUND(SUM(valor_plano), 2) as faturamento_total
FROM SpotifyClone.Assinatura AS a
INNER JOIN SpotifyClone.Usuario as u
ON a.id_assinatura = u.id_assinatura;