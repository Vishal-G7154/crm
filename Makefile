.PHONY: dev up down logs test lint format clean

python := python3
pip := pip3

create-env:
	@if [ ! -d .venv ]; then python3 -m venv .venv; fi
	@. .venv/bin/activate && pip install -U pip && pip install -r requirements.txt

run:
	FLASK_APP=wsgi.py FLASK_ENV=development flask run --host=0.0.0.0 --port=5000

dev:
	docker compose up --build

up:
	docker compose up -d

down:
	docker compose down

logs:
	docker compose logs -f --tail=100 web

clean:
	docker compose down -v
	docker system prune -f

test:
	python -m pytest tests/

lint:
	flake8 app/

format:
	black app/
	isort app/
