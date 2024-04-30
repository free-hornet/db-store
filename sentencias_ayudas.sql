
-- productos vendidos en la tienda con id 1
SELECT p.pk_id AS id_producto, p.nombre AS nombre_producto
FROM public.producto p
JOIN public.producto_venta pv ON p.pk_id = pv.fk_id_producto
JOIN public.venta v ON pv.fk_id_venta = v.pk_id
JOIN public.vendedor vd ON v.fk_id_vendedor = vd.pk_id
JOIN public.empleado e ON vd.fk_rut_empleado = e.pk_rut
JOIN tienda_empleado te ON e.pk_rut = te.fk_rut_empleado
WHERE te.fk_id_tienda = 1;

-- Tabla que muestra los productos vendidos para cada tienda, esto nos perminte saber que productos tiene
select te.fk_id_tienda as id_tienda, p.pk_id AS id_producto, p.nombre AS nombre_producto, p.precio 
FROM public.producto p
JOIN public.producto_venta pv ON p.pk_id = pv.fk_id_producto
JOIN public.venta v ON pv.fk_id_venta = v.pk_id
JOIN public.vendedor vd ON v.fk_id_vendedor = vd.pk_id
JOIN public.empleado e ON vd.fk_rut_empleado = e.pk_rut
JOIN tienda_empleado te ON e.pk_rut = te.fk_rut_empleado
group by te.fk_id_tienda, p.pk_id;
