set serveroutput on;

DECLARE    
    type a_nombres is varray(5) of varchar2(20);--matriz de 5 elementos de tipo varcahr2;
    type a_edad is varray(5) of integer;
    nombres a_nombres;--declaramos la variable
    edad a_edad;
    total integer;
    
BEGIN  
    nombres := a_nombres('Asier', 'Juan', 'Pedro', 'Marcos', 'Felipe');
    edad := a_edad(20,30,22,28,25);
    total := nombres.count;
    for f in 1..total loop
         DBMS_OUTPUT.PUT_LINE(nombres(f) || ' con edad ' || edad(f));
    end loop;

END;