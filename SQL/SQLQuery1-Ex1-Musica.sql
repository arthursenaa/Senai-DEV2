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

INSERT INTO Artistas VALUES ('Imagine Dragões' , '1')
							,('KPOP' , '2')
							,('Madonna' , '2')
--Fim--
UPDATE Estilos
	SET Nome = 'METAL'
	WHERE IdEstilo = 1;
