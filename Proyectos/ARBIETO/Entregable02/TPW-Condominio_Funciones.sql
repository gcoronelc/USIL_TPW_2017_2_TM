
--llamar a los Pagos, que seran gasto.
create view Vista_Listado_Gastos as
select pe.id_persona, CONCAT(pe.nombres, ' ',pe.ape_pat,' ',
 pe.ape_mat) as propietario,pe.dni,ed.nombre,i.nro_piso,
m.tipo,m.monto,m.importe,m.impuesto,m.total,m.descripcion,fecha 
from movimiento m 
inner join pago p on m.id_movimiento=p.id_movimiento 
inner join inmueble i on i.id_inmueble=p.id_inmueble 
inner join propietario pro on pro.id_propietario=i.id_propietario 
inner join persona pe on pro.id_persona=pe.id_persona 
inner join edificio ed on ed.id_edificio=i.id_edificio 
where tipo='Gasto' and m.id_movimiento in(
	select id_movimiento from movimiento 
	order by m.fecha DESC);


--llamar a los Pagos, que seran gasto.
create view Vista_Listado_Ingreso as
select pe.id_persona, CONCAT(pe.nombres, ' ',pe.ape_pat,' ',
 pe.ape_mat) as propietario,pe.dni,ed.nombre,i.nro_piso,
m.tipo,m.monto,m.importe,m.impuesto,m.total,m.descripcion,fecha 
from movimiento m 
inner join pago p on m.id_movimiento=p.id_movimiento 
inner join inmueble i on i.id_inmueble=p.id_inmueble 
inner join propietario pro on pro.id_propietario=i.id_propietario 
inner join persona pe on pro.id_persona=pe.id_persona 
inner join edificio ed on ed.id_edificio=i.id_edificio 
where tipo='Ingreso' and m.id_movimiento in(
	select id_movimiento from movimiento 
	order by m.fecha DESC);



create view Listado_Pagos as
select SUM(monto) AS MONTO,'GASTO' AS TIPO from movimiento WHERE tipo="gasto" 
union ALL 
SELECT sum(monto) as MONTO,'INGRESO' AS TIPO FROM movimiento WHERE tipo="ingreso" 
union ALL 
select sum(monto) as Monto,'TOTAL' AS TOTAL from movimiento 




--listado de pagos por fercha  ingreso
DROP PROCEDURE IF EXISTS  Listado_Pagos;
DELIMITER $$
create procedure Listado_Pagos_ingresos( 
	mes1 date,
    mes2 date
) 
BEGIN
select pe.id_persona, CONCAT(pe.nombres, ' ',pe.ape_pat,' ',
 pe.ape_mat) as propietario,pe.dni,ed.nombre,i.nro_piso,
m.tipo,m.monto,m.importe,m.impuesto,m.total,m.descripcion,m.fecha 
from movimiento m 
inner join pago p on m.id_movimiento=p.id_movimiento 
inner join inmueble i on i.id_inmueble=p.id_inmueble 
inner join propietario pro on pro.id_propietario=i.id_propietario 
inner join persona pe on pro.id_persona=pe.id_persona 
inner join edificio ed on ed.id_edificio=i.id_edificio 
where  
m.fecha BETWEEN m.fecha=mes1 and m.fecha=mes2 or tipo='ingreso'
END $$
DELIMITER ;


--listado de pagos por fercha  gastos
DROP PROCEDURE IF EXISTS  Listado_Pagos;
DELIMITER $$
create procedure Listado_Pagos_gastos( 
	mes1 date,
    mes2 date
) 
BEGIN
select pe.id_persona, CONCAT(pe.nombres, ' ',pe.ape_pat,' ',
 pe.ape_mat) as propietario,pe.dni,ed.nombre,i.nro_piso,
m.tipo,m.monto,m.importe,m.impuesto,m.total,m.descripcion,m.fecha 
from movimiento m 
inner join pago p on m.id_movimiento=p.id_movimiento 
inner join inmueble i on i.id_inmueble=p.id_inmueble 
inner join propietario pro on pro.id_propietario=i.id_propietario 
inner join persona pe on pro.id_persona=pe.id_persona 
inner join edificio ed on ed.id_edificio=i.id_edificio 
where  
m.fecha BETWEEN m.fecha=mes1 and m.fecha=mes2 or tipo='gastos'
END $$
DELIMITER ;

--llamar a los Pagos, que seran gasto.
create view Listado_Ingreso
select pe.id_persona, CONCAT(pe.nombres, ' ',pe.ape_pat,' ',
 pe.ape_mat) as propietario,pe.dni,ed.nombre,i.nro_piso,
m.tipo,m.monto,m.importe,m.impuesto,m.total,m.descripcion,fecha 
from movimiento m 
inner join pago p on m.id_movimiento=p.id_movimiento 
inner join inmueble i on i.id_inmueble=p.id_inmueble 
inner join propietario pro on pro.id_propietario=i.id_propietario 
inner join persona pe on pro.id_persona=pe.id_persona 
inner join edificio ed on ed.id_edificio=i.id_edificio 
where tipo='Ingreso' and m.fecha BETWEEN '2017-09-0' AND '2017-09-30';


select pe.id_persona, CONCAT(pe.nombres, ' ',pe.ape_pat,' ',
 pe.ape_mat) as propietario,pe.dni,ed.nombre,i.nro_piso,
m.tipo,m.monto,m.importe,m.impuesto,m.total,m.descripcion,fecha 
from movimiento m 
inner join pago p on m.id_movimiento=p.id_movimiento 
inner join inmueble i on i.id_inmueble=p.id_inmueble 
inner join propietario pro on pro.id_propietario=i.id_propietario 
inner join persona pe on pro.id_persona=pe.id_persona 
inner join edificio ed on ed.id_edificio=i.id_edificio 
where tipo='Ingreso' and MONTH(m.fecha)=09 and YEAR(m.fecha)=2017;






create procedure monto(
 
)
select SUM(monto) AS MONTO,'GASTO' AS TIPO from movimiento WHERE tipo="gasto" AND fecha=
union ALL 
SELECT sum(monto) as MONTO,'INGRESO' AS TIPO FROM movimiento WHERE tipo="ingreso" and 
union ALL 
select sum(monto) as Monto,'TOTAL' AS TOTAL from movimiento 


