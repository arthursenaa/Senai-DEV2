CREATE DATABASE T_SStops;

USE T_SStop

--CRIANDO TABELAS--
CREATE TABLE Estilos
(
	IdEstilo	INT PRIMARY KEY IDENTITY
	,Nome		VARCHAR(200) NOT NULL UNIQUE
);
--FIM TABELA 1
CREATE TABLE Artistas
(
	IdArtista	INT PRIMARY KEY IDENTITY
	,Nome		VARCHAR(200) NOT NULL UNIQUE
	,IdGenero	INT FOREIGN KEY REFERENCES Estilos (IdEstilo)
);
--Fim Tabela 2

-- Inserir Dados TABELA 1
INSERT INTO Estilos(Nome) VALUES ('ROCK'),('POP')

SELECT *
	FROM Estilos;

--FIM

--INSERIR DADOS TABELA 2

INSERT INTO Artistas VALUES ('AC/DC' , '1')

SELECT *
	FROM Artistas;

INSERT INTO Artistas VALUES ('Imagine Drag�es' , '1')
INSERT INTO Artistas VALUES ('KPOP' , '2')
INSERT INTO Artistas VALUES ('Madonna' , '2')
--Fim--