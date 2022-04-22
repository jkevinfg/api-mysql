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

create table movimiento(
	id_movimiento int not null auto_increment primary key,
	tipo_movimiento varchar(20) not null,
    monto decimal not null,
    estado varchar(20) not null,
	fecha_pago timestamp not null, 
    id_persona int not null,
    id_detalle_cronograma int not null,
    FOREIGN KEY (id_persona) REFERENCES persona(nid_persona) ON UPDATE CASCADE ON DELETE NO ACTION,
    FOREIGN KEY (id_detalle_cronograma) REFERENCES detalle_cronograma(id_detalle_cronograma) ON UPDATE CASCADE ON DELETE NO ACTION
);

create table detalle_cronograma(
	id_detalle_cronograma int not null primary key,
    id_cronograma int not null,
    desc_pension varchar(50) not null,
    monto decimal not null,
    fecha_venci date not null,
    id_grado int not null,
    FOREIGN KEY (id_cronograma) REFERENCES cronograma(id_cronograma) ON UPDATE CASCADE ON DELETE NO ACTION
);

create table cronograma(
    id_cronograma int not null primary key,
    year int not null
)

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
