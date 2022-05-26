set serveroutput on;

DECLARE
    nombre varchar2(25) := 'asier garcia';

BEGIN
    DBMS_OUTPUT.PUT_LINE('Mayusculas: ' || UPPER(nombre));
    DBMS_OUTPUT.PUT_LINE('Minusculas: ' || LOWER(nombre));
    DBMS_OUTPUT.PUT_LINE('Iniciales mayusculas: ' || INITCAP(nombre));
    DBMS_OUTPUT.PUT_LINE('Parte del string: ' || SUBSTR(nombre, 3, 3));
    DBMS_OUTPUT.PUT_LINE('Encuentra coincidencias: ' || INSTR(nombre, 'a'));

END;