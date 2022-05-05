-- database SQL
create table grado(
    nid_grado int not null auto_increment primary key,
    desc_grado varchar(30) not null,
    nivel varchar(3) not null
);

create table estudiante(
	nid_estudiante int not null auto_increment primary key,
	nom_estudiante varchar(50) not null,
    ape_pate_estu varchar(50) not null,
    ape_mate_estu varchar(50) not null,
	nid_grado int not null, 
    fecha_naci date not null,
    foto_ruta varchar(255),
    FOREIGN KEY (nid_grado) REFERENCES grado(nid_grado) ON UPDATE CASCADE ON DELETE NO ACTION
);

-- grados
insert into grado(desc_grado,nivel) values ('2 años','INI'),('3 años','INI'), ('4 años','INI'),('5 años','INI'),('Primero','PRI'),('Segundo','PRI'),('Tercero','PRI'),('Cuarto','PRI'),('Quinto','PRI'), ('Sexto','PRI'),('Primero','SEC'),  ('Segundo','SEC'),('Tercero','SEC'),('Cuarto','SEC'),('Quinto','SEC');

-- inserts students 
insert into estudiante (nom_estudiante,ape_pate_estu,ape_mate_estu,nid_grado,fecha_naci , foto_ruta) values ( 'Jair','Flores','Gamarra',3,'2009-02-06','user-default.png');
insert into estudiante (nom_estudiante, ape_pate_estu, ape_mate_estu, nid_grado, fecha_naci,foto_ruta) values ('Teresita', 'Savery', 'Espy', 14, '2012-05-21','user-default.png');
insert into estudiante (nom_estudiante, ape_pate_estu, ape_mate_estu, nid_grado, fecha_naci,foto_ruta) values ('Saloma', 'Bute', 'Jedraszek', 5, '2009-07-06','user-default.png');
insert into estudiante (nom_estudiante, ape_pate_estu, ape_mate_estu, nid_grado, fecha_naci,foto_ruta) values ('Georgiana', 'Breche', 'Gerraty', 6, '2010-06-13','user-default.png');
insert into estudiante (nom_estudiante, ape_pate_estu, ape_mate_estu, nid_grado, fecha_naci,foto_ruta) values ('Micky', 'Shepherdson', 'Marconi', 6, '2010-11-16','user-default.png');
insert into estudiante (nom_estudiante, ape_pate_estu, ape_mate_estu, nid_grado, fecha_naci,foto_ruta) values ('Robin', 'Carlsen', 'Brigshaw', 8, '2014-08-09','user-default.png');
insert into estudiante (nom_estudiante, ape_pate_estu, ape_mate_estu, nid_grado, fecha_naci,foto_ruta) values ('Kerstin', 'Robelow', 'Wem', 7, '2015-01-23','user-default.png');

--- store procedures create or edit persona
USE sistema_escuela;

delimiter $$
CREATE PROCEDURE estudianteAddOrEdit(
    IN _id int,
    IN _nom_estudiante varchar(50),
    IN _ape_pate_estu varchar(50),
    IN _ape_mate_estu varchar(50),
    IN _nid_grado int,
    IN _fecha_naci date,
    IN _foto_ruta varchar(255)
)
begin
    if _id = 0 then
        INSERT into estudiante (nom_estudiante,ape_pate_estu,ape_mate_estu,nid_grado,fecha_naci , foto_ruta)
        VALUES (_nom_estudiante,_ape_pate_estu,_ape_mate_estu,_nid_grado,_fecha_naci , _foto_ruta);
        SET _ID = LAST_INSERT_ID();
    else
        UPDATE estudiante
        SET 
            nom_estudiante = _nom_estudiante,
            ape_pate_estu = _ape_pate_estu, 
            ape_mate_estu = _ape_mate_estu,
            nid_grado = _nid_grado,
            fecha_naci = _fecha_naci,
            foto_ruta = _foto_ruta
        WHERE id = _id;
    end if;
end$$
delimiter ;

