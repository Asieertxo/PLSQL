set serveroutput on;

/*
create or replace trigger tr_ingresolibros
    before insert on libros
    for each row--hace un control por cada fila insertada
    begin
        insert into control values(user, sysdate, 'ingreso');
end tr_ingresolibros;
/

create or replace trigger tr_borradolibros
    before delete on libros
    for each row
    begin
        insert into control values(user, sysdate, 'borrado');
end tr_borradolibros;
/

create or replace trigger tr_actualizalibros
    before update on libros
    for each row
    begin
        insert into control values(user, sysdate, 'actualizacion');
end tr_actualizalibros;
/
*/

create or replace trigger tr_controllibros
    before insert or delete or update on libros
    for each row
    begin
    if inserting then
        insert into control values(user, sysdate, 'ingreso');
    end if;
    if deleting then
        insert into control values(user, sysdate, 'borrado');
    end if;
    if updating then
        insert into control values(user, sysdate, 'actualizado');
    end if;
end tr_controllibros;
/