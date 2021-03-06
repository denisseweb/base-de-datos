CREATE OR REPLACE FUNCTION crear_pago()
  RETURNS TRIGGER 
  LANGUAGE PLPGSQL
  AS
$$
DECLARE
BEGIN
  INSERT INTO PAGO VALUES(NEW.fallecido_id, NEW.fallecido_id, 'EFECTIVO', NULL, 50, 'PENDIENTE');
  RETURN NEW;
END;
$$

CREATE OR REPLACE TRIGGER crear_pago
  AFTER INSERT
  ON FALLECIDO
  FOR EACH ROW
  EXECUTE PROCEDURE crear_pago();