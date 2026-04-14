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
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `answers`
--

DROP TABLE IF EXISTS `answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `answers` (
  `answers_id` int NOT NULL AUTO_INCREMENT,
  `question_id` int NOT NULL,
  `correct_answer` varchar(255) NOT NULL,
  `wrong_answer_1` varchar(255) NOT NULL,
  `wrong_answer_2` varchar(255) NOT NULL,
  `wrong_answer_3` varchar(255) NOT NULL,
  PRIMARY KEY (`answers_id`),
  UNIQUE KEY `answers_id_UNIQUE` (`answers_id`),
  KEY `fk_question_answer_idx` (`question_id`),
  CONSTRAINT `fk_question_answer` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answers`
--

LOCK TABLES `answers` WRITE;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_log`
--

DROP TABLE IF EXISTS `audit_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_log` (
  `audit_log_id` int NOT NULL AUTO_INCREMENT,
  `user_team_id` int NOT NULL,
  `club_id` int NOT NULL,
  `winner` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`audit_log_id`),
  UNIQUE KEY `audit_log_id_UNIQUE` (`audit_log_id`),
  KEY `fk_user_team_audit_log_idx` (`user_team_id`),
  CONSTRAINT `fk_user_team_audit_log` FOREIGN KEY (`user_team_id`) REFERENCES `user_team` (`user_team_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_log`
--

LOCK TABLES `audit_log` WRITE;
/*!40000 ALTER TABLE `audit_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `audit_log` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `club_tournaments`
--

