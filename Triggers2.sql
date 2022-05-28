set serveroutput on;

create or replace trigger tr_actualizalibros
    before update on libros
    for each row
    begin
        if(:new.precio < :old.precio) then
            insert into ofertas values(:new.codigo, :new.precio, user, sysdate);
        end if;
        if(:new.precio >= :old.precio) then
            delete from ofertas where codigo = :new.codigo;
        end if;
end tr_actualizalibros;
/

update libros set precio=28 where codigo = 155;

select * from libros;
select * from ofertas;

/*----------------------------------------------------------------------------------------------------------------------------*/

create or replace trigger tr_aumento
    before update of sueldo on empleados
    for each row when(new.sueldo>old.sueldo)
    begin
        insert into control values (user, sysdate, :old.documento, :old.sueldo, :new.sueldo);
end tr_aumento;
/

select * from empleados;

update empleados set sueldo = 500 where documento=22333444;

select * from control;

/*----------------------------------------------------------------------------------------------------------------------------*/

create or replace trigger tr_actualizadatos
before insert on empleados
for each row
begin
    :new.apellido := INITCAP(:new.apellido);
    :new.nombre := INITCAP(:new.nombre);
    if (:new.sueldo is null) then
        :new.sueldo := 0;
    end if;
end tr_actualizadatos;
/

insert into empleados values('2566777', 'lopez', 'marcos', 'Secretario', null);
select * from empleados;