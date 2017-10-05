
--determinar los propietarios activos
select * from usuario as us 
inner join detalle_usuario as du on us.id_usuario=du.id_usuario and du.estado=1 and 
us.id_usuario in(select pro.id_usuario from propietario as pro)

--determinar los Adminitradores Activos
select * from usuario as us 
inner join detalle_usuario as du on us.id_usuario=du.id_usuario and du.estado=1 and 
us.id_usuario in(select ad.id_usuario from administrador as ad)

--determinar los eventos existentes
SELECT us.*, ev.id_evento,ev.nombre,ev.descripcion,ev.FechaAlqui,ev.FechaFin 
FROM usuario as us inner join propietario as pro on us.id_usuario=pro.id_usuario 
inner join evento as ev on pro.id_propietario=ev.id_propietario
where ev.estado=1;

--determinar los propietarios y su correspondiente inmueble
SELECT us.*,inm.id_inmueble,inm.nro_piso,inm.nombre FROM usuario as us 
inner join propietario as pro on us.id_usuario=pro.id_usuario 
inner join inmueble as inm on pro.id_propietario=inm.id_propietario 
where inm.estado=1

--
SELECT us.*,inm.id_inmueble,inm.nro_piso,inm.nombre 
FROM usuario as us inner join propietario as pro on us.id_usuario=pro.id_usuario 
inner join inmueble as inm on pro.id_propietario=inm.id_propietario 
inner join pago as pa on pa.id_pago=pro.id_propietario 
inner join ingreso as ing on ing.id_pago=pa.id_pago 
where inm.estado=1 and pa.estado=1