--detalleinmueble
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW ``  AS  

create procedure v_detalleinmueble
  AS
select i.idinmueble AS codInmueble,i.idpersona AS codPersona,
ti.nombre AS nomTipoInmueble,t.nombre AS nomTorre,
i.piso AS piso,i.numero AS numero,i.descripcion AS descripcion,
(case i.activo 
  when 1 then 'Activo' 
  when 0 then 'Inactivo' 
  end) AS `estado`,
(case ti.agua 
  when 1 then 'Si Paga' 
  when 0 then 'No Paga' 
  end) AS agua,
(case ti.mante 
  when 1 then 'Si Paga' 
  when 0 then 'No Paga' 
  end) AS mantenimiento,
ti.cmante AS costoMantenimiento 
from inmueble i 
inner join tinmueble ti on ti.idtinmueble = i.idtinmueble
inner join torre t on i.idtorre = t.idtorre;




create procedure detalleinmueble
  AS
select i.idinmueble AS codInmueble,i.idpersona AS codPersona,
ti.nombre AS nomTipoInmueble,t.nombre AS nomTorre,
i.piso AS piso,i.numero AS numero,i.descripcion AS descripcion,
(case i.activo 
  when 1 then 'Activo' 
  when 0 then 'Inactivo' 
  end) AS `estado`,
(case ti.agua 
  when 1 then 'Si Paga' 
  when 0 then 'No Paga' 
  end) AS agua,
(case ti.mante 
  when 1 then 'Si Paga' 
  when 0 then 'No Paga' 
  end) AS mantenimiento,
ti.cmante AS costoMantenimiento 
from inmueble i 
inner join tinmueble ti on ti.idtinmueble = i.idtinmueble
inner join torre t on i.idtorre = t.idtorre;




create view v_lista_personas
as
select p.idpersona AS CodPersona,tp.idtpersona AS CodTipoPerersona,
tp.nombre AS NombreTipoPerersona,p.apellido AS ApellidoPersona,
p.nombre AS NombrePersona,p.dni AS DniPersona,p.email AS EmailPersona,
p.telefono AS TelefonoPersona,p.direccion AS DireccionPersona,
u.usuario AS UsuarioPersona,u.estado AS EstadoPersona,r.idrol AS CodRol,r.nombre AS NombreRol
from persona p 
inner join tpersona tp on p.idtpersona = tp.idtpersona 
LEFT  join usuario u on p.idpersona = u.idpersona 
inner join rol r on u.idrol = r.idrol ;




create view v_lista_propietario_inmueble 
as
select p.idpersona AS CODIGO,concat(p.apellido,' ',p.nombre) AS 
PROPIETARIO,p.dni AS DNI,
(case u.estado 
  when 1 then 'Activo' 
  when 0 then 'Inactivo' 
  end) AS ESTADO,
count(`i`.`idinmueble`) AS CANTIDAD_INMUEBLE 
from persona p 
LEFT join inmueble i on i.idpersona = p.idpersona
inner join tinmueble tt on tt.idtinmueble = i.idtinmueble 
inner join torre t on t.idtorre = i.idtorre 
inner join usuario u on u.idpersona = p.idpersona;


