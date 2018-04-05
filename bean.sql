-- Variable tipo bean, remplaza variable de sustitucion y no tiene que ser precompliada 2 veces
-- podemos tener todas las v bean que queramos

SET SERVEROUTPUT ON;

DECLARE
  RESULTADO NUMBER;
BEGIN
    SELECT COUNT(*) INTO RESULTADO FROM EMPLOYEES WHERE DEPARTMENT_ID = :X;
    
    DBMS_OUTPUT.PUT_LINE(RESULTADO);
END;
/
