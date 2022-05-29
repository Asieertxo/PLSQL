set serveroutput on;

select * from empleados;

declare
    filas number(2);
begin
    update empleados set sueldo = sueldo + 500 where sueldo>=3000;
    if (sql%notfound) then
        dbms_output.put_line('==NO HAY EMPLEADOS DISPONIBLES==');
    elsif (sql%found) then
        filas := sql%rowcount;
        dbms_output.put_line(filas || ': EMPLEADOS ACTUALIZADOS');
    end if;
end;
/
/*----------------------------------------------------------------------------------------------------------------------------*/


declare
    v_docu empleados.documento%type; /*esa variable coge el tipo de dato del elemento*/
    v_nom empleados.nombre%type;
    v_ape empleados.apellido%type;
    v_suel empleados.sueldo%type;
    
    cursor c_cursor2 is /*cursor explicito, almacena el resultado de la select*/
        select documento, nombre, apellido, sueldo from empleados where documento = 22222222;
        
begin
    open c_cursor2; /*abrir cursor*/
    fetch c_cursor2 into v_docu, v_nom, v_ape, v_suel; /*extrae todos los registros*/
    close c_cursor2; /*cerrar cursor para evitar errores*/
    dbms_output.put_line('documento; ' || v_docu);
    dbms_output.put_line('nombre; ' || v_nom);
    dbms_output.put_line('apellido; ' || v_ape);
    dbms_output.put_line('sueldo; ' || v_suel);
end;
/
/*----------------------------------------------------------------------------------------------------------------------------*/

declare
    v_empleados empleados%rowtype;/*todos los tipos de datos de la tabla de empleados*/
begin
    for v_empleados in (select * from empleados) loop   /*recorre toda la tabla cogiendo todos los datos*/
        dbms_output.put_line(v_empleados.nombre || ' - ' ||v_empleados.sueldo);       /*y coge solo los nombres y sueldos*/
    end loop;
end;
/
/*----------------------------------------------------------------------------------------------------------------------------*/

begin
    update empleados set sueldo = 10000 where documento = 23333533;
    if (sql%notfound) then
        dbms_output.put_line('==NO HAY EMPLEADOS DISPONIBLES==');
    end if;
end;
/
/*----------------------------------------------------------------------------------------------------------------------------*/

declare
    v_nom productos.nombre_producto%type;
    v_pre productos.precio%type;
    
    cursor c_productos (idprod productos.id_producto%type) is
        select nombre_producto, precio from productos where id_producto = idprod;
begin
    open c_productos(1);
    loop
        fetch c_productos into v_nom, v_pre;
        exit when c_productos%notfound;
        dbms_output.put_line('Articulo: ' || v_nom || ', precio ' || v_pre);
    end loop;
    close c_productos;
end;







