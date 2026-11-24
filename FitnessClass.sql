/* R00225669, Rebecca Lordan, COMP1CX */
/* Statement that project is all of own work */
DROP DATABASE IF EXISTS `fitness4life`;
CREATE DATABASE `fitness4life`; 
USE `fitness4life`;

SET NAMES utf8 ;
SET character_set_client = utf8mb4 ;


CREATE TABLE `staff` (
  `staff_id` int(1) NOT NULL,
  `name` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `date_of_birth` varchar(50) NOT NULL,
  `position` varchar(50) NOT NULL,
  PRIMARY KEY (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `staff` VALUES (1,'Mary','Clonakilty','087-2539874','01/05/1980','Manager');
INSERT INTO `staff` VALUES (2,'John','Clonakilty','084-1598742','22/01/1984','Administrator');
INSERT INTO `staff` VALUES (3,'Daniel','Bandon','085-2316545','15/08/2000','Instructor');
INSERT INTO `staff` VALUES (4,'Margret','Kinsale','084-4561728','11/08/2000','Instructor');
INSERT INTO `staff` VALUES (5,'Anne','Ballincollig','086-2641539','06/11/1998','Instructor');


CREATE TABLE `fitness_class` (
  `fitness_class_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `day` varchar(50) NOT NULL,
  `time` varchar(50) NOT NULL,
  `room` char(2) NOT NULL,
  `instructor` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`fitness_class_id`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci; 
INSERT INTO `fitness_class` VALUES (34,'Weights','Tuesday','10:00','R7','Anne');
INSERT INTO `fitness_class` VALUES (12,'Couch to 5k','Tuesday','16:00','R3','Anne');
INSERT INTO `fitness_class` VALUES (11,'Yoga','Wednesday', '17:00','R2','Daniel');
INSERT INTO `fitness_class` VALUES (8,'Pliaties','Thuresday','17:00','R7','Margret');
INSERT INTO `fitness_class` VALUES (5,'Spinning','Friday','11:00','R7','Margret');


CREATE TABLE `member` (
  `member_id` int(4) NOT NULL,
  `name` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `phone_number` varchar(50) NOT NULL,
  `date_of_birth` varchar(50) NOT NULL,
  `email_address` varchar(50) NOT NULL,
  `membership` varchar(1) NOT NULL,
  `date_of_payimg_membership_fee` varchar(50) NOT NULL,
  `date_of_renewal` varchar(50) NOT NULL,
  PRIMARY KEY (`member_id`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci; 
INSERT INTO `member` VALUES (1598,'Brian','Blackpool','084-1592631','11/09/2001','brian@gmail.com','y','10/01/2023','10/01/2024');
INSERT INTO `member` VALUES (1550,'Amy','Kinsale','087-1359481','04/04/2004','Amy@gmail.com','m','08/07/2023','08/08/2023');
INSERT INTO `member` VALUES (1500,'John','Kinsale','087-7893615','20/12/2000','John@gmail.com','m','11/07/2023','11/08/2023');
INSERT INTO `member` VALUES (1499,'Lilly','Bandon','086-3338484','16/04/1997','Lilly@gmail.com','y','22/11/2022','22/11/2023');
INSERT INTO `member` VALUES (1111,'James','Clonakilty','085-9998732','18/07/1970','James@gamil.com','y','04/08/2023','04/08/2024');


CREATE TABLE `bookings` (
  `fitness_class_id` int(11) NOT NULL,
  `instructor` varchar(50) NOT NULL,
  `member_id` varchar(50) NOT NULL,
  `full` varchar(1) NOT NULL,
  FOREIGN KEY (`fitness_class_id`) REFERENCES `fitness_class` ('fitness_class_id')
  FOREIGN KEY (`instructor`) REFERENCES `staff` ('name')
  FOREIGN KEY (`member_id`) REFERENCES `member` ('member_id')
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci; 
INSERT INTO `bookings` VALUES (12,'Anne','1550','n');
INSERT INTO `bookings` VALUES (12,'Anne','1499','n');
INSERT INTO `bookings` VALUES (5,'Margret','1111','y');
INSERT INTO `bookings` VALUES (5,'Margret','1550','y');
INSERT INTO `bookings` VALUES (11,'Daniel','1598','n');


DROP TABLE IF EXISTS member;
DROP TABLE IF EXISTS fitness_class;
DROP TABLE IF EXISTS staff;

ALTER TABLE fitness_class
ADD COLUMN maxMembers INT(10);

ALTER TABLE Booking
ADD FOREIGN KEY (fitness_class_id) REFERENCES fitness_class(fitness_class_id);


SELECT fc.name AS class_name, fc.day, fc.time, fc.room, s.name AS instructor_name
FROM fitness_class fc
INNER JOIN staff s ON fc.instructor = s.name;

SELECT fc.name AS class_name, COUNT(b.member_id) AS num_members
FROM fitness_class fc
LEFT JOIN bookings b ON fc.fitness_class_id = b.fitness_class_id
GROUP BY fc.fitness_class_id;

SELECT m.name AS member_name, fc.name AS class_name
FROM member m
JOIN bookings b ON m.member_id = b.member_id
JOIN fitness_class fc ON b.fitness_class_id = fc.fitness_class_id
WHERE m.membership = 'y';

SELECT s.name AS instructor_name, fc.name AS class_name, fc.day, fc.time, fc.room
FROM staff s
JOIN fitness_class fc ON s.name = fc.instructor;
