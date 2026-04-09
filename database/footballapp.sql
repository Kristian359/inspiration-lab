CREATE DATABASE  IF NOT EXISTS `footballapp` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `footballapp`;
-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: footballapp
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `admin_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `profile_picture` varchar(255) DEFAULT '/img/default.png',
  PRIMARY KEY (`admin_id`),
  UNIQUE KEY `admin_id_UNIQUE` (`admin_id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `answers`
--

DROP TABLE IF EXISTS `answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `answers` (
  `answers_id` int NOT NULL AUTO_INCREMENT,
  `question_id` int NOT NULL,
  `quiz_id` int NOT NULL,
  `correct_answer` varchar(255) NOT NULL,
  `wrong_answer_1` varchar(255) NOT NULL,
  `wrong_answer_2` varchar(255) NOT NULL,
  `wrong_answer_3` varchar(255) NOT NULL,
  PRIMARY KEY (`answers_id`),
  UNIQUE KEY `answers_id_UNIQUE` (`answers_id`),
  KEY `fk_question_answer_idx` (`question_id`),
  KEY `fk_quiz_answer_idx` (`quiz_id`),
  CONSTRAINT `fk_question_answer` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`),
  CONSTRAINT `fk_quiz_answer` FOREIGN KEY (`quiz_id`) REFERENCES `quizes` (`quiz_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `audit_log`
--

DROP TABLE IF EXISTS `audit_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_log` (
  `audit_log_id` int NOT NULL AUTO_INCREMENT,
  `user_collection_id` int NOT NULL,
  `club_id` int NOT NULL,
  `winner` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`audit_log_id`),
  UNIQUE KEY `audit_log_id_UNIQUE` (`audit_log_id`),
  KEY `fk_audit_log_user_collection_idx` (`user_collection_id`),
  CONSTRAINT `fk_audit_log_user_collection` FOREIGN KEY (`user_collection_id`) REFERENCES `user_collection` (`user_collection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `club_tournaments`
--

DROP TABLE IF EXISTS `club_tournaments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `club_tournaments` (
  `club_tournament_id` int NOT NULL AUTO_INCREMENT,
  `season_id` int NOT NULL,
  `club_id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` mediumtext,
  PRIMARY KEY (`club_tournament_id`),
  UNIQUE KEY `club_tournament_id_UNIQUE` (`club_tournament_id`),
  KEY `fk_season_club_tournament_idx` (`season_id`),
  KEY `fk_club_club_tournamet_idx` (`club_id`),
  CONSTRAINT `fk_club_club_tournament` FOREIGN KEY (`club_id`) REFERENCES `clubs` (`club_id`),
  CONSTRAINT `fk_season_club_tournament` FOREIGN KEY (`season_id`) REFERENCES `seasons` (`season_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `clubs`
--

DROP TABLE IF EXISTS `clubs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clubs` (
  `club_id` int NOT NULL AUTO_INCREMENT,
  `league_id` int NOT NULL,
  `formation_id` int NOT NULL,
  `club_name` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `foundation` int DEFAULT NULL,
  `description` mediumtext,
  PRIMARY KEY (`club_id`),
  UNIQUE KEY `club_id_UNIQUE` (`club_id`),
  KEY `fk_league_club_idx` (`league_id`),
  KEY `fk_formation_club_idx` (`formation_id`),
  CONSTRAINT `fk_formation_club` FOREIGN KEY (`formation_id`) REFERENCES `formations` (`formation_id`),
  CONSTRAINT `fk_league_club` FOREIGN KEY (`league_id`) REFERENCES `leagues` (`league_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `formations`
--

DROP TABLE IF EXISTS `formations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formations` (
  `formation_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`formation_id`),
  UNIQUE KEY `formation_id_UNIQUE` (`formation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `league_competitions`
--

DROP TABLE IF EXISTS `league_competitions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `league_competitions` (
  `league_competition_id` int NOT NULL AUTO_INCREMENT,
  `league_id` int NOT NULL,
  `season_id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` mediumtext,
  PRIMARY KEY (`league_competition_id`),
  UNIQUE KEY `league_competition_id_UNIQUE` (`league_competition_id`),
  KEY `fk_league_league_competition_idx` (`league_id`),
  KEY `fk_season_league_competition_idx` (`season_id`),
  CONSTRAINT `fk_league_league_competition` FOREIGN KEY (`league_id`) REFERENCES `leagues` (`league_id`),
  CONSTRAINT `fk_season_league_competition` FOREIGN KEY (`season_id`) REFERENCES `seasons` (`season_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `leagues`
--

DROP TABLE IF EXISTS `leagues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leagues` (
  `league_id` int NOT NULL AUTO_INCREMENT,
  `season_id` int NOT NULL,
  `league_name` varchar(45) DEFAULT NULL,
  `logo` varchar(255) NOT NULL,
  `country` varchar(45) DEFAULT NULL,
  `description` mediumtext,
  PRIMARY KEY (`league_id`),
  UNIQUE KEY `league_id_UNIQUE` (`league_id`),
  UNIQUE KEY `season_id_UNIQUE` (`season_id`),
  CONSTRAINT `fk_season_league` FOREIGN KEY (`season_id`) REFERENCES `seasons` (`season_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nation_clubs`
--

DROP TABLE IF EXISTS `nation_clubs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nation_clubs` (
  `nation_club_id` int NOT NULL AUTO_INCREMENT,
  `formation_id` int NOT NULL,
  `player_id` int NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`nation_club_id`),
  UNIQUE KEY `nation_club_id_UNIQUE` (`nation_club_id`),
  KEY `fk_formation_nation_club_idx` (`formation_id`),
  KEY `fk_player_nation_club_idx` (`player_id`),
  CONSTRAINT `fk_formation_nation_club` FOREIGN KEY (`formation_id`) REFERENCES `formations` (`formation_id`),
  CONSTRAINT `fk_player_nation_club` FOREIGN KEY (`player_id`) REFERENCES `players` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nation_competitions`
--

DROP TABLE IF EXISTS `nation_competitions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nation_competitions` (
  `nation_competition_id` int NOT NULL AUTO_INCREMENT,
  `nation_club_id` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `description` mediumtext,
  PRIMARY KEY (`nation_competition_id`),
  UNIQUE KEY `nation_competition_id_UNIQUE` (`nation_competition_id`),
  KEY `fk_nation_club_nation_competition_idx` (`nation_club_id`),
  CONSTRAINT `fk_nation_club_nation_competition` FOREIGN KEY (`nation_club_id`) REFERENCES `nation_clubs` (`nation_club_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `packs`
--

DROP TABLE IF EXISTS `packs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `packs` (
  `pack_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `cost` int DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pack_id`),
  UNIQUE KEY `pack_id_UNIQUE` (`pack_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `players`
--

DROP TABLE IF EXISTS `players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `players` (
  `player_id` int NOT NULL AUTO_INCREMENT,
  `club_id` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `status` varchar(45) DEFAULT NULL,
  `career_description` mediumtext,
  `age` int DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `rating` varchar(45) DEFAULT NULL,
  `shooting` varchar(45) DEFAULT NULL,
  `dribbling` varchar(45) DEFAULT NULL,
  `defending` varchar(45) DEFAULT NULL,
  `speed` varchar(45) DEFAULT NULL,
  `passing` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`player_id`),
  UNIQUE KEY `player_id_UNIQUE` (`player_id`),
  KEY `fk_players_clubs_idx` (`club_id`),
  CONSTRAINT `fk_players_clubs` FOREIGN KEY (`club_id`) REFERENCES `clubs` (`club_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `playerspacks`
--

DROP TABLE IF EXISTS `playerspacks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playerspacks` (
  `player_pack_id` int NOT NULL AUTO_INCREMENT,
  `pack_id` int NOT NULL,
  `player_id` int NOT NULL,
  `odds` int NOT NULL,
  PRIMARY KEY (`player_pack_id`),
  UNIQUE KEY `player_pack_id_UNIQUE` (`player_pack_id`),
  KEY `fk_pack_player_pack_idx` (`pack_id`),
  KEY `fk_player_player_pack_idx` (`player_id`),
  CONSTRAINT `fk_pack_player_pack` FOREIGN KEY (`pack_id`) REFERENCES `packs` (`pack_id`),
  CONSTRAINT `fk_player_player_pack` FOREIGN KEY (`player_id`) REFERENCES `players` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questions` (
  `question_id` int NOT NULL AUTO_INCREMENT,
  `question_text` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`question_id`),
  UNIQUE KEY `question_id_UNIQUE` (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `quizes`
--

DROP TABLE IF EXISTS `quizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quizes` (
  `quiz_id` int NOT NULL AUTO_INCREMENT,
  `question_id` int NOT NULL,
  `quiz_date` datetime DEFAULT NULL,
  PRIMARY KEY (`quiz_id`),
  UNIQUE KEY `quiz_id_UNIQUE` (`quiz_id`),
  KEY `fk_question_quiz_idx` (`question_id`),
  CONSTRAINT `fk_question_quiz` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seasons`
--

DROP TABLE IF EXISTS `seasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seasons` (
  `season_id` int NOT NULL AUTO_INCREMENT,
  `year` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`season_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `coin_balance` int DEFAULT '500',
  `profile_picture` varchar(255) DEFAULT '/img/default.png',
  `registered_at` datetime NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_collection`
--

DROP TABLE IF EXISTS `user_collection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_collection` (
  `user_collection_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `player_id` int NOT NULL,
  PRIMARY KEY (`user_collection_id`),
  UNIQUE KEY `user_collection_id_UNIQUE` (`user_collection_id`),
  KEY `fk_user_user_collection_idx` (`user_id`),
  KEY `fk_player_user_collection_idx` (`player_id`),
  CONSTRAINT `fk_player_user_collection` FOREIGN KEY (`player_id`) REFERENCES `players` (`player_id`),
  CONSTRAINT `fk_user_user_collection` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_requests`
--

DROP TABLE IF EXISTS `user_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_requests` (
  `user_requests_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `admin_id` int NOT NULL,
  `type` varchar(255) NOT NULL,
  `description` mediumtext,
  `status` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`user_requests_id`),
  UNIQUE KEY `user_requests_id_UNIQUE` (`user_requests_id`),
  KEY `fk_user_user_request_idx` (`user_id`),
  KEY `fk_admin_user_request` (`admin_id`),
  CONSTRAINT `fk_admin_user_request` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`),
  CONSTRAINT `fk_user_user_request` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_team`
--

DROP TABLE IF EXISTS `user_team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_team` (
  `user_team_id` int NOT NULL AUTO_INCREMENT,
  `user_collection_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `formation` varchar(255) NOT NULL,
  PRIMARY KEY (`user_team_id`),
  UNIQUE KEY `user_team_id_UNIQUE` (`user_team_id`),
  KEY `fk_user_collection_user_team_idx` (`user_collection_id`),
  CONSTRAINT `fk_user_collection_user_team` FOREIGN KEY (`user_collection_id`) REFERENCES `user_collection` (`user_collection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-09 23:13:49
