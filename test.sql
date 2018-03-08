/* 
Almacenar en variables
  -la cantidad de registros de una tabla
  -seleccionar una columna numerica y almacenar el numero maximo y el numero minimo
  
  -mostrar por pantalla los valores almacenados en las variables
  y la resta de numero maximo y numero minimo
  
*/
set serveroutput on

DECLARE
  REGISTROS NUMBER;
  MAXID NUMBER;
  MINID NUMBER;
  PROMEDIO NUMBER;
BEGIN
  SELECT COUNT(*) INTO REGISTROS
  FROM ALL_USERS;
  
  SELECT MAX(USER_ID) INTO MAXID
  FROM ALL_USERS;
  
  SELECT MIN(USER_ID) INTO MINID
  FROM ALL_USERS;
  
  SELECT AVG(USER_ID) INTO PROMEDIO
  FROM ALL_USERS;
  
  DBMS_OUTPUT.PUT_LINE('REGISTROS= '||REGISTROS);
  DBMS_OUTPUT.PUT_LINE('NUMERO MAXIMO= '||MAXID);
  DBMS_OUTPUT.PUT_LINE('NUMERO MINIMO= '||MINID);
  DBMS_OUTPUT.PUT_LINE('EL PROMEDIO ENTRE TODOS LOS ID ES DE  = '||PROMEDIO);
END;
/
