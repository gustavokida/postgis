CREATE OR REPLACE FUNCTION caminhos_insert() RETURNS trigger AS $caminhos_insert$
	BEGIN
		IF (EXISTS(
			SELECT end_name
			FROM enderecos
			WHERE end_name = 'Cooperativa Coorimbatá')
		) THEN
			INSERT INTO caminhos(end_id, st_distance, distancia_linha)
				VALUES(new.end_id,
					ST_Distance(new.localizacao, (
						SELECT localizacao
						FROM enderecos
						WHERE end_name = 'Cooperativa Coorimbatá')),
					ST_MakeLine(new.localizacao, (
						SELECT localizacao
						FROM enderecos
						WHERE end_name = 'Cooperativa Coorimbatá'))
					);
			
		END IF;
		RETURN NULL;
	END;
$caminhos_insert$ LANGUAGE plpgsql;
		
CREATE TRIGGER caminhos_insert
AFTER INSERT ON enderecos
FOR EACH ROW 
EXECUTE PROCEDURE caminhos_insert();

