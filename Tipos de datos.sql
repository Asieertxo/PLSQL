set serveroutput on;

DECLARE
    identificador integer := 50;--nuemros entero
    nombre varchar2(25) := 'asier garcia';--string que recorta lo que sobra
    apodo char(10) := 'Asi';--string normal
    sueldo number(5) := 30000;--numeros
    comision decimal(4,2) := 50.20;--4 numeros, 2 de ellos decimales
    fecha date := (sysdate);--fecha del sistema
                --to_date('2020/07/09','yyyy/mm/dd')
    saludo varchar2(50) default 'Buenos dias a todos';

BEGIN
    DBMS_OUTPUT.PUT_LINE('Nombre: ' || nombre);


END;