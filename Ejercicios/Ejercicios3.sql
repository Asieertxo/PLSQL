set serveroutput on;

/*----------------------------------------------------------------------------------------------------------------------------*/
/*Ejercicio 1*/

create or replace procedure view_emp as
    v_emp emp%rowtype;
begin
    for v_emp in (select ename, hiredate from emp order by ename) loop
        dbms_output.put_line(v_emp.ename || ' -> ' || v_emp.hiredate);
    end loop;
end;

execute view_emp();


/*----------------------------------------------------------------------------------------------------------------------------*/
/*Ejercicio 2*/

select empno, deptno from emp group by depno;