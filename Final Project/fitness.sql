CREATE DATABASE fitness;

USE fitness;

CREATE TABLE workout_program (
    programID INT AUTO_INCREMENT PRIMARY KEY,
    programName VARCHAR(255) NOT NULL,
    fitnessGoal VARCHAR(255) NOT NULL,
    Description TEXT
);

INSERT INTO workout_program (programName, fitnessGoal, Description) VALUES
('Beginner''s Program', 'Weight Loss', 'A beginner-friendly program...'),
('Muscle Gain Plan', 'Muscle Gain', 'Focuses on building muscle mass'),
('Cardio Blast', 'Cardio', 'Intense cardio workouts'),
('Core Strength', 'Strength', 'Emphasizes core muscle training'),
('Yoga for Wellness', 'Flexibility', 'Promotes flexibility and peace');

CREATE TABLE exercise (
    ExerciseID INT AUTO_INCREMENT PRIMARY KEY,
    ExerciseName VARCHAR(255) NOT NULL,
    VideoURL VARCHAR(255),
    Description TEXT
);

INSERT INTO exercise (ExerciseName, VideoURL, Description)
VALUES ('Push-ups', 'https://www.example.com/pushups.mp4', 'A bodyweight exercise that strengthens the chest, shoulders, and triceps.'),
       ('Squats', 'https://www.example.com/squats.mp4', 'A lower body exercise that strengthens the quads, hamstrings, and glutes.'),
       ('Jumping Jacks', NULL, 'A full-body cardio exercise that elevates heart rate and improves coordination.'),
       ('Lunges', 'https://www.example.com/lunges.mp4', 'A lower body exercise that works glutes, quads, and core.'),
       ('Plank', 'https://www.example.com/plank.mp4', 'An isometric exercise that strengthens core and shoulders.'),
       ('Crunches', 'https://www.example.com/crunches.mp4', 'An abdominal exercise that targets the upper abs.'),
       ('High Knees', NULL, 'A cardio exercise that improves agility and coordination.'),
       ('Butt Bridges', 'https://www.example.com/bridges.mp4', 'An exercise that strengthens glutes and hamstrings.'),
       ('Rows (bodyweight)', 'https://www.example.com/rows.mp4', 'A back exercise using a chair or table to target upper back muscles.'),
       ('Dips (tricep)', 'https://www.example.com/dips.mp4', 'An exercise using a chair or bench to strengthen triceps.'),
       ('Mountain Climbers', 'https://www.example.com/climbers.mp4', 'A full-body exercise that combines cardio and core engagement.'),
       ('Russian Twists', 'https://www.example.com/twist.mp4', 'An exercise that strengthens obliques and core rotation.'),
       ('Walking Lunges', 'https://www.example.com/walkinglunges.mp4', 'A variation of lunges that adds a cardio element.'),
       ('Side Plank (right)', 'https://www.example.com/sideplank.mp4', 'Strengthens obliques and core on one side.'),
       ('Side Plank (left)', NULL, 'Same as Side Plank (right) but targeting the other side.'),
       ('Superman', 'https://www.example.com/superman.mp4', 'An exercise that strengthens lower back and glutes.'),
       ('Bird-Dog', 'https://www.example.com/birdog.mp4', 'Improves core stability and coordination.'),
       ('Squat Jumps', NULL, 'A plyometric exercise that builds lower body power.'),
       ('Glute Bridges with Single Leg Extension', 'https://www.example.com/bridgeext.mp4', 'Variation of bridge that adds hamstring and glute activation.'),
       ('Walking Plank', 'https://www.example.com/walkingplank.mp4', 'A core exercise that adds a dynamic element.'),
       ('Calf Raises', 'https://www.example.com/calfraises.mp4', 'Strengthens calf muscles for better ankle stability.'),
       ('Wall Sit', NULL, 'An isometric exercise that strengthens quads and core.'),
       ('Arm Circles (forward)', NULL, 'Improves shoulder mobility and warmup for upper body.'),
       ('Arm Circles (backward)', NULL, 'Counterpart to arm circles forward, improves shoulder mobility.'),
       ('Donkey Kicks', 'https://www.example.com/donkeys.mp4', 'An exercise that strengthens hamstrings and glutes in isolation.'),
       ('Hamstring Curls (bodyweight)', 'https://www.example.com/hamstringcurls.mp4', 'Strengthens hamstrings using a chair or furniture.'),
       ('Plank with Shoulder Taps', 'https://www.example.com/plankshoulder.mp4', 'A variation of plank that adds core and shoulder stability challenge.'),
       ('Jumping Jacks with Arm Claps', NULL, 'Variation of jumping jacks that adds upper body engagement.');


CREATE TABLE user (
    userID INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(35) NOT NULL,
    last_name  VARCHAR(35) NOT NULL,
    age INT,
    gender ENUM('Male', 'Female'),
    height FLOAT,
    weight FLOAT,
    progressGoal VARCHAR(255)
);

