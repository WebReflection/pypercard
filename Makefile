SHELL := /bin/bash

all:
	@echo "There's no default Makefile target right now. Try:"
	@echo ""
	@echo "make clean - reset the project and remove auto-generated assets."
	@echo "make tidy - tidy up the code with the 'black' formatter."
	@echo "make lint - check the code for obvious errors with flake8."
	@echo "make serve - serve the project at: http://0.0.0.0:8000/"
	@echo "make test - while serving the app, run the test suite in browser."

clean:
	rm -rf .pytest_cache
	find . | grep -E "(__pycache__)" | xargs rm -rf

tidy:
	black -l 79 pypercard.py
	black -l 79 tests/*

lint:
	flake8 pypercard.py tests/*

serve:
	python -m http.server

test:
	python -m webbrowser http://localhost:8000/tests.html
