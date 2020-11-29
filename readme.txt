Documentação do trabalho de dados espaciais utilizando postgis. Abaixo será detalhado cada arquivo presente no trabalho.
Para visualizar os dados espaciais utilize o pgadmin, selecione os dados que deseja ver e clique no botao com um olho, ao lado do nome da coluna aonde está o output dos dados.



1- Para transformar os dados OSM para o postgres, siga os passos:
	1-> Entrar como usuario postgres -> sudo -su postgres
	2-> wget https://download.openstreetmap.fr/extracts/south-america/brazil/central-west/mato-grosso-latest.osm.pbf
	3-> osm2pgsql -p matogrosso -d postgis -U postgres -H localhost -W -G --slim -l mato-grosso-latest.osm.pbf



2- ModelagemDER.brM3 é a modelagem feita no BRmodelo, possuindo 2 entidades representando as 2 tabelas criadas e sua relação.



3- tabelas.sql possui as tabelas criadas.
	Foi criado a tabela enderecos, que armazena todos os enderecos que forem adicionados, sendo incluido primeiramente o centro de distribuição. Será colocado o nome do consumidor, o nome do endereço e a localização.
	A outra tabela é a caminhos que guarda os caminhos gerados pelo trigger, possui chave estrangeira com a tabela enderecos e guarda o valor da distancia e uma linha em coordenadas para representar a distancia.
	
	
	
4- values.sql possui 2 valores exemplos.
	O primeiro valor é o centro de distribuição, e o segundo valor é a localização do IC ufmt.
	


5- trigger.sql possui o trigger caminhos_insert()
	O trigger caminhos_insert() pega cada valor inserido na tabela enderecos e calcula a distancia e a linha da distancia em relação ao primeiro valor em enderecos(centro de distribuição) e depois guarda esses valores na tabela caminhos, com chave estrangeira para o endereco calculado.
