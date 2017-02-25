from flask import Flask
from flask_bcrypt import Bcrypt
from flask_login import LoginManager
app = Flask(__name__)
bcrypt = Bcrypt(app)
login_manager = LoginManager()
login_manager.init_app(app)
app.secret_key = 'doknosis'
app.config['DEBUG'] = False
app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://doknosis:qwerty123456@doknosis.cxwnzlqwrgrs.us-west-1.rds.amazonaws.com:5432/doknosis'
from views import *


if __name__ == '__main__':
    app.run()
