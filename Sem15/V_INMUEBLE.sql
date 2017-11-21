CREATE VIEW V_INMUEBLE(
inmueble, tipo, nomtipo, torre, nomtorre, piso,
numero, descripcion, activo, propietario,
nompropietario, agua, mantenimiento, cuota
) AS
SELECT 
	I.IDINMUEBLE, TI.IDTINMUEBLE, TI.NOMBRE,
	T.IDTORRE, T.NOMBRE, I.PISO, I.NUMERO,
	I.DESCRIPCION, I.ACTIVO, P.IDPERSONA,
	CONCAT(P.APELLIDO,', ',P.NOMBRE) NOMBRE,
	TI.AGUA, TI.MANTE, TI.CMANTE
FROM TINMUEBLE TI
JOIN INMUEBLE I ON TI.IDTINMUEBLE = I.IDTINMUEBLE
JOIN TORRE T ON I.IDTORRE = T.IDTORRE
JOIN PERSONA P ON I.IDPERSONA = P.IDPERSONA;




	