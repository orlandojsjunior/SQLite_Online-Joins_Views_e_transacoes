-- Consulta 5: Criar uma view que apresenta o nome, a disciplina e a nota dos alunos

CREATE VIEW Alunos_Disciplina_Nota AS
SELECT A.Nome_Aluno,
       D.Nome_Disciplina,
       N.Nota
FROM Alunos A
JOIN Notas N ON A.ID_Aluno = N.ID_Aluno
JOIN Disciplinas D ON N.ID_Disciplina = D.ID_Disciplina
ORDER BY A.Nome_Aluno; -- Acrescentei essa linha para organizar a consulta

SELECT * FROM Alunos_Disciplina_Nota;