LOCK TABLES `club_tournaments` WRITE;
/*!40000 ALTER TABLE `club_tournaments` DISABLE KEYS */;
/*!40000 ALTER TABLE `club_tournaments` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clubs`
--

LOCK TABLES `clubs` WRITE;
/*!40000 ALTER TABLE `clubs` DISABLE KEYS */;
INSERT INTO `clubs` VALUES (1,1,3,'Manchester United','/img/clubs/manchester_united.png',1878,'Manchester United is one of the most successful and supported football clubs not only in England but in the world.The club was founded as Newton Heath LYR Football Club in 1878 before being renamed Manchester United in 1902. It is a place where many football stars have been born such as the one and only Cristiano Ronaldo. The club has won 20 Premier League titles and 3 UEFA Champions League trophies, as well as 13 FA Cups and 6 Carabao Cups. The nickname of the stadium is also \"The Theatre of Dreams\". The legendary manager Sir Alex Ferguson managed the club for 27 years, winning 13 Premier League titles alone during his tenure - the most successful period in the club\'s history. The nickname they have been known with is \'\'The Red Devils\'\'.'),(2,1,2,'Manchester City','/img/clubs/manchester_city.png',1880,'Manchester City is an English football club based in Manchester, playing their home games at the Etihad Stadium. Once considered the smaller club in Manchester, City has transformed into one of the most dominant forces in world football following Sheikh Mansour\'s takeover in 2008. Under Pep Guardiola, the club achieved the historic treble in 2022/23, winning the Premier League, FA Cup and UEFA Champions League in the same season. The club has won 10 Premier League titles and is known for its relentless, possession-based style of play.'),(3,1,2,'Liverpool','/img/clubs/liverpool.png',1892,'Liverpool FC is one of England\'s most decorated and passionate clubs, playing at the iconic Anfield stadium where the famous Kop end creates one of the most electric atmospheres in world football. Founded in 1892, the club has won 6 UEFA Champions League titles and 20 league titles. Liverpool is also famous for their anthem \"You\'ll Never Walk Alone\" which is sung by thousands of fans before every home game, sending chills down the spine of anyone who hears it.'),(4,1,2,'Arsenal','/img/clubs/arsenal.png',1886,'Arsenal is a North London football club founded in 1886, playing at the Emirates Stadium. Known as The Gunners, Arsenal is famous for the legendary Invincibles season of 2003/04 where they went the entire Premier League season unbeaten — a record that has never been matched. The club has won 13 league titles and is known for producing technically gifted and stylish football. Legends like Thierry Henry, Dennis Bergkamp and Patrick Vieira made Arsenal one of the most exciting teams to watch.'),(5,1,7,'Chelsea','/img/clubs/chelsea.png',1905,'Chelsea FC is a West London football club founded in 1905, playing at Stamford Bridge. The club rose to prominence in the early 2000s following Roman Abramovich\'s takeover, becoming a dominant force in English and European football. Chelsea has won 6 Premier League titles and 2 UEFA Champions League trophies. The club is also known for producing world class players and for their dramatic Champions League victory in 2012 against Bayern Munich in their own stadium.'),(6,1,3,'Tottenham','/img/clubs/tottenham.png',1882,'Tottenham Hotspur is a North London football club founded in 1882, playing at the stunning Tottenham Hotspur Stadium, one of the most modern stadiums in the world. Known as Spurs, the club has a fierce rivalry with Arsenal known as the North London Derby. Despite not winning a league title since 1961, Tottenham has produced some of the greatest players in Premier League history including Gareth Bale, Harry Kane and Jimmy Greaves, and reached the UEFA Champions League final in 2019.'),(7,2,2,'Real Madrid','/img/clubs/real_madrid.png',1902,'Real Madrid is the most decorated football club in the world, based at the iconic Santiago Bernabeu stadium in Madrid, Spain. The club has won a record 15 UEFA Champions League titles and 36 La Liga titles, more than any other club in history. They have also won 20 Copa del Rey titles. Home to legends like Zinedine Zidane, Ronaldo Nazario and Cristiano Ronaldo, Real Madrid is famous for signing the biggest stars in the world, a policy known as the Galacticos era. With an estimated value of $6.6 billion, they are the most valuable football club in the world.'),(8,2,2,'Barcelona','/img/clubs/barcelona.png',1899,'FC Barcelona is one of the most iconic football clubs in the world, playing at the legendary Camp Nou in Barcelona, Spain. The club has won 28 La Liga titles and a record 32 Copa del Rey titles, making them the most successful club in the history of that competition. Famous for their Tiki Taka philosophy perfected under Pep Guardiola, Barcelona is the only club to have won the treble twice. With the motto \"Mes que un club\" meaning \"More than a club\", Barcelona represents Catalan identity and culture beyond just football.'),(9,2,1,'Atletico Madrid','/img/clubs/atletico_madrid.png',1903,'Atletico Madrid is the third giant of Spanish football, playing at the modern Civitas Metropolitano stadium in Madrid. Known as Los Rojiblancos, Atletico has won 11 La Liga titles and 10 Copa del Rey titles. Famous for their intense defensive style under Diego Simeone, they have reached 3 UEFA Champions League finals. Despite playing in the shadow of Real Madrid and Barcelona, Atletico is known for their never say die attitude and passionate fanbase.'),(10,2,2,'Villarreal','/img/clubs/villareal.png',1923,'Villarreal CF is a unique story in football, a club from a small city of just 50,000 people competing at the highest level of European football. Known as the Yellow Submarine, Villarreal plays at the Estadio de la Ceramica and won the UEFA Europa League in 2021 under Unai Emery, defeating Manchester United on penalties in the final. Despite their small market size, Villarreal is respected across Europe for their smart recruitment and has finished runners up in La Liga in 2007/08.'),(11,2,1,'Sevilla','/img/clubs/sevilla.png',1890,'Sevilla FC is one of the most successful clubs in European football history, based at the Ramon Sanchez Pizjuan stadium in Seville, Spain. The club holds the record for the most UEFA Europa League titles having won it 7 times, and has also won the Copa del Rey 5 times. Sevilla is known for consistently punching above its weight and has a fierce local rivalry with Real Betis known as the Derby Sevillano, one of the most passionate derbies in Spanish football.'),(12,3,2,'Juventus','/img/clubs/juventus.png',1897,'Juventus is the most successful club in Italian football history, based at the Allianz Stadium in Turin. Known as the Old Lady, Juventus has won a record 36 Serie A titles and 15 Coppa Italia trophies, making them the most decorated club in Italy. The club also won 2 UEFA Champions League titles and is famous for a legendary nine consecutive Serie A titles between 2012 and 2020. Home to icons like Alessandro Del Piero, Michel Platini and Cristiano Ronaldo, Juventus has one of the largest fanbases in the world.'),(13,3,3,'Inter Milan','/img/clubs/inter.png',1908,'FC Internazionale, known as Inter Milan, is one of the giants of Italian and European football, playing at the iconic San Siro stadium in Milan. Founded in 1908, Inter has won 20 Serie A titles and 9 Coppa Italia trophies. The club achieved the historic treble in 2009/10 under Jose Mourinho, winning Serie A, Coppa Italia and the UEFA Champions League in the same season. Inter is the only Italian club never to have been relegated from Serie A in their entire history.'),(14,3,1,'AC Milan','/img/clubs/milan.png',1899,'AC Milan is one of the most iconic football clubs in the world, sharing the legendary San Siro stadium with city rivals Inter Milan. Founded in 1899, Milan has won 19 Serie A titles and 5 Coppa Italia trophies. Most impressively, the club has won 7 UEFA Champions League titles, the second most of any club in history. The legendary teams of the late 1980s and early 1990s under Arrigo Sacchi and Fabio Capello, featuring players like Paolo Maldini, Frank Rijkaard and Marco van Basten, are considered among the greatest club sides ever assembled.'),(15,3,2,'Napoli','/img/clubs/napoli.png',1926,'SSC Napoli is the most successful club from southern Italy, based at the Diego Armando Maradona Stadium in Naples. The stadium name says it all - Napoli is forever associated with Diego Maradona, who led the club to their first two Serie A titles in 1987 and 1990, transforming the club into a symbol of southern Italian pride. The club has won 4 Serie A titles and 6 Coppa Italia trophies. In 2022/23 Napoli won the Scudetto in dominant fashion, finishing 16 points clear of the competition in one of the most impressive title winning performances in Serie A history.'),(16,3,3,'Roma','/img/clubs/roma.png',1927,'AS Roma is one of the most passionate clubs in Italian football, playing at the Stadio Olimpico in Rome. Founded in 1927, Roma has won 3 Serie A titles and 9 Coppa Italia trophies. The club is known for its incredibly passionate and vocal fanbase known as the Curva Sud. Despite limited league success compared to Juventus and Milan, Roma made history in 2022 by winning the inaugural UEFA Conference League under Jose Mourinho, becoming the first club to win that competition. Legends like Francesco Totti, who spent his entire career at the club, represent the deep emotional connection between Roma and its city.'),(17,4,2,'PSG','/img/clubs/psg.png',1970,'Paris Saint-Germain is the most successful and most supported football club in France, playing at the iconic Parc des Princes in Paris. Founded in 1970, PSG has won a record 13 Ligue 1 titles and 16 Coupe de France trophies. Following the Qatar Sports Investments takeover in 2011, PSG became a global superclub signing legends like Zlatan Ibrahimovic, Neymar and Kylian Mbappe. In 2025, PSG completed an unprecedented sextuple winning the UEFA Champions League, becoming only the second French club ever to do so, and completing one of the greatest seasons in football history.'),(18,4,3,'Marseille','/img/clubs/marseille.png',1899,'Olympique de Marseille is the most passionate and historic football club in France, playing at the legendary Stade Velodrome in Marseille. Founded in 1899, Marseille has won 10 Ligue 1 titles and is the only French club to have won the UEFA Champions League, doing so in 1993. The rivalry between Marseille and PSG known as Le Classique is considered the biggest derby in French football. Despite being stripped of one league title due to a match fixing scandal, Marseille remains the most iconic club in French football history with one of the most atmospheric stadiums in Europe.'),(19,4,2,'Lyon','/img/clubs/lyon.png',1950,'Olympique Lyonnais is one of the most successful clubs in French football history, playing at the Groupama Stadium in Lyon. Founded in 1950, Lyon dominated French football in the 2000s winning an unprecedented 7 consecutive Ligue 1 titles between 2002 and 2008, a record that has never been matched in France. The club has also won 5 Coupe de France trophies. Lyon is also famous for producing world class talent through their academy, with players like Karim Benzema and Nabil Fekir developing at the club before becoming global stars.'),(20,4,7,'Monaco','/img/clubs/monaco.png',1924,'AS Monaco is one of the most unique clubs in world football  - a French league club based in the tiny principality of Monaco on the French Riviera. Founded in 1924, Monaco has won 8 Ligue 1 titles and is famous for producing and developing some of the greatest players in football history including Thierry Henry, David Trezeguet and Kylian Mbappe. The club\'s most memorable season came in 2016/17 when they won Ligue 1 and reached the UEFA Champions League semi-finals with an exciting young squad that took Europe by storm.'),(21,4,1,'Lille','/img/clubs/lille.png',1944,'LOSC Lille is one of the most respected clubs in French football, known for their smart recruitment and ability to develop young talent. Founded in 1944, Lille has won 4 Ligue 1 titles and 6 Coupe de France trophies. Their most remarkable achievement came in 2020/21 when they sensationally won Ligue 1 ahead of PSG despite having a fraction of their budget, in one of the biggest upsets in recent French football history. Lille is also famous for producing and selling world class players like Eden Hazard and Nicolas Pepe.'),(22,5,3,'Bayern Munich','/img/clubs/bayern_munich.png',1900,'FC Bayern Munich is the most dominant and successful football club in Germany, playing at the stunning Allianz Arena in Munich. Founded in 1900, Bayern has won a record 33 Bundesliga titles and 20 DFB-Pokal trophies, including an unprecedented 11 consecutive Bundesliga titles between 2013 and 2023. The club has also won 6 UEFA Champions League titles and completed the historic treble in 2012/13 under Jupp Heynckes. Home to legends like Franz Beckenbauer, Gerd Muller and Robert Lewandowski, Bayern Munich is one of the most recognizable and valuable football clubs in the world.'),(23,5,3,'Borussia Dortmund','/img/clubs/borussia_dortmund.png',1909,'Borussia Dortmund is one of the most exciting and passionate football clubs in the world, playing at the legendary Signal Iduna Park in Dortmund - home to the iconic Yellow Wall, the largest standing terrace in European football. Founded in 1909, BVB has won 8 Bundesliga titles and 5 DFB-Pokal trophies. The club reached the UEFA Champions League final in 2013 and 2024, losing both times to Bayern Munich and Real Madrid respectively. Known for developing world class young talent like Robert Lewandowski, Erling Haaland and Jadon Sancho, Dortmund is famous for their passionate fanbase and electric atmosphere.'),(24,5,2,'RB Leipzig','/img/clubs/rb_leipzig.png',2009,'RB Leipzig is one of the most controversial yet impressive stories in modern football, founded only in 2009 and rising from the fifth tier of German football to the Bundesliga in just seven years. Playing at the Red Bull Arena in Leipzig, the club has quickly established itself as a top four force in German football. Despite their short history, Leipzig has won 2 DFB-Pokal titles in 2022 and 2023 and regularly competes in the UEFA Champions League. Known for their high intensity pressing style under coaches like Ralf Rangnick and Julian Nagelsmann, Leipzig has changed the landscape of German football forever.'),(25,5,7,'Bayer Leverkusen','/img/clubs/bayer_leverkusen.png',1904,'Bayer 04 Leverkusen is one of the most dramatic clubs in German football history, playing at the BayArena in Leverkusen. Founded in 1904 as a workers club for the Bayer pharmaceutical company, Leverkusen was famously known as \"Neverkusen\" after finishing runners up in the Bundesliga, DFB-Pokal and Champions League all in the same 2001/02 season. However they rewrote their story completely in 2023/24 under Xabi Alonso, winning their first ever Bundesliga title in an unbeaten season - one of the greatest achievements in German football history - and also winning the DFB-Pokal.'),(26,5,7,'Eintracht Frankfurt','/img/clubs/eintracht_frankfurt.png',1899,'Eintracht Frankfurt is one of the most passionate and historic clubs in German football, playing at the Deutsche Bank Park in Frankfurt. Founded in 1899, Frankfurt has won 5 DFB-Pokal titles. The club is best known internationally for their stunning UEFA Europa League victory in 2022, defeating Barcelona in the quarter finals and Rangers in the final, with tens of thousands of Frankfurt fans travelling to Seville to create one of the most incredible atmospheres in European football history. Known for their passionate ultras and never say die attitude, Frankfurt is one of the most beloved clubs in Germany.');
/*!40000 ALTER TABLE `clubs` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formations`
--

LOCK TABLES `formations` WRITE;
/*!40000 ALTER TABLE `formations` DISABLE KEYS */;
INSERT INTO `formations` VALUES (1,'4-4-2'),(2,'4-3-3'),(3,'4-2-3-1'),(4,'4-5-1'),(5,'4-1-4-1'),(6,'3-5-2'),(7,'3-4-3'),(8,'3-6-1'),(9,'5-3-2'),(10,'5-4-1'),(11,'5-2-3'),(12,'4-4-1-1'),(13,'4-3-2-1'),(14,'4-2-4'),(15,'3-4-2-1'),(16,'3-3-3-1'),(17,'4-1-2-1-2'),(18,'4-3-1-2');
/*!40000 ALTER TABLE `formations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `league_competitions`
--

DROP TABLE IF EXISTS `league_competitions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `league_competitions` (
  `league_competition_id` int NOT NULL AUTO_INCREMENT,
  `league_id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` mediumtext,
  PRIMARY KEY (`league_competition_id`),
  UNIQUE KEY `league_competition_id_UNIQUE` (`league_competition_id`),
  KEY `fk_league_league_competition_idx` (`league_id`),
  CONSTRAINT `fk_league_league_competition` FOREIGN KEY (`league_id`) REFERENCES `leagues` (`league_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `league_competitions`
--

LOCK TABLES `league_competitions` WRITE;
/*!40000 ALTER TABLE `league_competitions` DISABLE KEYS */;
/*!40000 ALTER TABLE `league_competitions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leagues`
--

DROP TABLE IF EXISTS `leagues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leagues` (
  `league_id` int NOT NULL AUTO_INCREMENT,
  `league_name` varchar(45) DEFAULT NULL,
  `logo` varchar(255) NOT NULL,
  `country` varchar(45) DEFAULT NULL,
  `description` mediumtext,
  PRIMARY KEY (`league_id`),
  UNIQUE KEY `league_id_UNIQUE` (`league_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leagues`
--

LOCK TABLES `leagues` WRITE;
/*!40000 ALTER TABLE `leagues` DISABLE KEYS */;
INSERT INTO `leagues` VALUES (1,'Premier League','/img/leagues/premier_league.png','England','The Premier League is a professional association football league in England and the highest level of the English football league system.\n    The competition was founded on 20 February 1992. It consists of 20 clubs and operates on a system of promotion and relegation with the English Football League.\n    Each club plays 19 games away and 19 games at home, meaning either at their stadium or away\'s stadium. The season usually runs from August to May. \n    A win gives you 3 points, a draw 1 point, and a loss 0 points. Places 1-5 qualify for the UEFA Champions League, with first place winning you the Premier League. \n    Place 6 qualifies for the Europa League and place 7 for the Conference League. The bottom 3 clubs are relegated to the lower division.\n    Some of the teams with the biggest history and the most trophies are Manchester United and Liverpool. It is widely known as the number 1 ranked league in the world\n    with its high intensity, physicality and fast pace, making it one of the most unpredictable and exciting leagues in the world.'),(2,'La Liga','/img/leagues/la_liga.png','Spain','La Liga is a professional association football league in Spain and the highest level of the Spanish football league system, founded in 1929.\n    It consists of 20 clubs each playing 19 games at their stadium and 19 at the opponent\'s stadium. The season usually lasts from August to May.\n    Each win gives 3 points, a draw 1 point, and a loss 0 points. Places 1-4 qualify from the UEFA Champions League, with the first place winning you La Liga.\n    Place 5 qualifies for the Europa League and place 6 for the Conference League. The bottom 3 clubs are relegated to the lower division.\n    La Liga has been dominated by Real Madrid and Barcelona, in rare cases Atletico Madrid. \n    Famous for its technical, possession-based football with quick passing combinations and devastating counter attacks.'),(3,'Seria A','/img/leagues/seria_a.png','Italy','Seria A is a professional association football league in Italy and the highest level of the Italian football league system. \n    Established in the 1929-30 season, it restructured the existing Italian Football Championship, which had been played since 1898, into a national round-robin format alongside Serie B. \n    It functions under a promotion and relegation system with Serie B. In the competition 20 clubs compete and play 19 games away and 19 games home, meaning at their stadium and at the stadium of the opponent.\n    Each win gives 3 points, a draw 1 point, and a loss 0 points. Places 1-4 qualify for the UEFA Champions League, with first place winning Seria A. Place 5 gets Europa League and place 6 Conference League. The bottom 3 get relegated to the lower division.\n    Seria A is renowned for its tactical discipline and defensive solidity, often producing low scoring but highly strategic matches. Some of the great teams in the league are Juventus, Inter Milan, and AC Milan.'),(4,'Ligue 1','/img/leagues/ligue_1.png','France','Ligue 1 is a professional association football league in France and the highest level of the French football league system, founded in 1932.\n    The league is contested by 18 clubs, each playing 17 games at their stadium and 17 games at the stadium of the opponent. Each win gives 3 points, a draw 1 point, and a loss 0 points.\n    Places 1-3 qualify for the UEFA Champions League, with first place winning Ligue 1. Place 4 gets Europa League, place 5 the Conference League. The bottom 3 clubs get relegated to the lower division.\n    Ligue 1 is known for its athleticism and directness, with explosive pace and individual flair being key characteristics. The team most well-known team and the one dominating the league for is PSG.'),(5,'Bundesliga','/img/leagues/bundesliga.png','Germany','The Bundesliga is a professional association football league in Germany and the highest level of the German football league system, founded in 1963. In the league compete 18 teams and each team plays 17 games at home and 17 games away.\n    A win gets 3 points, a draw gets 1 point, and a draw 0 points. Places 1-4 qualify for the UEFA Champions League, with first place winning the Bundesliga.\n    Place 5 qualifies for the Europa League, and place 6 for the Conference League. The bottom 2 clubs are relegated to the lower division and the 16th place plays a playoff to the stay in the league.\n    The Bundesliga is characterized by high pressing, aggressive attacking football and incredibly high scoring games. Some of the more well-known teams are Borussia Dortmund and Bayern Munich.');
/*!40000 ALTER TABLE `leagues` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `nation_clubs`
--

LOCK TABLES `nation_clubs` WRITE;
/*!40000 ALTER TABLE `nation_clubs` DISABLE KEYS */;
/*!40000 ALTER TABLE `nation_clubs` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `nation_competitions`
--

LOCK TABLES `nation_competitions` WRITE;
/*!40000 ALTER TABLE `nation_competitions` DISABLE KEYS */;
/*!40000 ALTER TABLE `nation_competitions` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `packs`
--

LOCK TABLES `packs` WRITE;
/*!40000 ALTER TABLE `packs` DISABLE KEYS */;
/*!40000 ALTER TABLE `packs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_clubs`
--

DROP TABLE IF EXISTS `player_clubs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_clubs` (
  `player_club_id` int NOT NULL AUTO_INCREMENT,
  `player_id` int NOT NULL,
  `club_id` int NOT NULL,
  PRIMARY KEY (`player_club_id`),
  UNIQUE KEY `player_club_id_UNIQUE` (`player_club_id`),
  KEY `fk_player_player_club_idx` (`player_id`),
  KEY `fk_club_player_club_idx` (`club_id`),
  CONSTRAINT `fk_club_player_club` FOREIGN KEY (`club_id`) REFERENCES `clubs` (`club_id`),
  CONSTRAINT `fk_player_player_club` FOREIGN KEY (`player_id`) REFERENCES `players` (`player_id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_clubs`
--

LOCK TABLES `player_clubs` WRITE;
/*!40000 ALTER TABLE `player_clubs` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_clubs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `players`
--

DROP TABLE IF EXISTS `players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `players` (
  `player_id` int NOT NULL AUTO_INCREMENT,
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
  `position` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`player_id`),
  UNIQUE KEY `player_id_UNIQUE` (`player_id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `players`
--

LOCK TABLES `players` WRITE;
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
/*!40000 ALTER TABLE `players` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `playerspacks`
--

LOCK TABLES `playerspacks` WRITE;
/*!40000 ALTER TABLE `playerspacks` DISABLE KEYS */;
/*!40000 ALTER TABLE `playerspacks` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `quizes`
--

LOCK TABLES `quizes` WRITE;
/*!40000 ALTER TABLE `quizes` DISABLE KEYS */;
/*!40000 ALTER TABLE `quizes` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seasons`
--

LOCK TABLES `seasons` WRITE;
/*!40000 ALTER TABLE `seasons` DISABLE KEYS */;
INSERT INTO `seasons` VALUES (1,'2000/2001'),(2,'2001/2002'),(3,'2002/2003'),(4,'2003/2004'),(5,'2004/2005'),(6,'2005/2006'),(7,'2006/2007'),(8,'2007/2008'),(9,'2008/2009'),(10,'2009/2010'),(11,'2010/2011'),(12,'2011/2012'),(13,'2012/2013'),(14,'2013/2014'),(15,'2014/2015'),(16,'2015/2016'),(17,'2016/2017'),(18,'2017/2018'),(19,'2018/2019'),(20,'2019/2020'),(21,'2020/2021'),(22,'2021/2022'),(23,'2022/2023'),(24,'2023/2024'),(25,'2024/2025'),(26,'2025/2026'),(27,'2002'),(28,'2006'),(29,'2010'),(30,'2014'),(31,'2018'),(32,'2022');
/*!40000 ALTER TABLE `seasons` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `user_collection`
--

LOCK TABLES `user_collection` WRITE;
/*!40000 ALTER TABLE `user_collection` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_collection` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `user_requests`
--

LOCK TABLES `user_requests` WRITE;
/*!40000 ALTER TABLE `user_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_requests` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Dumping data for table `user_team`
--

LOCK TABLES `user_team` WRITE;
/*!40000 ALTER TABLE `user_team` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `winners`
--

DROP TABLE IF EXISTS `winners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `winners` (
  `winner_id` int NOT NULL AUTO_INCREMENT,
  `league_id` int DEFAULT NULL,
  `league_competition_id` int DEFAULT NULL,
  `club_tournament_id` int DEFAULT NULL,
  `nation_competition_id` int DEFAULT NULL,
  `club_id` int DEFAULT NULL,
  `nation_club_id` int DEFAULT NULL,
  `season_id` int DEFAULT NULL,
  PRIMARY KEY (`winner_id`),
  UNIQUE KEY `winner_id_UNIQUE` (`winner_id`),
  KEY `fk_league_winner_idx` (`league_id`),
  KEY `fk_league_competition_winner_idx` (`league_competition_id`),
  KEY `fk_club_tournament_id_idx` (`club_tournament_id`),
  KEY `fk_nation_competition_winner_idx` (`nation_competition_id`),
  KEY `fk_club_winner_idx` (`club_id`),
  KEY `fk_nation_club_winner_idx` (`nation_club_id`),
  KEY `fk_season_winner_idx` (`season_id`),
  CONSTRAINT `fk_club_tournament_winner` FOREIGN KEY (`club_tournament_id`) REFERENCES `club_tournaments` (`club_tournament_id`),
  CONSTRAINT `fk_club_winner` FOREIGN KEY (`club_id`) REFERENCES `clubs` (`club_id`),
  CONSTRAINT `fk_league_competition_winner` FOREIGN KEY (`league_competition_id`) REFERENCES `league_competitions` (`league_competition_id`),
  CONSTRAINT `fk_league_winner` FOREIGN KEY (`league_id`) REFERENCES `leagues` (`league_id`),
  CONSTRAINT `fk_nation_club_winner` FOREIGN KEY (`nation_club_id`) REFERENCES `nation_clubs` (`nation_club_id`),
  CONSTRAINT `fk_nation_competition_winner` FOREIGN KEY (`nation_competition_id`) REFERENCES `nation_competitions` (`nation_competition_id`),
  CONSTRAINT `fk_season_winner` FOREIGN KEY (`season_id`) REFERENCES `seasons` (`season_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `winners`
--

LOCK TABLES `winners` WRITE;
/*!40000 ALTER TABLE `winners` DISABLE KEYS */;
/*!40000 ALTER TABLE `winners` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-14 22:59:47
