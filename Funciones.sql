set serveroutput on;

create or replace function f_coste(valor number)
return varchar
is
    coste varchar2(20);
begin
    coste := '';
    if valor <= 10 then
        coste := 'barato';
    else
        coste := 'caro';
    end if;
    return coste;
end;
/
select titulo, autor, precio, f_coste(precio) from libros;




/*
create or replace function f_diasemana(numero int)
return varchar2
is
    dia varchar2(25);
begin
    dia := '';
    case numero
        when 1 then
            dia := 'Lunes';
        when 2 then
            dia := 'Martes';
        when 3 then
            dia := 'Miercoles';
        when 4 then
            dia := 'Jueves';
        when 5 then
            dia := 'Viernes';
        when 6 then
            dia := 'Sabado';
        when 7 then
            dia := 'Domingo';
        else
            dia := 'No es correcto';
    end case;
    return dia;
end;
/
select f_diasemana(1) as dia from dual;
*/