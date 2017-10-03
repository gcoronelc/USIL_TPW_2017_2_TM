use condosoft;



insert into propietario(nombre,apellidos,dni,telefono,correo) values ("far jordan","vasquez quispe",61555295,965887896,"farsitomasnaa@gmail.com");
insert into propietario(nombre,apellidos,dni,telefono,correo) values ("su mey","laban surichaqui",88988975,945556633,"sulaban@gmail.com");
insert into propietario(nombre,apellidos,dni,telefono,correo) values ("nicole sanddy","mercedes megia",45123658,987452236,"nicole@gmail.com");



insert into administrador(nombre,apellidos,dni,telefono,correo,usuario,clave) values ("fredy duran","ccama condori",70780371,996988877,"fccama@gmail.com","fredy.ccama","123456");



insert into inmueble(id_propietario,piso,torre,numero,tipo)values(1,3,4,10,"oficina");
insert into inmueble(id_propietario,piso,torre,numero,tipo)values(2,2,3,20,"departamento");
insert into inmueble(id_propietario,piso,torre,numero,tipo)values(3,1,5,15,"oficina");



insert into eventos(id_propietario,fecha,nombre,descripcion,monto) values (1,"2015-05-15","cumpleaños","cumpleaños de su sobrina con muchos invitos",100);
insert into eventos(id_propietario,fecha,nombre,descripcion,monto) values (2,"2016-06-20","fiesta","fiesta de graduacion",500);
insert into eventos(id_propietario,fecha,nombre,descripcion,monto) values (3,"2016-08-14","baby shower","baby shower de la dueña",1500);



insert into gastos_condominio(tipo,monto,descripcion,fecha) values ("servicios publicos",500,"se pago por el servicio de luz","2015-06-15");
insert into gastos_condominio(tipo,monto,descripcion,fecha) values ("servicios publicos",400,"se pago por el servicio de agua","2015-06-15");
insert into gastos_condominio(tipo,monto,descripcion,fecha) values ("servicios publicos",100,"se pago por el servicio de telefono","2015-06-15");
insert into gastos_condominio(tipo,monto,descripcion,fecha) values ("mantenimiento de equipos",1400,"mantenimiento de ascensores","2016-05-12");
insert into gastos_condominio(tipo,monto,descripcion,fecha) values ("mantenimiento de equipos",6400,"cambio de puertas elevadizas","2014-08-25");
insert into gastos_condominio(tipo,monto,descripcion,fecha) values ("insumos y materiales",3400,"compra de materiales para pintado","2014-07-23");


insert into cuotas(id_propietario,id_inmueble,tipo,monto,descripcion,fecha,estado) values (1,1,"mantenimiento",400,"mantenimiento de arreglo de escaleras","2014-05-18",1);
insert into cuotas(id_propietario,id_inmueble,tipo,monto,descripcion,fecha,estado) values (2,2,"mantenimiento",600,"arreglar ascensor","2016-04-03",0);


insert into total_cuota(id_cuota,total) values (1,400);
insert into total_cuota(id_cuota,total) values (2,600);

insert into total_pagoEventos(id_eventos,total) values (1,100);
insert into total_pagoEventos(id_eventos,total) values (2,500);
