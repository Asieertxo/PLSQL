set serveroutput on;
create sequence s_autoinAlumnos
    start with 1
    increment by 1
;

create or replace trigger tr_autoinAlumnos
before insert on alumnos
for each row
declare
    valor number := 0;
begin
    select s_autoinAlumnos.nextval into valor from dual;
    :new.id := valor;
end tr_autoinAlumnos;



select * from alumnos;

insert into alumnos (nombre, apellido) values ('Pedro', 'Jimenez');
insert into alumnos (nombre, apellido) values ('Antonio', 'Lopez');
insert into alumnos (nombre, apellido) values ('Juan', 'Garcia');
insert into alumnos (nombre, apellido) values ('Felipe', 'Lozano');





/*
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
*/