set serveroutput on;

--triggers de la tabla de empleados
select trigger_name, triggering_event, table_name, status from user_triggers where table_name='EMPLEADOS';

alter trigger tr_aumento disable;
alter trigger tr_aumento enable;

update empleados set sueldo = 2000 where documento = '22333444';

select * from control;





create or replace trigger tr_control_empleados
before insert or update or delete on empleados
for each row
begin
    if(:new.sueldo>5000)then
        raise_application_error(-20000, 'Sueldo no puede superar los 5000€');
    end if;
    insert into control values(user, sysdate, 'insert');
    if(:old.seccion = 'Gerencia')then
        raise_application_error(-20000, 'No se puede eliminar el puesto de Gerencia');
    end if;
        insert into control values(user, sysdate, 'borrado');
    if updating('documento')then
        raise_application_error(-20000, 'No se puede actualizar el documento');
    end if;
end tr_control_empleados;

select * from empleados;

insert into empleados values('56785555', 'garcia', 'pablo', 'Calle Mayor', 'Informatica', 6000);
delete from empleados where documento = 23333333;
update empleados set documento = 23333334 where documento = 22222222;