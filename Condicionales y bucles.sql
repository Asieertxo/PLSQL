set serveroutput on;

DECLARE    
    numero number(2);
    multiplo number(2) := 1;

BEGIN
    for numero in /*reverse*/ 1..10 loop
        while multiplo <= 10 loop
            DBMS_OUTPUT.PUT_LINE(numero || 'x' || multiplo || ' = ' || (numero*multiplo));
            multiplo := multiplo + 1;
        end loop;
        DBMS_OUTPUT.PUT_LINE('-----------------------------------');
        multiplo := 1;
    end loop;
END;