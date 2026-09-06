/* Actividad 1: Crear y usar la base de datos */
DROP DATABASE IF EXISTS dbGamarraMarket;
CREATE DATABASE dbGamarraMarket
DEFAULT CHARACTER SET utf8;

USE dbGamarraMarket;

/* Actividad 2: Crear tabla CLIENTE */
CREATE TABLE CLIENTE
(
    id int,
    tipo_documento char(3),
    numero_documento char(9),
    nombres varchar(60),
    apellidos varchar(90),
    email varchar(80),
    celular char(9),
    fecha_nacimiento date,
    activo bool,
    CONSTRAINT cliente_pk PRIMARY KEY (id)
);

/* Comandos de edición y eliminación de la guía */
ALTER TABLE CLIENTE
    ADD COLUMN estado_civil char(1);

ALTER TABLE CLIENTE
    DROP COLUMN fecha_nacimiento;

DROP TABLE CLIENTE;

/* Actividad 3: Crear y eliminar relación */
ALTER TABLE VENTA
    ADD CONSTRAINT VENTA_CLIENTE FOREIGN KEY (cliente_id)
    REFERENCES CLIENTE (id)
    ON UPDATE CASCADE
    ON DELETE CASCADE;

ALTER TABLE VENTA
    DROP CONSTRAINT VENTA_CLIENTE;

/* Sentencias de verificación */
SHOW COLUMNS IN CLIENTE;

SHOW TABLES;

SELECT 
    i.constraint_name, k.table_name, k.column_name,
    k.referenced_table_name, k.referenced_column_name
FROM 
    information_schema.TABLE_CONSTRAINTS i
LEFT JOIN information_schema.KEY_COLUMN_USAGE k
ON i.CONSTRAINT_NAME = k.CONSTRAINT_NAME
WHERE i.CONSTRAINT_TYPE = 'FOREIGN KEY'
AND i.TABLE_SCHEMA = DATABASE();