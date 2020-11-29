CREATE TABLE enderecos(
end_id SERIAL PRIMARY KEY,
consumidor_nome VARCHAR(256),
end_name VARCHAR(2048),
localizacao geometry(POINT, 4326)
);

CREATE TABLE caminhos(
cam_id SERIAL PRIMARY KEY,
end_id INT,
st_distance FLOAT,
distancia_linha geometry(LINESTRING, 4326),
CONSTRAINT fk_end
	FOREIGN KEY(end_id)
		REFERENCES enderecos(end_id)
);


