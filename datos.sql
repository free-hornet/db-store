INSERT INTO public.comuna (nombre) VALUES
    ('Calama'),
    ('Antofagasta'),
    ('Copiapo'),
    ('La Serena'),
    ('Santiago'),
    ('Viña del Mar'),
    ('Rancagua'),
    ('Curicó'),
    ('Puerto Montt');


INSERT INTO public.tienda (nombre, fk_id_comuna) VALUES
    ('pc Factory Calama (Mall Plaza)', 1),
    ('pc Factory Antofagasta', 2),
    ('pc Factory Copiapo', 3),
    ('pc Factory La Serena', 4),
    ('pc Factory Mall Costanera Center', 5),
    ('pc Factory Viña del Mar', 6),
    ('pc Factory Rancagua', 7),
    ('pc Factory Curicó', 8),
    ('pc Factory Puerto Montt', 9);


INSERT INTO public.empleado (pk_rut, telefono, nombre, fk_id_comuna) VALUES 
(19772950, '963548743', 'Joaquín Torres', 1),
(19300275, '929977227', 'María Fernández', 1),
(15788966, '943221674', 'Luis Pérez', 1),
(20418032, '912345678', 'Ana Martínez', 2),
(22577894, '966789012', 'Pedro García', 2),
(21445765, '927384651', 'Laura Rodríguez', 2),
(19885567, '945678912', 'Diego López', 3),
(22346891, '931234567', 'Sofía Gómez', 3),
(19562347, '922345678', 'Daniel Sánchez', 3),
(21087543, '933456789', 'Elena Castro', 4),
(23654432, '911223344', 'Pablo Ruiz', 4),
(20347891, '977654321', 'Marta Jiménez', 4),
(21985432, '966655544', 'Carlos Herrera', 5),
(22897654, '944332211', 'Isabel Díaz', 5),
(19123567, '966666666', 'Juan González', 5),
(20786543, '955443322', 'Lucía Vargas', 6),
(18234567, '977889900', 'Andrea Navarro', 6),
(21345678, '988776655', 'Roberto Cruz', 6),
(23898765, '977660011', 'Carmen Morales', 7),
(20123456, '955566677', 'Alejandro Pérez', 7),
(19567890, '933344455', 'Paula Torres', 7),
(21678901, '988887766', 'Mario López', 8),
(23547890, '955111222', 'Silvia García', 8),
(20987654, '922112233', 'Victoria Martínez', 8),
(22456789, '933223344', 'Javier Ruiz', 9),
(19876543, '977777888', 'Natalia Castro', 9),
(22233445, '966889900', 'Fernando Herrera', 9),
(20456789, '955667788', 'Sara Díaz', 9),
(21789012, '977889900', 'Gabriel Sánchez', 1);


INSERT INTO public.tienda_empleado (cargo, fecha_inicio, fecha_fin, fk_rut_empleado, fk_id_tienda) VALUES
-- Empleados de la tienda en Calama
('director', '2023-01-01', NULL, 19772950, 1),
('gerente', '2023-01-01', NULL, 19300275, 1),
('vendedor', '2023-01-01', NULL, 15788966, 1),

-- Empleados de la tienda en Antofagasta
('director', '2022-12-01', '2023-06-30', 20418032, 2),
('gerente', '2023-01-01', NULL, 22577894, 2),
('vendedor', '2023-01-01', NULL, 21445765, 2),

-- Empleados de la tienda en Copiapó
('director', '2022-11-01', NULL, 19885567, 3),
('gerente', '2023-01-01', NULL, 22346891, 3),
('vendedor', '2023-01-01', NULL, 19562347, 3),

-- Empleados de la tienda en La Serena
('director', '2023-01-01', NULL, 21087543, 4),
('gerente', '2023-01-01', NULL, 23654432, 4),
('vendedor', '2023-01-01', NULL, 20347891, 4),

-- Empleados de la tienda en Santiago (Costanera Center)
('director', '2023-01-01', NULL, 21985432, 5),
('gerente', '2023-01-01', NULL, 22897654, 5),
('vendedor', '2023-01-01', NULL, 19123567, 5),

-- Empleados de la tienda en Viña del Mar
('director', '2023-01-01', NULL, 20786543, 6),
('gerente', '2023-01-01', NULL, 18234567, 6),
('vendedor', '2023-01-01', NULL, 21345678, 6),

-- Empleados de la tienda en Rancagua
('director', '2023-01-01', NULL, 23898765, 7),
('gerente', '2023-01-01', NULL, 20123456, 7),
('vendedor', '2023-01-01', NULL, 19567890, 7),

-- Empleados de la tienda en Curicó
('director', '2023-01-01', NULL, 21678901, 8),
('gerente', '2023-01-01', NULL, 23547890, 8),
('vendedor', '2023-01-01', NULL, 20987654, 8),

