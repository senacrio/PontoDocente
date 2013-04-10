select 
ah.Data,
ah.entrada,
ah.saida,
ah.tipo as atividade,
ah.horasInt ,
 CASE ah.Categoria WHEN 1 THEN 'Fic/Tec' WHEN 2 THEN 'Graduação' WHEN 3 THEN 'Pós-Graduação' WHEN 4 THEN 'EAD' END AS categRel,
 u.Unidade ,
 ah.Area,
 ah.ValorVT
  
 from vwApontamentoHoras ah inner join
   dbo.Parametros AS p ON ah.IdParametro = p.Id INNER JOIN
                      dbo.vwFuncionarioPontoDocente AS f ON ah.Matricula = f.matricula INNER JOIN
                      dbo.vwUnidadePontoDocente AS u ON ah.IdUnidade = u.IdUnidade INNER JOIN
                      dbo.AreaDocente AS a ON ah.Area = a.Id