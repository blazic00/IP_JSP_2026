-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: intern
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `intern`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `intern` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `intern`;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `active` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (1,'lanaco','9960d7df077da630774b61d417984ff84f74efd6c6d249d8d643601910474732','Lanaco d.o.o.',_binary ''),(2,'prointer','e668b4d971778dedf84c42cf3a72c71a68d2f1372718121fcb6efb86a4d9ef5b','Prointer ITSS',_binary ''),(4,'mistral','920510199770f4d65cb8aaa2cd12bdb2b8c37f5b3907c50a734a0e3409da2823','Mistral Technologies',_binary ''),(6,'nsoft','19e05df6b2e5fb94f3ee7eed2c02d340a1128a00231f5f6949641a143ab3b57a','NSoft Company',_binary ''),(7,'infobip','37d3b18c32a9c590ec5c83e53464b9e97d11281fccf8df32e98f5a01a4e87c4b','Infobip BH',_binary ''),(9,'authority','37d3b18c32a9c590ec5c83e53464b9e97d11281fccf8df32e98f5a01a4e87c4b','Authority Partners',_binary ''),(10,'symphony','c71c605a70fa9e4594f12f2adacd395054ce1ca921afc457328c17d1c74822ee','Symphony Digital',_binary '\0');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faculty`
--

DROP TABLE IF EXISTS `faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faculty` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculty`
--

