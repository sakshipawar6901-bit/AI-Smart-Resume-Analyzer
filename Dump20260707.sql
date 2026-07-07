-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: ai_smart_resume_analyzer
-- ------------------------------------------------------
-- Server version	8.0.46

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `analysisresults`
--

DROP TABLE IF EXISTS `analysisresults`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `analysisresults` (
  `AnalysisID` int NOT NULL AUTO_INCREMENT,
  `ResumeScore` decimal(5,2) DEFAULT NULL,
  `GitHubScore` int DEFAULT NULL,
  `OverallScore` decimal(5,2) DEFAULT NULL,
  `MissingSkills` text,
  `Suggestions` text,
  `AnalysisDate` datetime DEFAULT NULL,
  `ResumeID` int DEFAULT NULL,
  `JobID` int DEFAULT NULL,
  PRIMARY KEY (`AnalysisID`),
  KEY `ResumeID` (`ResumeID`),
  KEY `JobID` (`JobID`),
  CONSTRAINT `analysisresults_ibfk_1` FOREIGN KEY (`ResumeID`) REFERENCES `resumes` (`ResumeID`),
  CONSTRAINT `analysisresults_ibfk_2` FOREIGN KEY (`JobID`) REFERENCES `jobdescriptions` (`JobID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `analysisresults`
--

LOCK TABLES `analysisresults` WRITE;
/*!40000 ALTER TABLE `analysisresults` DISABLE KEYS */;
INSERT INTO `analysisresults` VALUES (1,85.50,80,83.00,'Cloud Computing','Improve cloud knowledge and add more deployment projects.','2026-07-07 13:00:00',1,1),(2,78.00,75,77.00,'Machine Learning, SQL','Add ML projects and improve database skills.','2026-07-07 13:10:00',2,4),(3,90.00,88,89.00,'Security Tools','Add more practical cybersecurity certifications.','2026-07-07 13:20:00',3,2);
/*!40000 ALTER TABLE `analysisresults` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `githubprofiles`
--

DROP TABLE IF EXISTS `githubprofiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `githubprofiles` (
  `GitHubID` int NOT NULL AUTO_INCREMENT,
  `UserName` varchar(50) NOT NULL,
  `ProfileURL` varchar(100) NOT NULL,
  `LastSynced` datetime DEFAULT NULL,
  `UserID` int DEFAULT NULL,
  PRIMARY KEY (`GitHubID`),
  KEY `UserID` (`UserID`),
  CONSTRAINT `githubprofiles_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `githubprofiles`
--

LOCK TABLES `githubprofiles` WRITE;
/*!40000 ALTER TABLE `githubprofiles` DISABLE KEYS */;
INSERT INTO `githubprofiles` VALUES (1,'aaravpatil','github.com/aaravpatil','2026-07-07 10:45:00',1),(2,'snehakulkarni','github.com/snehakulkarni','2026-07-07 11:30:00',2),(3,'rahulsharma','github.com/rahulsharma','2026-07-07 12:15:00',3);
/*!40000 ALTER TABLE `githubprofiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `githubrepositories`
--

DROP TABLE IF EXISTS `githubrepositories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `githubrepositories` (
  `RepoID` int NOT NULL AUTO_INCREMENT,
  `RepoName` varchar(50) NOT NULL,
  `Language` varchar(50) NOT NULL,
  `CreatedAt` datetime DEFAULT NULL,
  `LastUpdated` datetime DEFAULT NULL,
  `GitHubID` int DEFAULT NULL,
  PRIMARY KEY (`RepoID`),
  KEY `GitHubID` (`GitHubID`),
  CONSTRAINT `githubrepositories_ibfk_1` FOREIGN KEY (`GitHubID`) REFERENCES `githubprofiles` (`GitHubID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `githubrepositories`
--

LOCK TABLES `githubrepositories` WRITE;
/*!40000 ALTER TABLE `githubrepositories` DISABLE KEYS */;
INSERT INTO `githubrepositories` VALUES (1,'AI_Resume_Analyzer','Python','2026-01-10 09:00:00','2026-06-15 14:30:00',1),(2,'Student_Management_System','Java','2025-08-20 10:00:00','2026-05-20 16:00:00',2),(3,'Network_Security_Tool','Python','2025-11-05 11:30:00','2026-06-25 12:45:00',3),(4,'Portfolio_Website','JavaScript','2026-02-15 08:30:00','2026-06-30 18:00:00',2),(5,'AI_Resume_Analyzer','Python','2026-01-10 09:00:00','2026-06-15 14:30:00',1),(6,'Student_Management_System','Java','2025-08-20 10:00:00','2026-05-20 16:00:00',2),(7,'Network_Security_Tool','Python','2025-11-05 11:30:00','2026-06-25 12:45:00',3),(8,'Portfolio_Website','JavaScript','2026-02-15 08:30:00','2026-06-30 18:00:00',2);
/*!40000 ALTER TABLE `githubrepositories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobdescriptions`
--

DROP TABLE IF EXISTS `jobdescriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobdescriptions` (
  `JobID` int NOT NULL AUTO_INCREMENT,
  `CompanyName` varchar(50) NOT NULL,
  `JobTitle` varchar(50) NOT NULL,
  `Description` text,
  PRIMARY KEY (`JobID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobdescriptions`
--

LOCK TABLES `jobdescriptions` WRITE;
/*!40000 ALTER TABLE `jobdescriptions` DISABLE KEYS */;
INSERT INTO `jobdescriptions` VALUES (1,'TechNova Solutions','Python Developer','Looking for Python developer with skills in Python, SQL, Machine Learning and Data Structures.'),(2,'CyberSecure Pvt Ltd','Cyber Security Analyst','Need a security analyst with knowledge of Cyber Security, Networking, Cloud Computing and Security Tools.'),(3,'WebTech Innovations','Full Stack Developer','Required developer with skills in JavaScript, Web Development, SQL and frontend technologies.'),(4,'DataVision AI','Machine Learning Engineer','Looking for ML engineer with Python, Machine Learning, Data Analysis and AI knowledge.');
/*!40000 ALTER TABLE `jobdescriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resumes`
--

DROP TABLE IF EXISTS `resumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resumes` (
  `ResumeID` int NOT NULL AUTO_INCREMENT,
  `ResumeName` varchar(50) NOT NULL,
  `FilePath` varchar(200) NOT NULL,
  `UploadDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `UserID` int DEFAULT NULL,
  PRIMARY KEY (`ResumeID`),
  KEY `UserID` (`UserID`),
  CONSTRAINT `resumes_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resumes`
--

LOCK TABLES `resumes` WRITE;
/*!40000 ALTER TABLE `resumes` DISABLE KEYS */;
INSERT INTO `resumes` VALUES (1,'Aarav_Resume.pdf','/uploads/aarav_resume.pdf','2026-07-07 10:30:00',1),(2,'Sneha_Resume.pdf','/uploads/sneha_resume.pdf','2026-07-07 11:15:00',2),(3,'Rahul_Resume.pdf','/uploads/rahul_resume.pdf','2026-07-07 12:00:00',3);
/*!40000 ALTER TABLE `resumes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resumeskills`
--

DROP TABLE IF EXISTS `resumeskills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resumeskills` (
  `ResumeSkillID` int NOT NULL AUTO_INCREMENT,
  `ResumeID` int DEFAULT NULL,
  `SkillID` int DEFAULT NULL,
  PRIMARY KEY (`ResumeSkillID`),
  KEY `ResumeID` (`ResumeID`),
  KEY `SkillID` (`SkillID`),
  CONSTRAINT `resumeskills_ibfk_1` FOREIGN KEY (`ResumeID`) REFERENCES `resumes` (`ResumeID`),
  CONSTRAINT `resumeskills_ibfk_2` FOREIGN KEY (`SkillID`) REFERENCES `skills` (`SkillID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resumeskills`
--

LOCK TABLES `resumeskills` WRITE;
/*!40000 ALTER TABLE `resumeskills` DISABLE KEYS */;
INSERT INTO `resumeskills` VALUES (1,1,1),(2,1,3),(3,1,4),(4,2,2),(5,2,6),(6,2,10),(7,3,7),(8,3,8),(9,3,9);
/*!40000 ALTER TABLE `resumeskills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skills`
--

DROP TABLE IF EXISTS `skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skills` (
  `SkillID` int NOT NULL AUTO_INCREMENT,
  `SkillName` varchar(50) NOT NULL,
  PRIMARY KEY (`SkillID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skills`
--

LOCK TABLES `skills` WRITE;
/*!40000 ALTER TABLE `skills` DISABLE KEYS */;
INSERT INTO `skills` VALUES (1,'Python'),(2,'Java'),(3,'SQL'),(4,'Machine Learning'),(5,'Data Structures'),(6,'Web Development'),(7,'Cyber Security'),(8,'Cloud Computing'),(9,'Git'),(10,'JavaScript');
/*!40000 ALTER TABLE `skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `UserID` int NOT NULL AUTO_INCREMENT,
  `FullName` varchar(50) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Phone` varchar(15) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `CreatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`UserID`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Aarav Patil','aarav.patil@gmail.com','9876543210','aarav123',NULL),(2,'Sneha Kulkarni','sneha.k@gmail.com','9876543211','sneha123',NULL),(3,'Rahul Sharma','rahul.sharma@gmail.com','9876543212','rahul123',NULL),(4,'Priya Deshmukh','priya.hr@gmail.com','9876543213','priya123',NULL),(5,'Vivek Joshi','vivek.hr@gmail.com','9876543214','vivek123',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-07-07 15:38:33
