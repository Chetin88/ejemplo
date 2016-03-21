SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS EQUIPO_HORARIO;
DROP TABLE IF EXISTS JUGADOR_EQUIPO;
DROP TABLE IF EXISTS EQUIPO;
DROP TABLE IF EXISTS CATEGORIA;
DROP TABLE IF EXISTS ENTRENADOR;
DROP TABLE IF EXISTS HORARIO;
DROP TABLE IF EXISTS JUGADOR;
DROP TABLE IF EXISTS POSICION;
DROP TABLE IF EXISTS TITULACION;




/* Create Tables */

CREATE TABLE CATEGORIA
(
	idCategoria year(2) NOT NULL AUTO_INCREMENT,
	nombreCategoria varchar(35),
	PRIMARY KEY (idCategoria),
	UNIQUE (idCategoria)
);


CREATE TABLE ENTRENADOR
(
	idEntrenador year(2) NOT NULL AUTO_INCREMENT,
	nombreEntrenador varchar(35),
	apellidosEntrenador varchar(80),
	DNIEntrenador decimal(8),
	idTitulacion year(2) NOT NULL,
	PRIMARY KEY (idEntrenador),
	UNIQUE (idEntrenador),
	UNIQUE (idTitulacion)
);


CREATE TABLE EQUIPO
(
	idEquipo year(2) NOT NULL AUTO_INCREMENT,
	nombreEquipo varchar(40),
	idCategoria year(2) NOT NULL,
	idEntrenador year(2) NOT NULL,
	PRIMARY KEY (idEquipo),
	UNIQUE (idEquipo),
	UNIQUE (idCategoria)
);


CREATE TABLE EQUIPO_HORARIO
(
	idEquipo year(2) NOT NULL,
	idHorario year(2) NOT NULL,
	UNIQUE (idEquipo),
	UNIQUE (idHorario)
);


CREATE TABLE HORARIO
(
	idHorario year(2) NOT NULL AUTO_INCREMENT,
	diaSemana varchar(9),
	horaInicio varchar(5),
	horaFin varchar(5),
	PRIMARY KEY (idHorario),
	UNIQUE (idHorario)
);


CREATE TABLE JUGADOR
(
	idCategoria year(2) NOT NULL AUTO_INCREMENT,
	nombreJugador varchar(35),
	apellidosJugador varchar(80),
	fechaNacimientoJugador date,
	DNIJugador decimal(8),
	idPosicion year(2) NOT NULL,
	PRIMARY KEY (idCategoria),
	UNIQUE (idCategoria)
);


CREATE TABLE JUGADOR_EQUIPO
(
	idEquipo year(2) NOT NULL,
	idCategoria year(2) NOT NULL
);


CREATE TABLE POSICION
(
	idPosicion year(2) NOT NULL AUTO_INCREMENT,
	nombrePosicion varchar(20),
	PRIMARY KEY (idPosicion),
	UNIQUE (idPosicion)
);


CREATE TABLE TITULACION
(
	idTitulacion year(2) NOT NULL AUTO_INCREMENT,
	nombreTitulacion varchar(40),
	PRIMARY KEY (idTitulacion),
	UNIQUE (idTitulacion)
);



/* Create Foreign Keys */

ALTER TABLE EQUIPO
	ADD FOREIGN KEY (idCategoria)
	REFERENCES CATEGORIA (idCategoria)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE EQUIPO
	ADD FOREIGN KEY (idEntrenador)
	REFERENCES ENTRENADOR (idEntrenador)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE EQUIPO_HORARIO
	ADD FOREIGN KEY (idEquipo)
	REFERENCES EQUIPO (idEquipo)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE JUGADOR_EQUIPO
	ADD FOREIGN KEY (idEquipo)
	REFERENCES EQUIPO (idEquipo)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE EQUIPO_HORARIO
	ADD FOREIGN KEY (idHorario)
	REFERENCES HORARIO (idHorario)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE JUGADOR_EQUIPO
	ADD FOREIGN KEY (idCategoria)
	REFERENCES JUGADOR (idCategoria)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE JUGADOR
	ADD FOREIGN KEY (idPosicion)
	REFERENCES POSICION (idPosicion)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE ENTRENADOR
	ADD FOREIGN KEY (idTitulacion)
	REFERENCES TITULACION (idTitulacion)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



