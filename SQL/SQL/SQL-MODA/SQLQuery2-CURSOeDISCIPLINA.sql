USE T_PSales

SELECT *
	FROM Cursos
SELECT *
	FROM CursosAlunos
INSERT INTO Cursos VALUES ('REDES');


SELECT * FROM Disciplinas

INSERT INTO Disciplinas VALUES ('CABEAMENTO', '3');

SELECT Cursos.* , Disciplinas.*
	FROM Cursos
	FULL JOIN Disciplinas
	ON CURSOS.IdCursos = Disciplinas.IdDisciplina

UPDATE Disciplinas
	SET IdCurso = 3
	WHERE Nome = 'REDES';
INSERT INTO Disciplinas (Nome, IdCurso)
	VALUES				('CABEAMENTO' ,  3  );

INSERT INTO Disciplinas (Nome, IdCurso)
	VALUES				('CSS' ,  1  );

SELECT Cursos.Nome , Disciplinas.Nome
	FROM Cursos
	FULL JOIN Disciplinas
	ON CURSOS.IdCursos = Disciplinas.IdDisciplina

DELETE FROM Disciplinas
	WHERE IdCurso = 3




