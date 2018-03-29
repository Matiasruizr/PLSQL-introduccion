/*
Fetch (recuperar)
FETCH cursor_name INTO variable_list;

*/

create table departamento_100 as select * from employees;
select  * from departamento_100;

create table departamento_10v2 as select first_name, last_name from employees;
select  * from departamento_10v2;

truncate table departamento_10v2;
set serveroutput on;


DECLARE
  emp_dep10v2 DEPARTAMENTO_10V2%rowtype; --adopta los valores de departamento_10
  cursor c1 is  select first_name, last_name  --Cursor es un arreglo que trae los resultados de la consulta fila por fila
                from employees
                where Department_id = 10;
BEGIN
  open c1; --Con esto abrimos el cursor antes de un loop (Es como inicializar), recien a este momento ejecuta el select (definido arriba)
  fetch c1 into emp_dep10v2; --fetch , colocal el cursor en la primera fila de resultados
  
  while c1%found loop --%found es devuelve true cuando hay resultados, false cuando no, Encontramos resultados en el cursor?
    insert into DEPARTAMENTO_10V2 values emp_dep10v2;
    DBMS_OUTPUT.PUT('Nombre: '); --El put deja mensajes en cola, cuando ingresamos el putline lo imprimimos
    DBMS_OUTPUT.PUT(emp_dep10v2.first_name);
    DBMS_OUTPUT.PUT(' ');
    DBMS_OUTPUT.PUT_LINE(emp_dep10v2.last_name);
    fetch c1 into emp_dep10v2;-- Colocamos el cursor en un valor mas abajo (Casi como un ++)
  end loop;
  close c1; -- Debemos cerrarlo para poder ejecutarlo nuevamente
END;
/


--codigo 2
DECLARE
  emp_dep10v2 DEPARTAMENTO_10V2%rowtype; --adopta los valores de departamento_10
  cursor c1 is  select first_name, last_name  --Cursor es un arreglo que trae los resultados de la consulta fila por fila
                from employees
               where Department_id = 10;
BEGIN
  open c1; --Con esto abrimos el cursor antes de un loop (Es como inicializar), recien a este momento ejecuta el select (definido arriba)
   loop --Loop repite una accion indefinidamente, hasta que un exit lo indique
   fetch c1 into emp_dep10v2; --fetch , coloca en la siguiente fila de resultados (si es por primera vez, inicializa 1)
    exit when c1%notfound; --Salir cuando no encuentre resultados
    insert into DEPARTAMENTO_10V2 values emp_dep10v2;
    DBMS_OUTPUT.PUT('Nombre: '); --El put deja mensajes en cola, cuando ingresamos el putline lo imprimimos
    DBMS_OUTPUT.PUT(emp_dep10v2.first_name);
    DBMS_OUTPUT.PUT(' ');
    DBMS_OUTPUT.PUT_LINE(emp_dep10v2.last_name);
  end loop;
  close c1; -- Debemos cerrarlo para poder ejecutarlo nuevamente
END;
/

--cursor 3, por medio de for
-- El for crea la variable fila, la cual es un rowtype automatica, esta existira solo cuando recorre el for
-- por cada fila hace un fetch, abre y cierra el cursor de manera automatica
DECLARE
  cursor c1 is  select first_name, last_name  --Cursor es un arreglo que trae los resultados de la consulta fila por fila
                from employees
                where Department_id = 10;
BEGIN
   FOR FILA IN c1 LOOP -- CLONA LOS RESULTADOS EN FILA, Y RECORRELOS, ABRE Y CIERA CURSOR DE MANERA AUTOMATICA
    insert into DEPARTAMENTO_10V2 values FILA;
    DBMS_OUTPUT.PUT('Nombre: '); --El put deja mensajes en cola, cuando ingresamos el putline lo imprimimos
    DBMS_OUTPUT.PUT(FILA.first_name);
    DBMS_OUTPUT.PUT(' ');
    DBMS_OUTPUT.PUT_LINE(FILA.last_name);
   END LOOP;
END;
/