-- Empleados de la tienda en Puerto Montt
('director', '2023-01-01', NULL, 22456789, 9),
('gerente', '2023-01-01', NULL, 19876543, 9),
('vendedor', '2023-01-01', NULL, 22233445, 9),
-- Cambios y fin de roles
('vendedor', '2024-01-01', '2024-03-31', 22233445, 9),
('gerente', '2024-04-01', NULL, 22233445, 9);



INSERT INTO public.sueldo (sueldo, fecha, fk_rut_empleado) VALUES 
-- Sueldos para enero de 2023
(1500000, '2023-01-01', 19772950), -- Joaquín Torres
(1200000, '2023-01-01', 19300275), -- María Fernández
(1000000, '2023-01-01', 15788966), -- Luis Pérez
(1300000, '2023-01-01', 20418032), -- Ana Martínez
(1100000, '2023-01-01', 22577894), -- Pedro García
(1000000, '2023-01-01', 21445765), -- Laura Rodríguez
(1200000, '2023-01-01', 19885567), -- Diego López
(1100000, '2023-01-01', 22346891), -- Sofía Gómez
(1000000, '2023-01-01', 19562347), -- Daniel Sánchez
(1300000, '2023-01-01', 21087543), -- Elena Castro
(1100000, '2023-01-01', 23654432), -- Pablo Ruiz
(1000000, '2023-01-01', 20347891), -- Marta Jiménez
(1200000, '2023-01-01', 21985432), -- Carlos Herrera
(1100000, '2023-01-01', 22897654), -- Isabel Díaz
(1000000, '2023-01-01', 19123567), -- Juan González
(1300000, '2023-01-01', 20786543), -- Lucía Vargas
(1100000, '2023-01-01', 18234567), -- Andrea Navarro
(1000000, '2023-01-01', 21345678), -- Roberto Cruz
(1200000, '2023-01-01', 23898765), -- Carmen Morales
(1100000, '2023-01-01', 20123456), -- Alejandro Pérez
(1000000, '2023-01-01', 19567890), -- Paula Torres
(1300000, '2023-01-01', 21678901), -- Mario López
(1100000, '2023-01-01', 23547890), -- Silvia García
(1000000, '2023-01-01', 20987654), -- Victoria Martínez
(1200000, '2023-01-01', 22456789), -- Javier Ruiz
(1100000, '2023-01-01', 19876543), -- Natalia Castro
(1000000, '2023-01-01', 22233445), -- Fernando Herrera
(1300000, '2023-01-01', 20456789), -- Sara Díaz
(1100000, '2023-01-01', 21789012), -- Gabriel Sánchez

-- Sueldos para febrero de 2023
(1500000, '2023-02-01', 19772950), -- Joaquín Torres
(1200000, '2023-02-01', 19300275), -- María Fernández
(1000000, '2023-02-01', 15788966), -- Luis Pérez
(1300000, '2023-02-01', 20418032), -- Ana Martínez
(1100000, '2023-02-01', 22577894), -- Pedro García
(1000000, '2023-02-01', 21445765), -- Laura Rodríguez
(1200000, '2023-02-01', 19885567), -- Diego López
(1100000, '2023-02-01', 22346891), -- Sofía Gómez
(1000000, '2023-02-01', 19562347), -- Daniel Sánchez
(1300000, '2023-02-01', 21087543), -- Elena Castro
(1100000, '2023-02-01', 23654432), -- Pablo Ruiz
(1000000, '2023-02-01', 20347891), -- Marta Jiménez
(1200000, '2023-02-01', 21985432), -- Carlos Herrera
(1100000, '2023-02-01', 22897654), -- Isabel Díaz
(1000000, '2023-02-01', 19123567), -- Juan González
(1300000, '2023-02-01', 20786543), -- Lucía Vargas
(1100000, '2023-02-01', 18234567), -- Andrea Navarro
(1000000, '2023-02-01', 21345678), -- Roberto Cruz
(1200000, '2023-02-01', 23898765), -- Carmen Morales
(1100000, '2023-02-01', 20123456), -- Alejandro Pérez
(1000000, '2023-02-01', 19567890), -- Paula Torres
(1300000, '2023-02-01', 21678901), -- Mario López
(1100000, '2023-02-01', 23547890), -- Silvia García
(1000000, '2023-02-01', 20987654), -- Victoria Martínez
(1200000, '2023-02-01', 22456789), -- Javier Ruiz
(1100000, '2023-02-01', 19876543), -- Natalia Castro
(1000000, '2023-02-01', 22233445), -- Fernando Herrera
(1300000, '2023-02-01', 20456789), -- Sara Díaz
(1100000, '2023-02-01', 21789012); -- Gabriel Sánchez


