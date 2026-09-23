/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.4.13-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: realnhi_neotech
-- ------------------------------------------------------
-- Server version	11.4.13-MariaDB-cll-lve

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES
(1,'Can add پست',4,'add_post'),
(2,'Can change پست',4,'change_post'),
(3,'Can delete پست',4,'delete_post'),
(4,'Can view پست',4,'view_post'),
(5,'Can add تیکت',5,'add_ticket'),
(6,'Can change تیکت',5,'change_ticket'),
(7,'Can delete تیکت',5,'delete_ticket'),
(8,'Can view تیکت',5,'view_ticket'),
(9,'Can add کامنت',2,'add_comment'),
(10,'Can change کامنت',2,'change_comment'),
(11,'Can delete کامنت',2,'delete_comment'),
(12,'Can view کامنت',2,'view_comment'),
(13,'Can add تصویر',3,'add_image'),
(14,'Can change تصویر',3,'change_image'),
(15,'Can delete تصویر',3,'delete_image'),
(16,'Can view تصویر',3,'view_image'),
(17,'Can add اکانت',1,'add_account'),
(18,'Can change اکانت',1,'change_account'),
(19,'Can delete اکانت',1,'delete_account'),
(20,'Can view اکانت',1,'view_account'),
(21,'Can add log entry',6,'add_logentry'),
(22,'Can change log entry',6,'change_logentry'),
(23,'Can delete log entry',6,'delete_logentry'),
(24,'Can view log entry',6,'view_logentry'),
(25,'Can add permission',8,'add_permission'),
(26,'Can change permission',8,'change_permission'),
(27,'Can delete permission',8,'delete_permission'),
(28,'Can view permission',8,'view_permission'),
(29,'Can add group',7,'add_group'),
(30,'Can change group',7,'change_group'),
(31,'Can delete group',7,'delete_group'),
(32,'Can view group',7,'view_group'),
(33,'Can add user',9,'add_user'),
(34,'Can change user',9,'change_user'),
(35,'Can delete user',9,'delete_user'),
(36,'Can view user',9,'view_user'),
(37,'Can add content type',10,'add_contenttype'),
(38,'Can change content type',10,'change_contenttype'),
(39,'Can delete content type',10,'delete_contenttype'),
(40,'Can view content type',10,'view_contenttype'),
(41,'Can add session',11,'add_session'),
(42,'Can change session',11,'change_session'),
(43,'Can delete session',11,'delete_session'),
(44,'Can view session',11,'view_session');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES
(1,'pbkdf2_sha256$1500000$p5Nl8uzOwMpP32Lg4Lg1qv$GPMm5ESa6lb/2ThJe0/iMuYdawfSmKCphvYDyqBhNrk=','2026-09-22 21:28:46.738753',1,'mahdibakhshi','مهدی','بخشی','mahdibakhshii2004@gmail.com',1,1,'2026-09-20 13:36:04.000000');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_account`
--

DROP TABLE IF EXISTS `blog_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_account` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date_of_birth` date DEFAULT NULL,
  `bio` longtext DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `job` varchar(250) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `blog_account_user_id_81a28a2a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_account`
--

