.PHONY: up
up: .env
	docker-compose up -d --build

.env:
	cp .env.example .env

.PHONY: setup
setup: .env
	$(MAKE) up
	$(MAKE) rails CMD="db:migrate"
	$(MAKE) yarn/check-files

.PHONY: down
down:
	docker-compose down

.PHONY: rails rails/*
rails: .env
	docker-compose run --rm app rails $(CMD)

.PHONY: yarn yarn/*
yarn: .env
	docker-compose run --rm app yarn $(CMD)

yarn/check-files:
	$(MAKE) yarn CMD="install --check-files"
