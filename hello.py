from flask import Flask
app = Flask(__name__)


@app.route('/')
def hello_world():
    return 'Hello from Neeru! This project makes use of rolling deployment.'

if __name__ == '__main__':
    app.run(host='0.0.0.0')