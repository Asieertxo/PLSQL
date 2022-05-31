set serveroutput on;


create or replace procedure cambiar_oficio (v_num in number, v_job in varchar2) as
begin
    update emp set job = v_job where empno = v_num;
end cambiar_oficio;
/

declare
    v_num number(4) := &numero;
    v_job varchar2(9) := '&job';
begin
    cambiar_oficio(v_num, v_job);
end;
/
select * from emp;



/*----------------------------------------------------------------------------------------------------------------------------*/
/*Ejercicio 2*/

create or replace procedure suma(num1 in number, num2 in number) as
begin
    DBMS_OUTPUT.PUT_LINE(num1+num2);
end suma;
/
execute suma(1, 5);


/*----------------------------------------------------------------------------------------------------------------------------*/
/*Ejercicio 4*/

create or replace function f_fecha_año (fecha date)
return number is
    año number;
begin
    año := 0;
    select extract(year from fecha) into año from dual;
    return año;
end;
/
select f_fecha_año('25/05/2001') from dual;


/*----------------------------------------------------------------------------------------------------------------------------*/
/*Ejercicio 5*/

declare
    fecha date := ('20/05/2001');
    f number;
begin
    select f_fecha_año(fecha) into f from dual;
    DBMS_OUTPUT.PUT_LINE(f);
end;


/*----------------------------------------------------------------------------------------------------------------------------*/
/*Ejercicio 6*/
/*
    1.False
    2.True
    3.False
    4.True
    5.False
    6.False
    7.True
    8.False
    9.False
    10.False
*/


/*----------------------------------------------------------------------------------------------------------------------------*/
/*Ejercicio 7*/

create or replace function f_dif_fechas(fecha1 date, fecha2 date)
return number is
    años number;
begin
    años := months_between(fecha1, fecha2)/12;
    return años;
end;

select f_dif_fechas(to_date('2020/07/09','yyyy/mm/dd'), to_date('2000/07/09','yyyy/mm/dd')) from dual;


/*----------------------------------------------------------------------------------------------------------------------------*/
/*Ejercicio 8*/

create or replace function f_trienios(fecha1 date, fecha2 date)
return int is
    trienios number;
    años int;
begin
    select f_dif_fechas(fecha1, fecha2) into años from dual;
    trienios := trunc(años/3);
    return trienios;
end;

select f_trienios(to_date('2020/07/09','yyyy/mm/dd'), to_date('2000/07/09','yyyy/mm/dd')) from dual;


/*----------------------------------------------------------------------------------------------------------------------------*/
/*Ejercicio 9*/

alter table emp add total2 number(7,2) default null;
select * from emp;

declare
    v_emp emp%rowtype;
    suma number;
begin
    for v_emp in (select * from emp) loop
        if(v_emp.comm > 0) then
            suma := v_emp.sal + v_emp.comm;
            update emp set total2 = suma where empno = v_emp.empno;
        end if;
    end loop;
end;
/
create or replace trigger tr_addemp_total
before insert on emp
for each row
begin
    if(:new.comm > 0) then
        :new.total2 := :new.sal + :new.comm;
    end if;
end;

INSERT INTO EMP VALUES(7995,'ASIER','CLERK',7782,to_date('31-5-2022','dd-mm-yyyy'),1300,100,10,null);


/*----------------------------------------------------------------------------------------------------------------------------*/
/*Ejercicio 10*/

declare
    texto varchar2;
begin
    texto := 'sd-3rsf.4ff/34tgfer34$';
    DBMS_OUTPUT.PUT_LINE(regexp_like(texto, '^[^[:digit:]]+$'));
end;


/*----------------------------------------------------------------------------------------------------------------------------*/
/*Ejercicio 11*/

create or replace procedure incre_salario (porcent in number) as
begin
    update emp set sal = sal + (sal * (porcent/100)) where comm > (sal * 0.05);
end;

execute incre_salario(10);

select * from emp;
select * from emp where comm > (sal * 0.05);


/*----------------------------------------------------------------------------------------------------------------------------*/
/*Ejercicio 12*/

create or replace trigger tr_addemp
before insert on emp
for each row
declare
    v_emp emp%rowtype;
    num emp.empno%type;
begin
    num := 0;
    for v_emp in (select * from emp)loop
        if (v_emp.empno > num) then 
            num := v_emp.empno;
        end if;
    end loop;
    :new.empno := num+1;
    :new.hiredate := sysdate;
end;

INSERT INTO EMP VALUES(2222,'Antonio','CLERK',7782,null,1300,100,10,null);
select * from emp;


/*----------------------------------------------------------------------------------------------------------------------------*/
/*Ejercicio 13*/

create or replace procedure borrar_emp (num number) as
begin
    delete from emp where empno = num;
end;

execute borrar_emp(7937);


/*----------------------------------------------------------------------------------------------------------------------------*/
/*Ejercicio 14*/






