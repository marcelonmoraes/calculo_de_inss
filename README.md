# Cálculo de INSS

Aplicação Rails para cálculo de INSS.

## Stack Tecnológica

### Backend
- Ruby 3.3.0
- Rails 8.0.2
- PostgreSQL 16
- Puma 6.6.0 (servidor web)

### Frontend
- Bootstrap 5.3.6
- Stimulus.js 3.2.2
- Turbo Rails 8.0.13
- ESBuild
- Sass

### Ferramentas de Desenvolvimento
- Rubocop (linting)
- Yarn (gerenciador de pacotes JavaScript)

## Requisitos

- Docker
- Docker Compose

## Configuração do Ambiente de Desenvolvimento

1. Clone o repositório:
```bash
git clone git@github.com:marcelonmoraes/calculo_de_inss.git
cd calculo_de_inss
```

2. Construa as imagens Docker:
```bash
docker compose build
```

3. Crie o banco de dados de desenvolvimento:
```bash
docker compose run --rm web rails db:create
docker compose run --rm web rails db:migrate
```

4. Inicie a aplicação:
```bash
docker compose up
```

A aplicação estará disponível em `http://localhost:3000`

## Executando Testes

1. Crie o banco de dados de teste:
```bash
docker compose run --rm test rails db:create RAILS_ENV=test
docker compose run --rm test rails db:migrate RAILS_ENV=test
```

2. Execute os testes:
```bash
docker compose run --rm test
```

## Estrutura do Docker

O projeto utiliza Docker Compose com os seguintes serviços:

- `web`: Aplicação Rails
- `db`: Banco de dados PostgreSQL para desenvolvimento
- `testdb`: Banco de dados PostgreSQL para testes
- `test`: Serviço para execução de testes

### Portas
- Aplicação Rails: 3000
- PostgreSQL (desenvolvimento): 5432
- PostgreSQL (testes): 55432

### Volumes
- `postgres_data`: Persistência dos dados do PostgreSQL
- `bundle_cache`: Cache das gems Ruby
- `.` (diretório atual): Código fonte da aplicação

## Comandos Úteis

### Desenvolvimento
```bash
# Iniciar a aplicação
docker compose up

# Executar comandos Rails
docker compose run --rm web rails [COMANDO]

# Executar console Rails
docker compose run --rm web rails console

# Executar migrações
docker compose run --rm web rails db:migrate
```

### Testes
```bash
# Executar todos os testes
docker compose run --rm test

# Executar testes específicos
docker compose run --rm test rspec [CAMINHO_DO_TESTE]
```

### Manutenção
```bash
# Reconstruir as imagens
docker compose build

# Parar todos os containers
docker compose down

# Limpar volumes não utilizados
docker compose down -v
```

## Desenvolvido por

Marcelo Moraes - @marcelonmoraes