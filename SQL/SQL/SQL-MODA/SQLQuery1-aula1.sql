-- criar banco de dados
CREATE DATABASE T_PSales;

-- COLOCAR BANCO DE DADOS EM USO
USE T_PSales;

-- CRIAR TABELA DE CURSOS
CREATE TABLE Cursos
(	
	--tipo de dados , pk , fk
	IdCursos	INT PRIMARY KEY IDENTITY
	,Nome		VARCHAR(200) NOT NULL UNIQUE
);

-- CRIAR TABELA DE DISCIPLINAS
CREATE TABLE Disciplinas
(
	IdDisciplina	INT PRIMARY KEY IDENTITY
	,Nome			VARCHAR(250) NOT NULL
	,IdCurso		INT FOREIGN KEY REFERENCES Cursos (IdCursos)
);

--CRIAR TABELA DE ALUNOS
CREATE TABLE Alunos
(
	IdAluno			INT PRIMARY KEY IDENTITY
	,Nome			VARCHAR(200) NOT NULL UNIQUE
);

-- CRIAR TABELA INTERMEDI�RIA DE ALUOS E CURSOS (VINCULAR)
CREATE TABLE CursosAlunos
(
	IdCurso		INT FOREIGN KEY REFERENCES Cursos (IdCursos)
	,IdAluno	INT FOREIGN KEY REFERENCES Alunos (IdAluno)
);

--INSERIR REGISTROS
-- insert into NOME_TABELA (colunas) value (valores)
INSERT INTO Cursos(Nome) VALUES ('T�cnico em Dev. Sistemas'); 

INSERT INTO Cursos VALUES ('T�cniuco em Redes');

SELECT	*
	FROM Cursos;	

SELECT *
	FROM Cursos;
	WHERE IdCurso = 1;

--atualiza��o
-- T�cnico em Dev
-- update tabela set qual_coluna = novo_valor condicao
UPDATE Cursos
	SET Nome = 'T�cnico em Desenvolvimento de Sistemas'
	WHERE IdCursos = 1;

INSERT INTO Disciplinas (Nome, IdCurso)
	VALUES				('HTML' ,  1  );

SELECT *
	FROM Disciplinas;

DELETE FROM Cursos
	WHERE IdCursos = 2;


-- CRUD
-- create, read, update, delete
-- insert, select, update, delete