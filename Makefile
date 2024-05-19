PIPENV = pipenv run
MANAGE = $(PIPENV) python manage.py
APPS = polls

.PHONY: manage
manage:
	echo 'pipenv run python manage.py'

.PHONY: runserver
runserver:
	$(MANAGE) runserver

.PHONY: migrate
migrate:
	$(MANAGE) createcachetable
	$(MANAGE) migrate

.PHONY: migrations
migrations:
	$(MANAGE) makemigrations

.PHONY: superuser
superuser:
	$(MANAGE) createsuperuser

.PHONY: lint
lint: flake8 mypy

.PHONY: flake8
flake8: $(APPS)
	@echo "Checking Python code..."
	@$(PIPENV) flake8 --statistics $^
	@echo "\e[32mOK\e[0m"

.PHONY: mypy
mypy: $(APPS)
	@echo "Checking Python types..."
	@$(PIPENV) mypy $^
