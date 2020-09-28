init:
	python -m pipenv install --ignore-pipfile --dev
	cd client && npm i

dev-flask:
	python -m pipenv run python app.py

dev-react:
	cd client && npm start

flask: dev-flask
react: dev-react

production:
	cd client && npm ci && npm run build
	python -m pipenv run gunicorn wsgi:app

prod: production