INSERT INTO public.vendedor (fk_rut_empleado)
SELECT fk_rut_empleado
FROM public.tienda_empleado
WHERE cargo = 'vendedor';


INSERT INTO public.producto (precio, nombre) VALUES 
(250000, 'Teléfono móvil'),
(780000, 'Laptop'),
(450000, 'Tablet'),
(150000, 'Auriculares inalámbricos'),
(320000, 'Smartwatch'),
(290000, 'Cámara digital'),
(980000, 'TV LED 55"'),
(850000, 'Consola de videojuegos'),
(210000, 'Altavoz inteligente'),
(620000, 'Monitor de computadora'),
(430000, 'Reproductor de Blu-ray'),
(380000, 'Impresora multifunción'),
(780000, 'Drone'),
(560000, 'Robot aspirador'),
(920000, 'Sistema de sonido envolvente'),
(390000, 'Barra de sonido'),
(110000, 'Cámara de seguridad'),
(720000, 'Proyector de cine en casa'),
(590000, 'Router inalámbrico'),
(680000, 'Disco duro externo'),
(360000, 'Teclado mecánico para juegos'),
(440000, 'Mouse inalámbrico'),
(120000, 'Funda para laptop'),
(150000, 'Funda para teléfono móvil'),
(550000, 'Lentes de realidad virtual'),
(890000, 'Sistema de iluminación inteligente'),
(310000, 'Batería externa'),
(180000, 'Cargador inalámbrico'),
(760000, 'Impresora 3D'),
(820000, 'Cámara de acción'),
(470000, 'Sistema de vigilancia para el hogar'),
(670000, 'Altavoz portátil resistente al agua'),
(290000, 'Auriculares con cancelación de ruido'),
(330000, 'Smart TV box'),
(570000, 'Dispositivo de seguimiento de actividad'),
(490000, 'Lámpara inteligente'),
(690000, 'Plataforma de juegos de realidad aumentada'),
(430000, 'Micrófono de estudio'),
(820000, 'Monitor de actividad física'),
(360000, 'Receptor de audio Bluetooth'),
(630000, 'Controlador de juego inalámbrico'),
(280000, 'Estación de carga USB'),
(510000, 'Sistema de alarma para el hogar'),
(340000, 'Router de malla WiFi'),
(240000, 'Estabilizador de cámara'),
(480000, 'Auriculares deportivos inalámbricos'),
(660000, 'Adaptador de corriente universal');


INSERT INTO public.venta (fecha, fk_id_vendedor)
SELECT 
    DATE '2023-01-01' + CAST(RANDOM() * 365 AS INTEGER) AS fecha,
    pk_id AS fk_id_vendedor
FROM 
    public.vendedor
ORDER BY 
    RANDOM()
LIMIT 100;





INSERT INTO public.venta (fecha, fk_id_vendedor)
SELECT 
    DATE '2023-01-01' + INTERVAL '1 day' * FLOOR(RANDOM() * 365) AS fecha,
    v.pk_id AS fk_id_vendedor
FROM 
    public.vendedor AS v
ORDER BY 
    RANDOM()
LIMIT 100;




INSERT INTO public.producto_venta (cantidad, fk_id_venta, fk_id_producto)
SELECT 
    ROUND(RANDOM() * 10) + 1 AS cantidad, -- Genera una cantidad aleatoria entre 1 y 10
    venta.pk_id AS fk_id_venta,          -- Selecciona un id de venta aleatorio
    producto.pk_id AS fk_id_producto     -- Selecciona un id de producto aleatorio
FROM 
    public.venta AS venta
CROSS JOIN 
    public.producto AS producto
ORDER BY 
    RANDOM() -- Orden aleatorio de las filas
LIMIT 100; -- Insertar 100 filas, puedes ajustar este número según sea necesario

   
INSERT INTO public.tipo_documento (monto, tipo, fecha, fk_id_venta)
SELECT 
    ROUND(RANDOM() * 100000) AS monto,                       -- Genera un monto aleatorio
    CASE 
        WHEN RANDOM() < 0.5 THEN 'boleta' 
        ELSE 'factura' 
    END AS tipo,                                             -- Asigna aleatoriamente 'boleta' o 'factura'
    DATE '2023-01-01' + INTERVAL '1 day' * FLOOR(RANDOM() * 365) AS fecha, -- Genera una fecha aleatoria dentro de 2023
    venta.pk_id AS fk_id_venta                               -- Selecciona un id de venta aleatorio
FROM 
    public.venta AS venta
ORDER BY 
    RANDOM()                                                  -- Orden aleatorio de las filas
LIMIT 100;                                                    -- Insertar 100 filas, puedes ajustar este número según sea necesario

