/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE OR REPLACE DATABASE app_de_notas;
USE app_de_notas;

CREATE OR REPLACE TABLE usuarios(
    id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(30), 
    apellido VARCHAR(30),
    email VARCHAR(30),
    PRIMARY KEY (id)
);

CREATE OR REPLACE TABLE usuarios_notas(
    id int primary key NOT NULL AUTO_INCREMENT,
    id_usuario int not null,
    id_nota int not null,
    key gestiones_id_usuario_usuarios_id_foreign (id_usuario),
    key gestiones_id_nota_notas_id (id_nota),
    constraint gestiones_id_usuario_usuarios_id_foreign foreign key (id_usuario) references usuarios (id),
    constraint gestiones_id_nota_notas_id foreign key (id_nota) references notas(id)
);

CREATE OR REPLACE TABLE categorias(
    id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(30),
    PRIMARY KEY (id)
);

CREATE OR REPLACE TABLE notas(
    id INT NOT NULL AUTO_INCREMENT,
    fecha_creacion DATETIME,
    fecha_modificacion DATETIME,
    id_usuario INT NOT NULL,
    titulo VARCHAR(100),
    descripcion TEXT,
    puede_ser_borrado TINYINT DEFAULT 1,
    id_categoria INT,
    PRIMARY KEY (id),
    key usuario_id_fk (id_usuario),
	key categoria_id_fk (id_categoria),
	constraint usuario_id_fk foreign key(id_usuario) references usuarios(id),
	constraint categoria_id_fk foreign key(id_categoria) references categorias(id)
);

INSERT INTO usuarios
VALUES (1,
  'Marcos',
  'Villanueva',
  'marcvillanueva2311@gmail.com'
),(2,
'Agus',
'Trossero',
'agustrossero@gmail.com'
),(3,
'Juan',
'Larraz',
'juanlarraz@gmail.com'
),(4,
'Ignacio',
'Maldonado',
'ignaciomaldonado@gmail.com'
),(5,
'Lucas',
'Sequeira',
'lucassequeira@gmail.com'
),(6,
'Julian',
'Hernandez',
'julihernandez@gmail.com'
),(7,
'Mauri',
'Hunau',
'maurihunau@gmail.com'
),(8,
'Gaston',
'Elthe',
'gastonelthe@gmail.com'
),(9,
'Luciano',
'Saeta',
'luchosaeta@gmail.com'
),(10,
'Maria',
'Gianera',
'mariagianera@gmail.com'
);

INSERT INTO usuarios_notas (id_usuario, id_nota)
VALUES (1,3),(2,4),(3,5),(4,6),(5,7),(6,8),(7,9),(8,10),(9,1),(10,2);

INSERT INTO categorias
VALUES (1,'Programador'),
(2,'Tatuador'),
(3,'Vendedor'),
(4,'Ingeniero'),
(5,'Profesor'),
(6,'Programador'),
(7,'Ingeniero'),
(8,'Ingeniero'),
(9,'Vendedor'),
(10,'Profesor');

INSERT INTO notas
VALUES(1,
'2022-04-06 00:32:00',
'2022-04-06 00:32:00',
1,
'Programador Web Full Stack',
'Lorem ipsum dolor sit amet',
0,
1),
(2,
'2019-12-30 04:51:28',
'2019-12-30 04:51:28',
2,
'Tatuador gallego',
'Lorem ipsum dolor sit amet',
0,
2),
(3,
'2020-01-07 15:48:23',
'2020-01-07 15:48:23',
3,
'Ventas computadoras',
'Lorem ipsum dolor sit amet',
1,
3),
(4,
'2019-12-22 15:08:43',
'2019-12-22 15:08:43',
4,
'Ingeniero en sistemas',
'Lorem ipsum dolor sit amet',
0,
4),
(5,
'2020-04-29 02:58:04',
'2020-04-29 02:58:04',
5,
'Profesor programador',
'Lorem ipsum dolor sit amet',
0,
5),
(6,
'2019-05-17 00:01:21',
'2019-05-17 00:01:21',
6,
'Programador Web',
'Lorem ipsum dolor sit amet',
0,
6),
(7,
'2019-12-25 21:36:05',
'2019-12-25 21:36:05',
7,
'Gamer Valorant',
'Lorem ipsum dolor sit amet',
0,
7),
(8,
'2019-11-17 22:27:08',
'2019-11-17 22:27:08',
8,
'Ingenerio en sistemas en la UBA',
'Lorem ipsum dolor sit amet',
0,
8),
(9,
'2019-06-26 06:29:44',
'2019-06-26 06:29:44',
9,
'Vendedor',
'Lorem ipsum dolor sit amet',
0,
9),
(10,
'2020-01-25 12:33:26',
'2020-01-25 12:33:26',
10,
'Musica,Arte y Pintura',
'Lorem ipsum dolor sit amet',
0,
10);

drop table if exists registro;
create table registro(
id int primary key NOT NULL AUTO_INCREMENT,
id_nota int not null,
gestion enum('creación','modificacion','eliminación') NOT NULL,
fecha_de_gestion timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
key registro_id_nota_notas_id (id_nota),
constraint registro_id_nota_notas_id foreign key (id_nota) references notas(id)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO registro(id_nota, gestion, fecha_de_gestion )
VALUES (13,'eliminación','2020-04-20 04:54:40'),
(31,'creación', '2019-05-13 14:50:11'),
(42,'eliminación', '2019-12-06 06:52:25'),
(53,'eliminación', '2019-08-11 18:43:59'),
(64,'modificacion', '2020-01-25 07:22:05'),
(72,'modificacion', '2019-07-06 00:08:08'),
(85,'creación', '2019-09-21 11:44:17'),
(93,'creación', '2019-11-05 10:42:02'),
(101,'modificacion', '2019-06-01 22:06:23');