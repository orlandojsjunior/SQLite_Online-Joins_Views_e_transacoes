-- Consulta 4: Listar os Alunos e as disciplinas em que estão matriculados

SELECT A.Nome_Aluno, D.Nome_Disciplina
FROM Alunos A
JOIN Turma_Alunos TA ON A.ID_Aluno = TA.ID_Aluno
JOIN Turma_Disciplinas TD ON TA.ID_Turma = TD.ID_Turma
JOIN Disciplinas D ON D.ID_Disciplina = TD.ID_Disciplina
ORDER BY A.Nome_Aluno;  -- Acrescentei essa linha para organizar a consulta