LOCK TABLES `faculty` WRITE;
/*!40000 ALTER TABLE `faculty` DISABLE KEYS */;
INSERT INTO `faculty` VALUES (1,'fakultet','37243e9f8cdbbf158331bb590cba3cd1c8101f5207a79781c39354657beb499c');
/*!40000 ALTER TABLE `faculty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `internship`
--

DROP TABLE IF EXISTS `internship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `internship` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `constraints` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `requirements` varchar(255) DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `technologies` varchar(255) DEFAULT NULL,
  `company_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5m7aghwpiy1nsiwudjowy0lhb` (`company_id`),
  CONSTRAINT `FK5m7aghwpiy1nsiwudjowy0lhb` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `internship`
--

LOCK TABLES `internship` WRITE;
/*!40000 ALTER TABLE `internship` DISABLE KEYS */;
INSERT INTO `internship` VALUES (5,'prosjek minimalan 8.5, student BIH','Internship fokusiran na Linux okruzenja i Python skriptiranje u produkcionim sistemima. Rad na automatizaciji, logovima i backend alatima u realnoj infrastrukturi.','2026-03-12','student 4. godine PMF,ETF','2025-02-17','linux, python',1),(14,'drzavljanstvo BIH','Internship u IT timu fokusiran na razvoj i odrzavanje enterprise aplikacija i internih poslovnih sistema koristeci moderne softverske prakse.','2020-12-15','4. godina ETF-a BL','2020-12-12','java, c#, c++',1),(15,'Za studente etf-a','Internship iz sistem administracije i DevOps-a sa fokusom na mreze, servere, CI/CD pipeline-e i automatizaciju deployment procesa u produkciji.','2026-07-31','minimalan prosjek 8.3','2026-05-01','Linux cmd, networking, devops',2),(16,'Poznavanje osnova programiranja','Frontend internship fokusiran na izradu modernih web aplikacija i SPA resenja uz mentorstvo senior developera i koriscenje standardnih alata.','2026-08-30','Student 3. ili 4. godine ETF-a ili PMF-a','2026-06-01','React, JavaScript, HTML, CSS',1),(17,'student ETF/PMF, min prosjek 8.0','Backend internship fokusiran na razvoj REST API-ja, rad sa relacijskim bazama i izradu skalabilnih backend servisa uz moderne frameworke.','2026-09-30','Poznavanje osnova SQL i OOP','2026-06-15','Java, Spring Boot, MySQL',2),(18,'dr?avljanstvo BIH','DevOps internship fokusiran na CI/CD procese, kontejnerizaciju i upravljanje cloud infrastrukturom uz rad na automatizaciji i deploymentu.','2026-10-15','Osnove Linux administracije','2026-07-01','Docker, Kubernetes, AWS',1),(19,'student 3. ili 4. godine','Mobile development internship fokusiran na Android razvoj aplikacija, implementaciju UI-a i integraciju sa backend i cloud servisima.','2026-08-31','Kotlin osnove ili Java','2026-05-20','Kotlin, Android Studio, Firebase',4),(20,'minimalan prosjek 8.5','Data science internship fokusiran na analizu podataka, pripremu i ciscenje podataka i razvoj machine learning modela na realnim datasetovima.','2026-11-01','Python i osnove statistike','2026-07-10','Python, Pandas, NumPy, Scikit-learn',6),(21,'ETF student, obavezno znanje OOP','Frontend internship fokusiran na razvoj single page aplikacija u React i TypeScript-u uz izradu komponenti i modernih UI obrazaca.','2026-09-20','JavaScript i osnove React-a','2026-06-05','React, TypeScript, CSS',2),(22,'poznavanje mre?nih protokola','Cybersecurity internship fokusiran na penetration testing, analizu mreza i procenu sigurnosnih propusta koristeci standardne security alate.','2026-12-01','Osnove mre?a i Linux-a','2026-08-01','Kali Linux, Wireshark, Nmap',7),(23,'student informatike','QA internship fokusiran na manualno i automatizovano testiranje softvera, pisanje test slucajeva i rad sa alatima za automatizaciju.','2026-10-05','Osnove testiranja softvera','2026-06-25','Selenium, JUnit, Postman',9),(24,'ETF/PMF studenti','AI internship fokusiran na obradu prirodnog jezika i razvoj machine learning modela koristeci Python i moderne deep learning frameworke.','2026-12-20','Python i osnovno ML znanje','2026-08-15','Python, TensorFlow, NLP',6),(25,'minimalno 3. godina studija','Full stack internship fokusiran na razvoj web aplikacija koristeci moderne frontend i backend tehnologije uz fokus na skalabilnost i arhitekturu.','2026-09-10','JavaScript i osnovni backend koncepti','2026-05-30','Node.js, React, MongoDB',4),(26,'motivacija i znanje osnova programiranja','Internship u razvoju enterprise softverskih sistema, rad na backend logici, integraciji baza i velikim poslovnim aplikacijama.','2026-11-15','Osnove C# ili Java','2026-07-20','C#, .NET, SQL Server',10);
/*!40000 ALTER TABLE `internship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `internship_application`
--

DROP TABLE IF EXISTS `internship_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `internship_application` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `status` tinyint DEFAULT NULL,
  `internship_id` bigint NOT NULL,
  `student_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKmloa20fmjef7xanwkh5tcw3hx` (`student_id`,`internship_id`),
  KEY `FKl5w1gy1rib10aaniwanrvxw2m` (`internship_id`),
  CONSTRAINT `fk_student` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`),
  CONSTRAINT `FKl5w1gy1rib10aaniwanrvxw2m` FOREIGN KEY (`internship_id`) REFERENCES `internship` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `internship_application`
--

LOCK TABLES `internship_application` WRITE;
/*!40000 ALTER TABLE `internship_application` DISABLE KEYS */;
INSERT INTO `internship_application` VALUES (2,1,5,1),(4,1,14,1),(10,1,15,1),(11,0,16,1),(15,0,16,19),(16,0,15,19),(18,0,5,19);
/*!40000 ALTER TABLE `internship_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `internships`
--

DROP TABLE IF EXISTS `internships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `internships` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  `technologies` varchar(255) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `requirements` text,
  `constraints` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `internships`
--

LOCK TABLES `internships` WRITE;
/*!40000 ALTER TABLE `internships` DISABLE KEYS */;
/*!40000 ALTER TABLE `internships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `cv` text,
  `photo` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'3339ce4b8a1027fa2a68d16b50ab35678a9db5a2d375b4976fc6410a1daa59c9','daco','{\"general\":{\"firstName\":\"Danilo\",\"lastName\":\"Blazic\",\"email\":\"danilo.blazic@mail.com\",\"phone\":\"123456489\"},\"education\":[{\"institution\":\"ETFBL\",\"degree\":\"Racunarstvo I informatika\",\"startDateEdu\":\"2026-02-28T23:00:00.000Z\",\"endDateEdu\":\"2026-03-01T23:00:00.000Z\"}],\"experience\":[{\"company\":\"IT product\",\"role\":\"Backend developer\",\"startDateWork\":\"2025-06-09T22:00:00.000Z\",\"endDateWork\":\"2026-03-18T23:00:00.000Z\",\"description\":\"Junior Backend programer u C# dotnet.\"}],\"skills\":\"C#, Java, Network Administration, Python\",\"interests\":\"Reading, Sport\"}','uploads\\photos\\1.jpg','Daco','Paco'),(7,'sale','sale',NULL,NULL,'sale','sale'),(19,'f41bfea8f6b1f8e5a4e6aebcae3114a2290f4c1517b1f208eaf57235af35c584','jovo1',NULL,NULL,'jovo','jovo'),(20,'8c5faf36ce0dae48351f5e09c5133fdaddcf52d9baf4369db027766a12c1742f','marko','{\"general\":{\"firstName\":\"Marko\",\"lastName\":\"Markovic\",\"email\":\"marko@mail.com\",\"phone\":\"123456789\"},\"education\":[{\"institution\":\"PMF\",\"degree\":\"informaticki smjer\",\"startDateEdu\":\"2022-05-27T22:00:00.000Z\",\"endDateEdu\":\"2026-05-26T22:00:00.000Z\"}],\"experience\":[{\"company\":\"STAMENKO\",\"role\":\"\",\"startDateWork\":\"\",\"endDateWork\":\"\",\"description\":\"\"}],\"skills\":\"\",\"interests\":\"\"}','uploads\\photos\\20.jpg','marko','marko'),(21,'da9f6713671da24a575ffbe6f0749ecb613efe7f3887b5c9f3e6cc8a94982ae9','danilo','{\"general\":{\"firstName\":\"Danilo\",\"lastName\":\"Blazic\",\"email\":\"danilo@mail.com\",\"phone\":\"123456489\"},\"education\":[{\"institution\":\"ETFBL\",\"degree\":\"Racunarstvo i informatika\",\"startDateEdu\":\"2026-02-28T23:00:00.000Z\",\"endDateEdu\":\"2026-03-01T23:00:00.000Z\"}],\"experience\":[{\"company\":\"IT Product\",\"role\":\"Backend Developer\",\"startDateWork\":\"2025-06-09T22:00:00.000Z\",\"endDateWork\":\"2026-03-18T23:00:00.000Z\",\"description\":\"Junior backend developer in C# .NET\"}],\"skills\":\"C#, Java, Python, Network Administration\",\"interests\":\"Reading, Sport\"}','uploads/photos/1.jpg','Danilo','Blazic'),(22,'a108d6d354a18ab7b395f000a7f08d1dd26cd64666b396281d7b4df08ac5bdb6','nikola','{\"general\":{\"firstName\":\"Nikola\",\"lastName\":\"Petrovic\",\"email\":\"nikola@mail.com\",\"phone\":\"061111111\"},\"education\":[{\"institution\":\"ETFBL\",\"degree\":\"Computer Engineering\",\"startDateEdu\":\"2023-10-01T00:00:00.000Z\",\"endDateEdu\":\"2027-06-01T00:00:00.000Z\"}],\"experience\":[{\"company\":\"StartUp Lab\",\"role\":\"Backend Intern\",\"startDateWork\":\"2025-07-01T00:00:00.000Z\",\"endDateWork\":\"2025-09-01T00:00:00.000Z\",\"description\":\"Built REST APIs using Spring Boot\"}],\"skills\":\"Java, Spring Boot, SQL\",\"interests\":\"Chess, Football\"}','uploads/photos/2.jpg','Nikola','Petrovic'),(23,'pass123','milos','{\"general\":{\"firstName\":\"Milos\",\"lastName\":\"Jankovic\",\"email\":\"milos@mail.com\",\"phone\":\"062222222\"},\"education\":[{\"institution\":\"University of Banja Luka\",\"degree\":\"IT\",\"startDateEdu\":\"2022-10-01T00:00:00.000Z\",\"endDateEdu\":\"2026-06-01T00:00:00.000Z\"}],\"experience\":[{\"company\":\"WebStudio\",\"role\":\"Full Stack Intern\",\"startDateWork\":\"2025-03-01T00:00:00.000Z\",\"endDateWork\":\"\",\"description\":\"Angular and Node.js development\"}],\"skills\":\"Angular, Node.js, TypeScript\",\"interests\":\"Music, Gaming\"}','uploads/photos/3.jpg','Milos','Jankovic'),(24,'pass123','ana','{\"general\":{\"firstName\":\"Ana\",\"lastName\":\"Simic\",\"email\":\"ana@mail.com\",\"phone\":\"063333333\"},\"education\":[{\"institution\":\"ETFBL\",\"degree\":\"Software Engineering\",\"startDateEdu\":\"2021-10-01T00:00:00.000Z\",\"endDateEdu\":\"2025-06-01T00:00:00.000Z\"}],\"experience\":[{\"company\":\"AI Lab\",\"role\":\"Data Science Intern\",\"startDateWork\":\"2024-06-01T00:00:00.000Z\",\"endDateWork\":\"2024-09-01T00:00:00.000Z\",\"description\":\"ML models and data preprocessing\"}],\"skills\":\"Python, Machine Learning, SQL\",\"interests\":\"AI, Yoga\"}','uploads/photos/4.jpg','Ana','Simic'),(25,'pass123','jelena','{\"general\":{\"firstName\":\"Jelena\",\"lastName\":\"Nikolic\",\"email\":\"jelena@mail.com\",\"phone\":\"065555555\"},\"education\":[{\"institution\":\"University of East Sarajevo\",\"degree\":\"Information Systems\",\"startDateEdu\":\"2023-10-01T00:00:00.000Z\",\"endDateEdu\":\"\"}],\"experience\":[],\"skills\":\"HTML, CSS, JavaScript\",\"interests\":\"Design, Art\"}','uploads/photos/5.jpg','Jelena','Nikolic');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_internship`
--

DROP TABLE IF EXISTS `student_internship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_internship` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `application_id` bigint NOT NULL,
  `company_evaluation` varchar(255) DEFAULT NULL,
  `grade` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK5ctis0r1b4uq78bnt2ln230hp` (`application_id`),
  CONSTRAINT `FK2i2gs8dd1f4dhf76sc63cxecq` FOREIGN KEY (`application_id`) REFERENCES `internship_application` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_internship`
--

LOCK TABLES `student_internship` WRITE;
/*!40000 ALTER TABLE `student_internship` DISABLE KEYS */;
INSERT INTO `student_internship` VALUES (1,2,'nice work2',9),(2,10,NULL,NULL),(3,4,'no work logs',5);
/*!40000 ALTER TABLE `student_internship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_internship_work_logs`
--

DROP TABLE IF EXISTS `student_internship_work_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_internship_work_logs` (
  `student_internship_id` bigint NOT NULL,
  `work_logs_id` int NOT NULL,
  UNIQUE KEY `UKgknto213o826fjpp4yheecduv` (`work_logs_id`),
  KEY `FK1njytxhrydfxpi509g6r4fi29` (`student_internship_id`),
  CONSTRAINT `FK8o4hbradug9cwa2pak19qd12u` FOREIGN KEY (`work_logs_id`) REFERENCES `work_log` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_internship_work_logs`
--

LOCK TABLES `student_internship_work_logs` WRITE;
/*!40000 ALTER TABLE `student_internship_work_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_internship_work_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_log`
--

DROP TABLE IF EXISTS `work_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `work_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` text,
  `title` varchar(255) DEFAULT NULL,
  `week` date DEFAULT NULL,
  `student_internship_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKgguq8c0l2lofv0162n5cn861p` (`student_internship_id`),
  CONSTRAINT `FKgguq8c0l2lofv0162n5cn861p` FOREIGN KEY (`student_internship_id`) REFERENCES `student_internship` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_log`
--

LOCK TABLES `work_log` WRITE;
/*!40000 ALTER TABLE `work_log` DISABLE KEYS */;
INSERT INTO `work_log` VALUES (32,'hello again','Hello','2026-03-16',1),(33,'Introduced to the company structure, development workflow, and internal tools. Set up local development environment including IDE, version control system, and database access. Attended onboarding sessions and reviewed documentation related to ongoing projects.','Onboarding & Setup','2026-03-23',1),(34,'Worked on understanding the existing codebase for the main web application. Explored backend architecture, API endpoints, and database schema. Fixed minor bugs related to UI rendering issues and submitted first pull request.','Codebase Familiarization','2026-03-30',1),(35,'Implemented a small feature for user profile updates, including frontend form validation and backend API integration. Collaborated with mentor for code review and learned best practices for clean and maintainable code.','Feature Development','2026-04-06',1),(36,'Focused on debugging and resolving reported issues from QA team. Used logging tools and debugging techniques to trace errors in the system. Improved error handling in several modules.','Bug Fixing & Debugging','2026-04-13',1),(37,'Participated in team sprint planning and daily stand-ups. Assisted in designing a new module for reporting analytics. Researched suitable libraries and presented findings to the team.','Sprint Participation & Research','2026-04-20',1),(38,'Developed REST API endpoints for a new reporting feature. Ensured proper authentication and data validation. Wrote unit tests to verify functionality and improve code coverage.','API Development','2026-04-27',1),(39,'Worked on frontend integration for reporting dashboard using modern JavaScript framework. Implemented charts and tables to visualize data effectively. Improved UI responsiveness.','Frontend Integration','2026-05-04',1),(40,'Optimized database queries to improve performance of slow endpoints. Analyzed execution plans and added indexing where necessary. Reduced average response time significantly.','Performance Optimization','2026-05-11',1),(41,'Collaborated with DevOps team to understand deployment pipelines. Assisted in configuring CI/CD workflows and learned basics of containerization using Docker.','DevOps Exposure','2026-05-18',1),(42,'Finalized documentation for completed features and contributed to knowledge base. Presented internship?? to the team, summarizing key learnings and contributions. Received feedback from mentors.','Documentation & Wrap-up','2026-05-25',1),(43,'Start hello hello','Start','2026-03-09',1),(44,'INTRODUCTION','INTRODUCTION','2026-05-11',3),(45,'hello','CHAPTER 2','2026-05-25',3),(46,'hello','CHAPTER 1','2026-05-18',3);
/*!40000 ALTER TABLE `work_log` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-31 22:18:44
