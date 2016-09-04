use Planes_De_Estudio
go

create procedure sp_reporteRegulares 
as
begin
    declare @msg varchar(120)
    declare @idA char(10)

    declare elCursor cursor
    for select IDALUMNO from ALUMNO

    open elCursor

    fetch elCursor into @idA

    if(@@sqlstatus = 2)
    begin
        close elCursor
        return
    end
    while(@@sqlstatus = 0)
    begin
    if((select count(*) from ALUMNO
         where  IDALUMNO in (select distinct IDALUMNO from CURSA
                                   where     IDALUMNO = @idA
                                        AND CALIFICACION >= 6
                                        AND IDMATERIA in (select IDMATERIA from INCLUYE
                                                          where  IDCARRERA in (select IDCARRERA from ALUMNO where IDALUMNO = @idA)
                                                          AND    SEMESTRE  <= (select SEMESTRE  from ALUMNO where IDALUMNO = @idA))
                                        AND (select count(*) from INCLUYE 
                                             where  IDCARRERA in (select IDCARRERA from ALUMNO where IDALUMNO = @idA)
                                             AND    SEMESTRE  <= (select SEMESTRE  from ALUMNO where IDALUMNO = @idA)) = 
                                                                     (select count(*) from CURSA
                                                                      where  IDMATERIA in (select IDMATERIA from INCLUYE
                                                                                           where  IDCARRERA in (select IDCARRERA from ALUMNO where IDALUMNO = @idA)
                                                                                           AND    SEMESTRE  <= (select SEMESTRE  from ALUMNO where IDALUMNO = @idA))))) > 0)
     begin
     select @msg = 
        (select NOMBREA from ALUMNO
         where  IDALUMNO in (select distinct IDALUMNO from CURSA
                                   where    IDALUMNO = @idA
                                        AND CALIFICACION >= 6
                                        AND IDMATERIA in (select IDMATERIA from INCLUYE
                                                          where  IDCARRERA in (select IDCARRERA from ALUMNO where IDALUMNO = @idA)
                                                          AND    SEMESTRE  <= (select SEMESTRE  from ALUMNO where IDALUMNO = @idA))
                                        AND (select count(*) from INCLUYE 
                                             where  IDCARRERA in (select IDCARRERA from ALUMNO where IDALUMNO = @idA)
                                             AND    SEMESTRE  <= (select SEMESTRE  from ALUMNO where IDALUMNO = @idA)) = 
                                                                     (select count(*) from CURSA
                                                                      where  IDMATERIA in (select IDMATERIA from INCLUYE
                                                                                           where  IDCARRERA in (select IDCARRERA from ALUMNO where IDALUMNO = @idA)
                                                                                           AND    SEMESTRE  <= (select SEMESTRE  from ALUMNO where IDALUMNO = @idA))))) + 'es alumno regular'
     print @msg
     end
     fetch elCursor into @idA
    end 
    
    close elCursor
    deallocate cursor elCursor
    
end
go