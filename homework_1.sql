CREATE EXTENSION IF NOT EXISTS "uuid-ossp"

CREATE TABLE IF NOT EXISTS student (
	id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
	first_name VARCHAR(100) NOT NULL,
	last_name VARCHAR(100) NOT NULL,
	date_of_birth DATE NOT NULL,
	enrolled_date DATE NOT NULL,
	gender CHAR(1) CONSTRAINT check_letter CHECK (gender = 'f' OR gender = 'm') NOT NULL,	
	national_id_number UUID DEFAULT uuid_generate_v4() NOT NULL,
	student_card_number SMALLINT NOT NULL
)

-- ALTER TABLE student
-- ALTER COLUMN student_card_number TYPE INT

INSERT INTO student (first_name, last_name, date_of_birth, enrolled_date, gender, student_card_number) VALUES
('Marija', 'Menchevska', '1995-08-21', '2023-10-17', 'f', 216415)

SELECT * FROM student

CREATE TABLE IF NOT EXISTS teacher (
	id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
	first_name VARCHAR(100) NOT NULL,
	last_name VARCHAR(100) NOT NULL,
	date_of_birth DATE CONSTRAINT check_date CHECK (date_of_birth >= '1960-01-01' AND date_of_birth <= '2000-01-01') NOT NULL,
	academic_rank VARCHAR(100) NOT NULL,
	hire_date DATE CONSTRAINT check_hire_date CHECK (hire_date >= '2010-01-01' AND hire_date < CURRENT_DATE) NOT NULL
)

INSERT INTO teacher (first_name, last_name, date_of_birth, academic_rank, hire_date) VALUES
('Ivo', 'Kostovski', '1990-10-15', 'BSc', '2018-10-22')

SELECT * FROM teacher

CREATE TABLE IF NOT EXISTS course (
	id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	credit SMALLINT CONSTRAINT check_credit CHECK (credit >= 2 AND credit <= 8) NOT NULL,
	academic_year INT CONSTRAINT check_academic_year CHECK (academic_year >= 1900 AND academic_year <= EXTRACT(YEAR FROM CURRENT_DATE)) NOT NULL,
	semester VARCHAR(100) CONSTRAINT check_semester CHECK (semester = 'winter' OR semester = 'summer') NOT NULL
)

INSERT INTO course(name, credit, academic_year, semester) VALUES
('Calculus', 8, 2012, 'winter')

SELECT * FROM course

CREATE TABLE IF NOT EXISTS achievement_type (
	id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	description TEXT,
	participation_rate INT NOT NULL
)

INSERT INTO achievement_type (name, participation_rate) VALUES
('Attendance', 85)

SELECT * FROM achievement_type

CREATE TABLE IF NOT EXISTS grade (
	id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
	student_id UUID DEFAULT uuid_generate_v4(),
	course_id UUID DEFAULT uuid_generate_v4(),
	teacher_id UUID DEFAULT uuid_generate_v4(),
	grade SMALLINT NOT NULL CONSTRAINT check_grade CHECK (grade >= 5 AND grade <= 10),
	comment TEXT,
	created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP	
)

INSERT INTO grade (grade, comment) VALUES
(6, 'This area is of type text.')

SELECT * FROM grade

CREATE TABLE IF NOT EXISTS grade_details (
	id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
	grade_id UUID DEFAULT uuid_generate_v4(),
	achievement_type_id UUID DEFAULT uuid_generate_v4(),
	achievement_points INT CONSTRAINT check_points CHECK (achievement_points >= 0 AND achievement_points <= achievement_max_points) NOT NULL,
	achievement_max_points INT DEFAULT 100,
	achievement_date DATE CONSTRAINT check_date CHECK (achievement_date > '2010-01-01' AND achievement_date < CURRENT_DATE)
)

-- DROP TABLE grade_details

INSERT INTO grade_details (achievement_points, achievement_date) VALUES
(100, '2016-05-15')

SELECT * FROM grade_details