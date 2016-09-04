use Planes_De_Estudio
go

select NOMBREA
from   ALUMNO
where  IDALUMNO in (select IDALUMNO from CURSA
                    where  CALIFICACION = 8
                      AND  IDMATERIA in (select IDMATERIA from MATERIA
                                         where  CREDITOS = 9)
                      AND  IDMATERIA in (select IDMATERIA from IMPARTE
                                         where  IDMAESTRO in (select IDMAESTRO from MAESTROS
                                                              where  NOMBREP = 'CHAVEZ NORMA')))
go
