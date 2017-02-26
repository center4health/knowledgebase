from flask_sqlalchemy import SQLAlchemy

from application import app

db = SQLAlchemy(app)


class explanation_observation(db.Model):
    __tablename__ = "explanation_observation"
    id = db.Column('id', db.Integer, primary_key=True)
    explanation_id = db.Column('explanation_id', db.Integer, db.ForeignKey('explanation.id'))
    observation_id = db.Column('observation_id', db.Integer, db.ForeignKey('observation.id'))
    weight = db.Column('weight', db.REAL)
    observation = db.relationship('observation', back_populates="explanations")
    explanation = db.relationship('explanation', back_populates="observations")


class explanation_location(db.Model):
    __tablename__ = "explanation_location"
    id = db.Column('id', db.Integer, primary_key=True)
    explanation_id = db.Column('explanation_id', db.Text, db.ForeignKey('explanation.id'))
    location_id = db.Column('location_id', db.Integer, db.ForeignKey('location.id'))
    location = db.relationship('location', back_populates="explanations")
    explanation = db.relationship('explanation', back_populates="locations")


class explanation_type(db.Model):
    __tablename__ = "explanation_type"
    id = db.Column('id', db.Integer, primary_key=True)
    name = db.Column('name', db.Text)


class explanation(db.Model):
    __tablename__ = "explanation"
    id = db.Column('id', db.Integer, primary_key=True)
    icd10 = db.Column('icd10', db.Text)
    name = db.Column('name', db.Text)
    typeid = db.Column('type', db.Integer, db.ForeignKey('explanation_type.id'))
    types = db.relationship("explanation_type")
    observations = db.relationship("explanation_observation", back_populates="explanation")
    locations = db.relationship("explanation_location", back_populates="explanation")


class observation(db.Model):
    __tablename__ = "observation"
    id = db.Column('id', db.Integer, primary_key=True)
    name = db.Column('name', db.Text)
    typeid = db.Column('type', db.Integer)
    explanations = db.relationship("explanation_observation", back_populates="observation")


class location(db.Model):
    __tablename__ = "location"
    id = db.Column('id', db.Integer, primary_key=True)
    name = db.Column('name', db.Text)
    explanations = db.relationship("explanation_location", back_populates="location")


class User(db.Model):
    __tablename__ = "users"
    id = db.Column('id', db.Integer, primary_key=True)
    username = db.Column('username', db.Text)
    password = db.Column('password', db.Text)
    email = db.Column('email', db.Text)
    name = db.Column('name', db.Text)
    authenticated = db.Column('authenticated', default=False)

    def __init__(self, username, password, email, name):
        self.username = username
        self.password = password
        self.email = email
        self.name = name

    def is_active(self):
        return True

    def get_id(self):
        return str(self.id)

    def is_authenticated(self):
        return self.authenticated

    def is_anonymous(self):
        return False