# PLSQL-introduccion
Introduccion y recordatorio sobre PLSQL

Los programas de PL/SQL se componen básicamente por bloques, pueden estar uno detrás de otro, o uno dentro de otro.

Los bloques se componen por secciones, estas son:

# DECLARE:
en ella se sitúan las variables (espacios de memoria que pueden contener valores de datos), las variables poseen un tipo el cual define qué clase de dato almacenan y estos tipos son de la misma naturaleza que los tipos que se utilizan para definir las columnas de una tabla en SQL.

# BEGIN: 
en ella se sitúan las ordenes SQL y procedimentales que llevan a cabo el trabajo del bloque.

# EXCEPTION: 
en ella se sitúa código que solo es ejecutado cuando ocurre un error


# Codigos de utilidad
  Mostrar mensajes del servidor de bases de datos
        set serveroutput on

  Imprimir una linea 
        DBMS_OUTPUT.PUT_LINE( x );

  Guardar una consulta en una variable
        SELECT COUNT(*) INTO NUMEROUSUARIOS
        FROM USUARIO;
        
  Guardar copia de una base de datos en variable, respetando el tipo
          REGISTRO EMPLOYEES%ROWTYPE;

# CICLOS
  # IF
      IF x THEN
       RETURN y;
      ELSE
       RETURN z;
      END IF;

  # WHILE
       WHILE X<100 LOOP
       X := X+ 1;
       END LOOP;
  # FOR
        FOR i IN 1..n LOOP
          DBMS_OUTPUT.PUT_LINE (i);
        END LOOP;
        (Para i igual a 1, hasta en, reproducir el loop)
# VARIABLES COMPUESTAS

# CURSORES
      Son Útiles para las consultas que devuelven más de una fila.

      La sintaxis para declarar un cursor es:
      CURSOR (Nombre del cursor) IS (Consulta select);

      Para utilizar un cursor debemos abrirlo con: OPEN (Nombre del cursor);
      
      Para recuperar los datos utilizamos FETCH(Recuperar).
      La sintax para el fetch es FETCH (Nombre cursor) INTO (nombre variable),(variable 2 etc hasta el mismo n de variables del cursor)
      Es necesario comprobar que el cursor tenga filas, el valor traido sera la fila actual, cada fetch avanza en uno la fila a consultar.  

      Luego lo cerramos con: CLOSE (Nombre del cursor);
