# Timetracking System

## Dependencias do Sistema
* Ruby versão 2.3.7.
* Rails versão 5.1.7.
## Instruções de Construção
### Comandos
` bundle install` - Instalá as gems utilizadas no projeto;/
` rake db:create` - Para gerar a base de dados dentro do projeto;/
` rake db:migrate` - Para migrar as tabelas do projeto para dentro do banco de dados;
## Instruções de uso
* ` rake spec`- Para iniciar os testes do Rspec;
* Geofences
  * New/Create - Antes de mais nada é necessário criar uma novo objeto geofence com sua geolocalização atual para que seja possível realizar o `Check-in` no sistema de controle de ponto. É possível gerar geopontos através das caixas de texto ou através do clique no mapa;
  * Index - Mostra a lista de Geofences criadas;
  * Show - Mostra os detalhes de uma Geofence especifíca;
  * Edit - Altera as propriedades de uma Geofence especifíca;
* Timetracking
  * New/Create/Update - Para gerar um novo objeto timetracking basta clicar sobre o botão `Check-in`, que irá funcionar desde que a localizão do usuário esteja dentro da areá de alguma geofence gerada;
  * Index - Mostra a lista de Timetrackigs criadas;
  * Show - Mostra os detalhes de uma Timetrackig especifíca;

Para checar se a geolocalização de um usuário está dentro de alguma geofence, uma funcão matemática que calcula a distancia entre duas coordenadas geográficas foi utlizada, onde, caso esteja dentro da distancia definida da radial de alguma geofence, permite gerar um novo objeto Timetracking./
A API do google maps foi utilizada nesse projeto pois possuí muitas funcionalidades já embutidas, é mais simples de utilizar e possui uma grande comunidade para auxílio.
