USE CONDOMINIO;
SET NAMES 'utf8';

CREATE VIEW V_OBLIGACION(
id,inmueble,codigo,torre,piso,descripcion,
obligacion,nomobligacio,anio,mes,
vencimiento,importe,pagada
) AS
select 
  o.idobligacion, i.idinmueble, i.idpersona,
  i.idtorre, i.piso, i.descripcion,
  t.idtobligacion, t.nombre, o.anio,
  o.mes, o.fvence, o.importe, 'none'
from inmueble i
join obligacion o on i.idinmueble = o.idinmueble
join tobligacion t on o.idtobligacion = t.idtobligacion;

