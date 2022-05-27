set serveroutput on;


/*
select * from user_objects where object_type= 'PROCEDURE';--muestra los procedimientos almacenados
drop procedure saludo;--borra un procedimiento
*/




/*
select * from empleados;

create or replace procedure aumenta_sueldo(anio in number, porcentaje in number) as
begin
    update empleados set sueldo = sueldo + (sueldo * porcentaje/100) where (extract(year from current_date) - extract(year from fechaingreso)) > anio;
end aumenta_sueldo;
/
execute aumenta_sueldo(10, 20);

select * from empleados;
*/



/*
create or replace procedure ingreso_empleado (docu in varchar2, nom in varchar2, ape in varchar2) as
begin
    insert into empleados values(docu, nom, ape, null, null);
end ingreso_empleado;
/
execute ingreso_empleado('33333333', 'Emilio', 'Perez');

select* from empleados;
*/




create or replace procedure autor_libro(v_titulo in varchar2) as
    v_autor varchar2(20);
begin
    select autor into v_autor from libros where titulo=v_titulo;
    insert into tabla1 select titulo, precio from libros where autor = v_autor;
end autor_libro;
/
execute autor_libro('Libro2');

select * from tabla1;











