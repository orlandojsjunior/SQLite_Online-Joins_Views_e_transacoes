-- Consulta 1: Buscar o nome do professor e a turma que ele é orientador.

SELECT nome_professor,
       nome_turma
FROM professores p
JOIN turmas t ON p.ID_Professor = t.ID_Professor_Orientador;

