@echo off


IF /I "%1"=="init" GOTO init
IF /I "%1"=="dev-flask" GOTO dev-flask
IF /I "%1"=="dev-react" GOTO dev-react
IF /I "%1"=="flask" GOTO flask
IF /I "%1"=="react" GOTO react
IF /I "%1"=="production" GOTO production
IF /I "%1"=="prod" GOTO prod
GOTO error

:init
	python -m pip install pipenv
	python -m pipenv install --ignore-pipfile --dev
	PUSHD client && npm i && POPD
	GOTO :EOF

:dev-flask
	python -m pipenv run python app.py
	GOTO :EOF

:dev-react
	PUSHD client && npm start && POPD
	GOTO :EOF

:flask
	CALL make.bat dev-flask
	GOTO :EOF

:react
	CALL make.bat dev-react
	GOTO :EOF

:production
	PUSHD client && npm ci && npm run build && POPD
	python -m pipenv run gunicorn wsgi:app
	GOTO :EOF

:prod
	CALL make.bat production
	GOTO :EOF

:error
    IF "%1"=="" (
        ECHO make: *** No targets specified and no makefile found.  Stop.
    ) ELSE (
        ECHO make: *** No rule to make target '%1%'. Stop.
    )
    GOTO :EOF
