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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `league_competitions`
--

LOCK TABLES `league_competitions` WRITE;
/*!40000 ALTER TABLE `league_competitions` DISABLE KEYS */;
INSERT INTO `league_competitions` VALUES (1,1,'FA Cup','The FA Cup is the oldest national football competition in the world, founded in 1871. It is open to all clubs in the English football league system. The competition starts in August with preliminary rounds for lower division clubs, with Premier League and Championship clubs entering in the third round in January. From there it follows a straight knockout format through the fourth, fifth, quarter finals, semi finals played at Wembley, and the final also at Wembley in May. It is famous for giant killings where lower division clubs knock out top Premier League sides.'),(2,2,'Copa del Rey','The Copa del Rey is the main domestic cup competition in Spain, founded in 1903. Lower division clubs enter in the early rounds while La Liga clubs join from the round of 32. The competition follows a straight knockout format with two legged ties until the semi finals, and a single match final played at a neutral venue. It has been dominated by Real Madrid and Barcelona, though Athletic Club holds the record for most finals reached.'),(3,3,'Coppa Italia','The Coppa Italia is the main domestic cup competition in Italy, founded in 1922. Serie A clubs enter from the round of 16 while lower division clubs compete in the earlier rounds. The competition uses a straight knockout format with two legged ties in most rounds, while the final is a single match played at the Stadio Olimpico in Rome. Juventus holds the record for the most titles with 15.'),(4,4,'Coupe de France','The Coupe de France is the main domestic cup competition in France, founded in 1917. It is one of the most inclusive cup competitions in the world, open to all amateur and professional clubs across France. The early rounds are played regionally before the competition becomes national from the round of 64. It follows a straight knockout format with the final played at the Stade de France in Paris. PSG holds the record for the most titles with 16.'),(5,5,'DFB-Pokal','The DFB-Pokal is the main domestic cup competition in Germany, founded in 1935. It begins in August with 64 clubs including all Bundesliga and Bundesliga 2 sides plus regional representatives. The competition follows a straight knockout format over six rounds, with the final played at the Olympiastadion in Berlin in May. Bayern Munich holds the record for the most titles with 20, and winning it alongside the Bundesliga is known as the domestic double.');
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
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_clubs`
--

LOCK TABLES `player_clubs` WRITE;
/*!40000 ALTER TABLE `player_clubs` DISABLE KEYS */;
INSERT INTO `player_clubs` VALUES (1,1,1),(2,2,1),(3,2,24),(4,3,2),(5,3,23),(6,4,4),(7,5,3),(8,5,5),(9,5,16),(10,6,3),(11,7,2),(12,7,5),(13,8,6),(14,9,7),(15,9,17),(16,10,7),(17,10,23),(18,11,8),(19,12,8),(20,13,8),(21,14,2),(22,14,9),(23,15,18),(24,16,13),(25,17,13),(26,18,14),(27,19,6),(28,19,7),(29,19,14),(30,20,5),(31,20,14),(32,20,23),(33,21,2),(34,21,15),(35,22,15),(36,23,6),(37,23,22),(38,24,22),(39,25,23),(40,26,1),(41,26,22),(42,26,23),(43,27,7),(44,27,17),(45,28,17),(46,29,17),(47,29,15),(48,30,8),(49,30,17),(50,30,23),(51,31,1),(52,31,18),(53,32,22),(54,32,18),(55,33,1),(56,33,12),(57,33,20),(58,34,23),(59,34,21),(60,35,25),(61,36,6),(62,36,17),(63,36,12),(64,37,6),(65,38,1),(66,39,3),(67,40,7),(68,41,5),(69,41,7),(70,42,12),(71,43,7),(72,43,11),(73,44,5),(74,45,5),(75,48,3),(76,48,7),(77,49,5),(78,50,22),(79,51,2),(80,52,4),(81,53,4),(82,54,1),(83,54,15),(84,54,13),(85,55,8),(86,55,9),(87,56,9),(88,57,8),(89,57,2),(90,58,1),(91,58,7),(92,59,8),(93,59,17),(94,60,8),(95,60,17),(96,61,8),(97,61,9),(98,62,7),(99,63,8),(100,64,1),(101,65,7),(102,65,13),(103,66,14),(104,67,1),(105,68,15),(106,70,1),(107,70,7),(108,71,3),(109,72,7),(110,72,12),(111,73,8),(112,74,8),(113,76,1),(114,76,8),(115,76,14),(116,77,12),(117,78,1),(118,78,13),(119,79,1),(120,80,10),(121,81,25),(122,82,26);
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
  `reflexes` varchar(45) DEFAULT NULL,
  `handling` varchar(45) DEFAULT NULL,
  `positioning` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`player_id`),
  UNIQUE KEY `player_id_UNIQUE` (`player_id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `players`
--

