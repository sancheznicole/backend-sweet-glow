CREATE DATABASE sweet_glow;
USE sweet_glow;

-- 1. roles
CREATE TABLE roles (
    id_rol INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL
);

-- 2. usuarios
CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    tipo_documento ENUM('cc', 'pep', 'ce', 'p') NOT NULL,
    numero_documento VARCHAR(20) NOT NULL,
    nombres VARCHAR(255) NOT NULL,
    apellidos VARCHAR(255) NOT NULL,
    correo VARCHAR(255) UNIQUE NOT NULL,
    contrasena VARCHAR(255) NOT NULL,
    telefono VARCHAR(255) NOT NULL,
    direccion VARCHAR(255) NOT NULL,
    id_rol INT NOT NULL,
    FOREIGN KEY (id_rol) REFERENCES roles(id_rol)
);

-- 3. categorias
CREATE TABLE categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL
);

-- 4. marcas
CREATE TABLE marcas (
    id_marca INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    pais_origen VARCHAR(255) NOT NULL
);

-- 5. referencia_productos
CREATE TABLE referencia_productos (
    id_referencia INT AUTO_INCREMENT PRIMARY KEY,
    codigo VARCHAR(255) UNIQUE NOT NULL,
    color VARCHAR(255) NOT NULL,
    tamaño VARCHAR(255) NOT NULL
);

-- 6. productos (SIN guia_regalos)
CREATE TABLE productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    descripcion TEXT NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    tendencia BOOLEAN NOT NULL,
    descuento BOOLEAN NOT NULL,
    prod_regalo BOOLEAN NOT NULL,
    premio BOOLEAN NOT NULL,
    stock INT NOT NULL,
    id_categoria INT NOT NULL,
    id_marca INT NOT NULL,
    id_referencia INT UNIQUE NOT NULL,
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria),
    FOREIGN KEY (id_marca) REFERENCES marcas(id_marca),
    FOREIGN KEY (id_referencia) REFERENCES referencia_productos(id_referencia)
);

-- 7. imagenes
CREATE TABLE imagenes (
    id_imagen INT AUTO_INCREMENT PRIMARY KEY,
    filename TEXT NOT NULL,
    id_producto INT NOT NULL,
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

-- 8. tarjetas_regalo
CREATE TABLE tarjetas_regalo (
    id_tarjeta INT AUTO_INCREMENT PRIMARY KEY,
    monto DECIMAL(10,2) NOT NULL,
    fecha_creacion DATETIME DEFAULT NOW(),
    fecha_expiracion DATETIME NOT NULL,
    fecha_de_uso DATETIME,
    estado VARCHAR(255) NOT NULL CHECK (estado IN ('activa','usada','vencida')),
    id_usuario INT NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
) AUTO_INCREMENT = 1000;

-- 9. factura_pedidos
CREATE TABLE factura_pedidos (
    id_factura_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    neto DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
) AUTO_INCREMENT = 1000;

-- 10. carritos
CREATE TABLE carritos (
    id_carrito INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    cantidad INT NOT NULL,
    descuento DECIMAL DEFAULT '0',
    id_producto INT NOT NULL,
    id_factura_pedido INT NOT NULL,
    id_tarjeta INT NULL,
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto),
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
    FOREIGN KEY (id_factura_pedido) REFERENCES factura_pedidos(id_factura_pedido),
    FOREIGN KEY (id_tarjeta) REFERENCES tarjetas_regalo(id_tarjeta)
);

-- 11. inscripciones_regalo
CREATE TABLE inscripciones_regalo (
    id_inscripcion INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT UNIQUE NOT NULL,
    id_factura_pedido INT NOT NULL,
    estado VARCHAR(255) DEFAULT 'participando',
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
    FOREIGN KEY (id_factura_pedido) REFERENCES factura_pedidos(id_factura_pedido)
);

-- 12. premios
CREATE TABLE premios (
    id_premio INT AUTO_INCREMENT PRIMARY KEY,
    id_producto INT NOT NULL,
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

-- 13. premiados
CREATE TABLE premiados (
    id_premiado INT AUTO_INCREMENT PRIMARY KEY,
    id_premio INT NOT NULL,
    id_usuario INT NOT NULL,
    id_inscripcion_regalo INT NOT NULL,
    FOREIGN KEY (id_inscripcion_regalo) REFERENCES inscripciones_regalo(id_inscripcion),
    FOREIGN KEY (id_premio) REFERENCES premios(id_premio),
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

-- 14. resenas
CREATE TABLE resenas (
    id_resena INT AUTO_INCREMENT PRIMARY KEY,
    resena INT NOT NULL,
    id_usuario INT NOT NULL,
    id_producto INT NOT NULL,
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto),
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

-- 15. guia_regalos (NUEVA TABLA)
CREATE TABLE guia_regalos (
    id_guia INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    descripcion TEXT
);

-- 16. ALTER TABLE productos (relación con guia_regalos)
ALTER TABLE productos
ADD COLUMN id_guia INT NULL,
ADD CONSTRAINT fk_productos_guia
FOREIGN KEY (id_guia) REFERENCES guia_regalos(id_guia);
