use Planes_De_Estudio
go

/*==============================================================*/
/* Tabla: ALUMNO                                                */
/*==============================================================*/
create table ALUMNO (
   IDALUMNO             char(10)                       not null,
   IDCARRERA            char(10)                       null,
   NOMBREA              varchar(30)                    not null,
   SEMESTRE             int                            not null,
   constraint PK_ALUMNO primary key nonclustered (IDALUMNO)
)
go

/*==============================================================*/
/* Tabla: CARRERA                                               */
/*==============================================================*/
create table CARRERA (
   IDCARRERA            char(10)                       not null,
   NOMBREC              varchar(30)                    not null,
   constraint PK_CARRERA primary key nonclustered (IDCARRERA)
)
go

/*==============================================================*/
/* Tabla: CURSA                                                 */
/*==============================================================*/
create table CURSA (
   IDMATERIA            char(10)                       not null,
   IDALUMNO             char(10)                       not null,
   CALIFICACION         float                          null,
   CLAVE                int                            null,
   constraint PK_CURSA primary key nonclustered (IDMATERIA, IDALUMNO)
)
go

/*==============================================================*/
/* Tabla: IMPARTE                                               */
/*==============================================================*/
create table IMPARTE (
   IDMAESTRO            char(10)                       not null,
   IDMATERIA            char(10)                       not null,
   constraint PK_IMPARTE primary key nonclustered (IDMAESTRO, IDMATERIA)
)
go

/*==============================================================*/
/* Tabla: INCLUYE                                               */
/*==============================================================*/
create table INCLUYE (
   IDMATERIA            char(10)                       not null,
   IDCARRERA            char(10)                       not null,
   SEMESTRE             int                            null,
   constraint PK_INCLUYE primary key nonclustered (IDMATERIA, IDCARRERA)
)
go

/*==============================================================*/
/* Tabla: MAESTROS                                              */
/*==============================================================*/
create table MAESTROS (
   IDMAESTRO            char(10)                       not null,
   NOMBREP              varchar(30)                    not null,
   constraint PK_MAESTROS primary key nonclustered (IDMAESTRO)
)
go

/*==============================================================*/
/* Tabla: MATERIA                                               */
/*==============================================================*/
create table MATERIA (
   IDMATERIA            char(10)                       not null,
   NOMBREM              varchar(30)                    not null,
   CREDITOS             int                            not null,
   OBLIGATORIA          bit                            not null,
   constraint PK_MATERIA primary key nonclustered (IDMATERIA)
)
go

alter table ALUMNO
   add constraint FK_ALUMNO_ESTUDIAN_CARRERA foreign key (IDCARRERA)
      references CARRERA (IDCARRERA)
go

alter table CURSA
   add constraint FK_CURSA_CURSA_MATERIA foreign key (IDMATERIA)
      references MATERIA (IDMATERIA)
go

alter table CURSA
   add constraint FK_CURSA_CURSA2_ALUMNO foreign key (IDALUMNO)
      references ALUMNO (IDALUMNO)
go

alter table IMPARTE
   add constraint FK_IMPARTE_IMPARTE_MAESTROS foreign key (IDMAESTRO)
      references MAESTROS (IDMAESTRO)
go

alter table IMPARTE
   add constraint FK_IMPARTE_IMPARTE2_MATERIA foreign key (IDMATERIA)
      references MATERIA (IDMATERIA)
go

alter table INCLUYE
   add constraint FK_INCLUYE_INCLUYE_MATERIA foreign key (IDMATERIA)
      references MATERIA (IDMATERIA)
go

alter table INCLUYE
   add constraint FK_INCLUYE_INCLUYE2_CARRERA foreign key (IDCARRERA)
      references CARRERA (IDCARRERA)
go

