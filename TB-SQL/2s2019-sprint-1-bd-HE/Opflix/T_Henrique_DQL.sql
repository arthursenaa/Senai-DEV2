--Sele��o - trazer todas as categorias, inclusive as que n�o possuem lan�amentos vinculados;
SELECT * FROM Categorias;
--(?)SELECT * FROM Categorias AS C FULL JOIN Lancamentos AS L ON C.IdCategoria = L.Categoria;

--Sele��o - trazer todas as plataformas, inclusive as que n�o possuem lan�amentos vinculados.
SELECT * FROM Plataformas;
--(?)SELECT * FROM Plataformas AS P FULL JOIN Lancamentos AS L ON P.IdPlataforma = L.Plataforma;





