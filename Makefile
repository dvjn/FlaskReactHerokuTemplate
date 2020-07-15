dev-flask:
	python app.py

dev-react:
	cd client && npm start

flask: dev-flask
react: dev-react

production:
	cd client && npm run build
	gunicorn wsgi:app

prod: production
