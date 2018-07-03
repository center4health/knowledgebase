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
    'postgres://mltkgljlklsite:11fec4fb9f2fa21cf880c20a980a94fcf349a1a2824765feb55e9811575fb09c@ec2-54-225-103-255.compute-1.amazonaws.com:5432/deukjocbdm26r1'
 #freedb:   'postgres://muxnxefxxigzwj:823f955cdba9cecd71804c9fe3e19727b6622f755c27998aa86c7ec5c6ca4fd4@ec2-54-235-196-250.compute-1.amazonaws.com:5432/d44jipmu2bfk8a'
 #olddb:  'postgres://doknosis:qwerty123456@doknosis.cxwnzlqwrgrs.us-west-1.rds.amazonaws.com:5432/doknosis'
from views import *


if __name__ == '__main__':
    app.run()
