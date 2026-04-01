CREATE TABLE roles (
  `id_rol` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `created_at` timestamp NULL,
  `updated_at` timestamp NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE usuarios (
  `id_usuario` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tipo_documento` varchar(255) NOT NULL,
  `num_documento` varchar(255) NOT NULL,
  `nombres` varchar(255) NOT NULL,
  `apellidos` varchar(255) NOT NULL,
  `correo` varchar(255) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `id_rol` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL,
  `updated_at` timestamp NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE categorias (
  `id_categoria` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE marcas (
  `id_marca` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `pais_origen` varchar(255) NOT NULL,
  `created_at` timestamp NULL,
  `updated_at` timestamp NULL,
  PRIMARY KEY (`id_marca`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE referencia_productos (
  `id_referencia` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `codigo` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `tamano` varchar(255) NOT NULL,
  `created_at` timestamp NULL,
  `updated_at` timestamp NULL,
  PRIMARY KEY (`id_referencia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE guia_regalos (
  `id_guia` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text,
  `created_at` timestamp NULL,
  `updated_at` timestamp NULL,
  PRIMARY KEY (`id_guia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE productos (
  `id_producto` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `tendencia` tinyint(1) NOT NULL,
  `descuento` tinyint(1) NOT NULL,
  `prod_regalo` tinyint(1) NOT NULL,
  `premio` tinyint(1) NOT NULL,
  `stock` int NOT NULL,
  `id_categoria` bigint UNSIGNED NOT NULL,
  `id_marca` bigint UNSIGNED NOT NULL,
  `id_referencia` bigint UNSIGNED NOT NULL,
  `id_guia` bigint UNSIGNED,
  `created_at` timestamp NULL,
  `updated_at` timestamp NULL,
  PRIMARY KEY (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE imagenes (
  `id_imagen` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `filename` text NOT NULL,
  `id_producto` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL,
  `updated_at` timestamp NULL,
  PRIMARY KEY (`id_imagen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE carritos (
  `id_carrito` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_usuario` bigint UNSIGNED NOT NULL,
  `status` enum('active','checked_out') DEFAULT 'active',
  `created_at` timestamp NULL,
  `updated_at` timestamp NULL,
  PRIMARY KEY (`id_carrito`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE elementos_carritos (
  `id_elemento_carrito` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_producto` bigint UNSIGNED NOT NULL,
  `id_carrito` bigint UNSIGNED NOT NULL,
  `cantidad` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL,
  `updated_at` timestamp NULL,
  PRIMARY KEY (`id_elemento_carrito`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE tarjetas_regalo (
  `id_tarjeta` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `monto` decimal(10,2) NOT NULL,
  `fecha_creacion` datetime DEFAULT CURRENT_TIMESTAMP,
  `fecha_expiracion` datetime NOT NULL,
  `fecha_de_uso` datetime NOT NULL,
  `estado` varchar(255) NOT NULL,
  `id_usuario` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL,
  `updated_at` timestamp NULL,
  PRIMARY KEY (`id_tarjeta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE factura_pedidos (
  `id_factura_pedido` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_usuario` bigint UNSIGNED NOT NULL,
  `id_carrito` bigint UNSIGNED NOT NULL,
  `id_tarjeta` bigint UNSIGNED NOT NULL,
  `neto` decimal(10,2) NOT NULL,
  `descuento` decimal(10,2) DEFAULT 0.00,
  `status` enum('pending','paid','failed') DEFAULT 'pending',
  `created_at` timestamp NULL,
  `updated_at` timestamp NULL,
  PRIMARY KEY (`id_factura_pedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE resenas (
  `id_resena` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `resena` int NOT NULL,
  `id_producto` bigint UNSIGNED NOT NULL,
  `id_usuario` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL,
  `updated_at` timestamp NULL,
  PRIMARY KEY (`id_resena`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE premios (
  `id_premio` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_producto` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL,
  `updated_at` timestamp NULL,
  PRIMARY KEY (`id_premio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE inscripciones_regalo (
  `id_inscripcion` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `estado` varchar(255) DEFAULT 'participando',
  `id_usuario` bigint UNSIGNED NOT NULL,
  `id_factura_pedido` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL,
  `updated_at` timestamp NULL,
  PRIMARY KEY (`id_inscripcion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE premiados (
  `id_premiado` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_premio` bigint UNSIGNED NOT NULL,
  `id_usuario` bigint UNSIGNED NOT NULL,
  `id_inscripcion` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL,
  `updated_at` timestamp NULL,
  PRIMARY KEY (`id_premiado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;