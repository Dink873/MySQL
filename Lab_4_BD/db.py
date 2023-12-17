from flask import Flask, jsonify, request

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://root:Dink4102@localhost/mydb'
SQLALCHEMY_TRACK_MODIFICATIONS = False
app.config['SECRET_KEY'] = 'cairocoders-ednalan'
SQLALCHEMY_ECHO = True
