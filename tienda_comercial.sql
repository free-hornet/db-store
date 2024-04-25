CREATE TABLE public.comuna (
	pk_id int GENERATED ALWAYS AS IDENTITY NOT NULL,
	nombre varchar NOT NULL,
	CONSTRAINT comuna_pk PRIMARY KEY (pk_id)
);
COMMENT ON TABLE public.comuna IS 'tabla que guarda datos de comunas';
-- Column comments
COMMENT ON COLUMN public.comuna.pk_id IS 'Identificador de la comuna';
COMMENT ON COLUMN public.comuna.nombre IS 'nombre de la comuna';


CREATE TABLE public.tienda (
    pk_id int GENERATED ALWAYS AS IDENTITY NOT NULL,
    nombre varchar NOT NULL,
    fk_id_comuna int NOT NULL,
    CONSTRAINT tienda_pk PRIMARY KEY (pk_id),
    CONSTRAINT tienda_fk FOREIGN KEY (fk_id_comuna) REFERENCES comuna(pk_id)
);
COMMENT ON TABLE public.tienda IS 'tabla que guarda los datos de las tiendas';
-- Column comments
COMMENT ON COLUMN public.tienda.pk_id IS 'Identificador de la tienda';
COMMENT ON COLUMN public.tienda.nombre IS 'Nombre de la tienda';
COMMENT ON COLUMN public.tienda.fk_id_comuna IS 'clave foranea de la comuna en la que se ubica la tienda';


CREATE TABLE public.empleado (
    pk_rut int NOT NULL,
    telefono int NOT NULL,
    nombre varchar NOT NULL,
    fk_id_comuna int NOT NULL,
    CONSTRAINT empleado_pk PRIMARY KEY (pk_rut),
    CONSTRAINT empleado_comuna_fk FOREIGN KEY (fk_id_comuna) REFERENCES comuna(pk_id)
);
COMMENT ON TABLE public.empleado IS 'tabla que guarda los datos de los empleados';
-- Column comments
COMMENT ON COLUMN public.empleado.pk_rut IS 'RUT de empleado';
COMMENT ON COLUMN public.empleado.nombre IS 'Nombre del empleado';
COMMENT ON COLUMN public.empleado.telefono IS 'Telefono del empleado';
COMMENT ON COLUMN public.empleado.fk_id_comuna IS 'Identificador de la comuna en la que se ubica el empleado';


CREATE TABLE public.tienda_empleado (
    pk_id int GENERATED ALWAYS AS IDENTITY NOT NULL,
    cargo varchar NOT NULL,
    fecha_inicio date NOT NULL,
    fecha_fin date NOT NULL,
    fk_rut_empleado int NOT NULL,
    fk_id_tienda int NOT NULL,
    CONSTRAINT tienda_empleado_pk PRIMARY KEY (pk_id),
    CONSTRAINT tienda_empleado_empleado_fk FOREIGN KEY (fk_rut_empleado) REFERENCES empleado(pk_rut),
    CONSTRAINT tienda_empleado_tienda_fk FOREIGN KEY (fk_id_tienda) REFERENCES tienda(pk_id)
);
COMMENT ON TABLE public.tienda_empleado IS 'tabla que guarda los datos de los empleados en las tiendas';
-- Column comments
COMMENT ON COLUMN public.tienda_empleado.pk_id IS 'Identificador de la relacion entre tienda y empleado';
COMMENT ON COLUMN public.tienda_empleado.cargo IS 'Cargo del empleado en la tienda';
COMMENT ON COLUMN public.tienda_empleado.fecha_inicio IS 'Fecha de inicio del empleado en la tienda';
COMMENT ON COLUMN public.tienda_empleado.fecha_fin IS 'Fecha de fin del empleado en la tienda';
COMMENT ON COLUMN public.tienda_empleado.fk_rut_empleado IS 'Rut del empleado';
COMMENT ON COLUMN public.tienda_empleado.fk_id_tienda IS 'Identificador de la tienda';


CREATE TABLE public.sueldo (
    pk_id int GENERATED ALWAYS AS IDENTITY NOT NULL,
    sueldo float4 NOT NULL,
    fecha date NOT NULL,
    fk_rut_empleado int NOT NULL,
    CONSTRAINT sueldo_pk PRIMARY KEY (pk_id),
    CONSTRAINT sueldo_empleado_fk FOREIGN KEY (fk_rut_empleado) REFERENCES empleado(pk_rut)
);
COMMENT ON TABLE public.sueldo IS 'tabla que guarda los datos de los sueldos';
-- Column comments
COMMENT ON COLUMN public.sueldo.pk_id IS 'Identificador del sueldo';
COMMENT ON COLUMN public.sueldo.sueldo IS 'Sueldo del empleado';
COMMENT ON COLUMN public.sueldo.fecha IS 'Fecha del sueldo';
COMMENT ON COLUMN public.sueldo.fk_rut_empleado IS 'Identificador del empleado al que se le pago el sueldo';


