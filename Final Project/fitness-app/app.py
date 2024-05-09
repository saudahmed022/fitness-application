from flask import Flask, render_template, request, redirect, url_for,flash
import pymysql
pymysql.install_as_MySQLdb()
from flask_mysqldb import MySQL
import MySQLdb.cursors


app = Flask(__name__)
app.config['SECRET_KEY'] = '5791628bb0b13ce0c676dfde280b9u2d5'
app.config["MYSQL_USER"]="flask_user"
app.config["MYSQL_PASSWORD"]="secure_password_123"
app.config["MYSQL_DB"]="fitness"
app.config["MYSQL_CURSORCLASS"]="DictCursor"

mysql = MySQL(app)

@app.route("/about")
def about():
    return render_template("about.html")

@app.route("/")
def index():
    cur=mysql.connection.cursor()
    cur.execute("SELECT * FROM user")
    user=cur.fetchall()
    # Chunk the user data into groups of 5
    user_chunks = [user[i:i+5] for i in range(0, len(user), 5)]
    return render_template("index.html",user=user,user_chunks=user_chunks)


@app.route("/view-user/<int:id>", methods=["POST","GET"])
def view_user(id):
    cur=mysql.connection.cursor()
    if request.method == "POST":
        pass
    else:
        cur.execute("SELECT * FROM user WHERE userID = %s", (id,))
        user = cur.fetchone()

        # Fetch user's program
        cur.execute("SELECT * FROM user_workout_program WHERE userID = %s", (id,))
        user_program = cur.fetchone()
        program_id = user_program['programID']

        # Fetch program details
        cur.execute("SELECT * FROM workout_program WHERE programID = %s", (program_id,))
        program = cur.fetchone()

        # Fetch recommended exercises for the program
        cur.execute("SELECT exercise.* FROM exercise INNER JOIN program_exercise ON exercise.ExerciseID = program_exercise.exerciseID WHERE program_exercise.programID = %s", (program_id,))
        recommended_exercises = cur.fetchall()

        return render_template("view-user.html", user=user, program=program, recommended_exercises=recommended_exercises)


@app.route("/view-user/<int:id>/delete", methods=['POST'])
def delete_user(id):
    cur=mysql.connection.cursor()
    del_query = "DELETE FROM User WHERE userID = %s"
    try:
        cur.execute(del_query,{id})
        mysql.connection.commit()
        return redirect("/")
    except:
        return "<h2>There was an issue deleting the record</h2>"

@app.route('/new-client', methods=["GET","POST"])
def new_client():
    cur = mysql.connection.cursor()
    if request.method == 'POST':
        first_name = request.form['firstName']
        last_name = request.form['lastName']
        age = request.form['age']
        gender = request.form['gender']
        height = request.form['height']
        weight = request.form['weight']
        progress_goal = request.form['specificGoal']
        
        # Insert the user into the user table
        sql_user = "INSERT INTO user (first_name, last_name, age, gender, height, weight, progressGoal) VALUES (%s, %s, %s, %s, %s, %s, %s)"
        cur.execute(sql_user, (first_name, last_name, age, gender, height, weight, progress_goal))
        mysql.connection.commit()
        user_id = cur.lastrowid

        # Assign a program to the user based on their progress goal and fitness goal
        sql_program = """
            INSERT INTO user_workout_program (userID, programID)
            SELECT user.userID, workout_program.programID
            FROM user
            JOIN workout_program ON (
                (user.progressGoal LIKE %s AND workout_program.fitnessGoal = 'Weight Loss')
                OR (user.progressGoal LIKE %s AND workout_program.fitnessGoal = 'Muscle Gain')
                OR (user.progressGoal LIKE %s AND workout_program.fitnessGoal = 'Cardio')
                OR (user.progressGoal LIKE %s AND workout_program.fitnessGoal = 'Strength')
                OR (user.progressGoal LIKE %s AND workout_program.fitnessGoal = 'Flexibility')
                OR (
                    user.progressGoal NOT LIKE %s
                    AND user.progressGoal NOT LIKE %s
                    AND user.progressGoal NOT LIKE %s
                    AND user.progressGoal NOT LIKE %s
                    AND user.progressGoal NOT LIKE %s
                )
            );
        """

        placeholders = ('%lose%', '%gain%', '%run%', '%strength%', '%flexibility%', '%lose%', '%gain%', '%run%', '%strength%', '%flexibility%')

        cur.execute(sql_program, placeholders)
        mysql.connection.commit()
        flash('Client Successfully Added.', 'success')
        return redirect(url_for('view_user', id=user_id))

    return render_template('new-client.html')


@app.route('/update-client/<int:id>', methods=["GET","POST"])
def update_client(id):
    cur = mysql.connection.cursor()
    if request.method == "POST":
        first_name = request.form['first_name']
        last_name = request.form['last_name']
        age = request.form['age']
        gender = request.form['gender']
        height = request.form['height']
        weight = request.form['weight']
        progressGoal = request.form['progressGoal']
        cur.execute("""
            UPDATE user 
            SET first_name=%s, last_name=%s, age=%s, gender=%s, height=%s, weight=%s, progressGoal=%s
            WHERE userID=%s
        """, (first_name, last_name, age, gender, height, weight, progressGoal, id))
        
        mysql.connection.commit()
        flash('Client Successfully Updated.', 'success')
        return redirect(url_for('view_user', id=id))
    else:
        cur.execute("SELECT * FROM user WHERE userID = %s", (id,))
        user = cur.fetchone()
    return render_template("update-client.html",user=user)


if __name__ == "__main__":
    app.run(debug=True)