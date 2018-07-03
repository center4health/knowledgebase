from flask import Flask
from flask_bcrypt import Bcrypt
from flask_login import LoginManager
app = Flask(__name__)
bcrypt = Bcrypt(app)
login_manager = LoginManager()
login_manager.init_app(app)
app.secret_key = 'doknosis'
app.config['DEBUG'] = True
app.config['SQLALCHEMY_DATABASE_URI'] = \
    'postgres://doknosis:qwerty123456@doknosis.cxwnzlqwrgrs.us-west-1.rds.amazonaws.com:5432/doknosis'
      #'postgres://muxnxefxxigzwj:823f955cdba9cecd71804c9fe3e19727b6622f755c27998aa86c7ec5c6ca4fd4@ec2-54-235-196-250.compute-1.amazonaws.com:5432/d44jipmu2bfk8a'
 
from views import *


if __name__ == '__main__':
    app.run()
