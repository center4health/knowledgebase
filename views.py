from flask import render_template, request, redirect, flash, url_for, session
from models import explanation, observation, location, explanation_observation, explanation_location, User, db
from application import app, bcrypt, login_manager
from flask_login import login_user , logout_user , current_user , login_required
login_manager.login_view = 'login'


@login_manager.user_loader
def user_loader(user_id):
    return User.query.get(int(user_id))


@login_manager.unauthorized_handler
def unauthorized():
    return redirect(url_for('login'))


@app.route('/', methods=['GET', 'POST'])
def login():
    if request.method == 'GET':
        return render_template('login.html')
    if len(request.form) == 2:
        user = User.query.filter_by(username=request.form['username']).first()
        if user:
            if bcrypt.check_password_hash(user.password, request.form['password']):
                user.authenticated = True
                db.session.add(user)
                db.session.commit()
                login_user(user, remember=False)
                flash('Logged in successfully')
                return redirect(request.args.get('next') or url_for('all'))
            else:
                flash('Password is invalid', 'error')
                return redirect(url_for('all'))
        else:
            flash('Username or Password is invalid', 'error')
            return redirect(url_for('all'))
    if len(request.form) == 6:
        username = request.form['username']
        if request.form['password'] == request.form['rpassword']:
            password = bcrypt.generate_password_hash(request.form['password'])
        else:
            flash('Password is invalid', 'error')
            return redirect(url_for('login'))
        user = User(username=username, password=password, email=request.form['email'], name=request.form['fullname'])
        db.session.add(user)
        db.session.commit()
        flash('User successfully registered')
        return redirect(url_for('login'))


@app.route('/logout', methods=["GET"])
@login_required
def logout():
    user = current_user
    user.authenticated = False
    db.session.add(user)
    db.session.commit()
    logout_user()
    session['signed'] = False
    return redirect('/')


@app.route('/all', methods=["GET"])
@login_required
def all():
    return render_template(
        'diseases.html',
        all=explanation.query.all()
    )

# @app.route('/new-disease', methods=['GET', 'POST'])
# def new_disease():
#     if request.method == 'POST':
#         d = disease(name=request.form['disease'])
#         db.session.add(d)
#         db.session.commit()
#         return redirect('/')
#     else:
#         return render_template(
#             'new-disease.html',
#             page='new-disease.html')
#
# @app.route('/<int:disease_id>', methods=['GET', 'POST'])
# def update_disease(disease_id):
#     d = disease.query.get(disease_id)
#     if request.method == 'GET':
#         return render_template(
#             'update.html',
#             d=d,
#         )
#     else:
#         name = request.form['disease']
#         d.name = name
#         db.session.commit()
#         exsymptoms = request.form.getlist('sym')
#         exweight = request.form.getlist('weight')
#         for i in xrange(len(exsymptoms)):
#             if (exsymptoms[i] != d.symptoms[i].symptom.name):
#                 dds = disease_symptom.query.filter_by(disease_id = d.id, symptom_id =d.symptoms[i].symptom.id).first()
#                 db.session.delete(dds)
#                 db.session.commit()
#                 s = symptom.query.filter_by(name=exsymptoms[i]).first()
#                 if (s == None):
#                     s = symptom(name=request.form['symptom'])
#                     db.session.add(s)
#                     db.session.commit()
#                 s = symptom.query.filter_by(name=exsymptoms[i]).first()
#                 ds = disease_symptom(disease_id=d.id, symptom_id=s.id, weight=exweight[i])
#                 db.session.add(ds)
#             else:
#                 s = symptom.query.filter_by(name=exsymptoms[i]).first()
#                 ds = disease_symptom.query.filter_by(disease_id = d.id, symptom_id =s.id).first()
#                 ds.weight = exweight[i]
#         db.session.commit()
#         return redirect('/')
#
#
# @app.route('/add-symptom', methods=['GET', 'POST'])
# def new():
#     if request.method == 'POST':
#         d = disease.query.filter_by(id=request.form['disease']).first()
#         s = symptom.query.filter_by(id=request.form['symptom']).first()
#         ds = disease_symptom(disease_id=request.form['disease'], symptom_id=request.form['symptom'], weight=request.form['weight'])
#         db.session.add(ds)
#         db.session.commit()
#         return redirect('/')
#     else:
#         return render_template(
#             'add-symptom.html',
#             page='add-symptom',
#             d=disease.query.all(),
#             s=symptom.query.all()
#         )