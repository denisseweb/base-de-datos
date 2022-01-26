/*==============================================================*/
/* Tabla: PROVINCIA                                             */
/*==============================================================*/
INSERT INTO PROVINCIA values(1, 'Manabí');

/*==============================================================*/
/* Tabla: CANTON                                                */
/*==============================================================*/
INSERT INTO CANTON values(1, 1, 'Manta');

/*==============================================================*/
/* Tabla: FALLECIDO                                             */
/*==============================================================*/
INSERT INTO FALLECIDO values(1, 'Alina Abril',       'Campos Bravo',  'Natural', '2020-07-26');
INSERT INTO FALLECIDO values(2, 'Romina Alisson',    'Cedeño Álava',  'Choque',  '2014-02-05');
INSERT INTO FALLECIDO values(3, 'Daniela Valentina', 'Zapata García', 'Natural', '2016-04-13');

/*==============================================================*/
/* Tabla: PROPIETARIO                                           */
/*==============================================================*/
INSERT INTO PROPIETARIO values(1, '1325645635', 'Marlon Luis',    'Zambrano López', '2000-09-13', 'Los Esteros', '0993209428');
INSERT INTO PROPIETARIO values(2, '1309987867', 'Anthony Javier', 'Torres Sánchez', '1998-04-19', 'Tarqui',      '0997895852');
INSERT INTO PROPIETARIO values(3, '1311329856', 'Bryan Elian',    'Alcivar Pilay',  '1999-07-25', 'Jocay',       '0980741236');

/*==============================================================*/
/* Tabla: INCIDENTE                                             */
/*==============================================================*/
INSERT INTO INCIDENTE values(1, 'Tumba dañada',   '2022-01-10', 3);
INSERT INTO INCIDENTE values(2, 'Tumba dañada',   '2022-01-11', 2);
INSERT INTO INCIDENTE values(3, 'Boveda abierta', '2022-01-12', 1);

/*==============================================================*/
/* Tabla: PERSONAL_EXTERNO                                      */
/*==============================================================*/
INSERT INTO PERSONAL_EXTERNO values(1, '0145781032', 'Bryan Elian',       'Alcivar Pilay', 'Operativo');
INSERT INTO PERSONAL_EXTERNO values(2, '1353145698', 'Romina Alisson',    'Cedeño Álava',  'Operativo');
INSERT INTO PERSONAL_EXTERNO values(3, '1306369170', 'Daniela Valentina', 'Zapata García', 'Administrativo');