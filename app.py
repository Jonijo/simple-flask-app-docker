import os
from flask import Flask, render_template

app = Flask(__name__)


bg_color = os.environ.get("BG_COLOR", "#ffffff")  # default to white

@app.route('/')
def hello():

    return render_template("index.html", bg_color=bg_color) # Flask finds the templates folder automatically


@app.route('/hi')
def hi():
    return "I am good, how about you?"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)