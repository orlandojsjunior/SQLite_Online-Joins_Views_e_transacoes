-- Consulta 2: Retornar o nome e a nota do aluno que possui a melhor nota na disciplina de Matemática

SELECT nome_aluno,
       MAX(nota) AS Melhor_nota
FROM Alunos A
JOIN Notas N ON A.ID_Aluno = N.ID_Aluno
JOIN Disciplinas D ON D.ID_Disciplina = N.ID_Disciplina
WHERE N.ID_Disciplina = 1;

