-- Creating User Table
CREATE TABLE IF NOT EXISTS users (
    user_id SERIAL PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    address TEXT,
    phone_number VARCHAR(15) NOT NULL,
    user_type VARCHAR(20) NOT NULL CHECK (user_type IN ('Member', 'Trainer', 'Staff')),
    start_time INT CHECK (start_time >= 7 AND start_time <= 19),
    end_time INT CHECK (end_time >= 8 AND end_time <= 20 AND end_time > start_time)
);

-- Creating Health Metrics Table
CREATE TABLE IF NOT EXISTS health_metrics (
    health_metric_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    weight INT,
    height INT,
    reading_date DATE,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Creating Fitness Goals Table
CREATE TABLE IF NOT EXISTS fitness_goals (
    goal_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
	weight INT NOT NULL,    
    completed BOOLEAN DEFAULT FALSE,
    completed_date DATE,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
	CASCADE
);

-- Creating Routine Table
CREATE TABLE IF NOT EXISTS routine (
    routine_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    routine_description VARCHAR(255) NOT NULL,
    routine_name VARCHAR(255) NOT NULL,
    routine_frequency VARCHAR(255) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);



-- Creating Personal Training Session Table
CREATE TABLE personal_training_session (
    session_id SERIAL PRIMARY KEY,
    trainer_id INT NOT NULL,
    user_id INT NOT NULL,
    date DATE,
    time TIME,
    FOREIGN KEY (trainer_id) REFERENCES users(user_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Creating Room Table
CREATE TABLE IF NOT EXISTS room (
    room_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- Creating Fitness Class Table
CREATE TABLE fitness_class (
    class_id SERIAL PRIMARY KEY,
    trainer_id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    date DATE NOT NULL,
    time INT NOT NULL,
    room_id INT NOT NULL,
    FOREIGN KEY (trainer_id) REFERENCES users(user_id),
    FOREIGN KEY (room_id) REFERENCES room(room_id),
	UNIQUE (room_id, date, time),
	UNIQUE (trainer_id, date, time)
	
);

-- Creating Fitness Class Participants Table
CREATE TABLE fitness_class_participants (
    class_id INT,
    user_id INT,
    PRIMARY KEY (class_id, user_id),
    FOREIGN KEY (class_id) REFERENCES fitness_class(class_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
	CASCADE
);

-- Creating Billing Table
CREATE TABLE billing (
    billing_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    amount INT,
    description VARCHAR(255) NOT NULL,
    status VARCHAR(20) NOT NULL CHECK (status IN ('Paid', 'Unpaid', 'Processing')) DEFAULT 'Unpaid',
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE
	CASCADE
);

-- Creating Personal Training Billing Table
CREATE TABLE personal_training_billing (
    billing_id INT NOT NULL,
    session_id INT NOT NULL,
    PRIMARY KEY (billing_id, session_id),
    FOREIGN KEY (billing_id) REFERENCES billing(billing_id),
    FOREIGN KEY (session_id) REFERENCES personal_training_session(session_id)
);

-- Creating Class Billing Table
CREATE TABLE class_billing (
    billing_id INT NOT NULL,
    class_id INT NOT NULL,
    user_id INT NOT NULL,
    PRIMARY KEY (billing_id, class_id, user_id),
    FOREIGN KEY (billing_id) REFERENCES billing(billing_id),
    FOREIGN KEY (class_id) REFERENCES fitness_class(class_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);





-- Creating Equipment Table
CREATE TABLE equipment (
    equipment_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(255) NOT NULL,
    last_maintenance_date DATE,
    next_maintenance_date DATE
);

-- Creating Equipment in Room Table
CREATE TABLE equipment_in_room (
    room_id INT NOT NULL,
    equipment_id INT NOT NULL,
    PRIMARY KEY (room_id, equipment_id),
    FOREIGN KEY (room_id) REFERENCES room(room_id),
    FOREIGN KEY (equipment_id) REFERENCES equipment(equipment_id)
);
