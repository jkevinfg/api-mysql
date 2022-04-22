create table persona(
	nid_persona int not null auto_increment primary key,
	nom_persona varchar(50) not null,
    ape_pate_pers varchar(50) not null,
    ape_mate_pers varchar(50) not null,
	nid_grado int not null, 
    fecha_naci date not null,
    foto_ruta varchar(255)
);

insert into persona (nom_persona,ape_pate_pers,ape_mate_pers,nid_grado,fecha_naci) values 
    ( 'Jair','Flores','Gamarra','3','1998-02-06');