INSERT INTO user (first_name, last_name, age, gender, height, weight, progressGoal) VALUES
('John', 'Doe', 30, 'Male', 180.5, 80.0, 'Lose 10 pounds by end of month'),
('Jane', 'Smith', 25, 'Female', 165.0, 60.0, 'Gain muscle mass'),
('Michael', 'Johnson', 40, 'Male', 175.0, 85.0, 'Run 5 miles daily'),
('Emily', 'Brown', 35, 'Female', 170.0, 65.0, 'Fit into old jeans'),
('David', 'Williams', 28, 'Male', 185.0, 90.0, 'Reduce body fat percentage'),
('Sarah', 'Wilson', 32, 'Female', 160.0, 55.0, 'Improve flexibility'),
('Robert', 'Jones', 45, 'Male', 170.0, 75.0, 'Increase strength'),
('Jessica', 'Davis', 27, 'Female', 175.0, 70.0, 'Train for marathon'),
('William', 'Miller', 33, 'Male', 190.0, 95.0, 'Build endurance'),
('Amanda', 'Taylor', 29, 'Female', 155.0, 50.0, 'Improve posture'),
('Matthew', 'Anderson', 38, 'Male', 180.0, 85.0, 'Enhance overall fitness'),
('Laura', 'Wilson', 31, 'Female', 170.0, 60.0, 'Increase energy levels'),
('Daniel', 'Martinez', 34, 'Male', 175.0, 80.0, 'Reduce stress'),
('Megan', 'Hernandez', 26, 'Female', 165.0, 55.0, 'Develop healthy habits'),
('Christopher', 'Garcia', 39, 'Male', 185.0, 90.0, 'Improve cardiovascular health'),
('Ashley', 'Lopez', 30, 'Female', 160.0, 65.0, 'Achieve balance in life'),
('Andrew', 'Gonzalez', 42, 'Male', 170.0, 75.0, 'Maintain weight'),
('Samantha', 'Perez', 28, 'Female', 175.0, 70.0, 'Strengthen core muscles'),
('James', 'Sanchez', 36, 'Male', 195.0, 100.0, 'Increase agility'),
('Stephanie', 'Ramirez', 32, 'Female', 165.0, 55.0, 'Enhance mental clarity'),
('Joseph', 'Torres', 37, 'Male', 180.0, 85.0, 'Improve sleep quality'),
('Jennifer', 'Flores', 29, 'Female', 170.0, 60.0, 'Manage stress effectively'),
('Ryan', 'Rivera', 41, 'Male', 175.0, 80.0, 'Promote overall well-being'),
('Melissa', 'Gomez', 27, 'Female', 155.0, 50.0, 'Increase self-confidence'),
('Kevin', 'Diaz', 43, 'Male', 190.0, 95.0, 'Build lean muscle mass'),
('Nicole', 'Reyes', 31, 'Female', 160.0, 65.0, 'Improve endurance'),
('Jason', 'Ortiz', 35, 'Male', 175.0, 70.0, 'Lose body fat'),
('Kimberly', 'Cruz', 28, 'Female', 175.0, 75.0, 'Enhance flexibility'),
('Brian', 'Morales', 44, 'Male', 180.0, 80.0, 'Increase metabolism'),
('Rachel', 'Gutierrez', 33, 'Female', 170.0, 55.0, 'Achieve weight loss goals'),
('Timothy', 'Chavez', 26, 'Male', 185.0, 90.0, 'Improve physical performance'),
('Christina', 'Ramos', 45, 'Female', 155.0, 60.0, 'Boost energy levels'),
('Brandon', 'Alvarez', 30, 'Male', 170.0, 75.0, 'Maintain healthy lifestyle'),
('Rebecca', 'Vasquez', 34, 'Female', 165.0, 70.0, 'Increase muscle tone'),
('Gary', 'Herrera', 46, 'Male', 175.0, 85.0, 'Stay active and fit'),
('Heather', 'Jimenez', 29, 'Female', 160.0, 65.0, 'Improve cardiovascular endurance'),
('Edward', 'Castillo', 36, 'Male', 180.0, 90.0, 'Develop strength and power'),
('Tiffany', 'Fernandez', 35, 'Female', 170.0, 55.0, 'Reduce body weight'),
('Jeremy', 'Luna', 47, 'Male', 185.0, 95.0, 'Enhance overall health'),
('Angela', 'Valdez', 31, 'Female', 155.0, 60.0, 'Increase flexibility and mobility'),
('Gregory', 'Mendoza', 28, 'Male', 170.0, 75.0, 'Improve physical appearance'),
('Katherine', 'Castro', 37, 'Female', 165.0, 70.0, 'Achieve optimal health'),
('Douglas', 'Gomez', 48, 'Male', 175.0, 80.0, 'Maintain active lifestyle'),
('Stacey', 'Hernandez', 32, 'Female', 160.0, 65.0, 'Increase strength and endurance'),
('Jerry', 'Gonzales', 29, 'Male', 180.0, 85.0, 'Improve flexibility and balance'),
('Linda', 'Martinez', 38, 'Female', 170.0, 55.0, 'Enhance overall well-being'),
('Peter', 'Alonso', 49, 'Male', 185.0, 90.0, 'Stay healthy and fit'),
('Vanessa', 'Vargas', 33, 'Female', 155.0, 60.0, 'Improve physical fitness'),
('Phillip', 'Ruiz', 50, 'Male', 170.0, 75.0, 'Reduce risk of chronic diseases');


