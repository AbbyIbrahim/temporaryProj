-- DML 
-- Inserting users with different roles: Member, Trainer, Staff
INSERT INTO users (first_name, last_name, email, password, address, phone_number, user_type, start_time, end_time) VALUES
('John', 'Doe', 'john.doe@example.com', 'hashedpassword', '123 Elm St', '1234567890', 'Member', NULL, NULL),
('Jane', 'Smith', 'jane.smith@example.com', 'hashedpassword', '456 Oak St', '2345678901', 'Trainer', 9, 17),
('Emily', 'Jones', 'emily.jones@example.com', 'hashedpassword', '789 Pine St', '3456789012', 'Staff', 8, 16),
('Chris', 'Brown', 'chris.brown@example.com', 'hashedpassword', '321 Maple St', '4567890123', 'Member', NULL, NULL),
('Jessica', 'Taylor', 'jessica.taylor@example.com', 'hashedpassword', '654 Spruce St', '5678901234', 'Trainer', 10, 18),
('Michael', 'Lee', 'michael.lee@example.com', 'hashedpassword', '987 Cedar St', '6789012345', 'Member', NULL, NULL),
('Sarah', 'White', 'sarah.white@example.com', 'hashedpassword', '246 Birch St', '7890123456', 'Trainer', 7, 15),
('David', 'Moore', 'david.moore@example.com', 'hashedpassword', '135 Willow St', '8901234567', 'Staff', 9, 17),
('Laura', 'Taylor', 'laura.taylor@example.com', 'hashedpassword', '864 Elm St', '9012345678', 'Member', NULL, NULL),
('James', 'Anderson', 'james.anderson@example.com', 'hashedpassword', '975 Oak St', '0123456789', 'Trainer', 10, 18),
('Sophia', 'Martinez', 'sophia.martinez@example.com', 'hashedpassword', '321 Pine St', '1234567890', 'Member', NULL, NULL),
('Brian', 'Davis', 'brian.davis@example.com', 'hashedpassword', '654 Maple St', '2345678901', 'Staff', 8, 16),
('Nancy', 'Wilson', 'nancy.wilson@example.com', 'hashedpassword', '987 Spruce St', '3456789012', 'Member', NULL, NULL),
('Lisa', 'Clark', 'lisa.clark@example.com', 'hashedpassword', '246 Cedar St', '4567890123', 'Trainer', 7, 15),
('Kevin', 'Lewis', 'kevin.lewis@example.com', 'hashedpassword', '135 Birch St', '5678901234', 'Member', NULL, NULL),
('Cindy', 'Harris', 'cindy.harris@example.com', 'hashedpassword', '864 Willow St', '6789012345', 'Staff', 9, 17);

-- Inserting health metrics for members
INSERT INTO health_metrics (user_id, weight, height, reading_date) VALUES
(1, 70, 175, '2023-09-01'),
(4, 85, 180, '2023-09-01'),
(6, 90, 182, '2023-09-01'),
(9, 65, 165, '2023-09-01'),
(11, 74, 170, '2023-09-01'),
(13, 80, 175, '2023-09-01'),
(15, 88, 185, '2023-09-01');

-- Inserting fitness goals for members
INSERT INTO fitness_goals (user_id, weight, completed, completed_date) VALUES
(1, 68, FALSE, NULL),
(4, 80, FALSE, NULL),
(6, 85, FALSE, NULL),
(9, 60, FALSE, NULL),
(11, 70, FALSE, NULL),
(13, 75, FALSE, NULL),
(15, 84, FALSE, NULL);

-- Inserting routines
INSERT INTO routine (user_id, routine_description, routine_name, routine_frequency) VALUES
(1, 'Cardio and Strength Training', 'Full Body Workout', '3 times a week'),
(4, 'Weight Lifting', 'Strength Focus', '5 times a week');

-- Inserting rooms
INSERT INTO room (name) VALUES
('Aerobics Room'),
('Weight Room');

-- Inserting equipment
INSERT INTO equipment (name, description, last_maintenance_date, next_maintenance_date) VALUES
('Treadmill', 'For cardiovascular workouts', '2023-08-15', '2023-10-15'),
('Dumbbells', 'For strength training', '2023-08-20', '2023-10-20');


-- Inserting equipment in room
INSERT INTO equipment_in_room (room_id, equipment_id) VALUES
(1, 1),
(2, 2);

-- Personal training sessions and fitness classes
INSERT INTO personal_training_session (trainer_id, user_id, date, time) VALUES
(2, 1, '2023-10-05', '10:00'),
(5, 4, '2023-10-05', '11:00');

INSERT INTO fitness_class (trainer_id, name, date, time, room_id) VALUES
(2, 'Morning Yoga', '2023-10-05', 9, 1),
(5, 'Power Lifting', '2023-10-05', 15, 2);

-- Fitness class participants
INSERT INTO fitness_class_participants (class_id, user_id) VALUES
(1, 1),
(1, 4),
(2, 6),
(2, 9);

-- Billing
INSERT INTO billing (user_id, amount, description, status) VALUES
(1, 50, 'Monthly Gym Fee', 'Paid'),
(4, 50, 'Monthly Gym Fee', 'Unpaid');

-- Personal training billing and class billing
INSERT INTO personal_training_billing (billing_id, session_id) VALUES
(1, 1),
(2, 2);

INSERT INTO class_billing (billing_id, class_id, user_id) VALUES
(1, 1, 1),
(2, 2, 4);
