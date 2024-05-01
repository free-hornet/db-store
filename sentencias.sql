--- Sentencias entrega 2 ---
-- Nombre e id de las comunas
select nombre, pk_id from comuna c;

-- Nombre y rut de los empleados que viven en la comuna de Puerto Montt(9)
select pk_rut, nombre  from empleado e where fk_id_comuna = 9;

-- Nombre e id de los productos con un valor superior a $500000 pesos
select pk_id, nombre, precio  from  producto p where precio > 500000;

-- Sueldo y rut de los empleados en el mes de Enero
select fk_rut_empleado, sueldo from sueldo s where fecha = '2023-01-01';

-- Nombre de las tiendas ubicadas en las comunas de Calama(1), La Serena(4) y Rancagua(7)
select nombre from tienda t where fk_id_comuna = 1 or fk_id_comuna = 4 or fk_id_comuna = 7;

-- Nombre y rut de los directores de cada tienda
select nombre, fk_rut_empleado from tienda_empleado te join empleado e on fk_rut_empleado = pk_rut where cargo = 'director';

-- Nombre, rut y fecha que los empleados se desvincularon de la tienda o cambiaron de cargo
select nombre, fk_rut_empleado, fecha_fin from tienda_empleado te join empleado e on fk_rut_empleado = pk_rut where fecha_fin is not null;

-- Monto, tipo de documento y id de las boletas generadas entre el 5 de Febrero de 2023 y el 15 de Junio del mismo año
select pk_id, monto, tipo from tipo_documento td where tipo = 'boleta' and '2023-02-05' < fecha and fecha < '2023-06-15';

-- Nombre y comuna de los vendedores con id 1 y 3
select e.nombre, c.nombre from vendedor v join empleado e on v.fk_rut_empleado = e.pk_rut join comuna c on e.fk_id_comuna = c.pk_id where v.pk_id = 1 or v.pk_id = 4;

-- Lista de las ventas entre el 15 de Marzo y 10 de Septiembre de 2023. Mostrando:  fecha, nombre y rut del vendedor
select e.nombre, e.pk_rut, fecha from venta ve join vendedor v on fk_id_vendedor = v.pk_id join empleado e on v.fk_rut_empleado = e.pk_rut where fecha > '2023-04-15' and fecha < '2023-09-10';

-- Muestra los sueldos mayores al promedio de los sueldos
SELECT  sueldo, fk_rut_empleado, nombre 
FROM    sueldo s join empleado e on fk_rut_empleado = pk_rut
WHERE   sueldo > (SELECT AVG(sueldo)
                 FROM sueldo s2);


--- Sentencias entrega 3 ---

-- 1. Producto más vendido
select * from (select p.nombre AS producto, SUM(pv.cantidad) AS total_vendido
FROM producto p
JOIN producto_venta pv ON p.pk_id = pv.fk_id_producto
JOIN venta v ON pv.fk_id_venta = v.pk_id
GROUP BY p.nombre) a
where a.total_vendido = (select (max(a.total_vendido)) from (select p.nombre AS producto, SUM(pv.cantidad) AS total_vendido
FROM producto p
JOIN producto_venta pv ON p.pk_id = pv.fk_id_producto
JOIN venta v ON pv.fk_id_venta = v.pk_id
GROUP BY p.nombre) a);

-- 2. Producto más caro por tienda
SELECT id_tienda, id_producto, nombre_producto, precio
FROM (
	SELECT id_tienda, id_producto, nombre_producto, precio, RANK() OVER (PARTITION BY id_tienda ORDER BY precio DESC) AS ranking
	FROM (
		select te.fk_id_tienda as id_tienda, p.pk_id AS id_producto, p.nombre AS nombre_producto, p.precio 
		FROM public.producto p
		JOIN public.producto_venta pv ON p.pk_id = pv.fk_id_producto
		JOIN public.venta v ON pv.fk_id_venta = v.pk_id
		JOIN public.vendedor vd ON v.fk_id_vendedor = vd.pk_id
		JOIN public.empleado e ON vd.fk_rut_empleado = e.pk_rut
		JOIN public.tienda_empleado te ON e.pk_rut = te.fk_rut_empleado
		group by te.fk_id_tienda, p.pk_id
	) AS productos_por_tienda
) AS productos_con_ranking
WHERE ranking = 1;

-- 3. ventas por mes, separadas entre Boletas y Facturas
SELECT TO_CHAR(v.fecha, 'YYYY-MM') AS mes, td.tipo, COUNT(pv.pk_id) AS cantidad
FROM tipo_documento td
JOIN venta v ON td.fk_id_venta = v.pk_id
JOIN producto_venta pv ON v.pk_id = pv.fk_id_venta
WHERE td.tipo IN ('boleta', 'factura')
GROUP BY mes, tipo
ORDER BY mes, tipo;

