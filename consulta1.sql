use Planes_De_Estudio
go

select NOMBREA from ALUMNO
where  IDALUMNO in (select IDALUMNO from CURSA
                    where  IDMATERIA in(select IDMATERIA from IMPARTE
                                        where  IDMAESTRO in (select IDMAESTRO from MAESTROS 
                                                             where NOMBREP = 'BAUTISTA MARGARITA'))
                    AND    CALIFICACION = 7)
go
