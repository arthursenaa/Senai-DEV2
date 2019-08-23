CREATE DATABASE T_Opflix;
USE T_Opflix;
CREATE TABLE PerfisUsuarios (
	IdPerfil INT PRIMARY KEY IDENTITY NOT NULL,
	Tipo VARCHAR(15) NOT NULL UNIQUE
);
CREATE TABLE Usuarios (
	IdUsuario INT PRIMARY KEY IDENTITY NOT NULL,
	Tipo INT FOREIGN KEY REFERENCES PerfisUsuarios(IdPerfil) NOT NULL,
	Nome TEXT NOT NULL,
	Email VARCHAR(255) UNIQUE NOT NULL,
	Senha VARCHAR(28) NOT NULL
);
CREATE TABLE FotosUsuarios (
	IdUsuario INT FOREIGN KEY REFERENCES Usuarios(IdUsuario) NOT NULL,
	Imagem VARBINARY(MAX) 
);
CREATE TABLE Categorias(
	IdCategoria INT PRIMARY KEY IDENTITY NOT NULL,
	Nome TEXT NOT NULL,
	Descricao TEXT NOT NULL
);
CREATE TABLE UsuariosCategorias(
	IdUsuario INT FOREIGN KEY REFERENCES Usuarios(IdUsuario) NOT NULL,
	IdCategoria INT FOREIGN KEY REFERENCES Categorias(IdCategoria)
);
CREATE TABLE Plataformas(
	IdPlataforma INT PRIMARY KEY IDENTITY NOT NULL,
	Nome VARCHAR(255) NOT NULL UNIQUE
);
CREATE TABLE FormatosLancamentos(
	IdFormatoLancamento INT PRIMARY KEY IDENTITY NOT NULL,
	Nome VARCHAR(255) NOT NULL
);
CREATE TABLE Lancamentos(
	IdLancamento INT PRIMARY KEY IDENTITY NOT NULL,
	Titulo VARCHAR(255) NOT NULL,
	Sinopse TEXT,
	Categoria INT NOT NULL FOREIGN KEY REFERENCES Categorias(IdCategoria),
	Duracao SMALLINT NOT NULL,
	Formato INT FOREIGN KEY REFERENCES FormatosLancamentos(IdFormatoLancamento),
	Estreia DATE NOT NULL,
	QtdEpisodios INT DEFAULT 1 NOT NULL,
	Plataforma INT FOREIGN KEY REFERENCES Plataformas(IdPlataforma)
);
CREATE TABLE LancamentosUsuarios(
	IdUsuario INT FOREIGN KEY REFERENCES Usuarios(IdUsuario) NOT NULL,
	IdLancamento INT FOREIGN KEY REFERENCES Lancamentos(IdLancamento)
);
ALTER TABLE Lancamentos ADD Visivel Bit DEFAULT 0;

---FUNCTIONS, PROCEDURES AND VIEWS
--INSERIR IMAGEM
GO
CREATE PROCEDURE InserirImagem
@IdUsuario INT , @CodigoImagem VARCHAR(255)
AS BEGIN
INSERT INTO FotosUsuarios(IdUsuario , Imagem) VALUES (@IdUsuario , CONVERT(VARBINARY(MAX) , @CodigoImagem))
END

-- 1.	O administrador poder� cadastrar qualquer tipo de usu�rio (administrador ou cliente);
GO
CREATE PROCEDURE InserirUsuario
@IdAdmin INT , @Tipo INT , @Nome TEXT , @Email VARCHAR(255) , @Senha VARCHAR(28)
AS BEGIN
DECLARE @Adm INT
SELECT @Adm=Tipo FROM Usuarios WHERE Usuarios.IdUsuario = @IdAdmin;
IF @IdAdmin = 2
INSERT INTO Usuarios (Tipo , Nome , Email , Senha) VALUES (@Tipo , @Nome , @Email , @Senha)
END

-- 2.	O administrador poder� cadastrar categorias (contendo nome);
GO
CREATE PROCEDURE CadastrarCategoria @IdAdmin INT , @Nome TEXT , @Descricao TEXT
AS BEGIN
DECLARE @Adm INT
SELECT @Adm=Tipo FROM Usuarios WHERE Usuarios.IdUsuario = @IdAdmin;
IF @IdAdmin = 2
INSERT INTO Categorias(Nome , Descricao) VALUES (@Nome , @Descricao)
END

