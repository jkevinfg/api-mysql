-- database SQL
create table grado(
    nid_grado int not null auto_increment primary key,
    desc_grado varchar(30) not null,
    nivel varchar(3) not null
);

create table persona(
	nid_persona int not null auto_increment primary key,
	nom_persona varchar(50) not null,
    ape_pate_pers varchar(50) not null,
    ape_mate_pers varchar(50) not null,
	nid_grado int not null, 
    fecha_naci date not null,
    foto_ruta varchar(255),
    FOREIGN KEY (nid_grado) REFERENCES grado(nid_grado) ON UPDATE CASCADE ON DELETE NO ACTION
);

-- grados
insert into grado(desc_grado,nivel) values ('2 años','INI'),('3 años','INI'), ('4 años','INI'),('5 años','INI'),('Primero','PRI'),('Segundo','PRI'),('Tercero','PRI'),('Cuarto','PRI'),('Quinto','PRI'), ('Sexto','PRI'),('Primero','SEC'),  ('Segundo','SEC'),('Tercero','SEC'),('Cuarto','SEC'),('Quinto','SEC');

-- inserts students 
insert into persona (nom_persona,ape_pate_pers,ape_mate_pers,nid_grado,fecha_naci , foto_ruta) values ( 'Jair','Flores','Gamarra',3,'2009-02-06','src/uploads/foto/user-default.png');
insert into persona (nom_persona, ape_pate_pers, ape_mate_pers, nid_grado, fecha_naci,foto_ruta) values ('Teresita', 'Savery', 'Espy', 14, '2012-05-21','src/uploads/foto/user-default.png');
insert into persona (nom_persona, ape_pate_pers, ape_mate_pers, nid_grado, fecha_naci,foto_ruta) values ('Saloma', 'Bute', 'Jedraszek', 5, '2009-07-06','src/uploads/foto/user-default.png');
insert into persona (nom_persona, ape_pate_pers, ape_mate_pers, nid_grado, fecha_naci,foto_ruta) values ('Georgiana', 'Breche', 'Gerraty', 6, '2010-06-13','src/uploads/foto/user-default.png');
insert into persona (nom_persona, ape_pate_pers, ape_mate_pers, nid_grado, fecha_naci,foto_ruta) values ('Micky', 'Shepherdson', 'Marconi', 6, '2010-11-16','src/uploads/foto/user-default.png');
insert into persona (nom_persona, ape_pate_pers, ape_mate_pers, nid_grado, fecha_naci,foto_ruta) values ('Robin', 'Carlsen', 'Brigshaw', 8, '2014-08-09','src/uploads/foto/user-default.png');
insert into persona (nom_persona, ape_pate_pers, ape_mate_pers, nid_grado, fecha_naci,foto_ruta) values ('Kerstin', 'Robelow', 'Wem', 7, '2015-01-23','src/uploads/foto/user-default.png');

--- store procedures create persona
USE school;

delimiter //
CREATE PROCEDURE personaAddOrEdit(
    IN _nom_persona varchar(50),
    IN _ape_pate_pers varchar(50),
    IN _ape_mate_pers varchar(50),
    IN _nid_grado int,
    IN _fecha_naci date,
    IN _foto_ruta varchar(255)
)
begin
    INSERT into persona (nom_persona,ape_pate_pers,ape_mate_pers,nid_grado,fecha_naci , foto_ruta)
    VALUES (_nom_persona,_ape_pate_pers,_ape_mate_pers,_nid_grado,_fecha_naci , _foto_ruta);
end//
delimiter ;

