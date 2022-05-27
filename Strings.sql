set serveroutput on;

DECLARE
    nombre varchar2(25) := 'asier garcia';

BEGIN
    DBMS_OUTPUT.PUT_LINE('Mayusculas: ' || UPPER(nombre));
    DBMS_OUTPUT.PUT_LINE('Minusculas: ' || LOWER(nombre));
    DBMS_OUTPUT.PUT_LINE('Iniciales mayusculas: ' || INITCAP(nombre));
    DBMS_OUTPUT.PUT_LINE('Parte del string: ' || SUBSTR(nombre, 3, 3));
    DBMS_OUTPUT.PUT_LINE('Busca la posicion de la coincidencia: ' || INSTR(nombre, 'a'));
    DBMS_OUTPUT.PUT_LINE('corta el caracter por ambos lados: ' || TRIM('a' from nombre));
    DBMS_OUTPUT.PUT_LINE('corta el caracter por la izquierda: ' || LTRIM(nombre, 'a'));
    DBMS_OUTPUT.PUT_LINE('corta el caracter por la derecha: ' || RTRIM(nombre, 'a'));

END;