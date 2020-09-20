setup:
	python3 -m venv ~/.capstone-env
	source ~/.capstone-env/bin/activate

install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

lint:
	#hadolint demos/flask-sklearn/Dockerfile
	pylint --disable=R,C,W1203 **.py