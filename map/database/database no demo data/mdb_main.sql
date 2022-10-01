-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 15, 2021 at 04:16 PM
-- Server version: 8.0.21
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mdb_main2`
--

-- --------------------------------------------------------

--
-- Table structure for table `bodypart`
--

DROP TABLE IF EXISTS `bodypart`;
CREATE TABLE IF NOT EXISTS `bodypart` (
  `body_code` int NOT NULL COMMENT 'Store body part unique code',
  `body_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Store body party name',
  PRIMARY KEY (`body_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bodypart`
--

INSERT INTO `bodypart` (`body_code`, `body_name`) VALUES
(-99, 'No data'),
(1, 'Intact'),
(2, 'Carcass'),
(3, 'Abdomen'),
(4, 'Head/Thorax'),
(5, 'Legs'),
(6, 'DNA'),
(7, 'Midgut (MG) homogenate'),
(8, 'Head/Thorax (HT) homogenate'),
(9, 'Midgut '),
(10, 'Ovaries'),
(11, 'Spermathecae'),
(12, 'Salivary glands'),
(13, 'Eggs'),
(14, 'Lipids/sugar/glycogen supernat'),
(15, 'Blood meal'),
(16, 'Larvae'),
(17, 'L1'),
(18, 'L2'),
(19, 'L3'),
(20, 'L4'),
(21, 'L1&L2'),
(22, 'L3&L4'),
(23, 'Pupae'),
(101, '<? echo $_POST[');

-- --------------------------------------------------------

--
-- Table structure for table `custed`
--

DROP TABLE IF EXISTS `custed`;
CREATE TABLE IF NOT EXISTS `custed` (
  `pc` int NOT NULL COMMENT 'Hold data which is auto increment links to ProjectReg',
  `ft` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Hold type of the form which submitted',
  `num_split` int NOT NULL COMMENT 'Hold number of split of value ',
  `p_attri` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Hold data for column selected ',
  `p_attri2` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`pc`,`ft`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custgraph`
--

DROP TABLE IF EXISTS `custgraph`;
CREATE TABLE IF NOT EXISTS `custgraph` (
  `pc` int NOT NULL AUTO_INCREMENT,
  `location` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `num_split` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `p_attri` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `p_attri2` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`pc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custso`
--

DROP TABLE IF EXISTS `custso`;
CREATE TABLE IF NOT EXISTS `custso` (
  `pc` int NOT NULL,
  `ft` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `num_split` int NOT NULL,
  `p_attri` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `p_attri2` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`pc`,`ft`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custss`
--

DROP TABLE IF EXISTS `custss`;
CREATE TABLE IF NOT EXISTS `custss` (
  `pc` int NOT NULL COMMENT 'Hold data which is auto increment links to ProjectReg',
  `ft` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Hold type of the form which submitted',
  `num_split` int NOT NULL COMMENT 'Hold number of split of value ',
  `p_attri` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Hold data for column selected ',
  `p_attri2` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`pc`,`ft`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custst`
--

DROP TABLE IF EXISTS `custst`;
CREATE TABLE IF NOT EXISTS `custst` (
  `pc` int NOT NULL COMMENT 'Hold data which is auto increment links to ProjectReg',
  `ft` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Hold type of the form which submitted',
  `num_split` int NOT NULL COMMENT 'Hold number of split of value ',
  `p_attri` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Hold data for column selected ',
  `p_attri2` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`pc`,`ft`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `grantproject`
--

DROP TABLE IF EXISTS `grantproject`;
CREATE TABLE IF NOT EXISTS `grantproject` (
  `pid` int NOT NULL COMMENT 'Store project identification number',
  `staff_id` int NOT NULL COMMENT 'Hold staff identification number',
  `created_by` int NOT NULL COMMENT 'Hold staff identification number which show who insert this data',
  `datecreated` datetime NOT NULL COMMENT 'Hold date time at time this data inserted into a system',
  PRIMARY KEY (`pid`,`staff_id`),
  KEY `fk_gp_staff_id` (`staff_id`),
  KEY `fk_gp_created_by` (`created_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `habitat`
--

DROP TABLE IF EXISTS `habitat`;
CREATE TABLE IF NOT EXISTS `habitat` (
  `habi_code` int NOT NULL COMMENT 'Store habitat code ',
  `habi_desc` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Store habitat description ',
  PRIMARY KEY (`habi_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `habitat`
--

INSERT INTO `habitat` (`habi_code`, `habi_desc`) VALUES
(-99, 'No data'),
(1, 'Puddles & tire tracks'),
(2, 'Swampy areas'),
(3, 'Mangrove swamp/saltwater marsh'),
(4, 'Drain/ditch'),
(5, 'Construction pit/foundations/m'),
(6, 'Water storage container'),
(7, 'Rice paddy'),
(8, 'Raised bed agriculture'),
(9, 'Other agriculture'),
(10, 'Stream/river bed'),
(11, 'Pond'),
(12, 'Other (describe)');

-- --------------------------------------------------------

--
-- Table structure for table `history_log`
--

DROP TABLE IF EXISTS `history_log`;
CREATE TABLE IF NOT EXISTS `history_log` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `user_name` varchar(50) DEFAULT NULL,
  `action` varchar(100) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
CREATE TABLE IF NOT EXISTS `languages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `language` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang2` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
CREATE TABLE IF NOT EXISTS `location` (
  `id` int NOT NULL,
  `number` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ind` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`id`, `number`, `ind`) VALUES
(1, '1', 'In'),
(2, '2', 'Out');

-- --------------------------------------------------------

--
-- Table structure for table `method`
--

DROP TABLE IF EXISTS `method`;
CREATE TABLE IF NOT EXISTS `method` (
  `meth_code` int NOT NULL COMMENT 'Store methode code',
  `meth_desc` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Store method description',
  `meth_abbre` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Store methode abbreviation',
  PRIMARY KEY (`meth_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `method`
--

INSERT INTO `method` (`meth_code`, `meth_desc`, `meth_abbre`) VALUES
(-99, 'No data', ''),
(1, 'Human landing catch', 'HLC'),
(2, 'Ifakara tent trap', 'ITT'),
(3, 'CDC light trap', 'CDC LT'),
(4, 'Resting box', 'RB'),
(5, 'Existing resting sites', 'ERS'),
(6, 'Floor', 'Floor'),
(7, 'Entry window interception trap', 'Entry window'),
(8, 'Entry eave interception trap', 'Entry eave'),
(9, 'Entry', 'Entry'),
(10, 'Exit window interception trap', 'Exit window'),
(11, 'Exit eave interception trap', 'Exit eave'),
(12, 'Exit', 'Exit'),
(13, 'Dip', 'Dip'),
(14, 'Substrate', 'Sub'),
(15, 'Emergence Trap', 'Em'),
(16, 'Ovitrap', 'Ovi'),
(17, 'Electrocuting Grids', 'EG'),
(18, 'Double Net', 'DN'),
(19, 'Mosquito electric Trap', 'MET'),
(100, 'test method', 'testmethod');

-- --------------------------------------------------------

--
-- Table structure for table `projectreg`
--

DROP TABLE IF EXISTS `projectreg`;
CREATE TABLE IF NOT EXISTS `projectreg` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'This used to link to other Entity',
  `pc` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'hold project code (unique identifier)',
  `expno` int(4) UNSIGNED ZEROFILL NOT NULL COMMENT 'Hold experiment number',
  `pn` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'project name (short descriptive -unlimited letters)',
  `pp` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'project protocol (metadata of the experimental protocol)',
  `eap` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ethics approval number  assigned to the ethical protocol',
  `rsn` int NOT NULL COMMENT 'responsibilities scientist name',
  `pin` int NOT NULL COMMENT 'principal investigator',
  `esd` date DEFAULT NULL COMMENT 'proposed date that collection will commence (yyyy-mm-dd)',
  `efd` date DEFAULT NULL COMMENT 'proposed date that the collection will be completed (yyyy-mm-dd)',
  PRIMARY KEY (`pc`,`expno`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `projectregsite`
--

DROP TABLE IF EXISTS `projectregsite`;
CREATE TABLE IF NOT EXISTS `projectregsite` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Hold data which is auto increment links to ED',
  `site_id` int NOT NULL COMMENT 'hold site code ',
  `projectreg_id` int NOT NULL COMMENT 'Hold identification number from ProjectReg Entity',
  PRIMARY KEY (`site_id`,`projectreg_id`),
  UNIQUE KEY `id` (`id`),
  KEY `fk_projectcode` (`projectreg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `projectshared`
--

DROP TABLE IF EXISTS `projectshared`;
CREATE TABLE IF NOT EXISTS `projectshared` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pid` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `psummary` varchar(9999) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `filename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `count` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
CREATE TABLE IF NOT EXISTS `region` (
  `reg_id` int(5) UNSIGNED ZEROFILL NOT NULL COMMENT 'Store enumeration area of region combine region id and zone id its format is zeno_id+reg_id',
  `reg_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Store region name',
  `zone_id` int(2) UNSIGNED ZEROFILL NOT NULL COMMENT 'Store zone identinfication number',
  PRIMARY KEY (`reg_id`),
  KEY `fk_zone_id` (`zone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `region`
--

INSERT INTO `region` (`reg_id`, `reg_name`, `zone_id`) VALUES
(00114, 'Tabora', 01),
(00202, 'Arusha', 02),
(00203, 'Kilimanjaro', 02),
(00204, 'Tanga', 02),
(00301, 'Dodoma', 03),
(00313, 'Singida', 03),
(00411, 'Iringa', 04),
(00412, 'Mbeya', 04),
(00605, 'Morogoro', 06),
(00606, 'Pwani', 06),
(00607, 'Dar-es-salaam', 06),
(00708, 'Lindi', 07),
(00709, 'Mtwara', 07),
(00710, 'Ruvuma', 07);

-- --------------------------------------------------------

--
-- Table structure for table `sampletype`
--

DROP TABLE IF EXISTS `sampletype`;
CREATE TABLE IF NOT EXISTS `sampletype` (
  `sample_code` int NOT NULL COMMENT 'Store sample code identification',
  `sample_desc` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Store sample description ',
  PRIMARY KEY (`sample_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `organization_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `organization_theme` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `organization_name`, `organization_theme`) VALUES
(1, 'Mosquito Database Management System', '1');

-- --------------------------------------------------------

--
-- Table structure for table `sexabdominal`
--

DROP TABLE IF EXISTS `sexabdominal`;
CREATE TABLE IF NOT EXISTS `sexabdominal` (
  `sex_code` int NOT NULL COMMENT 'Store sex code',
  `sex_desc` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Store sex description',
  PRIMARY KEY (`sex_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sexabdominal`
--

INSERT INTO `sexabdominal` (`sex_code`, `sex_desc`) VALUES
(-99, 'No data'),
(1, 'Total male'),
(2, 'Unfed'),
(3, 'Partly fed'),
(4, 'Fed'),
(5, 'Gravid/semigravid'),
(6, 'Total female'),
(100, 'testabn');

-- --------------------------------------------------------

--
-- Table structure for table `site`
--

DROP TABLE IF EXISTS `site`;
CREATE TABLE IF NOT EXISTS `site` (
  `site_id` int NOT NULL COMMENT 'hold site code (unique identification)',
  `site_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'hold site name',
  PRIMARY KEY (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `site`
--

INSERT INTO `site` (`site_id`, `site_name`) VALUES
(1, 'Dar es salaam (TZ)'),
(2, 'Ifakara (TZ)'),
(3, 'Rufiji (TZ)'),
(4, 'Pwani (TZ)'),
(5, 'Dodoma (TZ)'),
(6, 'Kagera (TZ)'),
(7, 'Unguja (TZ)'),
(8, 'Pemba (TZ)'),
(9, 'Kilombero (TZ)'),
(10, 'Ulanga (TZ)'),
(11, 'Misenyi (TZ)'),
(12, 'Mbogwe (TZ)'),
(13, 'Migori (KE)'),
(14, 'Homa Bay (KE)'),
(15, 'Siaya (KE)'),
(16, 'Serere (UG)'),
(17, 'Amolator (UG)'),
(18, 'Soroti (UG)'),
(19, 'Chikwawa (MW)'),
(20, 'Balaka (MW)'),
(21, 'Salima (MW)'),
(22, 'Burundi (BR)'),
(23, 'Zambia (ZM)'),
(24, 'Rwanda (RW)'),
(25, 'Burkina Faso (BF)');

-- --------------------------------------------------------

--
-- Table structure for table `snail_species`
--

DROP TABLE IF EXISTS `snail_species`;
CREATE TABLE IF NOT EXISTS `snail_species` (
  `species_code` int NOT NULL COMMENT 'Store species code ',
  `species_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Store species name ',
  `species_desc` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'no description' COMMENT 'Store species description '
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `snail_species`
--

INSERT INTO `snail_species` (`species_code`, `species_name`, `species_desc`) VALUES
(1, 'Biomphalari', 'no description'),
(2, 'Bulinus', 'no description');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
CREATE TABLE IF NOT EXISTS `staff` (
  `staff_id` int NOT NULL COMMENT 'Hold ID ',
  `fname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Hold first name of staff',
  `mname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Hold middle name of staff',
  `lname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Hold last name of staff',
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Hold username of staff',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Hold password of staff',
  `status` int NOT NULL COMMENT 'Hold condition of staff if is enable or disable (Enable = 1 Disable = 2)',
  `seculevel` int NOT NULL COMMENT 'Hold security level of staff (1: System Manager, 2: Power User, 3: User)',
  `mobinum` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Hold mobile phone number of a staff',
  `email` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Hold email address of staff',
  `register` int NOT NULL COMMENT 'Hold status of registration of staff (1: Register, 2: Not register)',
  `staff_group` int NOT NULL COMMENT 'Hold staff group refeence from StaffCategory Entity',
  `theme` int NOT NULL DEFAULT '1',
  `valid` tinyint NOT NULL DEFAULT '0',
  `staff_log` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_login` datetime DEFAULT NULL,
  PRIMARY KEY (`staff_id`),
  UNIQUE KEY `username` (`username`),
  KEY `fk_staff_group` (`staff_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`staff_id`, `fname`, `mname`, `lname`, `username`, `password`, `status`, `seculevel`, `mobinum`, `email`, `register`, `staff_group`, `theme`, `valid`, `staff_log`, `Created`, `last_login`) VALUES
(1001, 'Samson', 'Sifael', 'Kiware', 'skiware', '$2y$10$0SpPvA0llpAbDerZpz7mD.u2Efy76Z.dpef/rjEIUY8IazvrMMOuu', 1, 1, '+2551019804553', 'skiware@ihi.or.tz', 1, 1, 1, 1, '', '2015-03-01 09:22:00', '2021-09-15 16:10:06'),
(1003, 'Demo', 'D', 'DemoAccount', 'demo_admin', '$2y$10$UJfzOHHyJzp1sFvymoqk0ODkD9Cdz.xJjmZJUYG602sY5x31of8lm', 1, 2, NULL, 'demo@mosquitodb.io', 1, 1, 1, 1, '', '2021-08-11 13:17:07', '2021-09-12 22:07:59'),
(1008, 'Godlove', 'Thomas', 'Chila', 'gchila@ihi.or.tz', '$2y$10$q7fGzKlkV0z/JwabnUVru.5KzjrfIoiSkiuYaBE4BrlhSJmGwHI56', 1, 3, '0716722304', 'gchila@ihi.or.tz', 1, 1, 1, 1, '1576164626', '2019-12-12 15:30:26', '2021-08-02 10:48:00'),
(1009, 'Ian ', 'Sefineo', 'Mwelwa', 'Mwelwa', '$2y$10$75gIUtE6nX.7dRNm0tKL/.WzgWRbmaa3MJzCXL9PEORdcJFj7tBZK', 1, 2, '0979935838', 'ianmwelwa@gmail.com', 1, 1, 1, 1, '1581063137', '2020-02-07 08:12:17', '2020-02-26 12:46:25'),
(1010, 'Chishimba', 'Abiya', 'Kaputo', 'Chishimba', '$2y$10$h3rU4qAEHkrOzuv/qVytkeymvu.lPlLXcsst4oJTd.b9f3iBdaDIC', 1, 2, '+260966464405', 'chishimba.kaps@gmail.com', 1, 1, 1, 1, '1581063835', '2020-02-07 08:23:55', '2020-02-07 12:38:50'),
(1011, 'Lewis', 'Hambayi', 'Kabinga', 'Lewis', '$2y$10$YTImyRM2hPyG0bpl6mu19.bu4i5klsGnxA6CMblKEQer0k1cC2lN.', 1, 2, '0974848293', 'lewykasuit@gmail.com', 1, 1, 1, 1, '1581063848', '2020-02-07 08:24:09', '2020-02-07 13:00:49'),
(1012, 'Mwansa', 'David', 'Mwenya', 'mwamwe', '$2y$10$a1cn37T/.5wW/0cCqIRGZejwcMBwx.5/ZHtIbJN9SNF45b2jS7Sy.', 1, 2, '+260967851449', 'mwansamwenya4@gmail.com', 1, 1, 1, 1, '1581064050', '2020-02-07 08:27:30', '2020-02-07 12:37:37'),
(1013, 'Nicholus ', 'Sande', 'Chintu', 'Nick ', '$2y$10$cPVNYp61FUOFwO8nmAl72ejpfbonQgxSx/id0ubpIlWMlVZkSPyIW', 1, 2, '+260977235176', 'nicholus.sande@gmail.com', 1, 1, 1, 1, '1581064061', '2020-02-07 08:27:41', '2020-02-07 12:36:24'),
(1014, 'Tresford', 'Isaiah', 'Kaniki', 'Kaniki', '$2y$10$i9yrox6GUPkGuWa3HCf5v.xbnqurBuOl1MUnfPs2i9FOhRsYHvIvq', 1, 2, '+260962859410', 'tresfordkaniki4@gmail.com', 1, 1, 1, 1, '1581064172', '2020-02-07 08:29:33', '2020-02-07 12:58:07'),
(1015, 'Jimmy', 'Sakala', 'Sakala', 'Jimmy Sakala', '$2y$10$M5.cIzAZZHR5dVZs7Bh75OwuvAzIUe2/DVyfI3QdvaRgNkEx5/Bmi', 1, 2, '0965215069', 'sakalajim@gmail.com', 1, 1, 1, 1, '1581064555', '2020-02-07 08:35:55', '2020-02-07 12:38:57'),
(1017, 'Mbanga', 'Muleba', 'Muleba', 'Mbanga Muleba', '$2y$10$RQRQ.TcVQmzLB0YCXXREeu407FyQh6j6hS2qF3q/EajeBAD0/tfIe', 1, 2, '0977899583', 'mulebem@yahoo.com', 1, 1, 1, 1, '1581065860', '2020-02-07 08:57:40', '2020-02-07 12:27:30'),
(1018, 'Niza', 'Junior', 'Siame', 'nauzi', '$2y$10$zy2Ow/.kKsYhEySHhXfJe.YCc4vaSMSDNiO/A664pekpFfwEIuB4y', 1, 2, '0979132026', 'nizasiame5@gmail.com', 1, 1, 1, 1, '1581067218', '2020-02-07 09:20:18', '2020-02-07 12:22:49'),
(1019, 'BILALI', 'I.', 'KABULA', 'BILALI KABULA', '$2y$10$51UQH3f0HV5Bn/9oOo8FrObZq1pCOKmwSTbLCev7N3tAlL4eGXdca', 1, 2, '0783021213', 'bika72@gmail.com', 1, 1, 1, 1, '1581591398', '2020-02-13 10:56:38', '2020-02-13 14:00:37'),
(1020, 'Eric', 'O', 'Ochomo', 'eochomo', '$2y$10$TG/6O3UGq5rBe1FX3IvbGuQdZdrjSn4Mwqf4J2Bz8mREb9QrmmMFm', 1, 2, '+254723845457', 'ericochomo@yahoo.com', 1, 1, 1, 1, '1582954638', '2020-02-29 05:37:18', '2020-04-05 11:11:43'),
(1021, 'Betwel', 'John', 'Msugupakulya', 'Betwel John', '$2y$10$um4EowEuKb/oAYBYGJYOIu7OAC9m0Bl74F.db2OpTtXjhrcoTqslK', 1, 2, '+255763912255', 'jbetwel@ihi.or.tz', 1, 1, 1, 1, '1585041790', '2020-03-24 09:23:10', '2020-11-04 12:51:25'),
(1022, 'Silas', 'Majambere', 'Majambere', 'SilasMajambere', '$2y$10$kqXLM/0hSDKLm3fSXedxGO0.wHuRDgNNdmnfSND5Ii11AXOT1fgPq', 1, 2, '96802212', 'simajambere@gmail.com', 1, 1, 1, 1, '1585120992', '2020-03-25 07:23:12', '2021-07-26 11:12:14'),
(1023, 'MAURICE', 'OMBOK', 'OMBOK', 'MAURICE OMBOK', '$2y$10$ALYc9Zn8L/7.pmbrFdzEJew74COQc0bmtslSBXA/VqTEDtdQsUfl6', 1, 2, '0710312176', 'mombok@kemricdc.org', 1, 1, 1, 1, '1585295207', '2020-03-27 07:46:47', '2020-03-27 11:16:18'),
(1025, 'David', 'L', 'Smith', 'smitdave', '$2y$10$Ffn0ik9l/EUxeP8WZ4g5JeuRR5MfZ1aLWYwwc/kpB1G5l.h0niIfC', 1, 2, '2027314896', 'smitdave@uw.edu', 1, 1, 1, 1, '1586389237', '2020-04-08 23:40:37', '2020-04-09 23:17:52'),
(1026, 'Emmanuel', 'Bagop', 'Emmeni', 'emmaus', '$2y$10$7GoxQIjcVb8EprCrch/kbek7CbOOCNRFVFqc4Ee8as6SNTsXap56m', 1, 2, '+237 693204590', 'bagopemmanuel@yahoo.fr', 1, 1, 1, 1, '1588155135', '2020-04-29 10:12:15', '2020-10-20 11:46:08'),
(1027, 'Sow', 'Bazoumana', 'B.Danouma', 'Sow_Baz', '$2y$10$5DmTPc6rmHOPeRxAKsCuheGKp59Q0nuQ3jefMt/sxjy5QpaovrHT.', 1, 2, '0022671024832', 'sowbazoumana@gmail.com', 1, 1, 1, 1, '1588157162', '2020-04-29 10:46:02', '2021-05-25 17:04:42'),
(1028, 'Dickson', 'Msaky', 'Msaky', 'dixon', '$2y$10$xKs5IyGgDtEskdaud3SgZOypN48GMVgr9h3jJMi/wk0bxLBhiUb3e', 1, 1, '0723456789', 'dmsaky@ihi.or.tz', 1, 1, 1, 1, '1592823135', '2020-06-22 10:52:16', '2020-09-03 22:25:38'),
(1029, 'Samwel', 'Dickson', 'Msaky', 'samweldixon', '$2y$10$J.fqRGNjivBvzqxm6WZmoeBELYoBqQKKQ30ctIlT7X9u8gI3tXeWO', 1, 2, '0713123456', 'dixonmsaky@gmail.com', 1, 1, 1, 1, '1596378625', '2020-08-02 14:30:25', '2021-07-19 17:10:58'),
(1030, 'Asnath', 'Sethiel', 'Mosha', 'Asnath Sethy', '$2y$10$ccoF9u8S9IlmYJ02TfJdveidDkl0zPMcK33TGGcjB1IR.lHyrUKHC', 1, 2, '0757387450', 'asnath.sethy@gmail.com', 1, 1, 1, 1, '1599116901', '2020-09-03 07:08:21', '2020-12-17 08:12:22'),
(1031, 'Yeromin', 'Paul', 'Mlacha', 'ymlacha', '$2y$10$CJqsubwgMlxGUyJf.3aOKu/5rrnSaREf58XIY6Q9cmcVR2/CNqdb6', 1, 2, '0763311968', 'ymlacha@ihi.or.tz', 1, 1, 1, 1, '1600027294', '2020-09-13 20:01:34', '2021-08-01 16:58:29'),
(1032, 'Prosper', 'Pius', 'Chaki', 'pchaki', '$2y$10$DX4kae11U8lV4MAh1SJH0.P97MtbrNulXNoe/aWJuIgj5O3O0SxZu', 1, 2, '+255686997299', 'pchaki@ihi.or.tz', 1, 1, 1, 1, '1600067622', '2020-09-14 07:13:42', '2020-11-04 10:25:21'),
(1033, 'Tegemeo', 'Kalokola', 'Gavana', 'Gavana', '$2y$10$lS7R2XhfSt6i6Tl61OmBPuGf.nqscud/qHRQf1DXMqyjx2PxQ4L7.', 1, 2, '+255621108061', 'tgavana@ihi.or.tz', 1, 1, 1, 1, '1600168050', '2020-09-15 11:07:30', '2021-07-27 16:53:35'),
(1034, 'HAJIRANI', 'MUSA', 'MSUYA', 'MSUYA', '$2y$10$tuxN6NSvHuYpOT5nI.0edezN.8VICLLiGkeDxn8yTsUP54/O4WxDa', 1, 2, '0465261125', 'hmsuya@ihi.or.tz', 1, 1, 1, 1, '1600169528', '2020-09-15 11:32:08', '2020-09-15 15:36:57'),
(1035, 'Protas', 'Benedict', 'Sayo', 'protas sayo', '$2y$10$iDL7iqcei7Dn.JQJkp4z3eEl21wy7zo7qWqs.CGHpwNhVH5Otyaiu', 1, 2, '0765893363', 'psayo@ihi.or.tz', 1, 1, 1, 1, '1601393426', '2020-09-29 15:30:26', '2021-03-25 10:12:15'),
(1036, 'Andrea', 'Martin', 'Kipingu', 'Kipingu', '$2y$10$U3DYuI.GIsMfMJ86U4Qo4exjB2t9fxHI1/TYFfZOINN6i94GYZFzi', 1, 2, '+255717074415', 'andreakipingu@gmail.com', 1, 1, 1, 0, '1601556690', '2020-10-01 12:51:30', NULL),
(1037, 'Njire', 'S', 'Choba', 'njirec', '$2y$10$UO804vm401pYwyqMLvCYU.jmnOe67VzFYAiRlZAE2gCxNsLFkzw/i', 1, 2, '0789779227', 'irenechoba@gmail.com', 1, 1, 1, 1, '1601875377', '2020-10-05 05:22:57', '2021-08-02 16:52:33'),
(1038, 'Victor ', 'Adiel ', 'Mero', 'merocrypto', '$2y$10$kbKjiViZh9BaScUtnag9qexSXNu540iq/cJz7Xf9iIAcnlzXtN.9C', 1, 1, '0782400341', 'merovictorayo@gmail.com', 1, 1, 1, 1, '1602058851', '2020-10-07 08:20:51', '2021-08-02 16:00:33'),
(1039, 'Gerald ', 'Godfrey', 'Kiwelu', 'Gerald', '$2y$10$3fdzTlqsqD2l.yYWKhJrV.Kv1tiQV2yG91dSweTZ7q.6bSFCeXbiC', 1, 2, '0716655331', 'gerrykiwelu@yahoo.com', 1, 1, 1, 1, '1602139616', '2020-10-08 06:46:56', '2021-08-02 15:57:40'),
(1040, 'Elijah', 'O', 'Juma', 'Jadala', '$2y$10$uLQEraUt.s96haoLPZDOUeeopvVDX4dyANtOtK6Queh7sJU641zbu', 1, 2, '0711595126', 'elijah.juma@pamca.org', 1, 1, 1, 1, '1605609301', '2020-11-17 10:35:01', '2020-11-17 13:35:44'),
(1041, 'LINDA', 'WANJIRU', 'KANYONYO', 'LINDA', '$2y$10$Jg2lU9S1QeyLeRfuoFfdZ.rHJGFOxvz1arxf9HkN/m7ywQjQd19NW', 1, 2, '0702271838', 'lindakanyonyo@gmail.com', 1, 1, 1, 0, '1605610057', '2020-11-17 10:47:37', NULL),
(1042, 'Damaris', 'K', 'Matoke', 'Damaris', '$2y$10$dLtXWyXUuJOPcn3xsvkNiOHEemgGl1KDnQkijcLrbLTkQp6G93XLe', 1, 2, '+254723895281', 'kdamah@gmail.com', 1, 1, 1, 1, '1605611433', '2020-11-17 11:10:33', '2020-11-17 20:35:27'),
(1043, 'Duncan ', 'Kobia', 'Athinya', 'Athinyaduncan', '$2y$10$WckeP7g2wTwEa7sg6ycoueYFGY42nZ3RttwhJzyUwQ83bo.cj5q9G', 1, 2, '+254720905339', 'dka@vestergaard.com', 1, 1, 1, 1, '1605613070', '2020-11-17 11:37:50', '2020-11-26 09:46:09'),
(1044, 'Celso', 'Antonio', 'Alafo', 'celsoalafo', '$2y$10$IzbS0sjYAbdpt3gmMPAhC.b728HLj8dColuCcEBlrKuu2T0jw/3sW', 1, 2, '+258869541210', 'celso.alafo@gmail.com', 1, 1, 1, 1, '1606400783', '2020-11-26 14:26:23', '2020-11-26 18:05:11'),
(1045, 'Jackson', '.', 'Nyarko', 'jnyarko', '$2y$10$4Po4LdKKtiDcGzZCngyDAe5W6.x6b9GYjBkiCO1oJXwkEgY3scsxS', 1, 2, '+22962462710', 'jnyarko@crec-lshtm.org', 1, 1, 1, 1, '1606400924', '2020-11-26 14:28:44', '2020-11-26 17:30:01'),
(1046, 'Renaud', 'InÃ¨s SÃ¨gbÃ©gnon', 'Govoetchan', 'renaud292', '$2y$10$cO6OgVdTW4jozpQ1d3/0xeHx8Mba0Leiirb4tuw4.mdgQjdQcjHL.', 1, 2, '+22997074549', 'renaud292@yahoo.fr', 1, 1, 1, 1, '1606401347', '2020-11-26 14:35:47', '2020-11-26 17:37:47'),
(1047, 'Wilfrid', 'TalagbÃ©', 'SEWADE', 'Wilfrid', '$2y$10$hpKKr/IiuCwCv47XEIgqIeQoKe4hBjftFtkVL3FK0xiFExHrmPOfq', 1, 2, '+22996144648', 'sessowiles@gmail.com', 1, 1, 1, 1, '1607541130', '2020-12-09 19:12:10', '2020-12-10 23:23:11'),
(1048, 'Maneno', 'Edson', 'Baravuga', 'Baravuga', '$2y$10$D1G8WJ1VnKop9XY7kLn3/u/qJ5ViX7uQCNDzMnNoPvtWX9.47MsPO', 1, 2, '+255765577011', 'mbaravuga@ihi.or.tz', 1, 1, 1, 1, '1609932570', '2021-01-06 11:29:30', '2021-07-22 13:52:21'),
(1049, 'Selemani', 'Christopher', 'Mmbaga', 'smmbaga', '$2y$10$XQC0Zl2eV/hirXG1zGGzBu2VXW3QIhzBIzSKi3Ta7mHp.k/vcaVna', 1, 2, '0625820271', 'smmbaga@ihi.or.tz', 1, 1, 1, 1, '1609933851', '2021-01-06 11:50:51', '2021-01-06 15:51:52'),
(1050, 'Amos ', 'Thomas', 'Mlwale', 'Amos Thomas', '$2y$10$9tYr5J5pD/mNOr79mk2zEeJGVhBVA30MuAw81CVn2r9Q0hUNOkdz6', 1, 2, '0712251004', 'athomas@ihi.or.tz', 1, 1, 1, 1, '1611059336', '2021-01-19 12:28:57', '2021-05-08 20:06:25'),
(1051, 'Revocatus', 'Musyangi', 'Musiba', 'rmusiba', '$2y$10$qJ7c1qKLs0jFmCowWbtfeuBC5PZhuQhnLT3iSVdcga7GmM6tjz4.q', 1, 2, '0786739121', 'rmusiba@ihi.or.tz', 1, 1, 1, 1, '1617009633', '2021-03-29 09:20:33', '2021-03-30 15:14:40'),
(1052, 'Nico', 'J', 'Govella', 'govella@ihi.or.tz', '$2y$10$zZOt11vEBbo9ulomRdm7j.So0jmHXLZKOOkS9qrV/2k.jCPm9L8nO', 1, 2, '+255765885682', 'govella@ihi.or.tz', 1, 1, 1, 1, '1617265267', '2021-04-01 08:21:07', '2021-04-27 13:08:57'),
(1053, 'Frederik', '-', 'Seelig', 'Frederik.Seelig', '$2y$10$A8DYg3a1WeCkaCk2RQnxGu5WDzSBeqW6pHrLkVaXbzkLxhPh.SRgy', 1, 2, '+447514635299', 'frederik.seelig@lshtm.ac.uk', 1, 1, 1, 1, '1617907158', '2021-04-08 18:39:18', '2021-04-08 21:41:02'),
(1054, 'Stanslaus', 'Henry', 'Mafung\'a', 'shenry', '$2y$10$2bX.Ifi8eRcvIYLDsgAUDekp41CLGUrgIqPHIL8Mhzgi3oJVBVX/.', 1, 2, '+255789399961', 'stanslaushenry@gmail.com', 1, 1, 1, 1, '1617973896', '2021-04-09 13:11:36', '2021-07-09 10:42:24'),
(1055, 'Elias', 'EN', 'Niyituma', 'niyoelias1@gmail.com', '$2y$10$fSJpDmmrTDsWueeqWvDw/uWoUXZ2K9zUO0TtNOwoGEC1Lzb9iyfEe', 1, 2, '0788677624', 'niyoelias1@gmail.com', 1, 1, 1, 1, '1618318140', '2021-04-13 12:49:00', '2021-07-07 11:23:37'),
(1056, 'Alphonse', 'AM', 'Mutabazi', 'alphonse.mutabazi', '$2y$10$zzryKmaEwWWpdfqDOBxbveW4qpZRTEKjuGa96iR7om9trc8Wie5.m', 1, 2, '+250788857292', 'alphonse.mutabazi@gmail.com', 1, 1, 1, 1, '1618318250', '2021-04-13 12:50:50', '2021-04-14 12:32:42'),
(1057, 'Pacifique', 'Gisele', 'Mukashema', 'shema.gisele@gmail.c', '$2y$10$XxOSZ8m59RdF8KUvxC49B.sWrbTbGsdjzGa2MdiaOZKdEB7gfTkDe', 1, 2, '0788661211', 'shema.gisele@gmail.com', 1, 1, 1, 1, '1618318380', '2021-04-13 12:53:00', '2021-04-14 12:50:59'),
(1058, 'Beatus', 'BC', 'CYUBAHIRO', 'beatzc13@gmail.com', '$2y$10$IOy5pltnFn2zkzwsptZF.uGwjMenVfgiSUH4Xj8Gl096nRmlWNnWu', 1, 2, '0788309670', 'beatzc13@gmail.com', 1, 1, 1, 1, '1618318380', '2021-04-13 12:53:00', '2021-07-07 10:39:23'),
(1059, 'Xavier', 'MX', 'MISAGO', 'misagoxavier@gmail.c', '$2y$10$kGW.oGAdaQOzPND0dquL4Ok24r1fAoSACSP74kcXHywyrm17cBr72', 1, 2, '0788487895', 'misagoxavier@gmail.com', 1, 1, 1, 1, '1618319137', '2021-04-13 13:05:37', '2021-07-07 12:41:36'),
(1060, 'Dunia', 'MD', 'MUNYAKANAGE', 'duniapopol@gmail.com', '$2y$10$x.EZQATL9hxXMU56Z.Kbw.QME4oz2rOdveQTel7MSU0fs/HAKrORe', 1, 2, '+250788836654', 'duniapopol@gmail.com', 1, 1, 1, 1, '1618385429', '2021-04-14 07:30:29', '2021-04-16 15:53:13'),
(1061, 'Phocas ', 'Maziph', 'Mazimpaka', 'mazphocs@gmail.com', '$2y$10$OQonJdccK8Jyt93BxEqiUu0jPGNyxl.EinFVTcU6Luo1v2TWSvTtu', 1, 2, '+250788524014', 'mazphocs@gmail.com', 1, 1, 1, 1, '1618389026', '2021-04-14 08:30:28', '2021-04-14 12:30:57'),
(1062, 'Jackie', 'MJ', 'MUPFASONI', 'umupfasoni@ymail.com', '$2y$10$nprMae5oNtJQR6y3OWO2qeB9hAdniHGvFiBMAPPOAsxcReQ6mZ/KC', 1, 2, '0788462824', 'umupfasoni@ymail.com', 1, 1, 1, 1, '1618480994', '2021-04-15 10:03:14', '2021-05-22 15:59:17'),
(1063, 'Torbert', 'Migambi', 'Yvan', 'torbert', '$2y$10$2ftcfmAQfcArvnPjnTLzU.31/UrcbQy32cAWRXCPUooKrRybFQXyW', 1, 2, '0783834165', 'gahizitorbert@gmail.com', 1, 1, 1, 1, '1618481076', '2021-04-15 10:04:36', '2021-04-16 09:54:10'),
(1064, 'PRIMITIVE', 'MP', 'MUKANYANDWI', 'm7primitive@yahoo.fr', '$2y$10$UaRIlvnzrZszaVFb1QxAXu10A03Tzts2xTaoPq3RJ2cD2kWlCKBye', 1, 2, '0788618806', 'm7primitive@yahoo.fr', 1, 1, 1, 1, '1618481138', '2021-04-15 10:05:38', '2021-04-16 19:10:23'),
(1065, 'Narcisse', 'Gn', 'Gahamanyi', 'gahamanyin@yahoo.com', '$2y$10$iP2/ySRShW/MeJdwEYfyY.jW82GR7zOsNhuEoikCn4yu1PDpo7V46', 1, 2, '250783485518', 'gahamanyin@yahoo.com', 1, 1, 1, 1, '1618481240', '2021-04-15 10:07:20', '2021-04-15 13:27:54'),
(1066, 'Cassien', 'Ndahiro', 'Myambi', 'myambi', '$2y$10$9SdzQKzp/lRDGiZdu3UAGuhJPrWNP6XFa0cKhMEf/D.yiX4ARb/kW', 1, 2, '0783564886', 'ndahiro.myambi@gmail.com', 1, 1, 1, 1, '1618481381', '2021-04-15 10:09:41', '2021-04-15 18:01:10'),
(1067, 'Gerald', 'Gh', 'HABIMANA', 'geraldcele', '$2y$10$bzfgb3fTg7PZ8F2jmmI5LuGz3ME0o9UICbTU7Bx0Je4iZSFDYxHTS', 1, 2, '0788795419', 'geraldcele@gmail.com', 1, 1, 1, 1, '1618481428', '2021-04-15 10:10:28', '2021-04-16 09:53:49'),
(1068, 'Emmanuel', 'ERM', 'Rugarama', 'erugarama', '$2y$10$bNatKgARZLl8mGlf8rnobOFEq6npBuEgvHd06IY7nB3PBiobcMTeK', 1, 2, '0788590834', 'erugarama2021@gmail.com', 1, 1, 1, 0, '1618481528', '2021-04-15 10:12:09', NULL),
(1070, 'Gisele', 'Niyonsenga', 'Niyonsenga', 'Gisele Niyonsenga', '$2y$10$9E1g0qnKo.KvHOtS47hHB.3GZIW63YXynmMK6mJ/4QtpMzy.98otC', 1, 2, '0788391569', 'giseleniyo@gmail.com', 1, 1, 1, 1, '1618481860', '2021-04-15 10:17:40', '2021-04-16 09:52:06'),
(1071, 'Jean Paul', 'BJP', 'BAKURE', 'bajeste@gmail.com', '$2y$10$iZwGuXnC7N8qvQa0qfCAe.lrTAzw1aVvylGNbFHO67Ltr4NHjbE7.', 1, 2, '+250788450025', 'bajeste@gmail.com', 1, 1, 1, 1, '1618481989', '2021-04-15 10:19:49', '2021-04-16 09:49:15'),
(1073, 'Emmanuel', 'MRG', 'Rugarama', 'rugarama', '$2y$10$pRN7xkbKG9prKgygBOngfeFOkKfTspUT9NNd6G/EWzzehAXdBd1Y6', 1, 2, '0788590834', 'erugarama2017@gmail.com', 1, 1, 1, 1, '1618482285', '2021-04-15 10:24:45', '2021-04-21 19:38:07'),
(1074, 'Erneste', 'EK', 'Kamanzi', 'Kamanzierneste@gmail', '$2y$10$1P8Rq/nYDJg4ek5.01bGX.N8BxkC2C7nl.Mb8IpK4zJhc.sB2uVbq', 1, 2, '0788820950', 'kamanzierneste@gmail.com', 1, 1, 1, 1, '1618482360', '2021-04-15 10:26:00', '2021-06-21 12:48:14'),
(1075, 'Illuminee', 'Mi', 'Mukarugira', 'mi', '$2y$10$7RR1JOBBn33ytQmnoXDyLu.314kwURA2Ppgkfm6Gjg9aOgR2R.zd6', 1, 2, '0788535469', 'mukarugira.i@yahoo.com', 1, 1, 1, 1, '1618482887', '2021-04-15 10:34:47', '2021-04-15 13:38:13'),
(1076, 'Clarisse', 'CM', 'Mukashema', 'CM', '$2y$10$xvJlvmnKgx42gr3p0FvMh.YZ0tcAK0b8rFZArc8i/u8KOmCuvWzCe', 1, 2, '0788630009', 'shemaclarisse@gmail.com', 1, 1, 1, 1, '1618483388', '2021-04-15 10:43:08', '2021-04-16 12:22:46'),
(1077, 'John', 'Gihana', 'JG', 'GJ', '$2y$10$HCEhMLFmMhq/wUGgDi0ptuPHBGYpPQNNvERkgOY.mTdQdxTbnf7pC', 1, 2, '+250788549636', 'gihanajohn63@gmail.com', 1, 1, 1, 1, '1618484335', '2021-04-15 10:58:55', '2021-04-16 10:10:10'),
(1078, 'Onesphore', 'Onesphore', 'Rwabuhungu', 'rwabuhunguonesphore', '$2y$10$IQ7CWF34foRyrQH0up6yQOBWpc8vWkVMX9lrQkrUY0pc1xr2o1qIy', 1, 2, '0788878868', 'rwabuhunguonesphore2021@gmail.com', 1, 1, 1, 1, '1618499450', '2021-04-15 15:10:50', '2021-04-16 09:29:00'),
(1079, 'Cisca', 'CM', 'Murekatete', 'ciscamurekatete96@gm', '$2y$10$.OYjnCzHfy3VQNY/CMwe9.m6RbGBAHypS2Fvhy1Wl3jFHtwXWPELi', 1, 2, '+250784717610', 'ciscamurekatete96@gmail.com', 1, 1, 1, 1, '1618500056', '2021-04-15 15:20:56', '2021-04-24 11:37:54'),
(1080, 'Jacques', 'Ju', 'UZABAKIRIHO', 'uzabakirihojacques', '$2y$10$vexB7755jdsKa0NS9EiUcuexkph/ro4.UOwhMKjoTP9rgSjGsJzKO', 1, 2, '0788664276', 'uzabakirihojacques@gmail.com', 1, 1, 1, 1, '1618563985', '2021-04-16 09:06:25', '2021-04-27 13:29:31'),
(1081, 'Gerald', 'Godfrey', 'Kiwelu', 'gkiwelu', '$2y$10$T8Lw0u.lw4Opjpps/URY.u63wdPkkB8EQqAS6wfcsbyHeZO4WtmPm', 1, 2, '0716655331', 'gkiwelu@ihi.or.tz', 1, 1, 1, 1, '1619537475', '2021-04-27 15:31:15', '2021-08-02 15:47:11'),
(1082, 'Victoria', 'James', 'Materu', 'VictoriaJ', '$2y$10$YEndI0Dz8MjoNDZ6IL9bru/UXZsbaGITKhxMc2OiisPWUjDdhrWd.', 1, 2, '0716600982', 'victoriaj.materu@gmail.com', 1, 1, 1, 1, '1620808322', '2021-05-12 08:32:02', '2021-07-13 13:48:25'),
(1083, 'GLORIA SALOME', 'GABRIEL', 'SHIRIMA', 'GLORIA', '$2y$10$Bx/Uj8Y/72CBaszlSdLVZuWSrgVI2dyI1VktXtKYkTfD7MnPMYVi.', 1, 2, '+255683846556', 'gshirima@ihi.or.tz', 1, 1, 1, 1, '1620808482', '2021-05-12 08:34:42', '2021-05-12 11:37:09'),
(1084, 'Martine', 'Kamilus', 'Masonda', 'mmasonda', '$2y$10$vrECrJl6ViwpIkm036fktekJ2H5MpaqGEvhcwN8bm2MIbryuL7O3K', 1, 2, '0624108668', 'martinemasonda33@gmail.com', 1, 1, 1, 1, '1620810452', '2021-05-12 09:07:32', '2021-05-12 16:44:05'),
(1085, 'Janice', 'Stephen', 'Maige', 'Janice', '$2y$10$xss6miH0y9U1Cwp/dZOiqeZMTHM6xIc3nIoQ5UDT.cD87E3KFi4ie', 1, 2, '+255745180944', 'janicestephen36@gmail.com', 1, 1, 1, 1, '1620821911', '2021-05-12 12:18:31', '2021-08-02 14:32:06'),
(1086, 'Asiya', 'M', 'Mbarawa', 'Asiya', '$2y$10$rEboU/o66prejXxZdsM3ZOqDBspkgQF0pKOLhLAYKtN1/qc8lQrY2', 1, 2, '0754767951', 'ambarawa@ihi.or.tz', 1, 1, 1, 1, '1620821926', '2021-05-12 12:18:46', '2021-06-10 20:39:27'),
(1087, 'Basiliana, Dr.', 'A.', 'Emidi', 'ebasi2002', '$2y$10$ahRxsuaTURMzeMH8I/E8..hwmPOfQioW6kwVoanJuEibBFDRgH0qa', 1, 2, '+255784410595', 'ebasi2002@gmail.com', 1, 1, 1, 1, '1620827645', '2021-05-12 13:54:05', '2021-05-12 16:55:25'),
(1088, 'David', 'Takudzwa', 'Zinyengere', 'Takudzwa', '$2y$10$P982OnGcqNtoQulJkzNDTuHRU1MJFdS7khkf2AlIA9Y7IxUZBqkQ.', 1, 2, '+263773253102', 'david.zinyengere@gmail.com', 1, 1, 1, 1, '1620827703', '2021-05-12 13:55:04', '2021-05-12 16:55:58'),
(1089, 'Constant', 'Tchandema', 'Kansango', 'AFIA', '$2y$10$9yrc7J6WgZ5PZAYDZESHeuWDXOzUIUuLzJMfiE6g.QL1rSIecO2Dm', 1, 2, '+243810387625', 'kanstchand@yahoo.fr', 1, 1, 1, 1, '1620827778', '2021-05-12 13:56:18', NULL),
(1090, 'Eric', 'Ayuk', 'Besong', 'Eric', '$2y$10$rs3GBPWPm1lfrsz4cu.5ZOVSRdFZKj2ONaVLo.FTkvV7sODIt24AO', 1, 2, '06384522', 'ericbesong@yahoo.com', 1, 1, 1, 1, '1621276027', '2021-05-17 18:27:07', '2021-05-17 21:48:30'),
(1091, 'Abdoul ', 'Kader', 'NANA', 'abdoulkadernana2@gma', '$2y$10$pqAKJ0nSiKb/apugXfLQgO2SKhVWa/q.qBYwZvtOGCK0fiC..4jCq', 1, 2, '78039722', 'abdoulkadernana2@gmail.com', 1, 1, 1, 1, '1621276762', '2021-05-17 18:39:23', '2021-05-26 13:23:27'),
(1092, 'Oumarou ', 'Compaore', 'Compaore ', 'oumarouHB', '$2y$10$mKRavF9X2vR3Zby3MI1xI.Y0F6vm8MupRsxRR68ymPGrZ9q4WyBu6', 1, 2, '60175051', 'om04compaore@gmail.com', 1, 1, 1, 1, '1621276855', '2021-05-17 18:40:55', '2021-05-17 21:50:41'),
(1093, 'Azize', 'Abdoul', 'MILLOGO', 'amillogo', '$2y$10$Il6QDqtgG2wiwC10fBdz4eLvpaEwsKsuQ0vDiaCN1pjYVPYCBo49u', 1, 2, '+22676420097', 'azizemillogo@gmail.com', 1, 1, 1, 1, '1621277027', '2021-05-17 18:43:47', NULL),
(1094, 'Hamed', 'OUEDRAOGO', 'OUEDRAOGO', 'BigBoss', '$2y$10$efwggwDJOgbvBma6m8ygeeMXkchKooLBqAN7lgqP9CxD6i3D.uC4m', 1, 2, '+22670001973', 'hamedouedraogo887@gmail.com', 1, 1, 1, 1, '1621277053', '2021-05-17 18:44:13', '2021-05-26 12:55:54'),
(1095, 'Hamado', 'KOUDA', 'KOUDA', 'MonrÃ©', '$2y$10$jnQiCRskzGXMz1keW5/uZecjDzCZ2GfM8BBMjmrV7EoPbsc5NmCSO', 1, 2, '76284564', 'hamadokouda14@gmail.com', 1, 1, 1, 1, '1621277230', '2021-05-17 18:47:11', '2021-05-26 13:15:46'),
(1096, 'Aboubacar', 'GILA', 'GILA', 'GILA', '$2y$10$KJ7/cQOU6kY0HjQ/me2e3e6X8FZ65N/YdVckCRHkNGS8Ul3iUdQ0a', 1, 2, '63005236', 'aboubacargila@yahoo.fr', 1, 1, 1, 1, '1621277247', '2021-05-17 18:47:27', '2021-05-26 13:27:05'),
(1097, 'ADAMA', 'KABORE', 'KABORE', 'DAMSI', '$2y$10$bLsCAEi831PgNOfLPh0.2eu8ceB15p8HM1zutwG3FiS7gBpqmnTlG', 1, 2, '71644033', 'kaboredamsi@yahoo.fr', 1, 1, 1, 1, '1621277295', '2021-05-17 18:48:15', '2021-05-17 21:53:59'),
(1098, 'CAMARA', 'TiÃ©coura', 'Newman', 'CAMARA', '$2y$10$sd10UAJzBPsW32joJ5I1LeUDWXZ37yYQvqKZz3ZYMxpZOrHvOgzfG', 1, 2, '0022676684105', 'tcrcamara@gmail.com', 1, 1, 1, 1, '1621277418', '2021-05-17 18:50:18', '2021-05-17 21:51:51'),
(1099, 'Haoua', 'Sambore', 'Sambore', 'Elsambore', '$2y$10$6HQAcrjysnUKe..Tz25lwuaDLebwmMyVn6JqZ8xVZ90AlMBEdnSbi', 1, 2, '77851570', 'samboreawa1@gmail.com', 1, 1, 1, 0, '1621277418', '2021-05-17 18:50:18', NULL),
(1100, 'JEAN BAPTISTE ', 'NANA', 'NONE', 'NANA JB MTN', '$2y$10$i9Z9.lnZA.UNcg3FRYoefeB/w2czvImI3YDciiHGMm1bbtq3K2zd.', 1, 2, '60856733', 'baptistenana@yahoo.fr', 1, 1, 1, 1, '1621277434', '2021-05-17 18:50:34', '2021-05-17 21:54:29'),
(1101, 'ILBOUDO', 'W. Achille', 'NA', 'Achille', '$2y$10$q0QuF3tlaeoTaGxWWHATv.UnKPecB2VYHJ.cKLoWdQf557ITD7T0K', 1, 2, '70496966', 'achillilboudo@gmail.com', 1, 1, 1, 0, '1621277497', '2021-05-17 18:51:37', '2021-05-26 13:28:10'),
(1102, 'Kassoum', 'NIKIEMA', 'NIKIEMA', 'NIKIEMAFASO', '$2y$10$2mqq6zuYuJkeRoJhuZAOyesKPBzBgeM..1OnkGeDsN9CXfN6gKapW', 1, 2, '77156913', 'kassoumnikiema470@gmail.com', 1, 1, 1, 1, '1621277568', '2021-05-17 18:52:48', NULL),
(1103, 'Ibrahima ', 'Teguera ', 'Teguera ', 'Ibrahima ', '$2y$10$9hN0j3TNB4s016rsXHWOsOf9LR/JG0jKVmt7IIFYyVC0RFdcukEoq', 1, 2, '+22670264935', 'iteguera5@gmail.com', 1, 1, 1, 1, '1621277855', '2021-05-17 18:57:35', '2021-05-26 13:22:08'),
(1104, 'ADAMA', 'SANOU', 'SANOU', 'Sam', '$2y$10$5GHPW9z3agDIuF2JHyAO2.cOgXkS9QFNcNiwo1p6hWHuB5xEgwCAm', 1, 2, '71786271', 'adamasanou31@gmail.com', 1, 1, 1, 1, '1621277863', '2021-05-17 18:57:43', '2021-05-26 13:34:11'),
(1105, 'DABILGOU', 'PaligwendÃ©', 'Boris', 'PDABILGOU ', '$2y$10$DTzXKT1qSj9hh65NLGRkuedWDH0yn6e6Z6.m84hfIxUmffNEl.Lgy', 1, 2, '62577630', 'anselmedabilgou@gmail.com', 1, 1, 1, 1, '1621278765', '2021-05-17 19:12:45', '2021-05-18 17:28:54'),
(1106, 'Oumarou', 'Tao', 'Oumarou Tao', 'Omar', '$2y$10$SFaMzgDueCJT2ZiYsuHqrenPS9oxPadWkfpEhpcFNAgZJ5YeptKBG', 1, 2, '72194224', 'oumarou.tao90@gmail.com', 1, 1, 1, 1, '1621325282', '2021-05-18 08:08:02', '2021-06-05 12:31:45'),
(1107, 'SEMDE', 'Abdoul Salam ', 'Fiacre', 'semdefiacre@yahoo.co', '$2y$10$PoDrE5rRfg1bavkiFuncz.ezfXb5VTa8I58yAVNNB8diFevi4jNmq', 1, 2, '70130371', 'semdefiacre@yahoo.com', 1, 1, 1, 1, '1621331368', '2021-05-18 09:49:29', '2021-05-18 15:07:06'),
(1108, 'Sylvia', 'Nanfuka', 'Kirumira', 'Sylvia Kirumira', '$2y$10$3kXYWv302nya2ggknJ/vb.Cumqb0zWIw4Urr5K3x9uIpmptT2y1jW', 1, 2, '+256775414488', 'skirumira@clintonhealthaccess.org', 1, 1, 1, 1, '1621918117', '2021-05-25 04:48:37', '2021-05-25 07:49:30'),
(1109, 'Abdoulaye', 'A', 'Niang', 'DBNiang', '$2y$10$EfNPx0pxT4vUg6ydUGAqPOND4TUVjWOJAK0IJQj4RveluYh0qeEFy', 1, 2, '+22677828235', 'bband79@yahoo.fr', 1, 1, 1, 1, '1622056179', '2021-05-26 19:09:39', '2021-07-21 20:29:00'),
(1110, 'Ahlam', 'Saeed', 'Ali', 'ahlam', '$2y$10$DW69XbpCDN6aqPRFfOMVzOEldT15yPM3kSltk0kCjW4M1a/Z5/hsq', 1, 2, '0656015401', 'ahlamsaeed28.as@gmail.com', 1, 1, 1, 1, '1622702228', '2021-06-03 06:37:08', '2021-07-10 22:21:13'),
(1111, 'Nafissatou', 'C', 'Cisse', 'nafi', '$2y$10$xybcOKLdl39lKhzk/cI5.uOT6clyWCmqfD0LzCs0wsrunYvhTsZxq', 1, 2, '+221774054923', 'nafissatou.sn@gmail.com', 1, 1, 1, 1, '1622714644', '2021-06-03 10:04:04', '2021-06-03 13:06:22'),
(1112, 'ALEX ', 'CHARLES', 'KILULU', 'ALEX KILULU', '$2y$10$HOdZY0Dv/tYGxOSaFMDkLeiP0wbJ2wztp4A0MBer3Y0U9VzF8nNcK', 1, 2, '0755801523', 'alexkilulu41@gmail.com', 1, 1, 1, 1, '1622988929', '2021-06-06 14:15:29', '2021-06-06 17:17:15'),
(1113, 'Rehema', 'Richard', 'Mike', 'rayc', '$2y$10$03NC.49YnbHBPFlqJggoTuXsoQyhqpQvvKlzfrofKusnR0s/LJ8SW', 1, 2, '0742947305', 'reyoncee@gmail.com', 1, 1, 1, 1, '1623096858', '2021-06-07 20:14:18', '2021-06-07 23:15:48'),
(1114, 'Lupo', 'Bonaventura', 'Chambaka', 'lupo.chambaka@gmail.', '$2y$10$nfXp4mOWfdhYz6qEQEaqpeE1GdXvTe2mKABWPKvQVo4M5YkqEdrWS', 1, 2, '+255753493500', 'lupo.chambaka@gmail.com', 1, 1, 1, 1, '1623214542', '2021-06-09 04:55:42', '2021-07-17 17:30:19'),
(1115, 'Stan', 'Mafung\'a', 'Mafung\'a', 'smafung\'a', '$2y$10$IQjS4GXr6NPye7jK.QrxGe3U0xKcpJ9lww.av4lYaZ2rlFHus/gg.', 1, 2, '0716655331', 'smafung\'a@ihi.or.tz', 1, 1, 1, 0, '1623493014', '2021-06-12 10:16:55', NULL),
(1116, 'Test', 'Test', 'Test', 'testuser', '$2y$10$8XnkBPTlLO9VEUnfRWiv3OC.Tet7nQ40bgsBtsIAl0MKBK0RXNNgK', 1, 2, '0786666', 'sskiware@gmail.com', 1, 1, 1, 1, '1623612683', '2021-06-13 19:31:23', '2021-06-13 22:32:15'),
(1117, 'Sameen', 'N/A', 'Babur', 'sbabur', '$2y$10$zZPRGfwgwBDyAskttgrg0usEFCHyTz16a8Rnk1KJmSzT8wQwRJcCC', 1, 2, '16179916683', 'sbabur@clintonhealthaccess.org', 1, 1, 1, 1, '1623769999', '2021-06-15 15:13:19', '2021-06-16 00:01:03'),
(1118, 'Cive', 'M', 'Msc', 'civemsc2016', '$2y$10$de3v/s6iZUo3WKjseTEFbeinZNL44fsBy37FLr3nup03sbhG5Bqni', 1, 2, '+255785415678', 'civemsc2016@gmail.com', 1, 1, 1, 1, '1624899354', '2021-06-28 16:55:54', '2021-06-28 20:03:00'),
(1119, 'Sintia', 'Layla', 'Tamele', 'Sintia Tamele', '$2y$10$CVvpLwmfKwPoABx9l1866OPU0fSF2p53fCHTut6Ov7BJTsU1cZm6y', 1, 2, '+258845650008', 'sintia@tchautchaumalaria.com', 1, 1, 1, 1, '1625147048', '2021-07-01 13:44:08', '2021-07-01 16:49:32'),
(1120, 'Deogratius', 'Roman', 'Kavishe', 'e-dekavishe', '$2y$10$D1S7dnZ.NaoqXGGdO4vXSuqI.oBS9uy/lbTOp5WknY93SGFc.BbzW', 1, 2, '+255752440654', 'droman@ihi.or.tz', 1, 1, 1, 1, '1625730559', '2021-07-08 07:49:19', '2021-07-29 17:48:48'),
(1121, 'Issa', 'Moshi', 'Kapande', 'Moshi', '$2y$10$uV2u3r1i35Zx.e.FbECkSeMB4aYzw8UUigPKpUEUKRskHgariVm8u', 1, 2, '0762924798', 'issayamoshi@gmail.com', 1, 1, 1, 0, '1627041053', '2021-07-23 11:50:53', NULL),
(1122, 'Issa', 'Moshi', 'Kapande', 'Essiry', '$2y$10$kYebi8miIP5aFNq0rSehcuFOBGMJAA47NDGgFoKtiP2LVNbp.MCCK', 1, 2, '0762924798', 'jch890@alumni.ku.dk', 1, 1, 1, 1, '1627279938', '2021-07-26 06:12:18', '2021-07-26 17:04:10');

-- --------------------------------------------------------

--
-- Table structure for table `staffcategory`
--

DROP TABLE IF EXISTS `staffcategory`;
CREATE TABLE IF NOT EXISTS `staffcategory` (
  `id` int NOT NULL COMMENT 'Hold primary key of staff category group',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Hold name of staff group',
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Hold description of staff group according to the activities doing',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `staffcategory`
--

INSERT INTO `staffcategory` (`id`, `name`, `description`) VALUES
(1, 'Scientist', 'Perform scientist approve'),
(2, 'Supervisor', 'Perform supervision of project'),
(3, 'Volunteer', 'Help scientist/ supervisor'),
(4, 'Data Clerk', 'Perform insertion of data in the system'),
(5, 'Laboratory Technician', 'Perform laboratoy experiment ');

-- --------------------------------------------------------

--
-- Table structure for table `staff_groups`
--

DROP TABLE IF EXISTS `staff_groups`;
CREATE TABLE IF NOT EXISTS `staff_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `group_level` int NOT NULL,
  `group_status` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_level` (`group_level`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `staff_groups`
--

INSERT INTO `staff_groups` (`id`, `group_name`, `group_level`, `group_status`) VALUES
(1, 'System Manager', 1, 1),
(2, 'Power user', 2, 1),
(3, 'User', 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `taxon`
--

DROP TABLE IF EXISTS `taxon`;
CREATE TABLE IF NOT EXISTS `taxon` (
  `taxon_code` int NOT NULL COMMENT 'Store taxon code ',
  `taxon_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Store taxon name ',
  `taxon_desc` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'no description' COMMENT 'Store taxon description ',
  PRIMARY KEY (`taxon_code`),
  KEY `taxon_code` (`taxon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `taxon`
--

INSERT INTO `taxon` (`taxon_code`, `taxon_name`, `taxon_desc`) VALUES
(-99, 'No data', 'no description'),
(1, 'An. gambiae s.l.', 'no description'),
(2, 'An. funestus', 'no description'),
(3, 'An. coustani', 'no description'),
(4, 'An. pharoensis', 'no description'),
(5, 'An. squamosus', 'no description'),
(6, 'An. maculipalpis', 'no description'),
(7, 'An. pretoriensis', 'no description'),
(8, 'An. paludis', 'no description'),
(9, 'An. wellcomei', 'no description'),
(10, 'An. ziemanni', 'no description'),
(11, 'An. rufipes', 'no description'),
(49, 'Anopheles sp.', 'no description'),
(50, 'Culex sp.', 'no description'),
(60, 'Mansonia sp.', 'no description'),
(70, 'Aedes sp.', 'no description'),
(71, 'Ae. aegypti', 'no description'),
(80, 'Coquilettidia sp.', 'no description'),
(98, 'Unknown', 'no description');

-- --------------------------------------------------------

--
-- Table structure for table `token_key`
--

DROP TABLE IF EXISTS `token_key`;
CREATE TABLE IF NOT EXISTS `token_key` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `valid` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
