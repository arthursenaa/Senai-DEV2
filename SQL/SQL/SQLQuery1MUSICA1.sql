USE T_SStop

SELECT *
	FROM Estilos

SELECT *
	FROM Estilos
	WHERE IdEstilo = 1

SELECT *
	FROM Estilos
	WHERE Nome = 'POP'

SELECT *
	FROM Estilos
	WHERE Nome = 'PO'

SELECT *
	FROM Estilos
	WHERE Nome LIKE 'PO%'

SELECT *
	FROM Estilos
	WHERE Nome LIKE '%OP'

SELECT *
	FROM Estilos
	WHERE Nome LIKE '%A%'

SELECT Artistas.* , Estilos.*
	FROM Artistas
	JOIN Estilos
	ON Artistas.IdGenero = Estilos.IdEstilo

INSERT INTO ARTISTAS (Nome) VALUES ('ARTISTA');

SELECT Artistas.* , Estilos.*
	FROM Artistas
	LEFT JOIN Estilos
	ON Artistas.IdGenero = Estilos.IdEstilo

SELECT Artistas.* , Estilos.*
	FROM Artistas
	RIGHT JOIN Estilos
	ON Artistas.IdGenero = Estilos.IdEstilo

SELECT Artistas.* , Estilos.*
	FROM Artistas
	FULL JOIN Estilos
	ON Artistas.IdGenero = Estilos.IdEstilo

