select p.nombre, p.apellido,i.torre, i.piso, ti.nombre,i.fechaAdquisicion 
from propietario p INNER JOIN detalleinmueble di on p.idpro = di.idpro 
INNER JOIN inmueble i on di.idinmueble=i.idinmueble INNER JOIN TipoInmueble ti 
on i.idtipoInmueble = ti.idtipoInmueble 
where p.estado=1 
order by p.idpro


select p.nombre as propietario, iq.nombre as nomb_inq,iq.apellido 
as ape_inq,i.torre, i.piso, ti.nombre,i.fechaAdquisicion
from propietario p INNER JOIN detalleinmueble di
on p.idpro = di.idpro INNER JOIN inmueble i on di.idinmueble=i.idinmueble
INNER JOIN TipoInmueble ti on i.idtipoInmueble = ti.idtipoInmueble
INNER JOIN inquilino iq on iq.iddetalleinmu=di.iddetalleinmu
where p.estado=1
order by p.idpro

select a.idagua,p.nombre as propietario,ti.nombre as inmueble,i.torre, 
i.piso, a.fechaRecibo, a.total, a.cuota
from agua a INNER JOIN detalleinmueble di 
on a.iddetalleinmu = di.iddetalleinmu
INNER JOIN inmueble i on i.idinmueble=di.idinmueble
INNER JOIN propietario p on p.idpro=di.idpro
INNER JOIN tipoinmueble ti on ti.idtipoInmueble=i.idtipoInmueble
where ti.nombre != "cochera"