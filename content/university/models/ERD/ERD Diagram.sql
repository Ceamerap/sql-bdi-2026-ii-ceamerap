CREATE TABLE `Faculties` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255)
);

CREATE TABLE `Programs` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `faculty_id` int
);

CREATE TABLE `Courses` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `faculty_id` int
);

CREATE TABLE `Schedules` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `day` varchar(255),
  `start_time` varchar(255),
  `end_time` varchar(255)
);

CREATE TABLE `Buildings` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255)
);

CREATE TABLE `Classrooms` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `building_id` int
);

CREATE TABLE `Roles` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255)
);

CREATE TABLE `Users` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `first_name` varchar(255),
  `last_name` varchar(255),
  `role_id` int
);

CREATE TABLE `CourseCalendar` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `course_id` int,
  `schedule_id` int,
  `classroom_id` int,
  `professor_id` int,
  `capacity` int
);

CREATE TABLE `CoursePrograms` (
  `course_id` int,
  `program_id` int,
  `curriculum_semester` int
);

CREATE TABLE `ProgramStudents` (
  `program_id` int,
  `user_id` int,
  `current_semester` int
);

CREATE TABLE `CourseStudents` (
  `calendar_id` int,
  `user_id` int
);

ALTER TABLE `Programs` ADD FOREIGN KEY (`faculty_id`) REFERENCES `Faculties` (`id`);

ALTER TABLE `Courses` ADD FOREIGN KEY (`faculty_id`) REFERENCES `Faculties` (`id`);

ALTER TABLE `Classrooms` ADD FOREIGN KEY (`building_id`) REFERENCES `Buildings` (`id`);

ALTER TABLE `Users` ADD FOREIGN KEY (`role_id`) REFERENCES `Roles` (`id`);

ALTER TABLE `CourseCalendar` ADD FOREIGN KEY (`course_id`) REFERENCES `Courses` (`id`);

ALTER TABLE `CourseCalendar` ADD FOREIGN KEY (`schedule_id`) REFERENCES `Schedules` (`id`);

ALTER TABLE `CourseCalendar` ADD FOREIGN KEY (`classroom_id`) REFERENCES `Classrooms` (`id`);

ALTER TABLE `CourseCalendar` ADD FOREIGN KEY (`professor_id`) REFERENCES `Users` (`id`);

ALTER TABLE `CoursePrograms` ADD FOREIGN KEY (`course_id`) REFERENCES `Courses` (`id`);

ALTER TABLE `CoursePrograms` ADD FOREIGN KEY (`program_id`) REFERENCES `Programs` (`id`);

ALTER TABLE `ProgramStudents` ADD FOREIGN KEY (`program_id`) REFERENCES `Programs` (`id`);

ALTER TABLE `ProgramStudents` ADD FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`);

ALTER TABLE `CourseStudents` ADD FOREIGN KEY (`calendar_id`) REFERENCES `CourseCalendar` (`id`);

ALTER TABLE `CourseStudents` ADD FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`);
