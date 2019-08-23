CREATE DATABASE T_DPS

USE T_DPS

CREATE TABLE Departamento
(
	IdDepartamento	INT PRIMARY KEY IDENTITY
	,Nome			VARCHAR(100) NOT NULL UNIQUE
);

INSERT INTO Departamento(Nome) VALUES	('RH' ), ('FINANCEIRO' ), ('MARKETING')

CREATE TABLE Funcionarios
(
	IdFuncionario	INT PRIMARY KEY IDENTITY
	,Nome			VARCHAR(100)  NOT NULL UNIQUE
	,Salario		FLOAT  NOT NULL 
	,IdDepartamento	INT FOREIGN KEY REFERENCES Departamento(IdDepartamento)
);

INSERT INTO Funcionarios VALUES	('JOÃO', 1000 , 1) ,('PEDRO', 2575 , 2),('ARTHUR',5000 , 3),('MARIA',4200,2),('MARIANA',2500,1)

CREATE TABLE Habilidade 
(
	IdHabilidade	INT PRIMARY KEY IDENTITY
	,Nome			VARCHAR(1000) NOT  NULL UNIQUE
);

INSERT INTO Habilidade(Nome) VALUES	('Flexibilidade'), ('Iniciativa') , ('Liderança') , ('Empatia.') , ('Persuasão') , ('Trabalho em Equipe') , ('Comunicatividade') , ('Autoconhecimento'),('Autocontrole') 

SELECT * FROM Departamento

SELECT * FROM Funcionarios

select * from Habilidade

SELECT Funcionarios.Nome AS Funcionário , Funcionarios.Salario AS Salário , Departamento.Nome AS Departamento
	FROM Funcionarios
	FULL JOIN Departamento
	ON Funcionarios.IdDepartamento = Departamento.IdDepartamento

CREATE TABLE HabilidadeFuncionario
(
	Funcionario		INT FOREIGN KEY REFERENCES Funcionarios (IdFuncionario)
	,Habilidade		INT FOREIGN KEY REFERENCES Habilidade (IdHabilidade)

);

Drop TABLE HabilidadeFuncionario 

INSERT INTO HabilidadeFuncionario	VALUES (1 , 2) , (2,3) ,(3 ,8),(4,4),(5,3),(1,3),(1,5),(2,9),(5,7),(4,6)

SELECT * FROM HabilidadeFuncionario

SELECT Funcionarios.Nome , Funcionarios.Salario ,HabilidadeFuncionario.* , Habilidade.Nome
	FROM Funcionarios
	RIGHT JOIN HabilidadeFuncionario
	ON Funcionarios.IdFuncionario = HabilidadeFuncionario.Funcionario
	RIGHT JOIN Habilidade
	ON Habilidade.IdHabilidade = HabilidadeFuncionario.Habilidade