CREATE TABLE user_workout_program (
    userProgramID INT AUTO_INCREMENT PRIMARY KEY,
    userID INT,
    programID INT,
    FOREIGN KEY (userID) REFERENCES user(userID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (programID) REFERENCES workout_program(programID) ON DELETE CASCADE ON UPDATE CASCADE

);

-- For users with weight loss goals
INSERT INTO user_workout_program (userID, programID)
SELECT userID, programID
FROM user
CROSS JOIN workout_program
WHERE progressGoal LIKE '%lose%' AND fitnessGoal = 'Weight Loss';

-- For users with muscle gain goals
INSERT INTO user_workout_program (userID, programID)
SELECT userID, programID
FROM user
CROSS JOIN workout_program
WHERE progressGoal LIKE '%gain%' AND fitnessGoal = 'Muscle Gain';

-- For users with cardio goals
INSERT INTO user_workout_program (userID, programID)
SELECT userID, programID
FROM user
CROSS JOIN workout_program
WHERE progressGoal LIKE '%run%' AND fitnessGoal = 'Cardio';

-- For users with strength goals
INSERT INTO user_workout_program (userID, programID)
SELECT userID, programID
FROM user
CROSS JOIN workout_program
WHERE progressGoal LIKE '%strength%' AND fitnessGoal = 'Strength';

-- For users with flexibility goals
INSERT INTO user_workout_program (userID, programID)
SELECT userID, programID
FROM user
CROSS JOIN workout_program
WHERE progressGoal LIKE '%flexibility%' AND fitnessGoal = 'Flexibility';

-- For users with general fitness goals
INSERT INTO user_workout_program (userID, programID)
SELECT userID, programID
FROM user
CROSS JOIN workout_program
WHERE progressGoal NOT LIKE '%lose%'
  AND progressGoal NOT LIKE '%gain%'
  AND progressGoal NOT LIKE '%run%'
  AND progressGoal NOT LIKE '%strength%'
  AND progressGoal NOT LIKE '%flexibility%';


CREATE TABLE program_exercise (
    programExerciseID INT AUTO_INCREMENT PRIMARY KEY,
    programID INT,
    exerciseID INT,
    FOREIGN KEY (programID) REFERENCES workout_program(programID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (exerciseID) REFERENCES exercise(ExerciseID) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Next, Assigning exercises to workout programs based on fitness goals

-- For the Beginner's Program (Weight Loss)
INSERT INTO program_exercise (programID, exerciseID)
SELECT programID, exerciseID
FROM workout_program
CROSS JOIN exercise
WHERE fitnessGoal = 'Weight Loss'
AND (
    ExerciseName IN ('Push-ups', 'Squats', 'Jumping Jacks', 'Lunges', 'Plank', 'Crunches')
    OR ExerciseName LIKE '%High Knees%'
    OR ExerciseName LIKE '%Butt Bridges%'
);

-- For the Muscle Gain Plan
INSERT INTO program_exercise (programID, exerciseID)
SELECT programID, exerciseID
FROM workout_program
CROSS JOIN exercise
WHERE fitnessGoal = 'Muscle Gain'
AND (
    ExerciseName IN ('Push-ups', 'Squats', 'Lunges', 'Plank', 'Rows (bodyweight)', 'Dips (tricep)')
    OR ExerciseName LIKE '%Superman%'
    OR ExerciseName LIKE '%Bird-Dog%'
);

-- For the Cardio Blast
INSERT INTO program_exercise (programID, exerciseID)
SELECT programID, exerciseID
FROM workout_program
CROSS JOIN exercise
WHERE fitnessGoal = 'Cardio'
AND (
    ExerciseName IN ('Jumping Jacks', 'High Knees', 'Mountain Climbers', 'Walking Lunges')
    OR ExerciseName LIKE '%Side Plank%'
    OR ExerciseName LIKE '%Squat Jumps%'
);

-- For the Core Strength
INSERT INTO program_exercise (programID, exerciseID)
SELECT programID, exerciseID
FROM workout_program
CROSS JOIN exercise
WHERE fitnessGoal = 'Strength'
AND (
    ExerciseName IN ('Plank', 'Crunches', 'Rows (bodyweight)', 'Dips (tricep)', 'Superman', 'Bird-Dog', 'Plank with Shoulder Taps')
    OR ExerciseName LIKE '%Wall Sit%'
);

-- For the Yoga for Wellness
INSERT INTO program_exercise (programID, exerciseID)
SELECT programID, exerciseID
FROM workout_program
CROSS JOIN exercise
WHERE fitnessGoal = 'Flexibility'
AND (
    ExerciseName IN ('Yoga for Wellness')
    OR ExerciseName LIKE '%Arm Circles%'
);

CREATE USER 'fitness_admin'@'localhost' IDENTIFIED BY 'secure_password_123';
GRANT ALL PRIVILEGES ON fitness.* TO 'fitness_admin'@'localhost';