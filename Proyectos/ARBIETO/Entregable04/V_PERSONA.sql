USE CONDOMINIO;
SET NAMES 'utf8';

create view V_PERSONA(
idpersona, apellido, nombre, tipo, nomtipo,
dni, email, telefono, direccion
) as
select p.idpersona, p.apellido, p.nombre,
p.idtpersona, t.nombre, p.dni, p.email,
p.telefono, p.direccion
from tpersona t 
join persona p on t.idtpersona = p.idtpersona;

