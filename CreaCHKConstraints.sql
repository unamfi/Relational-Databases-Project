use Planes_De_Estudio
go

alter table ALUMNO
   add constraint SEMESTRE_ALUMNO check(SEMESTRE in(1,2,3,4,5,6,7,8))
go

alter table CARRERA
   add constraint NOMBRE_CARRERA check(NOMBREC in('Administración','Contaduría',
                                                  'Computación','Derecho',
                                                  'Economía','Actuaría',
                                                  'Matemáticas Aplicadas','Estadística'))
go

alter table INCLUYE
   add constraint SEMESTRE_INCLUYE check(SEMESTRE in(1,2,3,4,5,6,7,8))
go

alter table CURSA
   add constraint CALIFICACION_CURSA check(CALIFICACION between 0 AND 10)
go

alter table CURSA
   add constraint CLAVE_CURSA check(CLAVE in(1,2,3,4))
go