-- 3.	O administrador poder� cadastrar o lan�amento de um filme/s�rie
GO
CREATE PROCEDURE CadastrarLancamento
@IdAdmin INT , @Titulo VARCHAR(255), @Sinopse TEXT , @Categoria INT , @Duracao SMALLINT , @Formato INT , @Estreia DATE , @QtdEpisodios INT , @Plataforma INT 
AS BEGIN
DECLARE @Adm INT
SELECT @Adm=Tipo FROM Usuarios WHERE Usuarios.IdUsuario = @IdAdmin;
IF @IdAdmin = 2
INSERT INTO Lancamentos(Titulo , Sinopse , Categoria , Duracao , Formato , Estreia , QtdEpisodios , Plataforma) 
VALUES (@Titulo , @Sinopse , @Categoria , @Duracao , @Formato , @Estreia , @QtdEpisodios , @Plataforma)
END
-- 4.	O cliente poder� visualizar todos os lan�amentos publicados;
GO
CREATE VIEW VerLancamentos
AS
SELECT * FROM Lancamentos;
GO
-- 1.	O administrador poder� alterar categorias;
--ALTERAR NOME E DESCRI��O
GO
CREATE PROCEDURE AlterarCategoria
@IdAdmin INT , @IdCategoria INT , @NovoNome TEXT , @NovaDescricao TEXT
AS BEGIN
DECLARE @Adm INT
SELECT @Adm=Tipo FROM Usuarios WHERE Usuarios.IdUsuario = @IdAdmin;
IF @IdAdmin = 2
UPDATE Categorias SET Nome = @NovoNome , Descricao = @NovaDescricao WHERE Categorias.IdCategoria = @IdCategoria; 
END
--ALTERAR NOME
GO
CREATE PROCEDURE AlterarNomeCategoria
@IdAdmin INT , @IdCategoria INT , @NovoNome TEXT
AS BEGIN
DECLARE @Adm INT
SELECT @Adm=Tipo FROM Usuarios WHERE Usuarios.IdUsuario = @IdAdmin;
IF @IdAdmin = 2
UPDATE Categorias SET Nome = @NovoNome WHERE Categorias.IdCategoria = @IdCategoria; 
END
--ALTERAR DESCRI��O
GO
CREATE PROCEDURE AlterarDescricaoCategoria
@IdAdmin INT , @IdCategoria INT , @NovaDescricao TEXT
AS BEGIN
DECLARE @Adm INT
SELECT @Adm=Tipo FROM Usuarios WHERE Usuarios.IdUsuario = @IdAdmin;
IF @IdAdmin = 2
UPDATE Categorias SET Descricao = @NovaDescricao WHERE Categorias.IdCategoria = @IdCategoria; 
END
-- 2.	O administrador poder� alterar os lan�amentos;
--ALTERAR TODOS OS CAMPOS
GO
CREATE PROCEDURE AlterarLancamentos
@IdAdmin INT , @IdLancamento INT , @Titulo VARCHAR(255), @Sinopse TEXT , @Categoria INT , @Duracao SMALLINT , @Formato INT , @Estreia DATE , @QtdEpisodios INT , @Plataforma INT
AS BEGIN
DECLARE @Adm INT
SELECT @Adm=Tipo FROM Usuarios WHERE Usuarios.IdUsuario = @IdAdmin;
IF @IdAdmin = 2
UPDATE Lancamentos SET Titulo = @Titulo , Sinopse = @Sinopse , Categoria = @Categoria , Duracao = @Duracao , Formato = @Formato , Estreia = @Estreia , QtdEpisodios = @QtdEpisodios , Plataforma = @Plataforma WHERE Lancamentos.IdLancamento = @IdLancamento; 
END

--ALTERAR PLATAFORMA DE LANCAMENTO
GO
CREATE PROCEDURE AlterarLancamentosPlataforma
@IdAdmin INT , @IdLancamento INT ,  @Plataforma INT
AS BEGIN
SELECT Tipo  FROM Usuarios WHERE Usuarios.IdUsuario = @IdAdmin;
IF @IdAdmin = 2
UPDATE Lancamentos SET Plataforma = @Plataforma WHERE Lancamentos.IdLancamento = @IdLancamento; 
END
--TODO : FAZER AS "SOBRECARGAS" PARA CADA CAMPO DE LANCAMENTO

-- 3.	O administrador poder� cadastrar plataformas 
GO
CREATE PROCEDURE CadastrarPlataforma
@IdAdmin INT , @Nome VARCHAR(255)
AS BEGIN
DECLARE @Adm INT
SELECT @Adm=Tipo FROM Usuarios WHERE Usuarios.IdUsuario = @IdAdmin;
IF @IdAdmin = 2
INSERT INTO Plataformas(Nome) VALUES (@Nome);
END

--2.	O cliente poder� realizar a ordena��o por data de lan�amento e/ou categoria;
GO
CREATE PROCEDURE ListarFilmesCategoria
@IdAdmin INT , @Categoria TEXT
AS BEGIN
DECLARE @Adm INT
SELECT @Adm=Tipo FROM Usuarios WHERE Usuarios.IdUsuario = @IdAdmin;
IF @IdAdmin = 2
SELECT * FROM Lancamentos AS L JOIN Categorias AS C ON C.Nome LIKE  @Categoria AND L.Categoria LIKE @Categoria ORDER BY L.Categoria ASC
END

GO
CREATE PROCEDURE ListarFilmesEstreia
@Estreia TEXT
AS BEGIN
SELECT * FROM Lancamentos ORDER BY Lancamentos.Estreia ASC
END

-- 5.	O cliente poder� selecionar somente por m�s de lan�amento;
GO
CREATE PROCEDURE ListarFilmesMesEstreia
@MesEstreia TEXT
AS BEGIN
SELECT * FROM Lancamentos WHERE ((MONTH(Lancamentos.Estreia) = @MesEstreia)) ORDER BY Lancamentos.Estreia ASC
END

-- 6.	O cliente poder� favoritar um filme/s�rie;
GO
CREATE PROCEDURE FavoritarLancamento
@IdUsuario INT , @IdLancamento INT
AS BEGIN
INSERT INTO LancamentosUsuarios(IdUsuario , IdLancamento) VALUES (@IdUsuario , @IdLancamento)
END

-- 2.	Os usu�rios poder�o filtrar por plataforma/m�dia/g�nero;
