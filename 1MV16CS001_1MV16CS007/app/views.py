# Created by Abhijeet Singh
# views.py

from flask import render_template
from flask import request

from app import app

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/signin_student', methods=['GET', 'POST'])
def signin_student():
    return render_template('signin_student.html')

@app.route('/signin_staff')
def signin_staff():
    return render_template('signin_staff.html')

@app.route('/signin_admin')
def signin_admin():
    return render_template('signin_admin.html')

@app.route('/student_home', methods=['POST'])
def student_home():
    # import dbfunc
    stud_id = request.form['studEmail']
    stud_pass = request.form['studPass']
    # authenticated = dbfunc.verifyLogin(stud_id, stud_pass)

    if stud_pass == "1MV16CS002":
        return render_template('invalid_signin_student.html', name="")
    else:
        return render_template('student_home.html', name="")

@app.route('/admin_home')
def admin_home():
    return render_template('admin_home.html')

@app.route('/admin_create1')
def admin_create1():
    return render_template('admin_create1.html')

@app.route('/admin_create2')
def admin_create2():
    return render_template('admin_create2.html')

@app.route('/index_all')
def index_all():
    return render_template('index_all.html')

@app.route('/staff_home')
def staff_home():
    return render_template('staff_home.html')

@app.route('/search', methods=['POST'])
def search():
    search_name = request.form['searchQuery']

    if search_name == "hello":
        return render_template('search_error.html', name=search_name)
    else:
        return render_template('search.html', name=search_name)

@app.route('/updated', methods=['POST'])
def updated():
    # stud_id = request.form['entry_id']
    # stud_name = request.form['entry_name']
    # stud_dept = request.form['entry_dept']
    # if stud_id == "1MV16CS001":
    #     return render_template('invalid_create.html', name="")
    # else:
    #     import cx_Oracle
    #     con = cx_Oracle.connect('student/student@//localhost:1521/xe')
    #     cur = con.cursor()
    #     query = "insert into student values ('" + stud_id + "', '" + stud_name + "', '" + stud_dept + "')"
    #     cur.execute(query)
    #     con.close()
    return render_template('updated.html', name="")
