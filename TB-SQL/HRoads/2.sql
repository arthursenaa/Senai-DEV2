use T_HROADS;

--dql

insert into Classes (Nome) values ('Bárbaro '),('Cruzado'),('Caçadora de Demônios'),('Monge'),('Necromante'),('Feiticeiro'),('Arcanista ')

insert into Habilidades(Nome ,IdTipoHabilidade) values ('Lança Mortal ' , 1),('Escudo Supremo  ' , 2),('Recuperar Vida  ' , 3)

insert into Classes_Habilidades(IdClasse,IdHabilidade) values ( 1,1),( 2,2),( 1,2),( 3,1),( 4,3),( 4,2),( 6,3)

insert into TipoHabilidades(Nome) values ('Ataque'),('Defesa'),('Cura'),('Magia')

insert into Personagens(Nome,Capacidade_maxima_de_vida,Capacidade_maxima_de_mana,DataAtualizacao,DataCriacao,IdClasse)


select * from Habilidades
select * from Classes
select * from TipoHabilidades
select * from Personagens
select * from Classes_Habilidades



