MANAGE = pipenv run python manage.py


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
