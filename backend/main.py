from flask import Flask
from os import environ

app = Flask(__name__)

@app.route("/")
def root():
    return '<p>Hello World 2</p>'

if __name__ == "__main__":
    app.run(port=environ.get('PORT', '8181'), debug=False, host='0.0.0.0')