LOCK TABLES `players` WRITE;
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
INSERT INTO `players` VALUES (1,'Bruno Fernandes','active','Bruno Miguel Borges Fernandes is a Portuguese professional footballer, born 8 September 1994, who plays as an attacking midfielder for Premier League club Manchester United, which he captains, and the Portugal national team. Bruno Fernandes started his career in the Italian league but is better known for his time at Sporting CP and Manchester United. He has played 622 matches in his career, scoring 194 goals and assisting 172 times. He has won the Nations League twice and the FA Cup once, as well as the Carabao Cup. Known for his creative output, vision, goal scoring ability, and passing, he is widely regarded as one of the best attacking midfielders in the world, consistently performing at the highest level for both club and country.',31,'/img/players/bruno_fernandes.png','WORLD CLASS','HIGH','MEDIUM','MEDIUM','MEDIUM','HIGH','CAM',NULL,NULL,NULL),(2,'Benjamin Sesko','active','Benjamin Šeško is a Slovenian professional footballer, born 31 May 2003, who plays as a striker for Premier League club Manchester United F.C. and the Slovenia national team. Benjamin Šeško began his professional career within the Red Bull football system, developing at Red Bull Salzburg before earning recognition at RB Leipzig. He has played over 190 matches in his career, scoring more than 75 goals and providing over 20 assists. He has won multiple Austrian Bundesliga titles and domestic cups. Known for his height, pace, aerial ability, and powerful finishing, he is widely regarded as one of Europe’s most promising young strikers and a leading attacking talent of his generation.',22,'/img/players/benjamin_sesko.png','GOOD','HIGH','MEDIUM','LOW','HIGH','LOW','ST',NULL,NULL,NULL),(3,'Erling Haaland','active','Erling Haaland is a Norwegian professional footballer, born 21 July 2000, who plays as a striker for Premier League club Manchester City F.C. and the Norway national team. Erling Haaland started his professional career in Norway before rising to prominence at Borussia Dortmund and later establishing himself as one of the world’s most prolific goalscorers at Manchester City. He has played over 320 matches in his career, scoring more than 260 goals and assisting over 50 times. He has won multiple Premier League titles, the UEFA Champions League, FA Cup, and numerous individual Golden Boot awards. Known for his explosive pace, physical strength, positioning, and clinical finishing, he is widely regarded as one of the best strikers in world football.',25,'/img/players/erling_haaland.png','ELITE','HIGH','MEDIUM','LOW','HIGH','LOW','ST',NULL,NULL,NULL),(4,'Declan Rice','active','Declan Rice is an English professional footballer, born 14 January 1999, who plays as a defensive midfielder for Premier League club Arsenal F.C. and the England national team. Declan Rice began his professional career at West Ham United F.C., where he developed into one of the Premier League’s top midfielders and captained the club to UEFA Europa Conference League success before joining Arsenal. He has played over 420 matches in his career, scoring more than 35 goals and assisting over 40 times. He has won the UEFA Europa Conference League and FA Community Shield. Known for his leadership, defensive intelligence, ball-winning ability, and driving runs from midfield, he is regarded as one of the best defensive midfielders in modern football.',27,'/img/players/declan_rice.png','GOOD','MEDIUM','MEDIUM','MEDIUM','LOW','HIGH','CM',NULL,NULL,NULL),(5,'Mohamed Salah','active','Mohamed Salah is an Egyptian professional footballer, born 15 June 1992, who plays as a winger for Premier League club Liverpool F.C. and captains the Egypt national team. Mohamed Salah began his European career in Switzerland before gaining prominence in Italy and later becoming a global superstar at Liverpool. He has played over 730 matches in his career, scoring more than 360 goals and providing over 160 assists. He has won the UEFA Champions League, Premier League, FA Cup, FIFA Club World Cup, and multiple Premier League Golden Boot awards. Known for his pace, dribbling, movement, and remarkable goal-scoring consistency, he is widely regarded as one of the greatest African footballers of all time.',33,'/img/players/mohamed_salah.png','ELITE','HIGH','HIGH','LOW','HIGH','MEDIUM','RW',NULL,NULL,NULL),(6,'Alisson Becker','active','Alisson Becker is a Brazilian professional footballer, born 2 October 1992, who plays as a goalkeeper for Premier League club Liverpool and the Brazil national team. Alisson Becker began his professional career at Sport Club Internacional before rising to international prominence at AS Roma and later joining Liverpool for a then world-record fee for a goalkeeper. He has made over 520 career appearances, keeping more than 230 clean sheets and famously scoring one goal for Liverpool. He has won the UEFA Champions League, Premier League, Copa América, FIFA Club World Cup, and multiple Golden Glove awards. Known for his exceptional shot-stopping, composure, distribution, and one-on-one ability, he is widely considered one of the best goalkeepers of his era.',33,'/img/players/alisson_becker.png','ELITE',NULL,NULL,NULL,NULL,NULL,'GK','ELITE','ELITE','MEDIUM'),(7,'Cole Palmer','active','Cole Palmer is an English professional footballer, born 6 May 2002, who plays as an attacking midfielder and winger for Premier League club Chelsea F.C. and the England national team. Cole Palmer came through the academy at Manchester City F.C. before moving to Chelsea in search of regular first-team football, where he quickly established himself as one of the league’s standout attacking players. He has played over 180 matches in his career, scoring more than 65 goals and assisting over 40 times. He has won the Premier League, UEFA Super Cup, and FIFA Club World Cup. Known for his technical quality, composure, creativity, and penalty-taking ability, he is regarded as one of England’s most exciting young attacking talents.',23,'/img/player/cole_palmer.png','GOOD','MEDIUM','MEDIUM','LOW','MEDIUM','HIGH','CAM',NULL,NULL,NULL),(8,'Micky van de Ven','active','Micky van de Ven is a Dutch professional footballer, born 19 April 2001, who plays as a centre-back for Premier League club Tottenham Hotspur F.C. and the Netherlands national team. Micky van de Ven began his professional career at FC Volendam before earning recognition in Germany with VfL Wolfsburg, where his pace and defensive reliability attracted major European attention. He has played over 180 matches in his career, scoring more than 10 goals. Known for his exceptional recovery speed, defensive awareness, ball progression, and athleticism, he is widely regarded as one of the fastest and most promising centre-backs in European football.',24,'/img/player/de_ven.png','AVERAGE','LOW','MEDIUM','MEDIUM','HIGH','LOW','CB',NULL,NULL,NULL),(9,'Kylian Mbappe','active','Kylian Mbappe is a French professional footballer, born 20 December 1998, who plays as a forward for La Liga club Real Madrid C.F. and captains the France national team. Kylian Mbappé began his professional career at AS Monaco FC before rising to global superstardom at Paris Saint-Germain F.C., becoming one of the most prolific forwards of his generation. He has played over 420 matches in his career, scoring more than 320 goals and providing over 150 assists. He has won multiple Ligue 1 titles, domestic cups, and the FIFA World Cup with France in 2018. Known for his explosive pace, dribbling ability, finishing, and big-match performances, he is widely regarded as one of the best footballers in the world.',27,'/img/players/kylian_mbappe.png','WORLD CLASS','HIGH','HIGH','LOW','HIGH','MEDIUM','ST',NULL,NULL,NULL),(10,'Jude Bellingham','active','Jude Bellingham is an English professional footballer, born 29 June 2003, who plays as a midfielder for La Liga club Real Madrid and the England national team. Jude Bellingham began his professional career at Birmingham City F.C. before developing into one of Europe’s elite midfielders at Borussia Dortmund and later becoming a key player for Real Madrid. He has played over 230 matches in his career, scoring more than 60 goals and assisting over 40 times. He has won league titles and the UEFA Champions League and received multiple individual awards. Known for his maturity, technical ability, leadership, goal-scoring threat, and versatility, he is widely regarded as one of the best young midfielders in world football.',22,'/img/players/jude_bellingham','ELITE','MEDIUM','HIGH','HIGH','MEDIUM','HIGH','CM',NULL,NULL,NULL),(11,'Pau Cubarsi','active','Pau Cubarsi is a Spanish professional footballer, born 22 January 2007, who plays as a centre-back for La Liga club FC Barcelona and the Spain national team. Pau Cubarsí progressed through Barcelona’s famed La Masia academy and quickly established himself in the first team at a very young age. He has played over 60 senior matches in his career, contributing defensively with composure beyond his years. Known for his positioning, ball-playing ability, tactical intelligence, and calmness under pressure, he is regarded as one of the most promising young defenders in European football.',19,'/img/player/pau_cubarsi.png','AVERAGE','LOW','LOW','MEDIUM','MEDIUM','MEDIUM','CB',NULL,NULL,NULL),(12,'Pedri','active','Pedri is a Spanish professional footballer, born 25 November 2002, who plays as a central midfielder for La Liga club FC Barcelona and the Spain national team. Pedri began his professional career at UD Las Palmas before joining Barcelona, where he quickly became a key figure in midfield. He has played over 220 matches in his career, scoring more than 20 goals and providing over 20 assists. He has won La Liga, the Copa del Rey, and the European Golden Boy award. Known for his vision, technical control, intelligence, and creativity, he is widely regarded as one of the most technically gifted midfielders of his generation.',23,'/img/players/pedri.png','ELITE','HIGH','HIGH','MEDIUM','MEDIUM','HIGH','CM',NULL,NULL,NULL),(13,'Lamine Yamal','active','Lamine Yamal is a Spanish professional footballer, born 13 July 2007, who plays as a winger for La Liga club FC Barcelona and the Spain national team. Lamine Yamal came through Barcelona’s La Masia academy and became one of the youngest players ever to represent both the club and the Spanish national team. He has played over 90 senior matches in his career, scoring more than 20 goals and assisting over 25 times. He won the UEFA European Championship with Spain in 2024. Known for his dribbling, creativity, pace, and flair, he is widely regarded as one of the brightest young talents in world football.',18,'/img/players/lamine_yamal.png','GOOD','MEDIUM','HIGH','LOW','HIGH','MEDIUM','RW',NULL,NULL,NULL),(14,'Julian Alvarez','active','Julian Alvarez is an Argentine professional footballer, born 31 January 2000, who plays as a forward for La Liga club Atlético Madrid and the Argentina national team. Julián Álvarez began his professional career at Club Atlético River Plate before joining Manchester City F.C., where he won multiple major trophies before moving to Atlético Madrid. He has played over 260 matches in his career, scoring more than 110 goals and assisting over 50 times. He has won the FIFA World Cup, Copa América, UEFA Champions League, and multiple league titles. Known for his work rate, intelligent movement, pressing ability, and clinical finishing, he is considered one of the most complete modern forwards.',26,'/img/players/julian_alvarez.png','GOOD','HIGH','HIGH','LOW','HIGH','MEDIUM','CF',NULL,NULL,NULL),(15,'Pierre-Emile Hojbjerg','active','Pierre-Emile Hojbjerg is a Danish professional footballer, born 5 August 1995, who plays as a defensive midfielder for Ligue 1 club Olympique de Marseille and the Denmark national team. Pierre-Emile Højbjerg began his professional career at FC Bayern Munich before establishing himself in the Premier League with Southampton F.C. and later Tottenham Hotspur F.C.. He has played over 450 senior matches in his career, contributing consistently as a deep-lying midfielder. Known for his leadership, tactical discipline, ball recoveries, and work rate, he is regarded as a reliable and experienced presence in midfield.',30,'/img/players/hojbjerg.png','AVERAGE','MEDIUM','MEDIUM','MEDIUM','LOW','MEDIUM','CDM',NULL,NULL,NULL),(16,'Denzel Dumfries','active ','Denzel Dumfries is a Dutch professional footballer, born 18 April 1996, who plays as a right wing-back for Serie A club Inter Milan and the Netherlands national team. Denzel Dumfries rose to prominence at PSV Eindhoven before joining Inter, where he became known for his attacking runs from defence. He has made over 350 career appearances, regularly contributing with defensive recoveries, progressive carries, and key chances created from wide areas. Known for his athleticism, stamina, and physical presence, he is considered one of Europe’s most dynamic wing-backs.',29,'/img/players/denzel_dumfries.png','AVERAGE','LOW','MEDIUM','MEDIUM','MEDIUM','MEDIUM','RB',NULL,NULL,NULL),(17,'Federico Dimarco','active','Federico Dimarco is an Italian professional footballer, born 10 November 1997, who plays as a left wing-back for Serie A club Inter Milan and the Italy national team. A product of Inter’s academy, Federico Dimarco developed through loan spells before becoming a key starter for the club. He has played over 300 matches in his career, contributing both defensively and offensively with interceptions, defensive duels, and high chance creation from wide positions. Known for his crossing ability, technical quality, and tactical intelligence, he is regarded as one of the best attacking full-backs in Italian football.',27,'/img/players/federico_dimarco.png','AVERAGE','MEDIUM','MEDIUM','MEDIUM','MEDIUM','MEDIUM','LB',NULL,NULL,NULL),(18,'Mike Maignan','active','Mike Maignan is a French professional footballer, born 3 July 1995, who plays as a goalkeeper for Serie A club AC Milan and the France national team. Mike Maignan began his professional career at Paris Saint-Germain F.C. before gaining prominence with LOSC Lille, winning Ligue 1 prior to his move to Milan. He has made over 350 career appearances, keeping more than 140 clean sheets. Known for his reflex saves, distribution, command of the penalty area, and leadership from the back, he is widely regarded as one of the top goalkeepers in world football.',30,'/img/players/mike_maignan.png','AVERAGE',NULL,NULL,NULL,NULL,NULL,'GK','MEDIUM','MEDIUM','MEDIUM'),(19,'Luka Modric','active','Luka Modric is a Croatian professional footballer, born 9 September 1985, who plays as a midfielder for La Liga club Real Madrid C.F. and captains the Croatia national team. Luka Modrić began his professional career at GNK Dinamo Zagreb before gaining international recognition at Tottenham Hotspur F.C. and later becoming a legendary figure at Real Madrid. He has played over 830 matches in his career, scoring more than 90 goals and assisting over 140 times. He has won multiple La Liga titles, five UEFA Champions League trophies, and the 2018 Ballon d’Or. Known for his vision, passing range, ball control, and ability to dictate the tempo of matches, he is widely regarded as one of the greatest midfielders of his generation.',40,'/img/players/luca_modric.png','WORLD CLASS','MEDIUM','HIGH','MEDIUM','MEDIUM','HIGH','CM',NULL,NULL,NULL),(20,'Christian Pulisic','active','Christian Pulisic is an American professional footballer, born 18 September 1998, who plays as a winger for Serie A club AC Milan and the United States national team. Christian Pulisic began his European career at Borussia Dortmund before moving to Chelsea F.C., where he won the UEFA Champions League, later establishing himself as a key attacking player at AC Milan. He has played over 370 matches in his career, scoring more than 100 goals and providing over 80 assists. Known for his pace, dribbling ability, direct attacking play, and versatility across the frontline, he is regarded as one of the most successful American footballers in European football history.',27,'/img/players/christian_pulisic.png','WORLD CLASS','HIGH','HIGH','HIGH','HIGH','HIGH','LW',NULL,NULL,NULL),(21,'Kevin De Bruyne','active','Kevin De Bruyne is a Belgian professional footballer, born 28 June 1991, who plays as an attacking midfielder for Serie A club AC Milan and captains the Belgium national team. Kevin De Bruyne began his professional career in Belgium before gaining recognition at VfL Wolfsburg and later becoming one of the defining players of the modern era during his time at Manchester City F.C., where he won multiple Premier League titles and the UEFA Champions League. He has played over 660 matches in his career, scoring more than 165 goals and providing over 275 assists. Known for his exceptional vision, passing range, creativity, and long-range shooting, he is widely regarded as one of the greatest playmakers of his generation, continuing his career in Italy with AC Milan.',34,'/img/players/de_bruyne.png','WORLD CLASS','HIGH','MEDIUM','LOW','MEDIUM','HIGH','CAM',NULL,NULL,NULL),(22,'Matteo Politano','active','Matteo Politano is an Italian professional footballer, born 3 August 1993, who plays as a winger for Serie A club SSC Napoli and the Italy national team. Matteo Politano developed through the Italian league system before establishing himself at US Sassuolo Calcio and later Inter Milan, becoming part of Napoli’s Serie A title-winning side. He has played over 420 matches in his career, scoring more than 75 goals and providing over 65 assists. Known for his technical ability, left-footed finishing, work rate, and creativity from wide positions, he is regarded as a consistent and experienced attacking winger in Italian football.',32,'/img/players/matteo_politano.png','AVERAGE','MEDIUM','MEDIUM','LOW','MEDIUM','MEDIUM','RW',NULL,NULL,NULL),(23,'Harry Kane','active','Harry Kane is an English professional footballer, born 28 July 1993, who plays as a striker for Bundesliga club FC Bayern Munich and captains the England national team. Harry Kane began his professional career at Tottenham Hotspur F.C., where he became the club’s all-time leading scorer before moving to Bayern Munich. He has played over 700 matches in his career, scoring more than 450 goals and providing over 120 assists. He has won the Bundesliga title and numerous individual Golden Boot awards. Known for his finishing, link-up play, positioning, and playmaking ability for a striker, he is widely regarded as one of the best forwards of his generation.',32,'/img/players/harry_kane.png','WORLD CLASS','HIGH','MEDIUM','LOW','LOW','MEDIUM','ST',NULL,NULL,NULL),(24,'Joshua  Kimmich','active','Joshua Kimmich is a German professional footballer, born 8 February 1995, who plays as a midfielder and right-back for Bundesliga club Bayern Munich and the Germany national team. Joshua Kimmich began his professional career at RB Leipzig before establishing himself at Bayern Munich, where he became a key part of one of Europe’s most dominant teams. He has played over 550 matches in his career, scoring more than 50 goals and providing over 120 assists. He has won multiple Bundesliga titles and the UEFA Champions League. Known for his tactical intelligence, passing range, pressing, and leadership, he is regarded as one of the most complete midfielders in world football.',31,'/img/players/joshua_kimmich','ELITE','MEDIUM','MEDIUM','HIGH','MEDIUM','MEDIUM','CDM',NULL,NULL,NULL),(25,'Gregor Kobel','active','Gregor Kobel is a Swiss professional footballer, born 6 December 1997, who plays as a goalkeeper for Bundesliga club Borussia Dortmund and the Switzerland national team. Gregor Kobel began his career at Hoffenheim before gaining recognition at VfB Stuttgart and later becoming Borussia Dortmund’s first-choice goalkeeper. He has played over 250 senior matches in his career, keeping more than 70 clean sheets. Known for his reflex saves, shot-stopping ability, and command of the penalty area, he is regarded as one of the top goalkeepers in the Bundesliga.',28,'/img/player/gregor_kobel','AVERAGE',NULL,NULL,NULL,NULL,NULL,'GK','HIGH','MEDIUM','MEDIUM'),(26,'Marcel Sabitzer','active','Marcel Sabitzer is an Austrian professional footballer, born 17 March 1994, who plays as a midfielder for Bundesliga club Borussia Dortmund and the Austria national team. Marcel Sabitzer began his professional career at Admira Wacker before rising to prominence at RB Leipzig and later playing for Bayern Munich and Borussia Dortmund. He has played over 500 matches in his career, scoring more than 90 goals and providing over 80 assists. Known for his long-range shooting, versatility, pressing ability, and work rate, he is a highly experienced midfielder at both club and international level.',32,'/img/players/marcel_sabitzer.png','ELITE','MEDIUM','MEDIUM','HIGH','MEDIUM','HIGH','CDM',NULL,NULL,NULL),(27,'Achraf Hakimi','active','Achraf Hakimi is a Moroccan professional footballer, born 4 November 1998, who plays as a right-back for Ligue 1 club Paris Saint-Germain F.C. and the Morocco national team. Achraf Hakimi began his professional career at Real Madrid before gaining prominence at Borussia Dortmund and Inter Milan, later becoming a key player for PSG. He has played over 350 matches in his career, scoring more than 40 goals and providing over 60 assists. Known for his explosive pace, attacking runs, defensive recovery, and stamina, he is widely regarded as one of the best attacking full-backs in world football.',27,'/img/players/achraf_hakimi.png','WORLD CLASS','MEDIUM','MEDIUM','HIGH','HIGH','MEDIUM','RB',NULL,NULL,NULL),(28,'Nuno Mendes','active','Nuno Mendes is a Portuguese professional footballer, born 19 June 2002, who plays as a left-back for Ligue 1 club Paris Saint-Germain and the Portugal national team. Nuno Mendes began his professional career at Sporting CP before joining PSG, where he quickly established himself as one of Europe’s top young defenders. He has played over 180 matches in his career, contributing defensively with tackles, interceptions, and progressive runs, as well as providing over 15 assists. Known for his speed, dribbling, and defensive awareness, he is regarded as one of the most promising full-backs in world football.',23,'/img/players/nuno_mendes.png','WORLD CLASS','LOW','MEDIUM','HIGH','HIGH','MEDIUM','LB',NULL,NULL,NULL),(29,'Khvicha Kvaratskhelia','active','Khvicha Kvaratskhelia  Khvicha Kvaratskhelia is a Georgian professional footballer, born 12 February 2001, who plays as a left winger for Ligue 1 club Paris Saint-Germain and the Georgia national team. Kvaratskhelia started his career in Georgia but is better known for his extraordinary time at Napoli and Paris Saint-Germain, which he joined in January 2025. He has played 330 matches in his career, scoring 90 goals and assisting 54 times. He has won Serie A with Napoli in 2023 and the UEFA Champions League with PSG in 2025. Known for his explosive dribbling, creativity and ability to terrorise defenders, he is widely regarded as one of the most exciting wingers in world football, consistently performing at the highest level for both club and country.',25,'/img/players/khvicha.png','ELITE','HIGH','HIGH','LOW','HIGH','HIGH','LW',NULL,NULL,NULL),(30,'Ousmane Dembele','active','Masour Ousmane Dembélé is a French professional footballer, born 15 May 1997, who plays as a right winger for Ligue 1 club Paris Saint-Germain and the France national team. Dembélé started his career at Rennes but is better known for his time at Barcelona and Paris Saint-Germain, which he joined in 2023. He has played 424 matches in his career, scoring 121 goals and assisting 105 times. He has won the FIFA World Cup with France in 2018, the UEFA Champions League with PSG in 2025 and the 2025 Ballon d\'Or, making him one of only ten players in history to have won all three of football\'s greatest honours. Known for his dazzling dribbling, electric pace and clinical finishing, he is widely regarded as the best player in the world, consistently performing at the highest level for both club and country.',28,'/img/players/ousmane_dembele.png','ELITE','HIGH','HIGH','LOW','HIGH','MEDIUM','RW',NULL,NULL,NULL),(31,'Mason Greenwood','active','Mason Greenwood is an English professional footballer, born 1 October 2001, who plays as a right winger for Ligue 1 club Marseille. Greenwood started his career at Manchester United but is better known for his time at Getafe and Marseille, which he joined permanently in 2024. He has played 290 matches in his career, scoring 135 goals and assisting 39 times. He was the joint top scorer of Ligue 1 in 2024/25 and is currently one of the most in-form forwards in French football. Known for his clinical finishing, powerful left foot and ability to play across the front line, he is widely regarded as one of the most exciting forwards in Ligue 1',24,'/img/players/mason_greenwood.png','GOOD','MEDIUM','HIGH','LOW','HIGH','MEDIUM','RW',NULL,NULL,NULL),(32,'Benjamin Pavard','active','Benjamin Pavard is a French professional footballer, born 28 March 1996, who plays as a centre-back for Ligue 1 club Marseille and the France national team. Pavard started his career at Lille but is better known for his time at Bayern Munich and Inter Milan before joining Marseille on loan in 2025. He has played 432 matches in his career, scoring 20 goals and assisting 21 times. He has won the FIFA World Cup with France in 2018, the Champions League and the historic sextuple with Bayern Munich in 2020, as well as the Serie A with Inter Milan in 2024. Known for his physicality, composure and ability to play both as a centre-back and right back, he is widely regarded as one of the most experienced defenders in European football.',30,'/img/players/benjamin_pavard.png','AVERAGE','LOW','MEDIUM','MEDIUM','MEDIUM','MEDIUM','RB',NULL,NULL,NULL),(33,'Paul Pogba','active','Paul Pogba is a French professional footballer, born 15 March 1993, who plays as a central midfielder for Ligue 1 club Monaco and the France national team. Pogba started his career at Manchester United but is better known for his time at Juventus and Manchester United, which he rejoined in 2016 for a then world record fee. He has played 472 matches in his career, scoring 77 goals and assisting 84 times. He has won the FIFA World Cup with France in 2018, the Serie A title four times and the Europa League with Manchester United. Known for his physicality, vision and ability to dominate games from midfield, he is widely regarded as one of the most talented midfielders of his generation.',32,'/img/players/paul_pogba.png','ELITE','HIGH','HIGH','LOW','LOW','HIGH','CM',NULL,NULL,NULL),(34,'Thomas Meunier','active','Thomas Meunier is a Belgian professional footballer, born 12 September 1991, who plays as a right back for Ligue 1 club Lille and the Belgium national team. Meunier is best known for his time at Paris Saint-Germain and Borussia Dortmund before joining Lille. He has played 421 matches in his career, scoring 32 goals and assisting 54 times. He has won the Ligue 1 title with PSG and reached the Champions League final with Borussia Dortmund in 2024. Known for his attacking runs, crossing ability and defensive reliability, he is a versatile and experienced right back in French football.',33,'/img/players/thomas_meunier.png','AVERAGE','MEDIUM','MEDIUM','MEDIUM','LOW','MEDIUM','RB',NULL,NULL,NULL),(35,'Alex Grimaldo','active','Alex Grimaldo is a Spanish professional footballer, born 20 September 1995, who plays as a left back for Bundesliga club Bayer Leverkusen and the Spain national team. Grimaldo started his career at Barcelona but is better known for his time at Benfica and Bayer Leverkusen, which he joined in 2023. He has played 535 matches in his career, scoring 62 goals and assisting 102 times. He has won the historic unbeaten Bundesliga title with Bayer Leverkusen in 2024 and multiple Portuguese league titles with Benfica. Known for his blistering pace, attacking ability and precise crossing, he is widely regarded as one of the best left backs in world football, consistently performing at the highest level for both club and country.',29,'/img/players/alex_grimaldo.png','ELITE','HIGH','MEDIUM','MEDIUM','MEDIUM','HIGH','LB',NULL,NULL,NULL),(36,'Randal Kolo Muani','active','Kolo Muani is a French professional footballer, born 5 December 1998, who plays as a striker for Premier League club Tottenham Hotspur, on loan from Paris Saint-Germain, and the France national team. Kolo Muani started his career at Nantes but is better known for his time at Eintracht Frankfurt and Paris Saint-Germain before joining Tottenham on loan in 2025. He has played 308 matches in his career, scoring 90 goals and assisting 40 times. He has won the Coupe de France with Nantes and Ligue 1 with PSG, and was a finalist with France at the 2022 FIFA World Cup. Known for his pace, movement and clinical finishing, he is widely regarded as one of the most dynamic forwards in European football.',27,'/img/players/kolo_muani.png','AVERAGE','MEDIUM','MEDIUM','LOW','HIGH','LOW','ST',NULL,NULL,NULL),(37,'Richarlison','active','Richarlison de Andrade is a Brazilian professional footballer, born 9 May 1997, who plays as a striker for Premier League club Tottenham Hotspur and the Brazil national team. Richarlison is better known for his time at Everton and Tottenham Hotspur, which he joined in 2022. He has played 428 matches in his career, scoring 124 goals and assisting 39 times. He has won the Olympic gold medal with Brazil at the 2020 Tokyo Olympics, scoring five goals in the tournament. Known for his explosive pace, powerful finishing and relentless pressing, he is widely regarded as one of the best strikers in the Premier League, consistently performing at the highest level for both club and country. ',28,'/img/players/richarlison.png','AVERAGE','MEDIUM','MEDIUM','LOW','MEDIUM','MEDIUM','LW',NULL,NULL,NULL),(38,'Amad Diallo','active','Amad Diallo Traoré is an Ivorian professional footballer, born 11 July 2002, who plays as a right winger for Premier League club Manchester United and the Ivory Coast national team. Diallo started his career at Atalanta but is better known for his time at Manchester United, which he joined in 2021. He has played 176 matches in his career, scoring 46 goals and assisting 26 times. He has won the FA Cup with Manchester United in 2024. Known for his electric dribbling, creativity and ability to produce decisive moments in big games, he is widely regarded as one of the most exciting young wingers in the Premier League.',23,'/img/players/amad_diallo.png','GOOD','MEDIUM','HIGH','LOW','HIGH','MEDIUM','RW',NULL,NULL,NULL),(39,'Virgil van Dijk','active','Virgil van Dijk  is a Dutch professional footballer, born 8 July 1991, who plays as a centre-back for Premier League club Liverpool, which he captains, and the Netherlands national team. Van Dijk started his career at Groningen but is better known for his time at Southampton and Liverpool, which he joined in January 2018 for a then world record fee for a defender. He has played 669 matches in his career, scoring 65 goals and assisting 21 times. He has won the Premier League, Champions League, FA Cup and Carabao Cup with Liverpool, as well as finishing as runner-up for the 2019 Ballon d\'Or. Known for his strength, leadership, aerial ability and composure on the ball, he is widely regarded as one of the greatest defenders of his generation.',34,'/img/players/van_dijk.png','WORLD CLASS','LOW','LOW','HIGH','HIGH','MEDIUM','CB',NULL,NULL,NULL),(40,'Arda Guler','active','Arda Guleris a Turkish professional footballer, born 25 February 2005, who plays as an attacking midfielder for La Liga club Real Madrid and the Turkey national team. Güler started his career at Fenerbahçe but is better known for his time at Real Madrid, which he joined in 2023. He has played 182 matches in his career, scoring 31 goals and assisting 41 times. He has won La Liga and the Champions League with Real Madrid in his debut season, as well as the Turkish Cup with Fenerbahçe. Known for his technical brilliance, creativity and maturity beyond his years, he is widely regarded as one of the most exciting young talents in world football, consistently performing at the highest level for both club and country.',21,'/img/players/arda_guler.png','GOOD','HIGH','HIGH','LOW','MEDIUM','HIGH','CAM',NULL,NULL,NULL),(41,'Thibaut Courtois','active','Thibaut Nicolas Marc Courtois is a Belgian professional footballer, born 11 May 1992, who plays as a goalkeeper for La Liga club Real Madrid and the Belgium national team. Courtois started his career at Genk but is better known for his time at Atlético Madrid, Chelsea and Real Madrid, which he joined in 2018. He has made 701 appearances in his career, winning two Premier League titles with Chelsea, La Liga and the Champions League with Real Madrid. Known for his imposing presence, lightning reflexes and ability to perform in the biggest moments, he is widely regarded as one of the greatest goalkeepers of all time, consistently performing at the highest level for both club and country.',33,'/img/players/thibaut_courtois.png','WORLD CLASS',NULL,NULL,NULL,NULL,NULL,'GK','HIGH','HIGH','HIGH'),(42,'Weston McKennie','active','Weston James Earl McKennie is an American professional footballer, born 28 August 1998, who plays as a central midfielder for Serie A club Juventus and the United States national team. McKennie started his career at Schalke 04 but is better known for his time at Juventus, which he joined in 2020. He has played 381 matches in his career, scoring 40 goals and assisting 36 times. He has won the Coppa Italia with Juventus and represented the United States at the 2022 FIFA World Cup. Known for his energy, box-to-box running and ability to contribute both defensively and with goals, he is widely regarded as one of the best American midfielders of his generation.',27,'/img/players/weston_mckennie','AVERAGE','MEDIUM','MEDIUM','MEDIUM','MEDIUM','MEDIUM','CM',NULL,NULL,NULL),(43,'Sergio Ramos','active','Sergio Ramos García is a Spanish professional footballer, born 30 March 1986, who plays as a centre-back and is most known for his legendary time at Real Madrid, which he captained for many years, and the Spain national team. Ramos started his career at Sevilla but is better known for his extraordinary time at Real Madrid, which he joined in 2005. He has played 693 matches in his career, scoring 109 goals and assisting 27 times. He has won 5 La Liga titles, 4 UEFA Champions League titles and  FIFA World Cup with Spain in 2010 and the UEFA Euro twice. Known for his leadership, aerial ability and goalscoring from defence, he is widely regarded as one of the greatest defenders of all time.',40,'/img/players/sergio_ramos.png','WORLD CLASS','MEDIUM','LOW','HIGH','MEDIUM','MEDIUM','CB',NULL,NULL,NULL),(44,'Marc Cucurella','active','Marc Cucurella is a Spanish professional footballer, born 22 July 1998, who plays as a left back for Premier League club Chelsea and the Spain national team. Cucurella started his career at Barcelona but is better known for his time at Getafe, Brighton and Chelsea, which he joined in 2022. He has played 418 matches in his career, scoring 20 goals and assisting 30 times. He has won the UEFA Euro 2024 with Spain, the Conference League and the FIFA Club World Cup with Chelsea. Known for his tenacity, pace and ability to contribute offensively from left back, he is widely regarded as one of the best left backs in the Premier League, consistently performing at the highest level for both club and country.',27,'/img/players/marc_cucurella.png','AVERAGE','LOW','LOW','MEDIUM','MEDIUM','MEDIUM','LB',NULL,NULL,NULL),(45,'Moises Caicedo','active','Moises Caicedo is an Ecuadorian professional footballer, born 2 November 2001, who plays as a central defensive midfielder for Premier League club Chelsea and the Ecuador national team. Caicedo started his career at Independiente del Valle but is better known for his time at Brighton and Chelsea, which he joined in 2023 for a then British transfer record of £115 million. He has played 267 matches in his career, scoring 21 goals and assisting 18 times. He has won the Conference League with Chelsea in 2025. Known for his relentless pressing, ball-winning ability and composure in possession, he is widely regarded as one of the best defensive midfielders in the world, consistently performing at the highest level for both club and country.',24,'/img/players/moises_caicedo.png','AVERAGE','LOW','LOW','MEDIUM','MEDIUM','LOW','CDM',NULL,NULL,NULL),(46,'Viktor Velkov','active','Victor Velkov, born in 2006, is a Bulgarian central midfielder and three-time UEFA Sveta Troica Cup winner, as well as the FIFA Puskas Award winner in 2022. He served as captain of the Intergalactic Cup team and is known for his meteorite-like goals from the halfway line and eagle-like vision on the field. Across all competitions, he has recorded 880 goals and 1,152 assists. He captained the Sveta Troica international team from 2016 to 2023 and played for Zad Bloka FC from 2014 to 2019, followed by Nonstop FC from 2020 to 2025.',19,'/img/players/viktor_velkov.png','WORLD CLASS','HIGH','HIGH','HIGH','HIGH','HIGH','CDM',NULL,NULL,NULL),(47,'Kristian Krastev','active','Kristian Krastev is a Bulgarian semi-professional footballer, born on 8 August 2005, who has played for several Bulgarian teams, including Zad Bloka FC and 113-to FC. His football journey began at an open play club in Sveta Troica Park, where he quickly emerged as a promising talent among his peers. He became particularly recognized for his precise finishing ability as a static striker and excellent field scanning.As his career progressed, Krastev secured a place in the starting lineup of Zad Bloka FC, a team well known for developing young talents, including Viktor Velkov. Throughout his career, Kristian Krastev has participated in more than 1,000 matches, scoring 3,127 goals and recording 5 assists. He has won multiple trophies, including the Sveta Troica League title with Zad Bloka FC, as well as the UEFA Sveta Troica Cup.',20,'/img/players/kristian_krastev','WORLD CLASS','HIGH','HIGH','HIGH','HIGH','HIGH','CM',NULL,NULL,NULL),(48,'Trent Alexander-Arnold','active','Trent John Alexander-Arnold is an English professional footballer, born 7 October 1998, who plays as a right-back for La Liga club Real Madrid and the England national team. Having famously spent his entire early career at Liverpool where he won every major trophy available, he made a high-profile move to Real Madrid in 2025. He has played 416 matches in his career, scoring 27 goals and assisting 108 times. He has won the UEFA Champions League, the Premier League, and the FA Cup, as well as the FIFA Club World Cup. Known for his elite passing range, crossing, and set-piece specialist abilities, he is widely regarded as one of the best playmaking full-backs in the history of the game',27,'/img/players/trent_arnold.png','ELITE','MEDIUM','MEDIUM','MEDIUM','MEDIUM','HIGH','RWB',NULL,NULL,NULL),(49,'Reece James','active','Reece James is an English professional footballer, born 8 December 1999, who plays as a right-back for Premier League club Chelsea, which he captains, and the England national team. Reece James started his career in the Chelsea youth academy and spent a brief loan spell at Wigan Athletic, but is best known as the defensive cornerstone of his boyhood club. He has played 272 matches in his career, scoring 19 goals and assisting 31 times. He has won the UEFA Champions League, the FIFA Club World Cup, and the UEFA Europa Conference League. Known for his immense physical strength, technical crossing, and defensive dominance, he is widely regarded as one of the most complete right-backs in world football.',26,'/img/players/reece_james.png','GOOD','LOW','MEDIUM','MEDIUM','MEDIUM','MEDIUM','RWB',NULL,NULL,NULL),(50,'Alphonso Davies','active','Alphonso Boyle Davies is a Canadian professional footballer, born 2 November 2000, who plays as a left-back or winger for Bundesliga club Bayern Munich and the Canada national team. Davies started his career in MLS with the Vancouver Whitecaps before making a record-breaking move to Germany, where he became a global star. He has played 328 matches in his career, scoring 26 goals and assisting 58 times. He has won the UEFA Champions League once and the Bundesliga six times, as well as the FIFA Club World Cup. Known for his explosive pace, dribbling, and recovery speed, he is widely regarded as one of the best left-backs in the world, serving as a trailblazer for North American talent in Europe.',25,'/img/players/alphonso_davies','GOOD','LOW','MEDIUM','MEDIUM','HIGH','MEDIUM','LWB',NULL,NULL,NULL),(51,'Bernardo Silva','active','Bernardo Mota Veiga de Carvalho e Silva is a Portuguese professional footballer, born 10 August 1994, who plays as an attacking midfielder or winger for Premier League club Manchester City and the Portugal national team. Bernardo Silva started his career at Benfica and rose to prominence at Monaco, but he is better known for his trophy-laden era at Manchester City. He has played 651 matches in his career, scoring 104 goals and assisting 106 times. He has won the UEFA Champions League, the Premier League six times, and the UEFA Nations League. Known for his incredible work rate, close control, and tactical flexibility, he is widely regarded as one of the most intelligent and technically gifted players of his generation.',31,'/img/players/bernardo_silva.png','ELITE','HIGH','HIGH','LOW','MEDIUM','MEDIUM','RM',NULL,NULL,NULL),(52,'Bukayo Saka','active','Bukayo Ayoyinka TM Saka is an English professional footballer, born 5 September 2001, who plays as a winger for Premier League club Arsenal and the England national team. A product of the Arsenal academy, Saka has remained a one-club man, becoming the face of the club\'s modern era. He has played 353 matches in his career, scoring 94 goals and assisting 88 times. He has won the FA Cup once and the Community Shield twice, as well as being named PFA Young Player of the Year. Known for his elite 1v1 dribbling, composure under pressure, and decision-making, he is widely regarded as one of the premier wingers in the world, consistently delivering for both club and country.',24,'/img/players/bukayo_saka.png','AVERAGE','MEDIUM','MEDIUM','LOW','HIGH','MEDIUM','RM',NULL,NULL,NULL),(53,'Viktor Gyokeres','active','Viktor Einar Gyökeres is a Swedish professional footballer, born 4 June 1998, who plays as a striker for Premier League club Arsenal and the Sweden national team. Gyökeres started his career in Sweden with Brommapojkarna and spent time in the English Championship with Coventry City, but he became a global sensation at Sporting CP before making his marquee move to Arsenal in 2025. He has played 378 matches in his career, scoring 182 goals and assisting 58 times. He has won the Primeira Liga twice and the Taça de Portugal once, as well as the Emirates Cup. Known for his immense physical power, relentless ball-carrying, and clinical finishing, he is widely regarded as one of the most prolific and feared strikers in European football today.',27,'/img/players/viktor_gyokeres.png','GOOD','HIGH','LOW','LOW','HIGH','MEDIUM','CF',NULL,NULL,NULL),(54,'Romelu Lukaku','active','Romelu Menama Lukaku Bolingoli is a Belgian professional footballer, born 13 May 1993, who plays as a striker for Serie A club Napoli and the Belgium national team. Lukaku started his career at Anderlecht and has played for several of the world\'s biggest clubs including Chelsea, Everton, Manchester United, and Inter Milan. He has played 752 matches in his career, scoring 384 goals and assisting 102 times. He has won the Serie A twice, the UEFA Champions League, and the FIFA Club World Cup, as well as the FA Cup and the Belgian Pro League. Known for his exceptional strength, intelligent movement, and historic goal-scoring record for his country, he is widely regarded as one of the greatest Belgian players and most dominant strikers of his era.',32,'/img/players/romelu_lukaku.png','ELITE','HIGH','LOW','LOW','MEDIUM','MEDIUM','CF',NULL,NULL,NULL),(55,'Clement Lenglet','active','Clément Nicolas Laurent Lenglet is a French professional footballer, born 17 June 1995, who plays as a centre-back for La Liga club Atlético Madrid and the France national team. Lenglet started his career at Nancy and Sevilla before moving to Barcelona, but he is now revitalized at Atlético Madrid following successful Premier League loans at Tottenham and Aston Villa. He has played 391 matches in his career, scoring 16 goals and assisting 14 times. He has won La Liga, the Copa del Rey, and the Supercopa de España, as well as the Ligue 2 title. Known for his composure on the ball, tactical awareness, and distribution from the back, he is widely regarded as a reliable and experienced defender performing at the highest level in European football.',30,'/img/players/clement_lenglet.png','AVERAGE','LOW','LOW','MEDIUM','MEDIUM','LOW','CB',NULL,NULL,NULL),(56,'Marcos Llorente','active','Marcos Llorente Moreno is a Spaniard professional footballer, born 30 January 1995, who plays as a midfielder or right-back for La Liga club Atlético Madrid and the Spain national team. Llorente started his career at Real Madrid and had a standout loan spell at Alavés, but he is best known for his transformation into a versatile powerhouse under Diego Simeone at Atlético Madrid. He has played 432 matches in his career, scoring 41 goals and assisting 58 times. He has won the UEFA Champions League twice and the FIFA Club World Cup three times with Real Madrid, as well as La Liga with Atlético. Known for his incredible physical fitness, explosive speed, and ability to play almost any position on the pitch, he is widely regarded as one of the most versatile and hardworking players in the world.',31,'/img/players/marcos_llorente','AVERAGE','LOW','LOW','MEDIUM','MEDIUM','MEDIUM','CDM',NULL,NULL,NULL),(57,'Joao Cancelo','active','João Pedro Cavaco Cancelo is a Portuguese professional footballer, born 27 May 1994, who plays as a full-back for La Liga club Barcelona (on loan from Al-Hilal) and the Portugal national team. Cancelo started his career at Benfica and has played for several of the world\'s elite clubs, including Juventus, Manchester City, and Bayern Munich. He has played 528 matches in his career, scoring 23 goals and assisting 78 times. He has won the Premier League three times, the Serie A once, and the UEFA Champions League, as well as the UEFA Nations League with Portugal. Known for his elite technical ability, creative playmaking from defense, and flair, he is widely regarded as one of the most gifted attacking full-backs of his generation.',31,'/img/players/joao_cancelo.png','GOOD','MEDIUM','MEDIUM','MEDIUM','MEDIUM','MEDIUM','LB',NULL,NULL,NULL),(58,'Cristiano Ronaldo','active','Cristiano Ronaldo dos Santos Aveiro is a Portuguese professional footballer, born 5 February 1985, who plays as a forward for Saudi Pro League club Al-Nassr, which he captains, and the Portugal national team. Ronaldo started his career at Sporting CP and became a global icon at Manchester United and Real Madrid, later playing for Juventus. He has played 1,294 matches in his career, scoring 969 goals and assisting 256 times. He has won the UEFA Champions League five times, the Premier League three times, and the UEFA European Championship, alongside five Ballon d\'Or awards. Known for his elite athleticism, aerial prowess, and unmatched goal-scoring instinct, he is widely regarded as the greatest player of all time.',41,'/img/players/cristiano_ronaldo.png','WORLD CLASS','HIGH','HIGH','LOW','HIGH','HIGH','ST',NULL,NULL,NULL),(59,'Lionel Messi','active','Lionel Andrés Messi is an Argentine professional footballer, born 24 June 1987, who plays as a forward for Major League Soccer club Inter Miami, which he captains, and the Argentina national team. Messi famously spent the vast majority of his career at Barcelona before playing for Paris Saint-Germain and eventually moving to Miami. He has played 1,126 matches in his career, scoring 904 goals and assisting 389 times. He has won the FIFA World Cup, the UEFA Champions League four times, and the Copa América twice, holding a record eight Ballon d\'Or awards. Known for his extraordinary dribbling, playmaking, and vision, he is widely regarded as the greatest footballer in the history of the sport.',38,'/img/players/lionel_messi','WORLD CLASS','HIGH','HIGH','LOW','HIGH','HIGH','RW',NULL,NULL,NULL),(60,'Neymar','active','Neymar da Silva Santos Júnior is a Brazilian professional footballer, born 5 February 1992, who plays as an attacking midfielder or winger for Saudi Pro League club Al-Hilal and the Brazil national team. Neymar started his career at Santos and reached his peak at Barcelona and Paris Saint-Germain before his high-profile move to Saudi Arabia. He has played 741 matches in his career, scoring 452 goals and assisting 255 times. He has won the UEFA Champions League, the Copa Libertadores, and the FIFA Confederations Cup. Known for his flamboyant style, creative flair, and technical skill, he is widely regarded as one of the most talented players of his generation and Brazil’s all-time leading goalscorer.',34,'/img/players/neymar.png','WORLD CLASS','HIGH','HIGH','LOW','HIGH','HIGH','LW',NULL,NULL,NULL),(61,'Luis Suarez','active','Luis Alberto Suárez Díaz is an Uruguayan professional footballer, born 24 January 1987, who plays as a striker for Major League Soccer club Inter Miami and the Uruguay national team. Suárez started his career in Uruguay but rose to stardom at Ajax, Liverpool, and Barcelona, later winning a title with Atlético Madrid. He has played 974 matches in his career, scoring 593 goals and assisting 308 times. He has won the UEFA Champions League, the Premier League Golden Boot, and the Copa América. Known for his clinical finishing, clever movement, and fierce competitiveness, he is widely regarded as one of the greatest strikers to ever play the game.',39,'/img/players/luis_suarez','WORLD CLASS','HIGH','MEDIUM','LOW','MEDIUM','HIGH','ST',NULL,NULL,NULL),(62,'Marcelo','retired','Marcelo Vieira da Silva Júnior is a Brazilian professional footballer, born 12 May 1988, who plays as a left-back for Campeonato Brasileiro club Fluminense and the Brazil national team. Marcelo started his career at Fluminense and became a legend at Real Madrid, where he spent 15 seasons before returning to his boyhood club. He has played 802 matches in his career, scoring 61 goals and assisting 124 times. He has won the UEFA Champions League five times and the Copa Libertadores once, as well as the FIFA Confederations Cup. Known for his incredible technical skill, offensive contribution, and joy on the pitch, he is widely regarded as one of the greatest left-backs to ever play.',37,'/img/players/marcelo.png','ICON','MEDIUM','HIGH','HIGH','MEDIUM','HIGH','LWB',NULL,NULL,NULL),(63,'Andres Iniesta','retired','Andrés Iniesta Luján is a Spanish professional footballer, born 11 May 1984, who plays as a midfielder for UAE Pro League club Emirates and the Spain national team. Iniesta is a legend of Barcelona, where he spent 22 years before moving to Vissel Kobe and eventually the UAE. He has played 1,028 matches in his career, scoring 98 goals and assisting 196 times. He has won the FIFA World Cup—scoring the winning goal in the final—the UEFA Champions League four times, and the UEFA European Championship twice. Known for his balance, ball control, and ability to perform in the biggest moments, he is widely regarded as one of the greatest midfielders in football history.',41,'/img/players/andres_iniesta','ICON','MEDIUM','HIGH','MEDIUM','MEDIUM','HIGH','CM',NULL,NULL,NULL),(64,'Wayne Rooney','retired','Wayne Mark Rooney is an English former professional footballer, born 24 October 1985, who is best known for his time as a forward for Premier League club Manchester United and the England national team. Rooney started his career at Everton and became the all-time leading scorer for Manchester United during a 13-year stay. He played 883 matches in his career, scoring 366 goals and assisting 188 times. He won the UEFA Champions League, the Premier League five times, and the FA Cup. Known for his versatility, work rate, and power, he is widely regarded as one of the greatest English players in history, having served as captain for both his club and country.',40,'/img/players/wayne_rooney.png','ICON','HIGH','HIGH','LOW','MEDIUM','HIGH','CF',NULL,NULL,NULL),(65,'Ronaldo Nazario','retired','Ronaldo Luís Nazário de Lima is a Brazilian former professional footballer, born 18 September 1976, who played as a striker for several of the world\'s biggest clubs, including Real Madrid, Inter Milan, and Barcelona, and the Brazil national team. \"El Fenomeno\" started his career at Cruzeiro and became a global phenomenon, winning two Ballon d\'Or awards before the age of 21. He played 616 matches in his career, scoring 414 goals and assisting 104 times. He has won the FIFA World Cup twice and the Copa América twice, as well as the UEFA Cup. Known for his explosive pace, clinical finishing, and revolutionary dribbling, he is widely regarded as one of the most talented and complete strikers to ever grace the pitch.',49,'/img/players/ronaldo_nazario','ICON','HIGH','HIGH','LOW','HIGH','MEDIUM','ST',NULL,NULL,NULL),(66,'Paolo Maldini','retired','Paolo Cesare Maldini is an Italian former professional footballer, born 26 June 1968, who played as a left-back and centre-back for Serie A club AC Milan and the Italy national team. A true \"one-club man,\" Maldini spent his entire 25-season career at Milan, where he served as the long-standing captain. He played 1,028 matches in his career, scoring 40 goals and assisting 35 times. He has won the UEFA Champions League five times and Serie A seven times, as well as the FIFA Club World Cup. Known for his perfect positioning, elegant tackling, and immense leadership, he is widely regarded as the greatest defender in the history of football.',57,'/img/players/paolo_maldini.png','ICON','LOW','LOW','HIGH','HIGH','LOW','CB',NULL,NULL,NULL),(67,'Edwin van der Sar','retired','Edwin van der Sar is a Dutch former professional footballer, born 29 October 1970, who played as a goalkeeper for Manchester United, Ajax, and the Netherlands national team. Van der Sar started his career at Ajax where he won the Champions League before later revitalizing his career at Fulham and becoming a legend at Manchester United. He played 950 matches in his career, maintaining 438 clean sheets. He has won the UEFA Champions League twice, the Premier League four times, and the Eredivisie four times. Known for his calm presence, excellent distribution, and shot-stopping ability, he is widely regarded as one of the most consistent and decorated goalkeepers of all time.',55,'/img/players/van_der_sar.png','ICON',NULL,NULL,NULL,NULL,NULL,'GK','HIGH','HIGH','MEDIUM'),(68,'Diego Maradona','retired','Diego Armando Maradona is an Argentine former professional footballer, born 30 October 1960, who played as an attacking midfielder for Napoli, Barcelona, and the Argentina national team. Maradona started his career at Argentinos Juniors but became a god-like figure in Naples and his home country. He played 680 matches in his career, scoring 345 goals and assisting 238 times. He has won the FIFA World Cup, where he famously captained Argentina to victory in 1986, and two Serie A titles. Known for his divine dribbling, vision, and ball control, he is widely regarded as one of the most gifted and iconic players to ever play the game.',NULL,'/img/players/diego_maradona','ICON','HIGH','HIGH','LOW','HIGH','HIGH','CAM',NULL,NULL,NULL),(69,'Pele','retired','Edson Arantes do Nascimento is a Brazilian former professional footballer, born 23 October 1940, who played as a forward for Santos and the Brazil national team. Pelé spent nearly his entire career at Santos before a late stint with the New York Cosmos, becoming the sport\'s first global superstar. He played 1,363 matches in his career, scoring 1,281 goals (including friendlies). He remains the only player to have won the FIFA World Cup three times and won the Copa Libertadores twice. Known for his heading ability, powerful striking, and immense creativity, he is widely regarded as the king of football and a foundational figure in the history of the sport.',NULL,'/img/players/pele','ICON','HIGH','HIGH','LOW','HIGH','MEDIUM','CF',NULL,NULL,NULL),(70,'David Beckham','retired','David Robert Joseph Beckham is an English former professional footballer, born 2 May 1975, who played as a midfielder for Manchester United, Real Madrid, and the England national team. Beckham was a graduate of the \"Class of \'92\" at United and went on to become a global icon through spells at Milan, PSG, and LA Galaxy. He played 844 matches in his career, scoring 146 goals and assisting 273 times. He has won the UEFA Champions League, the Premier League six times, and La Liga. Known for his legendary crossing, free-kick expertise, and incredible work rate, he is widely regarded as one of the best right-sided midfielders of his generation.',50,'/img/players/david_beckham','ICON','MEDIUM','HIGH','LOW','MEDIUM','HIGH','RM',NULL,NULL,NULL),(71,'Steven Gerrard','retired','Steven George Gerrard is an English former professional footballer, born 30 May 1980, who played as a midfielder for Premier League club Liverpool, which he captained, and the England national team. Gerrard spent almost his entire career at his boyhood club, Liverpool, before a brief final season at LA Galaxy. He played 872 matches in his career, scoring 212 goals and assisting 175 times. He has won the UEFA Champions League, the FA Cup twice, and the UEFA Cup. Known for his long-range shooting, leadership, and ability to single-handedly win matches, he is widely regarded as one of the greatest and most complete midfielders in Premier League history.',45,'/img/players/steven_gerrard','ICON','MEDIUM','MEDIUM','MEDIUM','MEDIUM','HIGH','CM',NULL,NULL,NULL),(72,'Zinedine Zidane','retired','Zinedine Yazid Zidane is a French former professional footballer, born 23 June 1972, who played as an attacking midfielder for Juventus, Real Madrid, and the France national team. Zidane started his career at Cannes and Bordeaux before becoming the world\'s most expensive player during his iconic five-year stay at Real Madrid. He played 797 matches in his career, scoring 156 goals and assisting 164 times. He has won the FIFA World Cup, the UEFA Champions League, and the Ballon d\'Or. Known for his elegance, extraordinary ball control, and big-game temperament, he is widely regarded as one of the greatest playmakers in the history of football.',53,'/img/players/zinedine_zidane.png','ICON','HIGH','HIGH','LOW','MEDIUM','HIGH','CAM',NULL,NULL,NULL),(73,'Johan Cruyff','retired','Hendrik Johannes Cruijff, known as Johan Cruyff, was a Dutch professional footballer, born 25 April 1947 and passed away 24 March 2016, who played as a forward or attacking midfielder for Ajax, Barcelona, and the Netherlands national team. Cruyff is the architect of \"Total Football,\" leading Ajax to three consecutive European Cups before transforming Barcelona’s footballing philosophy. He played 716 matches in his career, scoring 401 goals and assisting 192 times. He won three Ballon d’Or awards and reached the FIFA World Cup final in 1974. Known for his tactical genius, revolutionary vision, and the \"Cruyff Turn,\" he is widely regarded as one of the most influential figures in the history of the sport.',NULL,'/img/players/johan_cruyff','ICON','HIGH','HIGH','LOW','HIGH','MEDIUM','CF',NULL,NULL,NULL),(74,'Ronaldinho','retired','Ronaldo de Assis Moreira, known as Ronaldinho Gaúcho, is a Brazilian former professional footballer, born 21 March 1980, who played as an attacking midfielder or winger for Barcelona, AC Milan, and the Brazil national team. Ronaldinho rose to fame at PSG before becoming the world\'s best player at Barcelona, where he famously received a standing ovation at the Bernabéu. He played 719 matches in his career, scoring 280 goals and assisting 189 times. He has won the FIFA World Cup, the UEFA Champions League, and the Ballon d\'Or. Known for his flair, incredible dribbling, and signature smile, he is widely regarded as one of the most skillful and entertaining players to ever play the game.',46,'/img/players/ronaldinho.png','ICON','HIGH','HIGH','LOW','HIGH','MEDIUM','LW',NULL,NULL,NULL),(75,'Lev Yashin','retired','Lev Ivanovich Yashin was a Soviet professional footballer, born 22 October 1929 and passed away 20 March 1990, who played as a goalkeeper for Dynamo Moscow and the Soviet Union national team. Known as the \"Black Spider,\" Yashin spent his entire 20-year career at Dynamo Moscow and remains the only goalkeeper in history to win the Ballon d\'Or. He played 812 matches in his career, reportedly saving over 150 penalties and keeping 270 clean sheets. He won the European Nations\' Cup and an Olympic Gold Medal. Known for his imposing presence, revolutionary command of the penalty area, and acrobatic reflex saves, he is widely regarded as the greatest goalkeeper in the history of football.',NULL,'/img/players/lev_yashin.png',NULL,NULL,NULL,NULL,NULL,NULL,'GK','HIGH','HIGH','HIGH'),(76,'Zlatan Ibrahimovic','retired','Zlatan Ibrahimović is a Swedish former professional footballer, born 3 October 1981, who played as a striker for Ajax, Juventus, Inter Milan, Barcelona, AC Milan, PSG, and Manchester United. Ibrahimović is one of the most decorated active-era players, having won trophies in almost every league he played in across a 24-year career. He played 988 matches in his career, scoring 573 goals and assisting 226 times. He has won 34 trophies, including multiple league titles in Italy, France, and Spain. Known for his acrobatic strikes, immense physical strength, and outspoken personality, he is widely regarded as one of the most unique and clinical strikers of the 21st century.',44,'/img/players/zlatan_ibrahimovic','ICON','HIGH','MEDIUM','LOW','LOW','MEDIUM','ST',NULL,NULL,NULL),(77,'Gianluigi Buffon','retired','Gianluigi Buffon is an Italian former professional footballer, born 28 January 1978, who played as a goalkeeper for Juventus, Parma, and the Italy national team. Buffon’s career spanned nearly three decades, including 17 legendary seasons at Juventus where he served as captain. He played 1,151 matches in his career, the most by any Italian player, keeping over 500 clean sheets. He has won the FIFA World Cup, ten Serie A titles, and the UEFA Cup. Known for his leadership, incredible longevity, and world-class positioning, he is widely regarded as one of the greatest goalkeepers to ever play the game, remaining at the top level until the age of 45.',48,'/img/players/gianluigi_buffon.png','ICON',NULL,NULL,NULL,NULL,NULL,'GK','MEDIUM','HIGH','HIGH'),(78,'Andre Onana','active','André Onana Onana is a Cameroonian professional footballer, born 2 April 1996, who plays as a goalkeeper for Premier League club Manchester United and the Cameroon national team. Onana started his career at Barcelona’s youth academy before rising to prominence at Ajax and Inter Milan, eventually reuniting with Erik ten Hag in England. He has played 442 matches in his career, keeping 168 clean sheets. He has won the Serie A, the Eredivisie three times, and the FA Cup, as well as reaching a UEFA Champions League final. Known for his exceptional ball distribution, bravery in sweeping, and shot-stopping reflexes, he is widely regarded as one of the best modern \"playmaking\" goalkeepers in the world.',30,'/img/players/andre_onana','AVERAGE',NULL,NULL,NULL,NULL,NULL,'GK','LOW','LOW','LOW'),(79,'Lisandro Martinez','active','Lisandro Martínez is an Argentine professional footballer, born 18 January 1998, who plays as a centre-back for Premier League club Manchester United and the Argentina national team. \"Licha\" started his career in Argentina with Newell\'s Old Boys and Defensa y Justicia before becoming a fan favorite at Ajax and Manchester United. He has played 346 matches in his career, scoring 11 goals and assisting 9 times. He has won the FIFA World Cup, the Copa América, the Eredivisie twice, and the FA Cup. Known for his aggressive tackling, elite passing ability, and reading of the game, he is widely regarded as one of the best ball-playing defenders in the world despite his height.',28,'/img/players/lisandro_martinez.png','GOOD','LOW','MEDIUM','HIGH','MEDIUM','MEDIUM','CB',NULL,NULL,NULL),(80,'Pape Gueye','active','Pape Alassane Gueye is a Senegalese professional footballer, born 24 January 1999, who plays as a defensive midfielder for La Liga club Villarreal and the Senegal national team. Gueye started his career at Le Havre and spent several years at Marseille, including a loan spell at Sevilla, before making a permanent move to Spain. He has played 268 matches in his career, scoring 12 goals and assisting 10 times. He has won the Africa Cup of Nations and the UEFA Europa League. Known for his physical presence, defensive discipline, and ability to break up play, he is widely regarded as a vital midfield anchor for both club and country.',27,'/img/players/pape_gueye.png','AVERAGE','LOW','LOW','MEDIUM','MEDIUM','MEDIUM','CDM',NULL,NULL,NULL),(81,'Patrik Schick','active','Patrik Schick is a Czech professional footballer, born 24 January 1996, who plays as a striker for Bundesliga club Bayer Leverkusen and the Czech Republic national team. Schick started his career at Sparta Prague and played for Sampdoria, Roma, and RB Leipzig before finding his most prolific form at Leverkusen. He has played 362 matches in his career, scoring 138 goals and assisting 34 times. He has won the Bundesliga and the DFB-Pokal, and was the joint-top scorer at UEFA Euro 2020. Known for his technical elegance, aerial strength, and ability to score spectacular goals, he is widely regarded as one of the most dangerous and versatile forwards in European football.',30,'/img/players/patrik_schick','AVERAGE','MEDIUM','LOW','LOW','MEDIUM','MEDIUM','ST',NULL,NULL,NULL),(82,'Hugo Larsson','active','Hugo Emanuel Larsson is a Swedish professional footballer, born 27 June 2004, who plays as a central midfielder for Bundesliga club Eintracht Frankfurt and the Sweden national team. Larsson started his career at Malmö FF where he became the record sale for a Swedish league player upon moving to Germany in 2023. He has played 148 matches in his career, scoring 11 goals and assisting 15 times. He has won the Allsvenskan and the Svenska Cupen. Known for his composure beyond his years, immense running power, and tactical maturity, he is widely regarded as one of the brightest young midfield prospects in Europe, consistently attracting interest from the world\'s biggest clubs.',21,'/img/players/hugo_larsson.png','AVERAGE','LOW','MEDIUM','LOW','MEDIUM','MEDIUM','CM',NULL,NULL,NULL);
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

-- Dump completed on 2026-04-16 22:03:00
