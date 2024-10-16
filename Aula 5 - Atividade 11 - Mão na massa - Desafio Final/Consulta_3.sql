-- Consulta 3: Identificar o total de alunos por turma

SELECT nome_turma,
       COUNT(TA.ID_Turma) Total_alunos
FROM Turmas T
JOIN Turma_Alunos TA ON T.ID_Turma = TA.ID_Turma
GROUP BY nome_turma;