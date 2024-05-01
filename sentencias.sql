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
select  sueldo, fk_rut_empleado, nombre 
from    sueldo s join empleado e on fk_rut_empleado = pk_rut
where   sueldo > (select AVG(sueldo)
                 from sueldo s2);


--- Sentencias entrega 3 ---

-- 1. Producto más vendido
select * from (select p.nombre as producto, SUM(pv.cantidad) as total_vendido
from producto p
join producto_venta pv on p.pk_id = pv.fk_id_producto
join venta v on pv.fk_id_venta = v.pk_id
group by p.nombre) a
where a.total_vendido = (select (max(a.total_vendido)) from (select p.nombre as producto, SUM(pv.cantidad) as total_vendido
from producto p
join producto_venta pv on p.pk_id = pv.fk_id_producto
join venta v on pv.fk_id_venta = v.pk_id
group by p.nombre) a);

-- 2. Producto más caro por tienda
select id_tienda, id_producto, nombre_producto, precio
from (select te.fk_id_tienda as id_tienda, p.pk_id as id_producto, p.nombre as nombre_producto, p.precio, RANK() over (partition by te.fk_id_tienda order by p.precio desc) as ranking
		from public.producto p
		join public.producto_venta pv on p.pk_id = pv.fk_id_producto
		join public.venta v on pv.fk_id_venta = v.pk_id
		join public.vendedor vd on v.fk_id_vendedor = vd.pk_id
		join public.empleado e on vd.fk_rut_empleado = e.pk_rut
		join public.tienda_empleado te on e.pk_rut = te.fk_rut_empleado
		group by te.fk_id_tienda, p.pk_id
		)
where ranking = 1;

-- 3. Ventas por mes, separadas entre Boletas y Facturas
select TO_CHAR(v.fecha, 'YYYY-MM') as mes, td.tipo, COUNT(pv.pk_id) as cantidad
from tipo_documento td
join venta v on td.fk_id_venta = v.pk_id
join producto_venta pv on v.pk_id = pv.fk_id_venta
where td.tipo in ('boleta', 'factura')
group by mes, tipo
order by mes, tipo;

