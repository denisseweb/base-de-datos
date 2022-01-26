/*==============================================================*/
/* Tabla: PROVINCIA                                             */
/*==============================================================*/
create table PROVINCIA (
  provincia_id            INT4            not null,
  provincia_nombre        VARCHAR(30)     null,

  constraint PK_PROVINCIA primary key (provincia_id)
);

/*==============================================================*/
/* Tabla: FALLECIDO                                             */
/*==============================================================*/
create table FALLECIDO (
  fallecido_id            INT4            not null,
  fallecido_nombres       VARCHAR(30)     null,
  fallecido_apellidos     VARCHAR(30)     null,
  fallecido_causa         VARCHAR(30)     null,
  fallecido_fecha         DATE            null,

  constraint PK_FALLECIDO primary key (fallecido_id)
);

/*==============================================================*/
/* Tabla: PERSONAL_EXTERNO                                      */
/*==============================================================*/
create table PERSONAL_EXTERNO (
  pe_id             INT4            not null,
  pe_cedula         VARCHAR(30)     null,
  pe_nombre         VARCHAR(30)     null,
  pe_apellido       VARCHAR(30)     null,
  pe_cargo          VARCHAR(30)     null,

  constraint PK_PERSONAL_EXTERNO primary key (pe_id)
);

/*==============================================================*/
/* Tabla: PERSONAL                                              */
/*==============================================================*/
create table PERSONAL (
  personal_id             INT4            not null,
  personal_cedula         VARCHAR(30)     null,
  personal_nombres        VARCHAR(30)     null,
  personal_apellidos      VARCHAR(30)     null,
  personal_tipo           VARCHAR(30)     null,
  personal_direccion      VARCHAR(30)     null,
  personal_telefono       VARCHAR(30)     null,

  constraint PK_PERSONAL primary key (personal_id)
);

/*==============================================================*/
/* Tabla: PROPIETARIO                                           */
/*==============================================================*/
create table PROPIETARIO (
  propietario_id              INT4            not null,
  propietario_cedula          VARCHAR(30)     null,
  propietario_nombres         VARCHAR(30)     null,
  propietario_apellidos       VARCHAR(30)     null,
  propietario_fecha           DATE            null,
  propietario_direccion       VARCHAR(30)     null,
  propietario_telefono        VARCHAR(30)     null,

  constraint PK_PROPIETARIO primary key (propietario_id)
);

/*==============================================================*/
/* Tabla: PAGO                                                  */
/*==============================================================*/
create table PAGO (
  fallecido_id    INT4            not null,
  pago_id         INT4            not null,
  pago_tipo       VARCHAR(30)     null,
  pago_fecha      DATE            null,
  pago_valor      NUMERIC(6,2)    null,
  pago_estado     VARCHAR(30)     null,

  constraint PK_PAGO primary key (pago_id)
);

/*==============================================================*/
/* Tabla: CERTIFICADO                                           */
/*==============================================================*/
create table CERTIFICADO (
  pago_id               INT4            not null,
  certificado_id        INT4            not null,
  certificado_fecha     DATE            null,

  constraint PK_CERTIFICADO primary key (certificado_id)
);

/*==============================================================*/
/* Tabla: TRÁMITE                                               */
/*==============================================================*/
create table TRAMITE (
  canton_id         INT4            not null,
  personal_id       INT4            not null,
  pe_id             INT4            not null,
  boveda_id         INT4            not null,
  propietario_id    INT4            not null,
  tramite_id        INT4            not null,
  tramite_fecha     DATE            null,
  tramite_tipo      VARCHAR(30)     null,

  constraint PK_TRAMITE primary key (tramite_id)
);

/*==============================================================*/
/* Tabla: CANTON                                                */
/*==============================================================*/
create table CANTON (
  provincia_id        INT4            not null,
  canton_id           INT4            not null,
  canton_nombre       VARCHAR(30)     null,

  constraint PK_CANTON primary key (canton_id)
);

/*==============================================================*/
/* Tabla: INCIDENTE                                             */
/*==============================================================*/
create table INCIDENTE (
  incidente_id          INT4            not null,
  incidente_tipo        VARCHAR(30)     null,
  incidente_fecha       DATE            null,
  propietario_id        INT4            not null,

  constraint PK_INCIDENTE primary key (incidente_id)
);

/*==============================================================*/
/* Tabla: SEGUIMIENTO_INCIDENTE                                 */
/*==============================================================*/
create table SEGUIMIENTO_INCIDENTE (
  si_id             INT4            not null,
  incidente_id      INT4            not null,
  si_estado         VARCHAR(30)     null,

  constraint PK_SEGUIMIENTO_INCIDENTE primary key (si_id)
);

/*==============================================================*/
/* Tabla: REPORTE_INCIDENTE                                     */
/*==============================================================*/
create table REPORTE_INCIDENTE (
  ri_id             INT4            not null,
  si_id             INT4            not null,
  ri_solucion       VARCHAR(30)     null,
  ri_fecha          DATE            null,

  constraint PK_REPORTE_INCIDENTE primary key (ri_id)
);

/*==============================================================*/
/* Tabla: CEMENTERIO                                            */
/*==============================================================*/
create table CEMENTERIO (
  canton_id                 INT4            not null,
  cementerio_id             INT4            not null,
  cementerio_nombre         VARCHAR(30)     null,
  cementerio_direccion      VARCHAR(30)     null,

  constraint PK_CEMENTERIO primary key (cementerio_id)
);

/*==============================================================*/
/* Tabla: MANZANA                                               */
/*==============================================================*/
create table MANZANA (
  cementerio_id           INT4            not null,
  manzana_id              INT4            not null,
  manzana_nombre          VARCHAR(30)     null,

  constraint PK_MANZANA primary key (manzana_id)
);

/*==============================================================*/
/* Tabla: BOVEDA                                                */
/*==============================================================*/
create table BOVEDA (
  boveda_id           INT4            not null,
  manzana_id          INT4            not null,
  propietario_id      INT4            not null,
  boveda_tipo         VARCHAR(30)     null,

  constraint PK_BOVEDA primary key (boveda_id)
);

alter table PAGO
  add constraint FK_PAGO_FALLECIDO foreign key (fallecido_id)
    references FALLECIDO (fallecido_id)
    on delete restrict on update restrict;

alter table CERTIFICADO
  add constraint FK_PAGO_CERTIFICADO foreign key (pago_id)
    references PAGO (pago_id)
    on delete restrict on update restrict;

alter table INCIDENTE
  add constraint FK_INCIDENTE_PROPIETARIO foreign key (propietario_id)
    references PROPIETARIO (propietario_id)
    on delete restrict on update restrict;

alter table SEGUIMIENTO_INCIDENTE
  add constraint FK_SI_INCIDENTE foreign key (incidente_id)
    references INCIDENTE (incidente_id)
    on delete restrict on update restrict;

alter table REPORTE_INCIDENTE
  add constraint FK_RI_SI foreign key (si_id)
    references SEGUIMIENTO_INCIDENTE (si_id)
    on delete restrict on update restrict;
