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
  # WHILE
  # FOR
