/*
	Empresa        :  MUCHO SOFTWARE
	Proyecto	   :  CONDOSOFT
	Grupo		   :  TECNOSOFTWARE
	Software       :  Sistema de Administración de Condominio
	DBMS           :  MySQL	
	Herramienta    :  Spring Framework.
	Script         :  Insertar datos en las tablas de la base de datos.	
	Integrantes	   :  Oria Bastos Jesús Caleb
					  Arbieto Chávez Julio César
					  Salazar Perez José Luis
					  Breña Taipe Emiliano
					  Muñoz Sosaya Jhoel
	Email          :  almostperfect557@gmail.com
	Creado el      :  23-AGO-2017
	Actualizada    :  04-SEP-2017  
*/
use Condominio;
set names "utf8";
insert into edificio (nombre,nro_pisos,descripcion,estado) values 
	('Santa Catalina de Los Santos', 15, "Pequena descripcion del edificio" ,1),
	('San Cristobal', 15, "Descripcion del edificio" ,1),
	('Carolaina', 15, "Ha sucedido un incendio en este edificio por la cual no estara disponible." ,0),
	('San Francisco', 15, "El edificio más moderno del condominio" ,1)
;
insert into persona (nombres,ape_pat,ape_mat,dni,estado) values
	('Jesus Caleb', 'Oria', 'Bastos', 73686541, 1),
	('Carmen', 'Ruiz', 'Ramirez', 12865241, 1),
	('Gabriel', 'Martinez', 'Zapata', 35686541, 1),
	('Fray', 'Celis', 'Hualpa', 66546516, 0),	
	('Renzo', 'Montenegro', 'Montenegro', 25686549, 0)
;
insert into evento (id_persona,nombre,descripcion,estado) values
	(1,'Compartir de la familia Oria', 'Un compartir organizada por la familia Oria', 1),
	(1,'Asamblea', 'Una reunion organizada por el gerente', 1),
	(2,'Fiesta de cumpleaños de Juanito', 'Una fiesta organizada por la familia Gutierrez', 1),
	(3,'Compartir de la familia Zapata', 'Un compartir organizada por la familia Zapata', 1),
	(4,'Clase de aerobicos', 'Clases realizadas por la familia Lopez ', 1),
	(5,'Fiesta a la familia Perez', 'Un compartir organizada por la familia Sanchez', 1)
;
insert into movimiento (tipo, monto,descripcion,fecha,estado) values 
	('Ingreso', 25.00, 'Mantenimiento a la bomba de agua', '15-05-2017', 1),
	('Gasto', 25.00, 'Servicio de energia electrica', '14-11-2014', 0),
	('Gasto', 27.00, 'Servicio de agua', '23-01-2015', 1),
	('Ingreso', 30.00, 'Limpieza del auditorio', '14-06-2016', 1),
	('Gasto', 21.00, 'Mantenimiento al ascensor', '15-05-2017', 1),
	('Ingreso', 24.00, 'Mantenimiento a la bomba de agua', '15-05-2017', 1)
;
insert into inmueble (id_edificio,nombre,nro_piso,descripcion,estado) values
	(1,'Departamento', 12, 'Descripcion del departamento', 1),
	(1,'Oficina', 12, 'Descripcion de la oficina', 1),
	(1,'Cochera', 1, 'Descripcion de la cochera', 1),
	(2,'Departamento', 12, 'Departamento de la familia Oria', 1),
	(2,'Cochera', 1, 'Descripcion de la cochera', 1),
	(3,'Oficina', 12, 'Descripcion de la oficina', 1),
	(3,'Departamento', 12, 'Descripcion del departamento', 1),
	(4,'Oficina', 12, 'Descripcion de la oficina', 1),
	(4,'Departamento', 12, 'Descripcion del departamento', 0),
	(4,'Oficina', 12, 'Descripcion de la oficina', 0)
;
insert into propietario (id_persona,id_inmueble,fec_ini,fec_fin,estado) values
	(1,1,'01-01-2017', '',1),
	(1,1,'21-03-2015', '',1),
	(1,1,'22-04-2016', '',1),
	(2,2,'02-04-2016', '',1),
	(2,2,'09-02-2015', '',1),
	(3,2,'12-06-2015', '15-08-2016',0),
	(3,3,'16-09-2016', '',1),
	(4,4,'16-09-2016', '',1),
	(4,5,'16-09-2016', '',1),
	(5,5,'16-09-2016', '22-12-2016',0)
;
insert into visita (id_edificio,nro_piso,nombres,ape_pat,ape_mat,dni,fecha,hora) values
	(1,12,'Diego Aaron', 'Oria', 'Bastos', 73686331,'2017-22-08','13:45:00'),
	(3,10,'Jose Luis', 'Perez', 'Godinez', 54138124,'2015-11-03','15:45:00'),
	(1,12,'Diego Aaron', 'Oria', 'Bastos', 12612331,'2016-29-11','12:15:00'),
	(2,08,'Elmer', 'Dario', 'Paredes', 54686331,'2015-11-08','10:45:00'),
	(4,11,'Ana', 'Zapata', 'Del Rosario', 64523331,'2016-01-05','16:01:00'),
	(1,12,'Geraldine Isabel', 'Rosario', 'Yenque', 64523331,'2017-07-25','20:00:00')
;
insert into usuario (id_persona,correo,clave,estado) values
	(1, 'jesus.oria@gmail.com', SHA('comebien'), 1),
	(2, 'carmen.ruiz@gmail.com', SHA('suerte'), 1),
	(3, 'jesus.oria@gmail.com', SHA('cargo'), 1),
	(4, 'jesus.oria@gmail.com', SHA('manzana'), 1),
	(5, 'renzomon@gmail.com', SHA('banana'), 0)
;
insert into queja (asunto,descripcion,fecha,hora,estado) values 
	('Aseo incorrecto', 'Personal de limpieza no hace bien su trabajo', '2017-11-12', '13:50:00', 1),
	('Aseo incorrecto', 'Personal de limpieza no hace bien su trabajo', '2016-09-23', '13:50:00', 1),
	('Aseo incorrecto', 'Personal de limpieza no hace bien su trabajo', '2015-05-06', '13:50:00', 1),
	('Aseo incorrecto', 'Personal de limpieza no hace bien su trabajo', '2017-03-01', '13:50:00', 1),
	('Aseo incorrecto', 'Personal de limpieza no hace bien su trabajo', '2017-03-02', '13:50:00', 0),
	('Aseo incorrecto', 'Personal de limpieza no hace bien su trabajo', '2016-01-04', '13:50:00', 0)
;
insert into pago (id_propietario,id_movimiento,id_inmueble,fec_canc,estado) values
	(1,2,2,'2017-12-03',0),
	(1,1,3,'2017-22-05',0),
	(2,3,1,'2017-30-04',1),
	(3,4,4,'<2017-01></2017-01>-06',1),
	(4,5,5,'2017-08-09',1),
	(5,6,6,'2016-05-12',0)
;