CREATE TABLE public.vendedor (
    pk_id int GENERATED ALWAYS AS IDENTITY NOT NULL,
    fk_rut_empleado int NOT NULL,
    CONSTRAINT vendedor_pk PRIMARY KEY (pk_id),
    CONSTRAINT vendedor_empleado_fk FOREIGN KEY (fk_rut_empleado) REFERENCES empleado(pk_rut)
);
COMMENT ON TABLE public.vendedor IS 'tabla que guarda los datos de los vendedores';
-- Column comments
COMMENT ON COLUMN public.vendedor.pk_id IS 'Identificador del vendedor';
COMMENT ON COLUMN public.vendedor.fk_rut_empleado IS 'El rut del empleado el cual es unico';


CREATE TABLE public.producto (
    pk_id int GENERATED ALWAYS AS IDENTITY NOT NULL,
    precio float4 NOT NULL,
    nombre varchar NOT NULL,
    CONSTRAINT producto_pk PRIMARY KEY (pk_id)
);
COMMENT ON TABLE public.producto IS 'tabla que guarda los datos de los productos';
-- Column comments
COMMENT ON COLUMN public.producto.pk_id IS 'Identificador del producto';
COMMENT ON COLUMN public.producto.precio IS 'Precio del producto';
COMMENT ON COLUMN public.producto.nombre IS 'Nombre del producto';


CREATE TABLE public.venta (
    pk_id int GENERATED ALWAYS AS IDENTITY NOT NULL,
    fecha date NOT NULL,
    fk_id_vendedor int NOT NULL,
    CONSTRAINT venta_pk PRIMARY KEY (pk_id),
    CONSTRAINT venta_vendedor_fk FOREIGN KEY (fk_id_vendedor) REFERENCES vendedor(pk_id)
);
COMMENT ON TABLE public.venta IS 'tabla que guarda los datos de las ventas';
-- Column comments
COMMENT ON COLUMN public.venta.pk_id IS 'Identificador unico de la venta que se está realizando';
COMMENT ON COLUMN public.venta.fecha IS 'Fecha que se realiza la venta';
COMMENT ON COLUMN public.venta.fk_id_vendedor IS 'Identificador del vendedor';


CREATE TABLE public.producto_venta (
    pk_id int GENERATED ALWAYS AS IDENTITY NOT NULL,
    cantidad int NOT NULL,
    fk_id_venta int NOT NULL,
    fk_id_producto int NOT NULL,
    CONSTRAINT producto_venta_pk PRIMARY KEY (pk_id),
    CONSTRAINT producto_venta_venta_fk FOREIGN KEY (fk_id_venta) REFERENCES venta(pk_id),
    CONSTRAINT producto_venta_producto_fk FOREIGN KEY (fk_id_producto) REFERENCES producto(pk_id)
);
COMMENT ON TABLE public.producto_venta IS 'tabla que guarda los datos de los productos en las ventas';
-- Column comments
COMMENT ON COLUMN public.producto_venta.pk_id IS 'Identificador de la relacion entre producto y venta';
COMMENT ON COLUMN public.producto_venta.cantidad IS 'Cantidad de productos vendidos';
COMMENT ON COLUMN public.producto_venta.fk_id_venta IS 'Identificador de la venta';
COMMENT ON COLUMN public.producto_venta.fk_id_producto IS 'Identificador del producto';


CREATE TABLE public.tipo_documento (
    pk_id int GENERATED ALWAYS AS IDENTITY NOT NULL,
    monto float4 NOT NULL,
    tipo VARCHAR(10) CHECK (tipo IN ('boleta', 'factura')), -- Restricción CHECK para limitar los valores
    fecha date NOT NULL,
    fk_id_venta int NOT NULL,
    CONSTRAINT tipo_documento_pk PRIMARY KEY (pk_id),
    CONSTRAINT tipo_documento_venta_fk FOREIGN KEY (fk_id_venta) REFERENCES venta(pk_id)
);
COMMENT ON TABLE public.tipo_documento IS 'tabla que guarda los datos de los tipos de documentos';
-- Column comments
COMMENT ON COLUMN public.tipo_documento.pk_id IS 'Identificador del tipo de documento';
COMMENT ON COLUMN public.tipo_documento.monto IS 'Monto del documento';
COMMENT ON COLUMN public.tipo_documento.tipo IS 'Tipo de documento ESTRICTAMENTE BOLETA O FACTURA';
COMMENT ON COLUMN public.tipo_documento.fecha IS 'Fecha del documento';
COMMENT ON COLUMN public.tipo_documento.fk_id_venta IS 'Identificador de la venta';