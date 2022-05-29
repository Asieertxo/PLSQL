set serveroutput on;

/*select * from alumnos;*/

create or replace trigger tr_autoincrement
before insert on alumnos
for each row
declare
    v_alumnos alumnos%rowtype;
    v_id alumnos.id%type;
begin
    v_id := 0;
    for v_alumnos in (select * from alumnos) loop
        if (v_alumnos.id > v_id) then
            v_id := v_alumnos.id;
        end if;
    end loop;
    insert into alumnos values(v_id, :new.nombre, :new.apellido);
end tr_autoincrement;

insert into alumnos (nombre, apellido) values('Asier', 'Garcia');

create table alumnos(
    id number primary key,
    nombre varchar2(20),
    apellido varchar2(20)
);