LOCK TABLES `blog_account` WRITE;
/*!40000 ALTER TABLE `blog_account` DISABLE KEYS */;
INSERT INTO `blog_account` VALUES
(2,'2004-07-10','مهدی بخشی هستم : مدیر مسئول نشریه نئوتک','account_images/IMG_20260917_145326_8071.png','دانشجو',1,1);
/*!40000 ALTER TABLE `blog_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_comment`
--

DROP TABLE IF EXISTS `blog_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `body` longtext NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `post_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_comment_post_id_580e96ef_fk_blog_post_id` (`post_id`),
  KEY `blog_commen_created_0e6ed4_idx` (`created`),
  CONSTRAINT `blog_comment_post_id_580e96ef_fk_blog_post_id` FOREIGN KEY (`post_id`) REFERENCES `blog_post` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_comment`
--

LOCK TABLES `blog_comment` WRITE;
/*!40000 ALTER TABLE `blog_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_image`
--

DROP TABLE IF EXISTS `blog_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_image` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `image_file` varchar(100) NOT NULL,
  `title` varchar(250) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `created` datetime(6) NOT NULL,
  `post_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_image_post_id_f0fc4833_fk_blog_post_id` (`post_id`),
  KEY `blog_image_created_1ba45b_idx` (`created`),
  CONSTRAINT `blog_image_post_id_f0fc4833_fk_blog_post_id` FOREIGN KEY (`post_id`) REFERENCES `blog_post` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_image`
--

LOCK TABLES `blog_image` WRITE;
/*!40000 ALTER TABLE `blog_image` DISABLE KEYS */;
INSERT INTO `blog_image` VALUES
(4,'post_images/c3.png',NULL,'','2026-09-20 17:52:33.684823',4),
(5,'post_images/IMG_20260824_232929_1591.png',NULL,NULL,'2026-09-20 21:01:13.687214',5),
(6,'post_images/523658c6-59f0-4d41-a398-48e26b7f91b4.png',NULL,NULL,'2026-09-20 21:18:56.357498',6);
/*!40000 ALTER TABLE `blog_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_post`
--

DROP TABLE IF EXISTS `blog_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_post` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(250) NOT NULL,
  `description` longtext NOT NULL,
  `slug` varchar(250) NOT NULL,
  `publish` datetime(6) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `status` varchar(2) NOT NULL,
  `author_id` int(11) NOT NULL,
  `reading_time` int(10) unsigned NOT NULL CHECK (`reading_time` >= 0),
  `category` varchar(20) NOT NULL,
  `attachment` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_post_author_id_dd7a8485_fk_auth_user_id` (`author_id`),
  KEY `blog_post_slug_b95473f2` (`slug`),
  KEY `blog_post_publish_bb7600_idx` (`publish` DESC),
  CONSTRAINT `blog_post_author_id_dd7a8485_fk_auth_user_id` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_post`
--

LOCK TABLES `blog_post` WRITE;
/*!40000 ALTER TABLE `blog_post` DISABLE KEYS */;
INSERT INTO `blog_post` VALUES
(4,'چرا کامپیوتر؟','چرا کامپیوتر؟\r\nاولین پادکست نئوتک با یک سؤال ساده آغاز می‌شود:\r\nچرا کامپیوتر؟\r\nدر این گفت‌وگو تلاش می‌کنیم فراتر از پاسخ‌های معمولی مثل بازار کار و آینده فناوری، به این سؤال نگاه کنیم که کامپیوتر چه چیزی به ما می‌دهد و چرا یادگیری آن اهمیت دارد.\r\n \r\nکامپیوتر چیست؟\r\nدر پادکست درباره گستردگی دنیای کامپیوتر صحبت می‌کنیم؛ از سخت‌افزار و نرم‌افزار گرفته تا شبکه، امنیت، پایگاه داده و هوش مصنوعی. کامپیوتر دیگر فقط یک دستگاه نیست و تقریباً در تمام صنایع و بخش‌های زندگی حضور دارد.\r\n \r\nکامپیوتر؛ فقط برنامه‌نویسی نیست\r\nیکی از موضوعات اصلی، حل مسئله و تفکر محاسباتی (Computational Thinking) است. درباره تحلیل و تجزیه مسائل، طراحی الگوریتم و اهمیت پیچیدگی زمانی صحبت می‌کنیم و نشان می‌دهیم که علوم کامپیوتر فراتر از صرفاً کدنویسی است\r\n.\r\nمسیرهای مختلف کامپیوتر\r\nدر ادامه به حوزه‌هایی مانند شبکه، امنیت سایبری، داده، یادگیری ماشین، معماری کامپیوتر و هوش مصنوعی می‌پردازیم و این سؤال را بررسی می‌کنیم که آیا نداشتن علاقه به برنامه‌نویسی به معنی مناسب نبودن رشته کامپیوتر است یا خیر.\r\n \r\nکامپیوتر در دنیای واقعی\r\nاز نقش کامپیوتر در بانکداری، پزشکی، صنعت، حمل‌ونقل و سرگرمی صحبت می‌کنیم و در کنار قدرت فناوری، موضوعاتی مانند حریم خصوصی، امنیت اطلاعات و مسئولیت استفاده از داده‌ها را نیز بررسی می‌کنیم.\r\n \r\nدانشگاه و آینده دانشجویان\r\nبخش دیگری از پادکست به نقش دانشگاه و اهمیت یادگیری مفاهیم پایه مانند الگوریتم، ساختمان داده، شبکه، سیستم‌عامل و پایگاه داده اختصاص دارد. همچنین بر پروژه، تمرین، تجربه واقعی و یادگیری مداوم تأکید می‌شود.\r\n \r\nپس چرا کامپیوتر؟\r\nدر پایان به این نتیجه می‌رسیم که کامپیوتر فقط یک ابزار فنی نیست؛ بلکه راهی برای فکر کردن، حل مسئله و تبدیل ایده به واقعیت است. شاید مهم‌ترین سؤال بعد از شنیدن این پادکست دیگر «چرا کامپیوتر؟» نباشد، بلکه این باشد:\r\n \r\nمن با کامپیوتر، چه چیزی می‌توانم بسازم؟\r\n\r\n[لینک ویدیو در یوتیوب](https://youtu.be/vO-5_ANOKAs)\r\n[لینک ویدیو در آپارات](https://www.aparat.com/v/dbvrja9)\r\n[لینک ساندکلاود](https://soundcloud.com/realneotech/radioneoteche1?si=fadbdcf130da4ab7a9c5e6b42e7811c1&utm_source=clipboard&utm_medium=text&utm_campaign=social_sharing)\r\n[لینک ویدیو در تلگرام](https://t.me/realneotech/98)','why-computer-1','2026-09-20 17:34:23.000000','2026-09-20 17:34:23.601052','2026-09-20 22:56:54.898827','PB',1,20,'پادکست',''),
(5,'گفت‌وگو با دکتر بابک نوری مقدم؛ از مسیر ورود به کامپیوتر تا آینده هوش مصنوعی','در این گفت‌وگوی اختصاصی با دکتر بابک نوری مقدم، عضو هیئت علمی دانشگاه آزاد اسلامی و فعال حوزه هوش مصنوعی و یادگیری ماشین، درباره مسیر تحصیلی و حرفه‌ای، تحولات فناوری و آینده مهندسی کامپیوتر به گفت‌وگو پرداختیم. این مصاحبه علاوه بر جنبه‌های تخصصی، شامل تجربه‌ها و توصیه‌هایی برای دانشجویان و علاقه‌مندان به این حوزه بود.\r\nمسیر ورود به دنیای کامپیوتر\r\nدکتر نوری مقدم از علاقه خود به فناوری از دوران کودکی و نخستین تجربه‌هایش با کامپیوتر گفت و توضیح داد که چگونه این علاقه در طول سال‌های تحصیل ادامه پیدا کرد. همچنین درباره انتخاب رشته کامپیوتر و آزادی عمل و تنوع مسیرهای شغلی در این رشته صحبت شد.\r\nچرا هوش مصنوعی؟\r\nیکی از بخش‌های مهم مصاحبه، مسیر حرکت ایشان از حوزه‌های شبکه و امنیت به سمت یادگیری ماشین و هوش مصنوعی بود. او از تأثیر تحصیلات تکمیلی و فعالیت‌های پژوهشی در این تغییر مسیر گفت و هوش مصنوعی را یکی از مهم‌ترین حوزه‌های آینده کامپیوتر دانست.\r\nآینده هوش مصنوعی و AGI\r\nدر ادامه درباره تحولات پیش‌روی هوش مصنوعی، افزایش توان پردازشی و توسعه مدل‌های قدرتمندتر صحبت شد. همچنین مفهوم هوش مصنوعی عمومی یا AGI و تفاوت آن با مدل‌های فعلی مورد بحث قرار گرفت.\r\nهوش مصنوعی و آینده بازار کار\r\nتأثیر AI بر مشاغل حوزه کامپیوتر از موضوعات اصلی این گفت‌وگو بود. دکتر نوری مقدم معتقد است بسیاری از مشاغل لزوماً از بین نمی‌روند، بلکه ماهیت آن‌ها تغییر می‌کند؛ از جمله حرکت از «برنامه‌نویس» به سمت «مهندس نرم‌افزار» و افزایش اهمیت طراحی، مدیریت و درک ساختار نرم‌افزار.\r\nچگونه دانشجویان از هوش مصنوعی استفاده کنند؟\r\nیکی از موضوعات مهم مصاحبه، نگرانی درباره وابستگی دانشجویان به ابزارهای هوش مصنوعی بود. پیشنهاد ایشان این است که AI به‌عنوان یک استاد مکمل مورد استفاده قرار گیرد؛ یعنی دانشجو ابتدا یاد بگیرد، مطالعه کند و جست‌وجو انجام دهد و سپس از هوش مصنوعی برای تکمیل یادگیری خود کمک بگیرد.\r\nچالش‌های دانشجویان و اهمیت کنجکاوی\r\nاز نگاه دکتر نوری مقدم، یکی از مشکلات دانشجویان این است که گاهی بدون تجربه‌کردن حوزه‌های مختلف، دیر به دنبال پیدا کردن مسیر تخصصی خود می‌روند. او توصیه کرد دانشجویان در سال‌های ابتدایی، حوزه‌های مختلف مانند شبکه، برنامه‌نویسی، وب، سخت‌افزار و رباتیک را تجربه کنند تا علایق و توانایی‌های خود را بهتر بشناسند.\r\nپژوهش، کار تیمی و مهارت‌های نرم\r\nوضعیت پژوهش در حوزه کامپیوتر، ضرورت یادگیری پایه‌ها پیش از ورود جدی به Research، اهمیت کار تیمی و تجربه شخصی دکتر نوری مقدم از چالش‌های همکاری در پروژه‌ها و استارتاپ‌ها نیز از دیگر موضوعات مطرح‌شده در این مصاحبه بود.\r\nیک توصیه برای آینده\r\nدر پایان، دکتر نوری مقدم بر اهمیت «تلاش، پشتکار و تعهد» تأکید کرد و موفقیت را نتیجه ادامه‌دادن مسیر حتی پس از شکست‌های متعدد دانست. او همچنین یادگیری زبان دوم و توانایی استفاده از مدل‌های هوش مصنوعی را از مهارت‌های مهم برای آینده معرفی کرد.\r\n\r\n[لینک آپارات پارت یک](https://aparat.com/v/zht8pmq)\r\n[لینک آپارات پارت دو](https://www.aparat.com/v/vjsp330)\r\n[لینک یوتیوب پارت یک](https://youtu.be/wPvA18vEAWc)\r\n[لینک یوتیوب پارت دو](https://youtu.be/qG-ZefMx57g)','','2026-09-20 21:01:12.815730','2026-09-20 21:01:12.850786','2026-09-20 22:57:09.599870','PB',1,60,'مصاحبه',''),
(6,'شماره یک | تابستان 1405','گاهی یک ایده، فقط یک ایده نمی‌ماند؛\r\nتبدیل می‌شود به ساعت‌ها فکر کردن، یاد گرفتن، ساختن و کنار هم قرار دادن آدم‌هایی که به آینده باور دارند.\r\n\r\nنئوتک برای ما دقیقاً از همین‌جا شروع شد؛\r\nاز یک ایده کوچک برای ساختن فضایی متفاوت،\r\nبرای گفتن از دنیای کامپیوتر و فناوری،\r\nو برای اینکه صدای دانشجوهایی باشد که می‌خواهند چیزی را یاد بگیرند، تجربه کنند و خلق کنند.\r\n\r\nامروز با افتخار، اولین شماره نئوتک منتشر شد. 💙\r\n\r\nاین فقط یک نشریه نیست؛\r\nاولین قدم ما در مسیری است که امیدواریم شماره‌های بیشتری از آن ساخته شود،\r\nایده‌های بیشتری در آن شکل بگیرد\r\nو آدم‌های بیشتری در این مسیر همراه ما شوند.\r\n\r\nبه نئوتک خوش آمدید؛\r\nجایی برای ایده‌هایی که قرار است به آینده برسند.','1405','2026-09-20 21:18:55.638118','2026-09-20 21:18:55.674259','2026-09-20 21:19:10.629728','PB',1,10,'سایر','');
/*!40000 ALTER TABLE `blog_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_ticket`
--

DROP TABLE IF EXISTS `blog_ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_ticket` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `message` longtext NOT NULL,
  `name` varchar(250) NOT NULL,
  `email` varchar(254) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `subject` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_ticket`
--

LOCK TABLES `blog_ticket` WRITE;
/*!40000 ALTER TABLE `blog_ticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES
(1,'2026-09-20 17:14:19.623082','1','alimmdsrn (فعال)',1,'[{\"added\": {}}]',1,1),
(2,'2026-09-20 17:14:53.252591','1','alimmdsrn',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\"]}}]',9,1),
(3,'2026-09-20 17:16:19.232783','2','چرا کامپیوتر؟',3,'',4,1),
(4,'2026-09-20 17:16:24.378881','1','چرا کامپیوتر؟',2,'[{\"changed\": {\"fields\": [\"\\u0648\\u0636\\u0639\\u06cc\\u062a \\u067e\\u0633\\u062a\"]}}]',4,1),
(5,'2026-09-20 17:19:23.219366','1','چرا کامپیوتر؟',3,'',4,1),
(6,'2026-09-20 17:20:20.107465','1','alimmdsrn (فعال)',3,'',1,1),
(7,'2026-09-20 17:21:12.280488','2','alimmdsrn (فعال)',1,'[{\"added\": {}}]',1,1),
(8,'2026-09-20 17:21:26.271136','2','alimmdsrn (فعال)',2,'[{\"changed\": {\"fields\": [\"\\u062a\\u0635\\u0648\\u06cc\\u0631\"]}}]',1,1),
(9,'2026-09-20 17:21:36.580949','3','چرا کامپیوتر؟',2,'[{\"changed\": {\"fields\": [\"\\u0648\\u0636\\u0639\\u06cc\\u062a \\u067e\\u0633\\u062a\"]}}]',4,1),
(10,'2026-09-20 17:30:05.932705','2','alimmdsrn (فعال)',2,'[{\"changed\": {\"fields\": [\"\\u062a\\u0635\\u0648\\u06cc\\u0631\"]}}]',1,1),
(11,'2026-09-20 17:30:18.522929','2','alimmdsrn (فعال)',2,'[{\"changed\": {\"fields\": [\"\\u062a\\u0635\\u0648\\u06cc\\u0631\"]}}]',1,1),
(12,'2026-09-20 17:33:47.847279','3','چرا کامپیوتر؟',3,'',4,1),
(13,'2026-09-20 17:34:53.924205','4','چرا کامپیوتر؟',2,'[{\"changed\": {\"fields\": [\"\\u0648\\u0636\\u0639\\u06cc\\u062a \\u067e\\u0633\\u062a\"]}}]',4,1),
(14,'2026-09-20 17:36:24.326748','1','رضا: چرا کامپیوتر؟',2,'[{\"changed\": {\"fields\": [\"\\u0627\\u06a9\\u062a\\u06cc\\u0648\"]}}]',2,1),
(15,'2026-09-20 17:38:21.891461','2','حسن: چرا کامپیوتر؟',2,'[{\"changed\": {\"fields\": [\"\\u0627\\u06a9\\u062a\\u06cc\\u0648\"]}}]',2,1),
(16,'2026-09-20 17:38:36.284072','2','انتقاد',3,'',5,1),
(17,'2026-09-20 17:38:41.921593','1','گزارش',3,'',5,1),
(18,'2026-09-20 17:38:50.602345','1','رضا: چرا کامپیوتر؟',3,'',2,1),
(19,'2026-09-20 17:38:50.602375','2','حسن: چرا کامپیوتر؟',3,'',2,1),
(20,'2026-09-20 17:43:08.221635','4','چرا کامپیوتر؟',2,'[{\"changed\": {\"fields\": [\"\\u0627\\u0633\\u0644\\u0627\\u06af\", \"\\u062a\\u0627\\u0631\\u06cc\\u062e \\u0627\\u0646\\u062a\\u0634\\u0627\\u0631\"]}}]',4,1),
(21,'2026-09-20 17:44:18.453664','1','alimmdsrn',2,'[{\"changed\": {\"fields\": [\"password\"]}}]',9,1),
(22,'2026-09-20 17:44:52.482847','1','mahdibakhshi',2,'[{\"changed\": {\"fields\": [\"Username\", \"First name\", \"Last name\", \"Email address\"]}}]',9,1),
(23,'2026-09-20 17:46:16.012402','2','mahdibakhshi (فعال)',2,'[{\"changed\": {\"fields\": [\"\\u0628\\u0627\\u06cc\\u0648\", \"\\u062a\\u0635\\u0648\\u06cc\\u0631\", \"\\u0634\\u063a\\u0644\"]}}]',1,1),
(24,'2026-09-20 17:46:30.817676','2','mahdibakhshi (فعال)',2,'[{\"changed\": {\"fields\": [\"\\u062a\\u0635\\u0648\\u06cc\\u0631\"]}}]',1,1),
(25,'2026-09-20 19:18:16.302555','2','mahdibakhshi (فعال)',2,'[{\"changed\": {\"fields\": [\"\\u062a\\u0627\\u0631\\u06cc\\u062e \\u062a\\u0648\\u0644\\u062f\", \"\\u0628\\u0627\\u06cc\\u0648\", \"\\u062a\\u0635\\u0648\\u06cc\\u0631\"]}}]',1,1),
(26,'2026-09-20 19:21:31.185354','4','چرا کامپیوتر؟',2,'[{\"changed\": {\"fields\": [\"\\u062f\\u0633\\u062a\\u0647 \\u0628\\u0646\\u062f\\u06cc\"]}}, {\"changed\": {\"name\": \"\\u062a\\u0635\\u0648\\u06cc\\u0631\", \"object\": \"None\", \"fields\": [\"Image file\"]}}]',4,1),
(27,'2026-09-20 19:56:51.174800','4','چرا کامپیوتر؟',2,'[{\"changed\": {\"name\": \"\\u062a\\u0635\\u0648\\u06cc\\u0631\", \"object\": \"None\", \"fields\": [\"Image file\"]}}]',4,1),
(28,'2026-09-20 21:02:28.428963','5','گفت‌وگو با دکتر بابک نوری مقدم؛ از مسیر ورود به کامپیوتر تا آینده هوش مصنوعی',2,'[{\"changed\": {\"fields\": [\"\\u0648\\u0636\\u0639\\u06cc\\u062a \\u067e\\u0633\\u062a\"]}}]',4,1),
(29,'2026-09-20 21:19:10.631267','6','شماره یک | تابستان 1405',2,'[{\"changed\": {\"fields\": [\"\\u0648\\u0636\\u0639\\u06cc\\u062a \\u067e\\u0633\\u062a\"]}}]',4,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES
(6,'admin','logentry'),
(7,'auth','group'),
(8,'auth','permission'),
(9,'auth','user'),
(1,'blog','account'),
(2,'blog','comment'),
(3,'blog','image'),
(4,'blog','post'),
(5,'blog','ticket'),
(10,'contenttypes','contenttype'),
(11,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES
(1,'contenttypes','0001_initial','2026-09-20 13:27:00.701864'),
(2,'auth','0001_initial','2026-09-20 13:27:00.889259'),
(3,'admin','0001_initial','2026-09-20 13:27:00.967604'),
(4,'admin','0002_logentry_remove_auto_add','2026-09-20 13:27:00.972155'),
(5,'admin','0003_logentry_add_action_flag_choices','2026-09-20 13:27:00.976589'),
(6,'contenttypes','0002_remove_content_type_name','2026-09-20 13:27:01.029470'),
(7,'auth','0002_alter_permission_name_max_length','2026-09-20 13:27:01.046418'),
(8,'auth','0003_alter_user_email_max_length','2026-09-20 13:27:01.058824'),
(9,'auth','0004_alter_user_username_opts','2026-09-20 13:27:01.062935'),
(10,'auth','0005_alter_user_last_login_null','2026-09-20 13:27:01.082540'),
(11,'auth','0006_require_contenttypes_0002','2026-09-20 13:27:01.083015'),
(12,'auth','0007_alter_validators_add_error_messages','2026-09-20 13:27:01.086896'),
(13,'auth','0008_alter_user_username_max_length','2026-09-20 13:27:01.099209'),
(14,'auth','0009_alter_user_last_name_max_length','2026-09-20 13:27:01.110964'),
(15,'auth','0010_alter_group_name_max_length','2026-09-20 13:27:01.123069'),
(16,'auth','0011_update_proxy_permissions','2026-09-20 13:27:01.127296'),
(17,'auth','0012_alter_user_first_name_max_length','2026-09-20 13:27:01.138687'),
(18,'blog','0001_initial','2026-09-20 13:27:01.180956'),
(19,'blog','0002_alter_post_options_alter_post_author_and_more','2026-09-20 13:27:01.219572'),
(20,'blog','0003_ticket','2026-09-20 13:27:01.226550'),
(21,'blog','0004_alter_ticket_options_comment','2026-09-20 13:27:01.261429'),
(22,'blog','0005_post_reading_time_alter_comment_active_and_more','2026-09-20 13:27:01.291953'),
(23,'blog','0006_alter_comment_created_alter_comment_updated_and_more','2026-09-20 13:27:01.316004'),
(24,'blog','0007_alter_comment_created_alter_comment_updated_and_more','2026-09-20 13:27:01.335858'),
(25,'blog','0008_image','2026-09-20 13:27:01.371359'),
(26,'blog','0009_alter_image_image_file_alter_image_post','2026-09-20 13:27:01.383798'),
(27,'blog','0010_post_category_alter_post_status','2026-09-20 13:27:01.410992'),
(28,'blog','0011_account','2026-09-20 13:27:01.439185'),
(29,'blog','0012_alter_comment_body_alter_comment_name_and_more','2026-09-20 13:27:01.460601'),
(30,'blog','0013_alter_image_created','2026-09-20 13:27:01.465038'),
(31,'blog','0014_alter_post_status','2026-09-20 13:27:01.471241'),
(32,'blog','0015_alter_post_options_and_more','2026-09-20 13:27:01.514729'),
(33,'blog','0016_alter_post_options_and_more','2026-09-20 13:27:01.554689'),
(34,'blog','0017_account_is_active','2026-09-20 13:27:01.578153'),
(35,'blog','0018_alter_post_category','2026-09-20 13:27:01.584266'),
(36,'blog','0019_post_attachment','2026-09-20 13:27:01.599812'),
(37,'sessions','0001_initial','2026-09-20 13:27:01.618286'),
(38,'blog','0020_alter_image_image_file','2026-09-20 19:53:26.893315');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES
('41a63gdujyqq422wsubm4lrg0h9zwj8s','.eJxVjEEOwiAQRe_C2hCgAw4u3XsGwjAgVUOT0q6Md7dNutDtf-_9twhxXWpYe57DyOIitDj9bhTTM7cd8CO2-yTT1JZ5JLkr8qBd3ibOr-vh_h3U2OtW--K8j8QIg3PgdNIlITmwWqNF51mfURmMTGSSyThY2LCywLYo9iA-X8UfNv0:1x8JYu:zzBHJlyGss2z2DZpWa6EcStN4hdzyGK9ryI7eNwhOsQ','2026-10-04 19:04:40.539374'),
('81lvrp7sjnp3hpkjp9vbzp20485iuqly','.eJxVjEEOwiAQRe_C2hCgAw4u3XsGwjAgVUOT0q6Md7dNutDtf-_9twhxXWpYe57DyOIitDj9bhTTM7cd8CO2-yTT1JZ5JLkr8qBd3ibOr-vh_h3U2OtW--K8j8QIg3PgdNIlITmwWqNF51mfURmMTGSSyThY2LCywLYo9iA-X8UfNv0:1x94lS:-zBbqVYH7s9xeTSfUj939anu7bGQ_Ila04XJ5dpnung','2026-10-06 21:28:46.740086');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2026-09-23 13:07:44
