set serveroutput on;

DECLARE    
    valor number :=10;
    condicion varchar2(3) := 'yes';

BEGIN
    if condicion = 'yes' then
        loop
            DBMS_OUTPUT.PUT_LINE(valor);
            valor := valor + 10;
            
            if valor > 50 then
                exit;
            end if;
            --exit when valor >60    Lo mismo que el exit del if
        end loop;
        DBMS_OUTPUT.PUT_LINE('valor final =' || valor);
    else
        DBMS_OUTPUT.PUT_LINE('No entro en la condicion');
    end if;

END;