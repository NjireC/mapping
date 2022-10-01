-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 15, 2021 at 04:07 PM
-- Server version: 8.0.21
-- PHP Version: 7.4.9

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mdb_main`
--

-- --------------------------------------------------------

--
-- Table structure for table `1_audit_trail`
--

DROP TABLE IF EXISTS `1_audit_trail`;
CREATE TABLE IF NOT EXISTS `1_audit_trail` (
  `auditid` int NOT NULL AUTO_INCREMENT,
  `auditsen` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `auditfr` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `auditformtype` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `audituser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `auditdate` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `auditaction` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `auditdetail` varchar(350) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`auditid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `1_bodypart`
--

DROP TABLE IF EXISTS `1_bodypart`;
CREATE TABLE IF NOT EXISTS `1_bodypart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `number` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bp` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `1_cluster`
--

DROP TABLE IF EXISTS `1_cluster`;
CREATE TABLE IF NOT EXISTS `1_cluster` (
  `id` int NOT NULL AUTO_INCREMENT,
  `number` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cr` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `1_colonycode`
--

DROP TABLE IF EXISTS `1_colonycode`;
CREATE TABLE IF NOT EXISTS `1_colonycode` (
  `id` int NOT NULL AUTO_INCREMENT,
  `number` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cc` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `1_compound`
--

DROP TABLE IF EXISTS `1_compound`;
CREATE TABLE IF NOT EXISTS `1_compound` (
  `id` int NOT NULL AUTO_INCREMENT,
  `number` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cp` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `1_custgraph`
--

DROP TABLE IF EXISTS `1_custgraph`;
CREATE TABLE IF NOT EXISTS `1_custgraph` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pc` int NOT NULL,
  `location` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `num_split` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `p_attri` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `p_attri2` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `1_custlabel`
--

DROP TABLE IF EXISTS `1_custlabel`;
CREATE TABLE IF NOT EXISTS `1_custlabel` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pc` int NOT NULL,
  `location` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `num_split` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `p_attri` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `p_attri2` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `1_ed1`
--

DROP TABLE IF EXISTS `1_ed1`;
CREATE TABLE IF NOT EXISTS `1_ed1` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Hold data which is auto increment links to SS',
  `projectregsite_id` int NOT NULL COMMENT 'Store value from table projectregsite id',
  `sen` int NOT NULL COMMENT 'unique identifier for ED1 form',
  `fr` int NOT NULL COMMENT 'unique identifier of each row on the data collected',
  `dt` date NOT NULL COMMENT 'date of collection (morning on which the mosquitoes were collected)',
  `re` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT 'Region (Define specific Region in the Country)',
  `di` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT 'District (Define specific District in a Region )',
  `sec` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT 'Sector/Council (Define specific Sector in the District)',
  `cew` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT 'Cell/Ward (Define specific Cell/ in the Sector)',
  `vis` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT 'Village/Street (Define specific Village/Street in the Cell/Ward)',
  `ea` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT 'Enumaration area (Define geographic location within the study site)',
  `cr` bigint DEFAULT '0' COMMENT 'Cluster (The smallest geographic statistical unit within enumaration area)',
  `cp` int DEFAULT '0' COMMENT 'Compound or Plot (A specific physical area within an identifiable owner)',
  `tcu` bigint DEFAULT '-99' COMMENT 'Hold Ten Cell Unit',
  `hh` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT 'Household (A person or group of people who live together in the same dwelling unit)',
  `nah` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT 'Animals in Household (An animal or group of animals who live together with people in same dwelling unit)',
  `sid` int DEFAULT '0' COMMENT 'Structure ID (A free standing building that can have one or more room for residential or commercial use)',
  `me` int NOT NULL DEFAULT '-99' COMMENT 'Method (The method by which the mosquitoes were collected or trapped)',
  `ind` int NOT NULL COMMENT 'hold collection was made indoors a house or hut',
  `ht` int DEFAULT NULL COMMENT 'Habitat Type (Classification of the aquatic habitat in which the collection was made)',
  `st` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Start Time (The time that the collection started in 24 time )',
  `ft` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Finish Time (The time that the collection finish in 24 time)',
  `hp` int DEFAULT NULL COMMENT 'Hold Period (The period of time for which the mosquitoes were held for survival analysis after they were collected)',
  `rnd` int DEFAULT '-99' COMMENT 'Round (One cycle or rotation of the treatment )',
  `blk` int DEFAULT '-99' COMMENT 'Block (A set of position through which treatments are rotated in a Latin)',
  `shh` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '-99' COMMENT 'A project specific house or experiment hut',
  `stn` int DEFAULT '-99' COMMENT 'A project specific where station where a trap may be positioned',
  `vi` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Initial of person that caught the mosquitoes',
  `tr` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Treatment (Coding for the unique experimental treatment)',
  `dy` int DEFAULT '-99' COMMENT 'Experiment Day (The consecutive nth day since the experiment commenced)',
  `tmp` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Temperature',
  `hmd` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Humidity',
  `ws` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'wind speed',
  `hs` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '-99' COMMENT 'Number of household sampled',
  `vc` int DEFAULT '2' COMMENT 'Legitimacy of the collection',
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'On site observation about the collection',
  `gps` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Site geolocation',
  `dsen` int NOT NULL COMMENT 'Destination form serial number',
  `livestock` int DEFAULT NULL,
  `hoccupant` int DEFAULT NULL,
  `heaves` int DEFAULT NULL,
  `nss` int DEFAULT NULL,
  `nbh` int DEFAULT NULL,
  `oth` int DEFAULT NULL,
  `sn` int DEFAULT '-99' COMMENT 'Season',
  `wtc` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '-99' COMMENT 'Weather Conditions',
  `agrt` int DEFAULT '-99' COMMENT 'Agriculture',
  `invn` int DEFAULT '-99' COMMENT 'Intervention',
  `lvk` int DEFAULT '-99' COMMENT 'Livestock',
  `rfe` int DEFAULT '-99' COMMENT 'Roof type',
  `wle` int DEFAULT '-99' COMMENT 'Wall type',
  `evs` int DEFAULT '-99' COMMENT 'Eaves',
  `bv` int DEFAULT '-99' COMMENT 'Block ventilation',
  `bvs` int DEFAULT '-99' COMMENT 'Block ventilation screening',
  `wsn` int DEFAULT '-99' COMMENT 'Window screening',
  `wsnc` int DEFAULT '-99' COMMENT 'Window screening Condition',
  `ckl` int DEFAULT '-99' COMMENT 'Cooking location',
  `cke` int DEFAULT '-99' COMMENT 'Cooking Energy source',
  `sp` int DEFAULT '-99' COMMENT 'Sprayed',
  `lsd` date DEFAULT NULL COMMENT 'Last spray date',
  `ise` int DEFAULT '-99' COMMENT 'Insectside',
  `userid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Submitted by userid',
  `submitted` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Channel used to submit',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`projectregsite_id`,`userid`,`sen`,`fr`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `1_ed1`
--

INSERT INTO `1_ed1` (`id`, `projectregsite_id`, `sen`, `fr`, `dt`, `re`, `di`, `sec`, `cew`, `vis`, `ea`, `cr`, `cp`, `tcu`, `hh`, `nah`, `sid`, `me`, `ind`, `ht`, `st`, `ft`, `hp`, `rnd`, `blk`, `shh`, `stn`, `vi`, `tr`, `dy`, `tmp`, `hmd`, `ws`, `hs`, `vc`, `notes`, `gps`, `dsen`, `livestock`, `hoccupant`, `heaves`, `nss`, `nbh`, `oth`, `sn`, `wtc`, `agrt`, `invn`, `lvk`, `rfe`, `wle`, `evs`, `bv`, `bvs`, `wsn`, `wsnc`, `ckl`, `cke`, `sp`, `lsd`, `ise`, `userid`, `submitted`, `created_at`, `updated_at`) VALUES
(1, 5, 1, 1, '2020-01-06', '0', '0', '0', '0', '0', '1', 0, 0, -99, '0', '0', 0, 3, 1, NULL, '18:00', '6:00', NULL, -99, -99, '-99', -99, 'DM', NULL, -99, NULL, NULL, NULL, '-99', 1, '', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, -99, '-99', -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, NULL, -99, '1001', 'submitted_via_web', '2021-09-15 14:45:04', '2021-09-15 14:45:04'),
(2, 5, 1, 2, '2020-04-15', '0', '0', '0', '0', '0', '1', 0, 0, -99, '0', '0', 0, 1, 2, NULL, '18:00', '6:00', NULL, -99, -99, '-99', -99, 'DM', NULL, -99, NULL, NULL, NULL, '-99', 1, '', NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, -99, '-99', -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, NULL, -99, '1001', 'submitted_via_web', '2021-09-15 14:45:04', '2021-09-15 14:45:04'),
(3, 5, 1, 3, '2020-01-06', '0', '0', '0', '0', '0', '1', 0, 0, -99, '0', '0', 0, 4, 2, NULL, '18:00', '6:00', NULL, -99, -99, '-99', -99, 'DM', NULL, -99, NULL, NULL, NULL, '-99', 1, '', NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, -99, '-99', -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, NULL, -99, '1001', 'submitted_via_web', '2021-09-15 14:45:04', '2021-09-15 14:45:04'),
(4, 5, 1, 4, '2020-01-27', '0', '0', '0', '0', '0', '1', 0, 0, -99, '0', '0', 0, 3, 1, NULL, '18:00', '6:00', NULL, -99, -99, '-99', -99, 'DM', NULL, -99, NULL, NULL, NULL, '-99', 1, '', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, -99, '-99', -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, NULL, -99, '1001', 'submitted_via_web', '2021-09-15 14:45:04', '2021-09-15 14:45:04'),
(5, 5, 1, 5, '2020-01-27', '0', '0', '0', '0', '0', '1', 0, 0, -99, '0', '0', 0, 3, 2, NULL, '18:00', '6:00', NULL, -99, -99, '-99', -99, 'DM', NULL, -99, NULL, NULL, NULL, '-99', 1, '', NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL, -99, '-99', -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, NULL, -99, '1001', 'submitted_via_web', '2021-09-15 14:45:04', '2021-09-15 14:45:04'),
(6, 5, 1, 6, '2020-01-27', '0', '0', '0', '0', '0', '1', 0, 0, -99, '0', '0', 0, 4, 2, NULL, '18:00', '6:00', NULL, -99, -99, '-99', -99, 'DM', NULL, -99, NULL, NULL, NULL, '-99', 1, '', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, -99, '-99', -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, NULL, -99, '1001', 'submitted_via_web', '2021-09-15 14:45:04', '2021-09-15 14:45:04'),
(7, 5, 1, 7, '2020-01-28', '0', '0', '0', '0', '0', '1', 0, 0, -99, '0', '0', 0, 3, 1, NULL, '18:00', '6:00', NULL, -99, -99, '-99', -99, 'DM', NULL, -99, NULL, NULL, NULL, '-99', 1, '', NULL, 8, NULL, NULL, NULL, NULL, NULL, NULL, -99, '-99', -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, NULL, -99, '1001', 'submitted_via_web', '2021-09-15 14:45:04', '2021-09-15 14:45:04'),
(8, 5, 1, 8, '2020-01-28', '0', '0', '0', '0', '0', '1', 0, 0, -99, '0', '0', 0, 3, 2, NULL, '18:00', '6:00', NULL, -99, -99, '-99', -99, 'DM', NULL, -99, NULL, NULL, NULL, '-99', 1, '', NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, -99, '-99', -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, NULL, -99, '1001', 'submitted_via_web', '2021-09-15 14:45:04', '2021-09-15 14:45:04'),
(9, 5, 1, 9, '2020-01-28', '0', '0', '0', '0', '0', '1', 0, 0, -99, '0', '0', 0, 4, 2, NULL, '18:00', '6:00', NULL, -99, -99, '-99', -99, 'DM', NULL, -99, NULL, NULL, NULL, '-99', 1, '', NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, -99, '-99', -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, NULL, -99, '1001', 'submitted_via_web', '2021-09-15 14:45:04', '2021-09-15 14:45:04'),
(10, 5, 9, 2, '2020-04-15', '0', '0', '0', '0', '0', '2', 0, 0, -99, '0', '0', 0, 1, 2, NULL, '18:00', '6:00', NULL, -99, -99, '-99', -99, 'DM', NULL, -99, NULL, NULL, NULL, '-99', 1, '', NULL, 11, NULL, NULL, NULL, NULL, NULL, NULL, -99, '-99', -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, NULL, -99, '1001', 'submitted_via_web', '2021-09-15 14:45:04', '2021-09-15 14:45:04'),
(11, 5, 10, 2, '2020-04-16', '0', '0', '0', '0', '0', '2', 0, 0, -99, '0', '0', 0, 1, 2, NULL, '18:00', '6:00', NULL, -99, -99, '-99', -99, 'DM', NULL, -99, NULL, NULL, NULL, '-99', 1, '', NULL, 12, NULL, NULL, NULL, NULL, NULL, NULL, -99, '-99', -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, NULL, -99, '1001', 'submitted_via_web', '2021-09-15 14:45:04', '2021-09-15 14:45:04'),
(12, 5, 11, 2, '2020-02-07', '0', '0', '0', '0', '0', '2', 0, 0, -99, '0', '0', 0, 3, 2, NULL, '18:00', '6:00', NULL, -99, -99, '-99', -99, 'DM', NULL, -99, NULL, NULL, NULL, '-99', 1, '', NULL, 13, NULL, NULL, NULL, NULL, NULL, NULL, -99, '-99', -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, NULL, -99, '1001', 'submitted_via_web', '2021-09-15 14:45:04', '2021-09-15 14:45:04'),
(13, 5, 11, 3, '2020-02-07', '0', '0', '0', '0', '0', '2', 0, 0, -99, '0', '0', 0, 4, 2, NULL, '18:00', '6:00', NULL, -99, -99, '-99', -99, 'DM', NULL, -99, NULL, NULL, NULL, '-99', 1, '', NULL, 14, NULL, NULL, NULL, NULL, NULL, NULL, -99, '-99', -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, NULL, -99, '1001', 'submitted_via_web', '2021-09-15 14:45:04', '2021-09-15 14:45:04'),
(14, 5, 11, 4, '2020-02-19', '0', '0', '0', '0', '0', '2', 0, 0, -99, '0', '0', 0, 3, 1, NULL, '18:00', '6:00', NULL, -99, -99, '-99', -99, 'DM', NULL, -99, NULL, NULL, NULL, '-99', 1, '', NULL, 15, NULL, NULL, NULL, NULL, NULL, NULL, -99, '-99', -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, NULL, -99, '1001', 'submitted_via_web', '2021-09-15 14:45:04', '2021-09-15 14:45:04'),
(15, 5, 11, 5, '2020-02-19', '0', '0', '0', '0', '0', '2', 0, 0, -99, '0', '0', 0, 3, 2, NULL, '18:00', '6:00', NULL, -99, -99, '-99', -99, 'DM', NULL, -99, NULL, NULL, NULL, '-99', 1, '', NULL, 16, NULL, NULL, NULL, NULL, NULL, NULL, -99, '-99', -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, NULL, -99, '1001', 'submitted_via_web', '2021-09-15 14:45:04', '2021-09-15 14:45:04'),
(16, 5, 11, 6, '2020-02-19', '0', '0', '0', '0', '0', '2', 0, 0, -99, '0', '0', 0, 4, 2, NULL, '18:00', '6:00', NULL, -99, -99, '-99', -99, 'DM', NULL, -99, NULL, NULL, NULL, '-99', 1, '', NULL, 17, NULL, NULL, NULL, NULL, NULL, NULL, -99, '-99', -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, NULL, -99, '1001', 'submitted_via_web', '2021-09-15 14:45:04', '2021-09-15 14:45:04'),
(17, 5, 11, 7, '2020-03-03', '0', '0', '0', '0', '0', '2', 0, 0, -99, '0', '0', 0, 3, 1, NULL, '18:00', '6:00', NULL, -99, -99, '-99', -99, 'DM', NULL, -99, NULL, NULL, NULL, '-99', 1, '', NULL, 18, NULL, NULL, NULL, NULL, NULL, NULL, -99, '-99', -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, NULL, -99, '1001', 'submitted_via_web', '2021-09-15 14:45:04', '2021-09-15 14:45:04'),
(18, 5, 11, 8, '2020-03-03', '0', '0', '0', '0', '0', '2', 0, 0, -99, '0', '0', 0, 3, 2, NULL, '18:00', '6:00', NULL, -99, -99, '-99', -99, 'DM', NULL, -99, NULL, NULL, NULL, '-99', 1, '', NULL, 19, NULL, NULL, NULL, NULL, NULL, NULL, -99, '-99', -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, NULL, -99, '1001', 'submitted_via_web', '2021-09-15 14:45:04', '2021-09-15 14:45:04'),
(19, 5, 11, 9, '2020-03-03', '0', '0', '0', '0', '0', '2', 0, 0, -99, '0', '0', 0, 4, 2, NULL, '18:00', '6:00', NULL, -99, -99, '-99', -99, 'DM', NULL, -99, NULL, NULL, NULL, '-99', 1, '', NULL, 20, NULL, NULL, NULL, NULL, NULL, NULL, -99, '-99', -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, NULL, -99, '1001', 'submitted_via_web', '2021-09-15 14:45:04', '2021-09-15 14:45:04'),
(20, 5, 21, 1, '2020-03-20', '0', '0', '0', '0', '0', '3', 0, 0, -99, '0', '0', 0, 3, 1, NULL, '18:00', '6:00', NULL, -99, -99, '-99', -99, 'DM', NULL, -99, NULL, NULL, NULL, '-99', 1, '', NULL, 22, NULL, NULL, NULL, NULL, NULL, NULL, -99, '-99', -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, NULL, -99, '1001', 'submitted_via_web', '2021-09-15 14:45:04', '2021-09-15 14:45:04'),
(21, 5, 21, 2, '2020-03-20', '0', '0', '0', '0', '0', '3', 0, 0, -99, '0', '0', 0, 3, 2, NULL, '18:00', '6:00', NULL, -99, -99, '-99', -99, 'DM', NULL, -99, NULL, NULL, NULL, '-99', 1, '', NULL, 23, NULL, NULL, NULL, NULL, NULL, NULL, -99, '-99', -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, NULL, -99, '1001', 'submitted_via_web', '2021-09-15 14:45:04', '2021-09-15 14:45:04'),
(22, 5, 21, 3, '2020-03-20', '0', '0', '0', '0', '0', '3', 0, 0, -99, '0', '0', 0, 4, 2, NULL, '18:00', '6:00', NULL, -99, -99, '-99', -99, 'DM', NULL, -99, NULL, NULL, NULL, '-99', 1, '', NULL, 24, NULL, NULL, NULL, NULL, NULL, NULL, -99, '-99', -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, NULL, -99, '1001', 'submitted_via_web', '2021-09-15 14:45:04', '2021-09-15 14:45:04'),
(23, 5, 21, 4, '2020-04-07', '0', '0', '0', '0', '0', '3', 0, 0, -99, '0', '0', 0, 3, 1, NULL, '18:00', '6:00', NULL, -99, -99, '-99', -99, 'DM', NULL, -99, NULL, NULL, NULL, '-99', 1, '', NULL, 25, NULL, NULL, NULL, NULL, NULL, NULL, -99, '-99', -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, NULL, -99, '1001', 'submitted_via_web', '2021-09-15 14:45:04', '2021-09-15 14:45:04'),
(24, 5, 21, 5, '2020-04-07', '0', '0', '0', '0', '0', '3', 0, 0, -99, '0', '0', 0, 3, 2, NULL, '18:00', '6:00', NULL, -99, -99, '-99', -99, 'DM', NULL, -99, NULL, NULL, NULL, '-99', 1, '', NULL, 26, NULL, NULL, NULL, NULL, NULL, NULL, -99, '-99', -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, NULL, -99, '1001', 'submitted_via_web', '2021-09-15 14:45:04', '2021-09-15 14:45:04'),
(25, 5, 21, 6, '2020-04-07', '0', '0', '0', '0', '0', '3', 0, 0, -99, '0', '0', 0, 4, 2, NULL, '18:00', '6:00', NULL, -99, -99, '-99', -99, 'DM', NULL, -99, NULL, NULL, NULL, '-99', 1, '', NULL, 27, NULL, NULL, NULL, NULL, NULL, NULL, -99, '-99', -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, NULL, -99, '1001', 'submitted_via_web', '2021-09-15 14:45:04', '2021-09-15 14:45:04'),
(26, 5, 21, 7, '2020-04-08', '0', '0', '0', '0', '0', '3', 0, 0, -99, '0', '0', 0, 3, 1, NULL, '18:00', '6:00', NULL, -99, -99, '-99', -99, 'DM', NULL, -99, NULL, NULL, NULL, '-99', 1, '', NULL, 28, NULL, NULL, NULL, NULL, NULL, NULL, -99, '-99', -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, NULL, -99, '1001', 'submitted_via_web', '2021-09-15 14:45:04', '2021-09-15 14:45:04'),
(27, 5, 21, 8, '2020-04-08', '0', '0', '0', '0', '0', '3', 0, 0, -99, '0', '0', 0, 3, 2, NULL, '18:00', '6:00', NULL, -99, -99, '-99', -99, 'DM', NULL, -99, NULL, NULL, NULL, '-99', 1, '', NULL, 29, NULL, NULL, NULL, NULL, NULL, NULL, -99, '-99', -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, NULL, -99, '1001', 'submitted_via_web', '2021-09-15 14:45:04', '2021-09-15 14:45:04'),
(28, 5, 21, 9, '2020-04-08', '0', '0', '0', '0', '0', '3', 0, 0, -99, '0', '0', 0, 4, 2, NULL, '18:00', '6:00', NULL, -99, -99, '-99', -99, 'DM', NULL, -99, NULL, NULL, NULL, '-99', 1, '', NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, -99, '-99', -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, NULL, -99, '1001', 'submitted_via_web', '2021-09-15 14:45:04', '2021-09-15 14:45:04'),
(29, 5, 30, 1, '2020-04-16', '0', '0', '0', '0', '0', '1', 0, 0, -99, '0', '0', 0, 1, 1, NULL, '19:00', '6:00', NULL, -99, -99, '-99', -99, 'DM', NULL, -99, NULL, NULL, NULL, '-99', 1, '', NULL, 31, NULL, NULL, NULL, NULL, NULL, NULL, -99, '-99', -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, NULL, -99, '1001', 'submitted_via_web', '2021-09-15 14:45:04', '2021-09-15 14:45:04'),
(30, 5, 30, 2, '2020-04-16', '0', '0', '0', '0', '0', '1', 0, 0, -99, '0', '0', 0, 1, 2, NULL, '19:00', '6:00', NULL, -99, -99, '-99', -99, 'DM', NULL, -99, NULL, NULL, NULL, '-99', 1, '', NULL, 32, NULL, NULL, NULL, NULL, NULL, NULL, -99, '-99', -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, NULL, -99, '1001', 'submitted_via_web', '2021-09-15 14:45:04', '2021-09-15 14:45:04'),
(31, 5, 31, 2, '2020-04-15', '0', '0', '0', '0', '0', '1', 0, 0, -99, '0', '0', 0, 3, 2, NULL, '18:00', '6:00', NULL, -99, -99, '-99', -99, 'DM', NULL, -99, NULL, NULL, NULL, '-99', 1, '', NULL, 33, NULL, NULL, NULL, NULL, NULL, NULL, -99, '-99', -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, NULL, -99, '1001', 'submitted_via_web', '2021-09-15 14:45:04', '2021-09-15 14:45:04'),
(32, 5, 31, 3, '2020-04-15', '0', '0', '0', '0', '0', '1', 0, 0, -99, '0', '0', 0, 4, 2, NULL, '18:00', '6:00', NULL, -99, -99, '-99', -99, 'DM', NULL, -99, NULL, NULL, NULL, '-99', 1, '', NULL, 34, NULL, NULL, NULL, NULL, NULL, NULL, -99, '-99', -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, NULL, -99, '1001', 'submitted_via_web', '2021-09-15 14:45:04', '2021-09-15 14:45:04'),
(33, 5, 31, 4, '2020-04-22', '0', '0', '0', '0', '0', '1', 0, 0, -99, '0', '0', 0, 3, 1, NULL, '18:00', '6:00', NULL, -99, -99, '-99', -99, 'DM', NULL, -99, NULL, NULL, NULL, '-99', 1, '', NULL, 35, NULL, NULL, NULL, NULL, NULL, NULL, -99, '-99', -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, NULL, -99, '1001', 'submitted_via_web', '2021-09-15 14:45:04', '2021-09-15 14:45:04'),
(34, 5, 31, 5, '2020-04-22', '0', '0', '0', '0', '0', '1', 0, 0, -99, '0', '0', 0, 3, 2, NULL, '18:00', '6:00', NULL, -99, -99, '-99', -99, 'DM', NULL, -99, NULL, NULL, NULL, '-99', 1, '', NULL, 36, NULL, NULL, NULL, NULL, NULL, NULL, -99, '-99', -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, NULL, -99, '1001', 'submitted_via_web', '2021-09-15 14:45:04', '2021-09-15 14:45:04'),
(35, 5, 31, 6, '2020-04-22', '0', '0', '0', '0', '0', '2', 0, 0, -99, '0', '0', 0, 4, 2, NULL, '18:00', '6:00', NULL, -99, -99, '-99', -99, 'DM', NULL, -99, NULL, NULL, NULL, '-99', 1, '', NULL, 37, NULL, NULL, NULL, NULL, NULL, NULL, -99, '-99', -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, NULL, -99, '1001', 'submitted_via_web', '2021-09-15 14:45:04', '2021-09-15 14:45:04'),
(36, 5, 31, 7, '2020-05-01', '0', '0', '0', '0', '0', '2', 0, 0, -99, '0', '0', 0, 3, 1, NULL, '18:00', '6:00', NULL, -99, -99, '-99', -99, 'DM', NULL, -99, NULL, NULL, NULL, '-99', 1, '', NULL, 38, NULL, NULL, NULL, NULL, NULL, NULL, -99, '-99', -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, NULL, -99, '1001', 'submitted_via_web', '2021-09-15 14:45:04', '2021-09-15 14:45:04'),
(37, 5, 31, 8, '2020-05-01', '0', '0', '0', '0', '0', '2', 0, 0, -99, '0', '0', 0, 3, 2, NULL, '18:00', '6:00', NULL, -99, -99, '-99', -99, 'DM', NULL, -99, NULL, NULL, NULL, '-99', 1, '', NULL, 39, NULL, NULL, NULL, NULL, NULL, NULL, -99, '-99', -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, NULL, -99, '1001', 'submitted_via_web', '2021-09-15 14:45:04', '2021-09-15 14:45:04'),
(38, 5, 31, 9, '2020-05-01', '0', '0', '0', '0', '0', '2', 0, 0, -99, '0', '0', 0, 4, 2, NULL, '18:00', '6:00', NULL, -99, -99, '-99', -99, 'DM', NULL, -99, NULL, NULL, NULL, '-99', 1, '', NULL, 40, NULL, NULL, NULL, NULL, NULL, NULL, -99, '-99', -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, NULL, -99, '1001', 'submitted_via_web', '2021-09-15 14:45:04', '2021-09-15 14:45:04'),
(39, 5, 65, 1, '2020-04-16', '0', '0', '0', '0', '0', '2', 0, 0, -99, '0', '0', 0, 1, 1, NULL, '19:00', '6:00', NULL, -99, -99, '-99', -99, 'DM', NULL, -99, NULL, NULL, NULL, '-99', 1, '', NULL, 66, NULL, NULL, NULL, NULL, NULL, NULL, -99, '-99', -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, NULL, -99, '1001', 'submitted_via_web', '2021-09-15 14:45:04', '2021-09-15 14:45:04'),
(40, 5, 65, 2, '2020-04-16', '0', '0', '0', '0', '0', '2', 0, 0, -99, '0', '0', 0, 1, 1, NULL, '19:00', '6:00', NULL, -99, -99, '-99', -99, 'DM', NULL, -99, NULL, NULL, NULL, '-99', 1, '', NULL, 67, NULL, NULL, NULL, NULL, NULL, NULL, -99, '-99', -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, NULL, -99, '1001', 'submitted_via_web', '2021-09-15 14:45:04', '2021-09-15 14:45:04'),
(41, 5, 70, 1, '2020-04-16', '0', '0', '0', '0', '0', '2', 0, 0, -99, '0', '0', 0, 1, 1, NULL, '19:00', '6:00', NULL, -99, -99, '-99', -99, 'DM', NULL, -99, NULL, NULL, NULL, '-99', 1, '', NULL, 71, NULL, NULL, NULL, NULL, NULL, NULL, -99, '-99', -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, NULL, -99, '1001', 'submitted_via_web', '2021-09-15 14:45:04', '2021-09-15 14:45:04'),
(42, 5, 70, 2, '2020-04-16', '0', '0', '0', '0', '0', '2', 0, 0, -99, '0', '0', 0, 1, 2, NULL, '19:00', '6:00', NULL, -99, -99, '-99', -99, 'DM', NULL, -99, NULL, NULL, NULL, '-99', 1, '', NULL, 72, NULL, NULL, NULL, NULL, NULL, NULL, -99, '-99', -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, NULL, -99, '1001', 'submitted_via_web', '2021-09-15 14:45:04', '2021-09-15 14:45:04');

-- --------------------------------------------------------

--
-- Table structure for table `1_ed1template`
--

DROP TABLE IF EXISTS `1_ed1template`;
CREATE TABLE IF NOT EXISTS `1_ed1template` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Hold data which is auto increment links to SS',
  `sen` int NOT NULL COMMENT 'unique identifier for ED1 form',
  `fr` int NOT NULL COMMENT 'unique identifier of each row on the data collected',
  `dt` date DEFAULT NULL COMMENT 'date of collection (morning on which the mosquitoes were collected)',
  `re` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT 'Region (Define specific Region in the Country)',
  `di` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT 'District (Define specific District in a Region )',
  `sec` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT 'Sector/Council (Define specific Sector in the District)',
  `cew` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT 'Cell/Ward (Define specific Cell/ in the Sector)',
  `vis` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT 'Village/Street (Define specific Village/Street in the Cell/Ward)',
  `ea` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT 'Enumaration area (Define geographic location within the study site)',
  `cr` bigint DEFAULT '0' COMMENT 'Cluster (The smallest geographic statistical unit within enumaration area)',
  `cp` int DEFAULT '0' COMMENT 'Compound or Plot (A specific physical area within an identifiable owner)',
  `tcu` bigint DEFAULT '-99' COMMENT 'Hold Ten Cell Unit',
  `hh` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT 'Household (A person or group of people who live together in the same dwelling unit)',
  `nah` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT 'Animals in Household (An animal or group of animals who live together with people in same dwelling unit)',
  `sid` int DEFAULT '0' COMMENT 'Structure ID (A free standing building that can have one or more room for residential or commercial use)',
  `me` int DEFAULT '-99' COMMENT 'Method (The method by which the mosquitoes were collected or trapped)',
  `ind` int DEFAULT NULL COMMENT 'hold collection was made indoors a house or hut',
  `ht` int DEFAULT NULL COMMENT 'Habitat Type (Classification of the aquatic habitat in which the collection was made)',
  `st` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Start Time (The time that the collection started in 24 time )',
  `ft` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Finish Time (The time that the collection finish in 24 time)',
  `hp` int DEFAULT NULL COMMENT 'Hold Period (The period of time for which the mosquitoes were held for survival analysis after they were collected)',
  `rnd` int DEFAULT '-99' COMMENT 'Round (One cycle or rotation of the treatment )',
  `blk` int DEFAULT '-99' COMMENT 'Block (A set of position through which treatments are rotated in a Latin)',
  `shh` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '-99' COMMENT 'A project specific house or experiment hut',
  `stn` int DEFAULT '-99' COMMENT 'A project specific where station where a trap may be positioned',
  `vi` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Initial of person that caught the mosquitoes',
  `tr` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Treatment (Coding for the unique experimental treatment)',
  `dy` int DEFAULT '-99' COMMENT 'Experiment Day (The consecutive nth day since the experiment commenced)',
  `tmp` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Temperature',
  `hmd` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Humidity',
  `ws` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'wind speed',
  `hs` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '-99' COMMENT 'Number of household sampled',
  `vc` int DEFAULT '2' COMMENT 'Legitimacy of the collection',
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'On site observation about the collection',
  `gps` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Site geolocation',
  `dsen` int NOT NULL COMMENT 'Destination form serial number',
  `livestock` int DEFAULT '-99',
  `hoccupant` int DEFAULT '-99',
  `heaves` int DEFAULT '-99',
  `nss` int DEFAULT '-99',
  `nbh` int DEFAULT '-99',
  `oth` int DEFAULT '-99',
  `sn` int DEFAULT '-99' COMMENT 'Season',
  `wtc` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '-99' COMMENT 'Weather Conditions',
  `agrt` int DEFAULT '-99' COMMENT 'Agriculture',
  `invn` int DEFAULT '-99' COMMENT 'Intervention',
  `lvk` int DEFAULT '-99' COMMENT 'Livestock',
  `rfe` int DEFAULT '-99' COMMENT 'Roof type',
  `wle` int DEFAULT '-99' COMMENT 'Wall type',
  `evs` int DEFAULT '-99' COMMENT 'Eaves',
  `bv` int DEFAULT '-99' COMMENT 'Block ventilation',
  `bvs` int DEFAULT '-99' COMMENT 'Block ventilation screening',
  `wsn` int DEFAULT '-99' COMMENT 'Window screening',
  `wsnc` int DEFAULT '-99' COMMENT 'Window screening Condition',
  `ckl` int DEFAULT '-99' COMMENT 'Cooking location',
  `cke` int DEFAULT '-99' COMMENT 'Cooking Energy source',
  `sp` int DEFAULT '-99' COMMENT 'Sprayed',
  `lsd` date DEFAULT NULL COMMENT 'Last spray date',
  `ise` int DEFAULT '-99' COMMENT 'Insectside',
  `userid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Submitted by userid',
  `submitted` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Channel used to submit',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `1_ed2`
--

DROP TABLE IF EXISTS `1_ed2`;
CREATE TABLE IF NOT EXISTS `1_ed2` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Hold data which is auto increment links to SS',
  `projectregsite_id` int NOT NULL COMMENT 'Store value from table projectregsite id (Foreign Key)',
  `sen` int NOT NULL COMMENT 'unique identifier for ED2 form',
  `fr` int NOT NULL COMMENT 'unique identifier of each row on the data collected',
  `ssen` int DEFAULT '-99',
  `sfr` int DEFAULT '-99',
  `slc` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '-99',
  `sbp` int DEFAULT '-99',
  `sst` int DEFAULT '-99',
  `ssid` int DEFAULT '-99',
  `scc` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '-99',
  `stx` int DEFAULT '-99' COMMENT 'Store taxon code foreign key from Taxon table',
  `ssas` int DEFAULT '-99' COMMENT 'Store sex code foreign key from SexAbdominal table',
  `ag` int DEFAULT '-99',
  `n` int NOT NULL COMMENT 'Store number of mosqutoes caught',
  `sd` date DEFAULT NULL COMMENT 'started date of the experiment',
  `st` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '-99' COMMENT 'started time of the experiment',
  `tr` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '-99' COMMENT 'Treatment (Coding for the unique experimental treatment)',
  `vi` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'NA' COMMENT 'Initial of person that caught the mosquitoes',
  `rnd` int DEFAULT '-99' COMMENT 'Round (One cycle or rotation of the treatment )',
  `dy` int DEFAULT '-99' COMMENT 'Experiment Day (The consecutive nth day since the experiment commenced)',
  `oth1` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '-99' COMMENT 'Other Any additional experimental details',
  `oth2` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '-99' COMMENT 'Pther Any additional experimental details',
  `oth3` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '-99' COMMENT 'Pther Any additional experimental details',
  `va` int DEFAULT NULL COMMENT 'Valid Assay Legitimacy of the experimental assay',
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'On site observation about the collection',
  `dsen` int NOT NULL COMMENT 'Destination form serial number',
  `userid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Submitted by userid',
  `submitted` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Channel used to submit',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`projectregsite_id`,`userid`,`sen`,`fr`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `1_edss`
--

DROP TABLE IF EXISTS `1_edss`;
CREATE TABLE IF NOT EXISTS `1_edss` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Hold data which is auto increment links to EDSS',
  `ed1id` int DEFAULT NULL COMMENT 'Hold data which is coming from Ed1',
  `ed2id` int DEFAULT NULL COMMENT 'Hold data which is coming from  Ed2',
  PRIMARY KEY (`id`),
  KEY `fk_edss_ed1id` (`ed1id`),
  KEY `fk_edss_ed2id` (`ed2id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `1_edss`
--

INSERT INTO `1_edss` (`id`, `ed1id`, `ed2id`) VALUES
(1, 1, NULL),
(2, 2, NULL),
(3, 3, NULL),
(4, 4, NULL),
(5, 5, NULL),
(6, 6, NULL),
(7, 7, NULL),
(8, 8, NULL),
(9, 9, NULL),
(10, 10, NULL),
(11, 11, NULL),
(12, 12, NULL),
(13, 13, NULL),
(14, 14, NULL),
(15, 15, NULL),
(16, 16, NULL),
(17, 17, NULL),
(18, 18, NULL),
(19, 19, NULL),
(20, 20, NULL),
(21, 21, NULL),
(22, 22, NULL),
(23, 23, NULL),
(24, 24, NULL),
(25, 25, NULL),
(26, 26, NULL),
(27, 27, NULL),
(28, 28, NULL),
(29, 29, NULL),
(30, 30, NULL),
(31, 31, NULL),
(32, 32, NULL),
(33, 33, NULL),
(34, 34, NULL),
(35, 35, NULL),
(36, 36, NULL),
(37, 37, NULL),
(38, 38, NULL),
(39, 39, NULL),
(40, 40, NULL),
(41, 41, NULL),
(42, 42, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `1_enumerationarea`
--

DROP TABLE IF EXISTS `1_enumerationarea`;
CREATE TABLE IF NOT EXISTS `1_enumerationarea` (
  `id` int NOT NULL AUTO_INCREMENT,
  `number` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ea` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `1_habitattype`
--

DROP TABLE IF EXISTS `1_habitattype`;
CREATE TABLE IF NOT EXISTS `1_habitattype` (
  `id` int NOT NULL AUTO_INCREMENT,
  `number` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ht` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `1_location`
--

DROP TABLE IF EXISTS `1_location`;
CREATE TABLE IF NOT EXISTS `1_location` (
  `id` int NOT NULL AUTO_INCREMENT,
  `number` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ind` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `1_location`
--

INSERT INTO `1_location` (`id`, `number`, `ind`) VALUES
(1, '1', 'In'),
(2, '2', 'Out');

-- --------------------------------------------------------

--
-- Table structure for table `1_method`
--

DROP TABLE IF EXISTS `1_method`;
CREATE TABLE IF NOT EXISTS `1_method` (
  `id` int NOT NULL AUTO_INCREMENT,
  `number` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `me` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `1_replicate`
--

DROP TABLE IF EXISTS `1_replicate`;
CREATE TABLE IF NOT EXISTS `1_replicate` (
  `id` int NOT NULL AUTO_INCREMENT,
  `number` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rep` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `1_sas`
--

DROP TABLE IF EXISTS `1_sas`;
CREATE TABLE IF NOT EXISTS `1_sas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `number` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sas` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `1_so1`
--

DROP TABLE IF EXISTS `1_so1`;
CREATE TABLE IF NOT EXISTS `1_so1` (
  `id_` int NOT NULL AUTO_INCREMENT COMMENT 'Hold data which is auto increment',
  `sssoid` int NOT NULL,
  `sen` int NOT NULL,
  `ssen` int NOT NULL,
  `sfr` int NOT NULL,
  `fr` int NOT NULL,
  `rc` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sbf` int DEFAULT NULL,
  `sslc` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sst` int DEFAULT NULL,
  `ssid` int NOT NULL,
  `stx` int DEFAULT NULL,
  `species` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'NRQ',
  `kdr` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'NRQ',
  `pf` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'NRQ',
  `pv` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'NRQ',
  `po` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'NRQ',
  `pm` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'NRQ',
  `human` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'NRQ',
  `chicken` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'NRQ',
  `goat` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'NRQ',
  `bovine` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'NRQ',
  `dog` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'NRQ',
  `cat` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'NRQ',
  `rat` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'NRQ',
  `bps` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'NRQ',
  `userid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Submitted by userid',
  `submitted` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Channel used to submit',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`sssoid`,`ssen`,`sfr`,`ssid`,`userid`),
  UNIQUE KEY `id_` (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `1_so2`
--

DROP TABLE IF EXISTS `1_so2`;
CREATE TABLE IF NOT EXISTS `1_so2` (
  `id_` int NOT NULL AUTO_INCREMENT COMMENT 'Hold data which is auto increment',
  `sssoid` int NOT NULL,
  `sen` int NOT NULL,
  `ssen` int NOT NULL,
  `sfr` int NOT NULL,
  `fr` int NOT NULL,
  `sbf` int DEFAULT NULL,
  `sslc` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sst` int DEFAULT NULL,
  `ssid` int NOT NULL,
  `stx` int DEFAULT NULL,
  `ssas` int DEFAULT NULL,
  `ms` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'NRQ',
  `pr` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'NRQ',
  `inf` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'NRQ',
  `os` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'NRQ',
  `wl` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'NRQ',
  `bps` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'NRQ',
  `userid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Submitted by userid',
  `submitted` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Channel used to submit',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`sssoid`,`ssen`,`sfr`,`ssid`,`userid`),
  UNIQUE KEY `id_` (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `1_sost`
--

DROP TABLE IF EXISTS `1_sost`;
CREATE TABLE IF NOT EXISTS `1_sost` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Hold data which is auto increment to links to SO',
  `so1id` int DEFAULT NULL COMMENT 'Hold data link to SS1',
  `so2id` int DEFAULT NULL COMMENT 'Hold data link to SS2',
  `so3id` int DEFAULT NULL COMMENT 'Hold data link to SS3',
  PRIMARY KEY (`id`),
  KEY `fk_ss1id` (`so1id`),
  KEY `fk_ss2id` (`so2id`),
  KEY `fk_ss3id` (`so3id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `1_ss1`
--

DROP TABLE IF EXISTS `1_ss1`;
CREATE TABLE IF NOT EXISTS `1_ss1` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Hold data which is auto increment to links to SO',
  `edssid` int NOT NULL COMMENT 'unique identifier for SS1 form',
  `sen` int NOT NULL COMMENT 'unique identifier for SS1 form',
  `ssen` int NOT NULL COMMENT 'unique identifier for SS1 form',
  `sfr` int NOT NULL COMMENT 'unique identifier for SS1 form',
  `bf` int DEFAULT '1' COMMENT 'body part (The body type of the sample)',
  `fr` int NOT NULL COMMENT 'unique identifier of each row on the data collected',
  `tx` int NOT NULL COMMENT 'taxon identification number',
  `sas` int NOT NULL COMMENT 'sex and abdominal status',
  `n` int NOT NULL COMMENT 'number of observed (Records the total number of mosquitoes observed in each specific subgroup)',
  `notes` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'NA',
  `slc` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'NA',
  `st` int DEFAULT '0' COMMENT 'sample type (Designates the category of sample as either individual or batch)',
  `ni` int DEFAULT '0' COMMENT 'no of individual ',
  `nb` int DEFAULT '0' COMMENT 'no of batched ',
  `sid01` int DEFAULT '0' COMMENT 'sample type sample identification 1',
  `sid02` int DEFAULT '0' COMMENT 'sample type sample identification 2',
  `sid03` int DEFAULT '0' COMMENT 'sample type sample identification 3',
  `sid04` int DEFAULT '0' COMMENT 'sample type sample identification 4',
  `sid05` int DEFAULT '0' COMMENT 'sample type sample identification 5',
  `sid06` int DEFAULT '0' COMMENT 'sample type sample identification 6',
  `sid07` int DEFAULT '0' COMMENT 'sample type sample identification 7',
  `nd` int DEFAULT NULL COMMENT 'number of discarded (This is the number of mosquitoes discarded)',
  `senfr` int NOT NULL,
  `userid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Submitted by userid',
  `submitted` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Channel used to submit',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`edssid`,`userid`,`sen`,`tx`,`sas`),
  UNIQUE KEY `id` (`id`),
  KEY `tx` (`tx`),
  KEY `bf` (`bf`),
  KEY `sas` (`sas`)
) ENGINE=InnoDB AUTO_INCREMENT=1070 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `1_ss1`
--

INSERT INTO `1_ss1` (`id`, `edssid`, `sen`, `ssen`, `sfr`, `bf`, `fr`, `tx`, `sas`, `n`, `notes`, `slc`, `st`, `ni`, `nb`, `sid01`, `sid02`, `sid03`, `sid04`, `sid05`, `sid06`, `sid07`, `nd`, `senfr`, `userid`, `submitted`, `created_at`, `updated_at`) VALUES
(2, 1, 2, 1, 1, 1, 2, 1, 2, 13, 'NA', 'NA', 1, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 22, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(4, 1, 2, 1, 1, 1, 3, 1, 3, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 23, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(1, 1, 2, 1, 1, 1, 1, 1, 4, 12, 'NA', 'NA', 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 21, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(5, 1, 2, 1, 1, 1, 5, 1, 5, 6, 'NA', 'NA', 1, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 25, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(6, 1, 2, 1, 1, 1, 6, 1, 6, 23, 'NA', 'NA', 1, 23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 26, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(7, 1, 2, 1, 1, 1, 7, 2, 1, 14, 'NA', 'NA', 1, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 27, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(3, 1, 2, 1, 1, 1, 2, 2, 2, 8, 'NA', 'NA', 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 22, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(8, 1, 2, 1, 1, 1, 9, 2, 3, 12, 'NA', 'NA', 1, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 29, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(9, 1, 2, 1, 1, 1, 10, 2, 4, 20, 'NA', 'NA', 1, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 210, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(10, 1, 2, 1, 1, 1, 11, 2, 5, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 211, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(11, 1, 2, 1, 1, 1, 12, 2, 6, 33, 'NA', 'NA', 1, 33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 212, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(12, 1, 2, 1, 1, 1, 15, 3, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 215, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(13, 1, 2, 1, 1, 1, 16, 3, 2, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 216, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(14, 1, 2, 1, 1, 1, 17, 3, 3, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 217, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(15, 1, 2, 1, 1, 1, 18, 3, 4, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 218, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(16, 1, 2, 1, 1, 1, 19, 3, 5, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 219, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(17, 1, 2, 1, 1, 1, 20, 3, 6, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 220, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(18, 1, 2, 1, 1, 1, 21, 4, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 221, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(19, 1, 2, 1, 1, 1, 22, 4, 2, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 222, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(20, 1, 2, 1, 1, 1, 23, 4, 3, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 223, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(21, 1, 2, 1, 1, 1, 24, 4, 4, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 224, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(22, 1, 2, 1, 1, 1, 25, 4, 5, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 225, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(23, 1, 2, 1, 1, 1, 26, 4, 6, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 226, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(24, 1, 2, 1, 1, 1, 27, 5, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 227, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(25, 1, 2, 1, 1, 1, 28, 5, 2, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 228, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(26, 1, 2, 1, 1, 1, 29, 5, 3, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 229, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(27, 1, 2, 1, 1, 1, 30, 5, 4, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 230, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(28, 1, 2, 1, 1, 1, 31, 5, 5, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 231, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(29, 1, 2, 1, 1, 1, 32, 5, 6, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 232, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(30, 1, 2, 1, 1, 1, 33, 6, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 233, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(31, 1, 2, 1, 1, 1, 34, 6, 2, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 234, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(32, 1, 2, 1, 1, 1, 35, 6, 3, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 235, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(33, 1, 2, 1, 1, 1, 36, 6, 4, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 236, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(34, 1, 2, 1, 1, 1, 37, 6, 5, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 237, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(36, 1, 2, 1, 1, 1, 38, 6, 6, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 238, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(38, 1, 2, 1, 1, 1, 39, 9, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 239, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(40, 1, 2, 1, 1, 1, 40, 9, 2, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 240, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(42, 1, 2, 1, 1, 1, 41, 9, 3, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 241, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(44, 1, 2, 1, 1, 1, 42, 9, 4, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 242, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(46, 1, 2, 1, 1, 1, 43, 9, 5, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 243, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(48, 1, 2, 1, 1, 1, 44, 9, 6, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 244, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(50, 1, 2, 1, 1, 1, 45, 10, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 245, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(51, 1, 2, 1, 1, 1, 46, 10, 2, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 246, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(52, 1, 2, 1, 1, 1, 47, 10, 3, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 247, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(53, 1, 2, 1, 1, 1, 48, 10, 4, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 248, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(54, 1, 2, 1, 1, 1, 49, 10, 5, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 249, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(55, 1, 2, 1, 1, 1, 50, 10, 6, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 250, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(56, 1, 2, 1, 1, 1, 51, 11, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 251, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(57, 1, 2, 1, 1, 1, 52, 11, 2, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 252, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(58, 1, 2, 1, 1, 1, 53, 11, 3, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 253, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(59, 1, 2, 1, 1, 1, 54, 11, 4, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 254, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(60, 1, 2, 1, 1, 1, 55, 11, 5, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 255, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(61, 1, 2, 1, 1, 1, 56, 11, 6, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(35, 1, 2, 1, 1, 1, 37, 50, 1, 12, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12, 237, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(37, 1, 2, 1, 1, 1, 38, 50, 6, 58, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 37, 238, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(39, 1, 2, 1, 1, 1, 39, 60, 1, 47, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 47, 239, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(41, 1, 2, 1, 1, 1, 40, 60, 6, 8, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 78, 240, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(43, 1, 2, 1, 1, 1, 41, 70, 1, 38, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 38, 241, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(45, 1, 2, 1, 1, 1, 42, 70, 6, 15, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 102, 242, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(47, 1, 2, 1, 1, 1, 43, 80, 1, 39, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 59, 243, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(49, 1, 2, 1, 1, 1, 44, 80, 6, 17, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 126, 244, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(62, 2, 3, 1, 2, 1, 1, 1, 1, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 31, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(63, 2, 3, 1, 2, 1, 2, 1, 2, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 32, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(64, 2, 3, 1, 2, 1, 3, 1, 3, 3, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 33, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(65, 2, 3, 1, 2, 1, 4, 1, 4, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 34, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(66, 2, 3, 1, 2, 1, 5, 1, 5, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 35, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(67, 2, 3, 1, 2, 1, 6, 1, 6, 3, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 36, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(68, 2, 3, 1, 2, 1, 7, 2, 1, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 37, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(69, 2, 3, 1, 2, 1, 8, 2, 2, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 38, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(70, 2, 3, 1, 2, 1, 9, 2, 3, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 39, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(71, 2, 3, 1, 2, 1, 10, 2, 4, 5, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 310, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(72, 2, 3, 1, 2, 1, 11, 2, 5, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 311, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(73, 2, 3, 1, 2, 1, 12, 2, 6, 5, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 312, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(74, 2, 3, 1, 2, 1, 14, 3, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 314, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(75, 2, 3, 1, 2, 1, 15, 3, 2, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 315, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(76, 2, 3, 1, 2, 1, 16, 3, 3, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 316, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(77, 2, 3, 1, 2, 1, 17, 3, 4, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 317, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(78, 2, 3, 1, 2, 1, 18, 3, 5, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 318, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(79, 2, 3, 1, 2, 1, 19, 3, 6, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 319, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(80, 2, 3, 1, 2, 1, 20, 4, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 320, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(81, 2, 3, 1, 2, 1, 21, 4, 2, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 321, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(82, 2, 3, 1, 2, 1, 22, 4, 3, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 322, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(83, 2, 3, 1, 2, 1, 23, 4, 4, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 323, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(84, 2, 3, 1, 2, 1, 24, 4, 5, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 324, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(85, 2, 3, 1, 2, 1, 25, 4, 6, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 325, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(86, 2, 3, 1, 2, 1, 26, 5, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 326, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(87, 2, 3, 1, 2, 1, 27, 5, 2, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 327, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(88, 2, 3, 1, 2, 1, 28, 5, 3, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 328, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(89, 2, 3, 1, 2, 1, 29, 5, 4, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 329, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(90, 2, 3, 1, 2, 1, 30, 5, 5, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 330, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(91, 2, 3, 1, 2, 1, 31, 5, 6, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 331, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(92, 2, 3, 1, 2, 1, 32, 6, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 332, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(93, 2, 3, 1, 2, 1, 33, 6, 2, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 333, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(94, 2, 3, 1, 2, 1, 34, 6, 3, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 334, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(95, 2, 3, 1, 2, 1, 35, 6, 4, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 335, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(96, 2, 3, 1, 2, 1, 36, 6, 5, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 336, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(99, 2, 3, 1, 2, 1, 39, 9, 2, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 339, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(100, 2, 3, 1, 2, 1, 40, 9, 3, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 340, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(101, 2, 3, 1, 2, 1, 41, 9, 4, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 341, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(102, 2, 3, 1, 2, 1, 42, 9, 5, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 342, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(103, 2, 3, 1, 2, 1, 43, 9, 6, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 343, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(104, 2, 3, 1, 2, 1, 44, 10, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 344, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(105, 2, 3, 1, 2, 1, 45, 10, 2, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 345, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(106, 2, 3, 1, 2, 1, 46, 10, 3, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 346, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(107, 2, 3, 1, 2, 1, 47, 10, 4, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 347, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(108, 2, 3, 1, 2, 1, 48, 10, 5, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 348, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(109, 2, 3, 1, 2, 1, 49, 10, 6, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 349, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(110, 2, 3, 1, 2, 1, 50, 11, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 350, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(111, 2, 3, 1, 2, 1, 51, 11, 2, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 351, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(112, 2, 3, 1, 2, 1, 52, 11, 3, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 352, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(113, 2, 3, 1, 2, 1, 53, 11, 4, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 353, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(114, 2, 3, 1, 2, 1, 54, 11, 5, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 354, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(115, 2, 3, 1, 2, 1, 55, 11, 6, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 355, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(97, 2, 3, 1, 2, 1, 37, 50, 1, 1, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 337, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(98, 2, 3, 1, 2, 1, 38, 50, 6, 13, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 338, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(116, 2, 3, 1, 2, 1, 58, 60, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 358, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(117, 2, 3, 1, 2, 1, 59, 60, 6, 10, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 359, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(118, 2, 3, 1, 2, 1, 60, 70, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 360, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(119, 2, 3, 1, 2, 1, 61, 70, 6, 20, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 361, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(120, 2, 3, 1, 2, 1, 62, 80, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 362, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(121, 2, 3, 1, 2, 1, 63, 80, 6, 13, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 363, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(122, 3, 4, 1, 3, 1, 1, 1, 1, 7, 'NA', 'NA', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 41, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(123, 3, 4, 1, 3, 1, 2, 1, 2, 13, 'NA', 'NA', 1, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 42, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(124, 3, 4, 1, 3, 1, 3, 1, 3, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 43, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(125, 3, 4, 1, 3, 1, 4, 1, 4, 4, 'NA', 'NA', 1, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 44, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(126, 3, 4, 1, 3, 1, 5, 1, 5, 6, 'NA', 'NA', 1, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 45, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(127, 3, 4, 1, 3, 1, 6, 1, 6, 23, 'NA', 'NA', 1, 23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 46, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(128, 3, 4, 1, 3, 1, 7, 2, 1, 14, 'NA', 'NA', 1, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 47, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(129, 3, 4, 1, 3, 1, 8, 2, 2, 1, 'NA', 'NA', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 48, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(130, 3, 4, 1, 3, 1, 9, 2, 3, 12, 'NA', 'NA', 1, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 49, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(131, 3, 4, 1, 3, 1, 10, 2, 4, 20, 'NA', 'NA', 1, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 410, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(132, 3, 4, 1, 3, 1, 11, 2, 5, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 411, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(133, 3, 4, 1, 3, 1, 12, 2, 6, 33, 'NA', 'NA', 1, 33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 412, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(134, 3, 4, 1, 3, 1, 37, 50, 1, 12, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12, 437, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(135, 3, 4, 1, 3, 1, 38, 50, 6, 15, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 37, 438, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(136, 4, 5, 1, 4, 1, 1, 1, 1, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 51, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(137, 4, 5, 1, 4, 1, 2, 1, 2, 12, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 52, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(138, 4, 5, 1, 4, 1, 3, 1, 3, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 53, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(139, 4, 5, 1, 4, 1, 4, 1, 4, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 54, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(140, 4, 5, 1, 4, 1, 5, 1, 5, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 55, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(141, 4, 5, 1, 4, 1, 6, 1, 6, 12, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 56, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(142, 4, 5, 1, 4, 1, 7, 2, 1, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 57, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(143, 4, 5, 1, 4, 1, 8, 2, 2, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 58, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(144, 4, 5, 1, 4, 1, 9, 2, 3, 5, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 59, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(145, 4, 5, 1, 4, 1, 10, 2, 4, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 510, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(146, 4, 5, 1, 4, 1, 11, 2, 5, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 511, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(147, 4, 5, 1, 4, 1, 12, 2, 6, 5, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 512, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(148, 4, 5, 1, 4, 1, 37, 50, 1, 7, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 537, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(149, 4, 5, 1, 4, 1, 38, 50, 6, 48, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 538, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(150, 5, 6, 1, 5, 1, 1, 1, 1, 25, 'NA', 'NA', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 61, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(151, 5, 6, 1, 5, 1, 2, 1, 2, 13, 'NA', 'NA', 1, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 62, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(152, 5, 6, 1, 5, 1, 3, 1, 3, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 63, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(153, 5, 6, 1, 5, 1, 4, 1, 4, 4, 'NA', 'NA', 1, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 64, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(154, 5, 6, 1, 5, 1, 5, 1, 5, 6, 'NA', 'NA', 1, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 65, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(155, 5, 6, 1, 5, 1, 6, 1, 6, 23, 'NA', 'NA', 1, 23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 66, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(156, 5, 6, 1, 5, 1, 7, 2, 1, 14, 'NA', 'NA', 1, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 67, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(157, 5, 6, 1, 5, 1, 8, 2, 2, 1, 'NA', 'NA', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 68, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(158, 5, 6, 1, 5, 1, 9, 2, 3, 12, 'NA', 'NA', 1, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 69, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(159, 5, 6, 1, 5, 1, 10, 2, 4, 20, 'NA', 'NA', 1, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 610, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(160, 5, 6, 1, 5, 1, 11, 2, 5, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 611, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(161, 5, 6, 1, 5, 1, 12, 2, 6, 33, 'NA', 'NA', 1, 33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 612, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(162, 5, 6, 1, 5, 1, 37, 50, 1, 12, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12, 637, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(163, 5, 6, 1, 5, 1, 38, 50, 6, 27, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 37, 638, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(164, 6, 7, 1, 6, 1, 1, 1, 1, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 71, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(165, 6, 7, 1, 6, 1, 2, 1, 2, 3, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 72, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(166, 6, 7, 1, 6, 1, 3, 1, 3, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 73, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(167, 6, 7, 1, 6, 1, 4, 1, 4, 5, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 74, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(168, 6, 7, 1, 6, 1, 5, 1, 5, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 75, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(169, 6, 7, 1, 6, 1, 6, 1, 6, 8, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 76, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(170, 6, 7, 1, 6, 1, 7, 2, 1, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 77, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(171, 6, 7, 1, 6, 1, 8, 2, 2, 3, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 78, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(172, 6, 7, 1, 6, 1, 9, 2, 3, 3, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 79, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(173, 6, 7, 1, 6, 1, 10, 2, 4, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 710, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(174, 6, 7, 1, 6, 1, 11, 2, 5, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 711, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(175, 6, 7, 1, 6, 1, 12, 2, 6, 6, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 712, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(176, 6, 7, 1, 6, 1, 13, 3, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 713, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(177, 6, 7, 1, 6, 1, 14, 3, 2, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 714, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(178, 6, 7, 1, 6, 1, 15, 3, 3, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 715, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(179, 6, 7, 1, 6, 1, 16, 3, 4, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 716, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(180, 6, 7, 1, 6, 1, 17, 3, 5, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 717, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(181, 6, 7, 1, 6, 1, 18, 3, 6, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 718, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(182, 6, 7, 1, 6, 1, 19, 4, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 719, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(183, 6, 7, 1, 6, 1, 20, 4, 2, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 720, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(184, 6, 7, 1, 6, 1, 21, 4, 3, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 721, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(185, 6, 7, 1, 6, 1, 22, 4, 4, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 722, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(186, 6, 7, 1, 6, 1, 23, 4, 5, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 723, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(187, 6, 7, 1, 6, 1, 24, 4, 6, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 724, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(188, 6, 7, 1, 6, 1, 25, 5, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 725, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(189, 6, 7, 1, 6, 1, 26, 5, 2, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 726, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(190, 6, 7, 1, 6, 1, 27, 5, 3, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 727, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(191, 6, 7, 1, 6, 1, 28, 5, 4, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 728, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(192, 6, 7, 1, 6, 1, 29, 5, 5, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 729, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(193, 6, 7, 1, 6, 1, 30, 5, 6, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 730, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(194, 6, 7, 1, 6, 1, 31, 6, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 731, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(195, 6, 7, 1, 6, 1, 32, 6, 2, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 732, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(196, 6, 7, 1, 6, 1, 33, 6, 3, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 733, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(197, 6, 7, 1, 6, 1, 34, 6, 4, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 734, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(198, 6, 7, 1, 6, 1, 35, 6, 5, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 735, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(199, 6, 7, 1, 6, 1, 36, 6, 6, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 736, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(202, 6, 7, 1, 6, 1, 39, 9, 3, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 739, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(203, 6, 7, 1, 6, 1, 40, 9, 4, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 740, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(204, 6, 7, 1, 6, 1, 41, 9, 5, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 741, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(205, 6, 7, 1, 6, 1, 42, 9, 6, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 742, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(206, 6, 7, 1, 6, 1, 43, 10, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 743, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(207, 6, 7, 1, 6, 1, 44, 10, 2, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 744, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(208, 6, 7, 1, 6, 1, 45, 10, 3, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 745, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(209, 6, 7, 1, 6, 1, 46, 10, 4, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 746, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(210, 6, 7, 1, 6, 1, 47, 10, 5, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 747, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(211, 6, 7, 1, 6, 1, 48, 10, 6, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 748, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(212, 6, 7, 1, 6, 1, 49, 11, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 749, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(213, 6, 7, 1, 6, 1, 50, 11, 2, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 750, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(214, 6, 7, 1, 6, 1, 51, 11, 3, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 751, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(215, 6, 7, 1, 6, 1, 52, 11, 4, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 752, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(216, 6, 7, 1, 6, 1, 53, 11, 5, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 753, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(217, 6, 7, 1, 6, 1, 54, 11, 6, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 754, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(200, 6, 7, 1, 6, 1, 37, 50, 1, 4, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 737, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(201, 6, 7, 1, 6, 1, 38, 50, 6, 12, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 738, '1001', 'submitted_via_web', '2021-09-15 14:48:39', '2021-09-15 14:48:39'),
(218, 6, 7, 1, 6, 1, 57, 60, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 757, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(219, 6, 7, 1, 6, 1, 58, 60, 6, 24, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 758, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(220, 6, 7, 1, 6, 1, 59, 70, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 759, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(221, 6, 7, 1, 6, 1, 60, 70, 6, 14, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 760, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(222, 6, 7, 1, 6, 1, 61, 80, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 761, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(223, 6, 7, 1, 6, 1, 62, 80, 6, 6, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 762, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(224, 7, 8, 1, 7, 1, 1, 1, 1, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 81, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(225, 7, 8, 1, 7, 1, 2, 1, 2, 3, 'NA', 'NA', 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 82, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(226, 7, 8, 1, 7, 1, 3, 1, 3, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 83, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(227, 7, 8, 1, 7, 1, 4, 1, 4, 5, 'NA', 'NA', 1, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 84, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(228, 7, 8, 1, 7, 1, 5, 1, 5, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 85, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(229, 7, 8, 1, 7, 1, 6, 1, 6, 8, 'NA', 'NA', 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 86, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(230, 7, 8, 1, 7, 1, 7, 2, 1, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 87, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(231, 7, 8, 1, 7, 1, 8, 2, 2, 3, 'NA', 'NA', 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 88, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(232, 7, 8, 1, 7, 1, 9, 2, 3, 3, 'NA', 'NA', 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 89, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(233, 7, 8, 1, 7, 1, 10, 2, 4, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 810, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(234, 7, 8, 1, 7, 1, 11, 2, 5, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 811, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(235, 7, 8, 1, 7, 1, 12, 2, 6, 6, 'NA', 'NA', 1, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 812, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(236, 7, 8, 1, 7, 1, 37, 50, 1, 4, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 837, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(237, 7, 8, 1, 7, 1, 38, 50, 6, 11, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 838, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(238, 8, 9, 1, 8, 1, 1, 1, 1, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 91, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(239, 8, 9, 1, 8, 1, 2, 1, 2, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 92, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(240, 8, 9, 1, 8, 1, 3, 1, 3, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 93, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(241, 8, 9, 1, 8, 1, 4, 1, 4, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 94, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(242, 8, 9, 1, 8, 1, 5, 1, 5, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 95, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(243, 8, 9, 1, 8, 1, 6, 1, 6, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 96, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(244, 8, 9, 1, 8, 1, 7, 2, 1, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 97, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(245, 8, 9, 1, 8, 1, 8, 2, 2, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 98, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(246, 8, 9, 1, 8, 1, 9, 2, 3, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 99, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(247, 8, 9, 1, 8, 1, 10, 2, 4, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 910, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(248, 8, 9, 1, 8, 1, 11, 2, 5, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 911, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(249, 8, 9, 1, 8, 1, 12, 2, 6, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 912, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(250, 8, 9, 1, 8, 1, 37, 50, 1, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 937, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(251, 8, 9, 1, 8, 1, 38, 50, 6, 41, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 938, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(252, 9, 10, 1, 9, 1, 1, 1, 1, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 101, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(253, 9, 10, 1, 9, 1, 2, 1, 2, 3, 'NA', 'NA', 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 102, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(254, 9, 10, 1, 9, 1, 3, 1, 3, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 103, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(255, 9, 10, 1, 9, 1, 4, 1, 4, 5, 'NA', 'NA', 1, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 104, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(256, 9, 10, 1, 9, 1, 5, 1, 5, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 105, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(257, 9, 10, 1, 9, 1, 6, 1, 6, 8, 'NA', 'NA', 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 106, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(258, 9, 10, 1, 9, 1, 7, 2, 1, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 107, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(259, 9, 10, 1, 9, 1, 8, 2, 2, 3, 'NA', 'NA', 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 108, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(260, 9, 10, 1, 9, 1, 9, 2, 3, 3, 'NA', 'NA', 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 109, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(261, 9, 10, 1, 9, 1, 10, 2, 4, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1010, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(262, 9, 10, 1, 9, 1, 11, 2, 5, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1011, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(263, 9, 10, 1, 9, 1, 12, 2, 6, 6, 'NA', 'NA', 1, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1012, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(264, 9, 10, 1, 9, 1, 37, 50, 1, 4, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 1037, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(265, 9, 10, 1, 9, 1, 38, 50, 6, 33, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 1038, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(267, 10, 11, 9, 2, 1, 2, 1, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 112, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(266, 10, 11, 9, 2, 1, 1, 1, 2, 3, 'NA', 'NA', 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 111, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(268, 10, 11, 9, 2, 1, 4, 1, 3, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 114, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(269, 10, 11, 9, 2, 1, 5, 1, 4, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 115, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(270, 10, 11, 9, 2, 1, 6, 1, 5, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 116, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(271, 10, 11, 9, 2, 1, 7, 1, 6, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 117, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(272, 10, 11, 9, 2, 1, 8, 2, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 118, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(273, 10, 11, 9, 2, 1, 9, 2, 2, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 119, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(274, 10, 11, 9, 2, 1, 10, 2, 3, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1110, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(275, 10, 11, 9, 2, 1, 11, 2, 4, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1111, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(276, 10, 11, 9, 2, 1, 12, 2, 5, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1112, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(277, 10, 11, 9, 2, 1, 13, 2, 6, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1113, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(278, 10, 11, 9, 2, 1, 14, 3, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1114, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(279, 10, 11, 9, 2, 1, 15, 3, 2, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1115, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(280, 10, 11, 9, 2, 1, 16, 3, 3, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1116, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(281, 10, 11, 9, 2, 1, 17, 3, 4, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1117, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(282, 10, 11, 9, 2, 1, 18, 3, 5, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1118, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(283, 10, 11, 9, 2, 1, 19, 3, 6, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1119, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(284, 10, 11, 9, 2, 1, 20, 4, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1120, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(285, 10, 11, 9, 2, 1, 21, 4, 2, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1121, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(286, 10, 11, 9, 2, 1, 22, 4, 3, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1122, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(287, 10, 11, 9, 2, 1, 23, 4, 4, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1123, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(288, 10, 11, 9, 2, 1, 24, 4, 5, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1124, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(289, 10, 11, 9, 2, 1, 25, 4, 6, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1125, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(290, 10, 11, 9, 2, 1, 26, 5, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1126, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(291, 10, 11, 9, 2, 1, 27, 5, 2, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1127, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(292, 10, 11, 9, 2, 1, 28, 5, 3, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1128, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(293, 10, 11, 9, 2, 1, 29, 5, 4, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1129, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(294, 10, 11, 9, 2, 1, 30, 5, 5, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1130, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(295, 10, 11, 9, 2, 1, 31, 5, 6, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1131, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(296, 10, 11, 9, 2, 1, 32, 6, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1132, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(297, 10, 11, 9, 2, 1, 33, 6, 2, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1133, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(298, 10, 11, 9, 2, 1, 34, 6, 3, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1134, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(299, 10, 11, 9, 2, 1, 35, 6, 4, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1135, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(300, 10, 11, 9, 2, 1, 36, 6, 5, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1136, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(301, 10, 11, 9, 2, 1, 37, 6, 6, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1137, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(302, 10, 11, 9, 2, 1, 38, 9, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1138, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(303, 10, 11, 9, 2, 1, 39, 9, 2, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1139, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(304, 10, 11, 9, 2, 1, 40, 9, 3, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1140, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(305, 10, 11, 9, 2, 1, 41, 9, 4, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1141, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(306, 10, 11, 9, 2, 1, 42, 9, 5, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1142, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(307, 10, 11, 9, 2, 1, 43, 9, 6, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1143, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(308, 10, 11, 9, 2, 1, 44, 10, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1144, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(309, 10, 11, 9, 2, 1, 45, 10, 2, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1145, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(310, 10, 11, 9, 2, 1, 46, 10, 3, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1146, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(311, 10, 11, 9, 2, 1, 47, 10, 4, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1147, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(312, 10, 11, 9, 2, 1, 48, 10, 5, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1148, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(313, 10, 11, 9, 2, 1, 49, 10, 6, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1149, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(314, 10, 11, 9, 2, 1, 50, 11, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1150, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40');
INSERT INTO `1_ss1` (`id`, `edssid`, `sen`, `ssen`, `sfr`, `bf`, `fr`, `tx`, `sas`, `n`, `notes`, `slc`, `st`, `ni`, `nb`, `sid01`, `sid02`, `sid03`, `sid04`, `sid05`, `sid06`, `sid07`, `nd`, `senfr`, `userid`, `submitted`, `created_at`, `updated_at`) VALUES
(315, 10, 11, 9, 2, 1, 51, 11, 2, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1151, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(316, 10, 11, 9, 2, 1, 52, 11, 3, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1152, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(317, 10, 11, 9, 2, 1, 53, 11, 4, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1153, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(318, 10, 11, 9, 2, 1, 54, 11, 5, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1154, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(319, 10, 11, 9, 2, 1, 55, 11, 6, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1155, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(320, 10, 11, 9, 2, 1, 56, 50, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1156, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(321, 10, 11, 9, 2, 1, 57, 50, 6, 56, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1157, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(322, 10, 11, 9, 2, 1, 58, 60, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1158, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(323, 10, 11, 9, 2, 1, 59, 60, 6, 12, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1159, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(324, 10, 11, 9, 2, 1, 60, 70, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1160, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(325, 10, 11, 9, 2, 1, 61, 70, 6, 10, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1161, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(326, 10, 11, 9, 2, 1, 62, 80, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1162, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(327, 10, 11, 9, 2, 1, 63, 80, 6, 10, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1163, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(329, 11, 12, 10, 2, 1, 2, 1, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 122, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(330, 11, 12, 10, 2, 1, 3, 1, 2, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 123, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(331, 11, 12, 10, 2, 1, 4, 1, 3, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 124, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(332, 11, 12, 10, 2, 1, 5, 1, 4, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 125, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(333, 11, 12, 10, 2, 1, 6, 1, 5, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 126, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(334, 11, 12, 10, 2, 1, 7, 1, 6, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 127, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(335, 11, 12, 10, 2, 1, 8, 2, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 128, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(336, 11, 12, 10, 2, 1, 9, 2, 2, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 129, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(337, 11, 12, 10, 2, 1, 10, 2, 3, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1210, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(338, 11, 12, 10, 2, 1, 11, 2, 4, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1211, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(339, 11, 12, 10, 2, 1, 12, 2, 5, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1212, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(340, 11, 12, 10, 2, 1, 13, 2, 6, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1213, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(341, 11, 12, 10, 2, 1, 14, 3, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1214, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(342, 11, 12, 10, 2, 1, 15, 3, 2, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1215, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(343, 11, 12, 10, 2, 1, 16, 3, 3, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1216, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(344, 11, 12, 10, 2, 1, 17, 3, 4, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1217, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(345, 11, 12, 10, 2, 1, 18, 3, 5, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1218, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(346, 11, 12, 10, 2, 1, 19, 3, 6, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1219, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(347, 11, 12, 10, 2, 1, 20, 4, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1220, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(348, 11, 12, 10, 2, 1, 21, 4, 2, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1221, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(349, 11, 12, 10, 2, 1, 22, 4, 3, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1222, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(350, 11, 12, 10, 2, 1, 23, 4, 4, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1223, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(351, 11, 12, 10, 2, 1, 24, 4, 5, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1224, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(352, 11, 12, 10, 2, 1, 25, 4, 6, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1225, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(353, 11, 12, 10, 2, 1, 26, 5, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1226, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(354, 11, 12, 10, 2, 1, 27, 5, 2, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1227, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(355, 11, 12, 10, 2, 1, 28, 5, 3, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1228, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(356, 11, 12, 10, 2, 1, 29, 5, 4, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1229, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(357, 11, 12, 10, 2, 1, 30, 5, 5, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1230, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(358, 11, 12, 10, 2, 1, 31, 5, 6, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1231, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(359, 11, 12, 10, 2, 1, 32, 6, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1232, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(360, 11, 12, 10, 2, 1, 33, 6, 2, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1233, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(361, 11, 12, 10, 2, 1, 34, 6, 3, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1234, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(362, 11, 12, 10, 2, 1, 35, 6, 4, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1235, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(363, 11, 12, 10, 2, 1, 36, 6, 5, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1236, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(364, 11, 12, 10, 2, 1, 37, 6, 6, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1237, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(328, 11, 12, 10, 2, 1, 1, 8, 4, 2, 'NA', 'NA', 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 121, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(365, 11, 12, 10, 2, 1, 38, 9, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1238, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(366, 11, 12, 10, 2, 1, 39, 9, 2, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1239, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(367, 11, 12, 10, 2, 1, 40, 9, 3, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1240, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(368, 11, 12, 10, 2, 1, 41, 9, 4, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1241, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(369, 11, 12, 10, 2, 1, 42, 9, 5, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1242, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(370, 11, 12, 10, 2, 1, 43, 9, 6, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1243, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(371, 11, 12, 10, 2, 1, 44, 10, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1244, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(372, 11, 12, 10, 2, 1, 45, 10, 2, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1245, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(373, 11, 12, 10, 2, 1, 46, 10, 3, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1246, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(374, 11, 12, 10, 2, 1, 47, 10, 4, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1247, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(375, 11, 12, 10, 2, 1, 48, 10, 5, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1248, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(376, 11, 12, 10, 2, 1, 49, 10, 6, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1249, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(377, 11, 12, 10, 2, 1, 50, 11, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1250, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(378, 11, 12, 10, 2, 1, 51, 11, 2, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1251, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(379, 11, 12, 10, 2, 1, 52, 11, 3, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1252, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(380, 11, 12, 10, 2, 1, 53, 11, 4, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1253, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(381, 11, 12, 10, 2, 1, 54, 11, 5, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1254, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(382, 11, 12, 10, 2, 1, 55, 11, 6, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1255, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(383, 11, 12, 10, 2, 1, 56, 50, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1256, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(384, 11, 12, 10, 2, 1, 57, 50, 6, 29, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1257, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(385, 11, 12, 10, 2, 1, 58, 60, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1258, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(386, 11, 12, 10, 2, 1, 59, 60, 6, 12, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1259, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(387, 11, 12, 10, 2, 1, 60, 70, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1260, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(388, 11, 12, 10, 2, 1, 61, 70, 6, 13, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1261, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(389, 11, 12, 10, 2, 1, 62, 80, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1262, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(390, 11, 12, 10, 2, 1, 63, 80, 6, 18, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1263, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(391, 12, 13, 11, 2, 1, 1, 1, 1, 23, 'NA', 'NA', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 131, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(392, 12, 13, 11, 2, 1, 2, 1, 2, 13, 'NA', 'NA', 1, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 132, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(393, 12, 13, 11, 2, 1, 3, 1, 3, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 133, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(394, 12, 13, 11, 2, 1, 4, 1, 4, 4, 'NA', 'NA', 1, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 134, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(395, 12, 13, 11, 2, 1, 5, 1, 5, 6, 'NA', 'NA', 1, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 135, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(396, 12, 13, 11, 2, 1, 6, 1, 6, 23, 'NA', 'NA', 1, 23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 136, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(397, 12, 13, 11, 2, 1, 7, 2, 1, 14, 'NA', 'NA', 1, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 137, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(398, 12, 13, 11, 2, 1, 8, 2, 2, 1, 'NA', 'NA', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 138, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(399, 12, 13, 11, 2, 1, 9, 2, 3, 12, 'NA', 'NA', 1, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 139, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(400, 12, 13, 11, 2, 1, 10, 2, 4, 20, 'NA', 'NA', 1, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1310, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(401, 12, 13, 11, 2, 1, 11, 2, 5, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1311, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(402, 12, 13, 11, 2, 1, 12, 2, 6, 33, 'NA', 'NA', 1, 33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1312, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(403, 12, 13, 11, 2, 1, 37, 50, 1, 12, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12, 1337, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(404, 12, 13, 11, 2, 1, 38, 50, 6, 44, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 37, 1338, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(405, 13, 14, 11, 3, 1, 1, 1, 1, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 141, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(406, 13, 14, 11, 3, 1, 2, 1, 2, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 142, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(407, 13, 14, 11, 3, 1, 3, 1, 3, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 143, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(408, 13, 14, 11, 3, 1, 4, 1, 4, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 144, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(409, 13, 14, 11, 3, 1, 5, 1, 5, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 145, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(410, 13, 14, 11, 3, 1, 6, 1, 6, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 146, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(411, 13, 14, 11, 3, 1, 7, 2, 1, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 147, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(412, 13, 14, 11, 3, 1, 8, 2, 2, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 148, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(413, 13, 14, 11, 3, 1, 9, 2, 3, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 149, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(414, 13, 14, 11, 3, 1, 10, 2, 4, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1410, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(415, 13, 14, 11, 3, 1, 11, 2, 5, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1411, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(416, 13, 14, 11, 3, 1, 12, 2, 6, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1412, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(417, 13, 14, 11, 3, 1, 37, 50, 1, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1437, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(418, 13, 14, 11, 3, 1, 38, 50, 6, 56, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1438, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(419, 14, 15, 11, 4, 1, 1, 1, 1, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 151, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(420, 14, 15, 11, 4, 1, 2, 1, 2, 3, 'NA', 'NA', 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 152, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(421, 14, 15, 11, 4, 1, 3, 1, 3, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 153, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(422, 14, 15, 11, 4, 1, 4, 1, 4, 5, 'NA', 'NA', 1, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 154, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(423, 14, 15, 11, 4, 1, 5, 1, 5, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 155, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(424, 14, 15, 11, 4, 1, 6, 1, 6, 8, 'NA', 'NA', 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 156, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(425, 14, 15, 11, 4, 1, 7, 2, 1, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 157, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(426, 14, 15, 11, 4, 1, 8, 2, 2, 3, 'NA', 'NA', 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 158, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(427, 14, 15, 11, 4, 1, 9, 2, 3, 3, 'NA', 'NA', 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 159, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(428, 14, 15, 11, 4, 1, 10, 2, 4, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1510, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(429, 14, 15, 11, 4, 1, 11, 2, 5, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1511, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(430, 14, 15, 11, 4, 1, 12, 2, 6, 6, 'NA', 'NA', 1, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1512, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(431, 14, 15, 11, 4, 1, 37, 50, 1, 4, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 1537, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(432, 14, 15, 11, 4, 1, 38, 50, 6, 32, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 1538, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(433, 15, 16, 11, 5, 1, 1, 1, 1, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 161, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(434, 15, 16, 11, 5, 1, 2, 1, 2, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 162, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(435, 15, 16, 11, 5, 1, 3, 1, 3, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 163, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(436, 15, 16, 11, 5, 1, 4, 1, 4, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 164, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(437, 15, 16, 11, 5, 1, 5, 1, 5, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 165, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(438, 15, 16, 11, 5, 1, 6, 1, 6, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 166, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(439, 15, 16, 11, 5, 1, 7, 2, 1, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 167, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(440, 15, 16, 11, 5, 1, 8, 2, 2, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 168, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(441, 15, 16, 11, 5, 1, 9, 2, 3, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 169, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(442, 15, 16, 11, 5, 1, 10, 2, 4, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1610, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(443, 15, 16, 11, 5, 1, 11, 2, 5, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1611, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(444, 15, 16, 11, 5, 1, 12, 2, 6, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1612, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(445, 15, 16, 11, 5, 1, 37, 50, 1, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1637, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(446, 15, 16, 11, 5, 1, 38, 50, 6, 53, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1638, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(447, 15, 16, 11, 5, 1, 39, 60, 1, 47, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 47, 1639, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(448, 15, 16, 11, 5, 1, 40, 60, 6, 5, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 78, 1640, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(449, 15, 16, 11, 5, 1, 41, 70, 1, 38, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 38, 1641, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(450, 15, 16, 11, 5, 1, 42, 70, 6, 18, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 102, 1642, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(451, 15, 16, 11, 5, 1, 43, 80, 1, 40, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 59, 1643, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(452, 15, 16, 11, 5, 1, 44, 80, 6, 18, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 126, 1644, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(453, 16, 17, 11, 6, 1, 1, 1, 1, 33, 'NA', 'NA', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 171, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(454, 16, 17, 11, 6, 1, 2, 1, 2, 13, 'NA', 'NA', 1, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 172, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(455, 16, 17, 11, 6, 1, 3, 1, 3, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 173, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(456, 16, 17, 11, 6, 1, 4, 1, 4, 4, 'NA', 'NA', 1, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 174, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(457, 16, 17, 11, 6, 1, 5, 1, 5, 6, 'NA', 'NA', 1, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 175, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(458, 16, 17, 11, 6, 1, 6, 1, 6, 23, 'NA', 'NA', 1, 23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 176, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(459, 16, 17, 11, 6, 1, 7, 2, 1, 14, 'NA', 'NA', 1, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 177, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(460, 16, 17, 11, 6, 1, 8, 2, 2, 1, 'NA', 'NA', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 178, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(461, 16, 17, 11, 6, 1, 9, 2, 3, 12, 'NA', 'NA', 1, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 179, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(462, 16, 17, 11, 6, 1, 10, 2, 4, 20, 'NA', 'NA', 1, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1710, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(463, 16, 17, 11, 6, 1, 11, 2, 5, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1711, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(464, 16, 17, 11, 6, 1, 12, 2, 6, 33, 'NA', 'NA', 1, 33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1712, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(465, 16, 17, 11, 6, 1, 37, 50, 1, 12, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12, 1737, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(466, 16, 17, 11, 6, 1, 38, 50, 6, 44, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 37, 1738, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(467, 17, 18, 11, 7, 1, 1, 1, 1, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 181, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(468, 17, 18, 11, 7, 1, 2, 1, 2, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 182, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(469, 17, 18, 11, 7, 1, 3, 1, 3, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 183, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(470, 17, 18, 11, 7, 1, 4, 1, 4, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 184, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(471, 17, 18, 11, 7, 1, 5, 1, 5, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 185, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(472, 17, 18, 11, 7, 1, 6, 1, 6, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 186, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(473, 17, 18, 11, 7, 1, 7, 2, 1, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 187, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(474, 17, 18, 11, 7, 1, 8, 2, 2, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 188, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(475, 17, 18, 11, 7, 1, 9, 2, 3, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 189, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(476, 17, 18, 11, 7, 1, 10, 2, 4, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1810, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(477, 17, 18, 11, 7, 1, 11, 2, 5, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1811, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(478, 17, 18, 11, 7, 1, 12, 2, 6, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1812, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(479, 17, 18, 11, 7, 1, 37, 50, 1, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1837, '1001', 'submitted_via_web', '2021-09-15 14:48:40', '2021-09-15 14:48:40'),
(480, 17, 18, 11, 7, 1, 38, 50, 6, 14, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1838, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(481, 18, 19, 11, 8, 1, 1, 1, 1, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 191, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(482, 18, 19, 11, 8, 1, 2, 1, 2, 3, 'NA', 'NA', 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 192, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(483, 18, 19, 11, 8, 1, 3, 1, 3, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 193, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(484, 18, 19, 11, 8, 1, 4, 1, 4, 5, 'NA', 'NA', 1, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 194, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(485, 18, 19, 11, 8, 1, 5, 1, 5, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 195, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(486, 18, 19, 11, 8, 1, 6, 1, 6, 8, 'NA', 'NA', 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 196, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(487, 18, 19, 11, 8, 1, 7, 2, 1, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 197, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(488, 18, 19, 11, 8, 1, 8, 2, 2, 3, 'NA', 'NA', 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 198, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(489, 18, 19, 11, 8, 1, 9, 2, 3, 3, 'NA', 'NA', 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 199, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(490, 18, 19, 11, 8, 1, 10, 2, 4, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1910, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(491, 18, 19, 11, 8, 1, 11, 2, 5, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1911, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(492, 18, 19, 11, 8, 1, 12, 2, 6, 6, 'NA', 'NA', 1, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1912, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(493, 18, 19, 11, 8, 1, 37, 50, 1, 4, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 1937, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(494, 18, 19, 11, 8, 1, 38, 50, 6, 25, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 1938, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(495, 19, 20, 11, 9, 1, 1, 1, 1, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 201, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(496, 19, 20, 11, 9, 1, 2, 1, 2, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 202, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(497, 19, 20, 11, 9, 1, 3, 1, 3, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 203, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(498, 19, 20, 11, 9, 1, 4, 1, 4, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 204, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(499, 19, 20, 11, 9, 1, 5, 1, 5, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 205, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(500, 19, 20, 11, 9, 1, 6, 1, 6, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 206, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(501, 19, 20, 11, 9, 1, 7, 2, 1, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 207, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(502, 19, 20, 11, 9, 1, 8, 2, 2, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 208, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(503, 19, 20, 11, 9, 1, 9, 2, 3, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 209, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(504, 19, 20, 11, 9, 1, 10, 2, 4, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2010, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(505, 19, 20, 11, 9, 1, 11, 2, 5, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2011, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(506, 19, 20, 11, 9, 1, 12, 2, 6, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2012, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(507, 19, 20, 11, 9, 1, 37, 50, 1, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2037, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(508, 19, 20, 11, 9, 1, 38, 50, 6, 15, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2038, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(509, 20, 22, 21, 1, 1, 1, 1, 1, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 221, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(510, 20, 22, 21, 1, 1, 2, 1, 2, 3, 'NA', 'NA', 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 222, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(511, 20, 22, 21, 1, 1, 3, 1, 3, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 223, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(512, 20, 22, 21, 1, 1, 4, 1, 4, 5, 'NA', 'NA', 1, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 224, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(513, 20, 22, 21, 1, 1, 5, 1, 5, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 225, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(514, 20, 22, 21, 1, 1, 6, 1, 6, 8, 'NA', 'NA', 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 226, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(515, 20, 22, 21, 1, 1, 7, 2, 1, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 227, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(516, 20, 22, 21, 1, 1, 8, 2, 2, 3, 'NA', 'NA', 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 228, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(517, 20, 22, 21, 1, 1, 9, 2, 3, 3, 'NA', 'NA', 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 229, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(518, 20, 22, 21, 1, 1, 10, 2, 4, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2210, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(519, 20, 22, 21, 1, 1, 11, 2, 5, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2211, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(520, 20, 22, 21, 1, 1, 12, 2, 6, 6, 'NA', 'NA', 1, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2212, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(521, 20, 22, 21, 1, 1, 37, 50, 1, 4, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 2237, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(522, 20, 22, 21, 1, 1, 38, 50, 6, 59, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 2238, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(523, 21, 23, 21, 2, 1, 1, 1, 1, 44, 'NA', 'NA', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 231, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(524, 21, 23, 21, 2, 1, 2, 1, 2, 56, 'NA', 'NA', 1, 56, 0, 0, 0, 0, 0, 0, 0, 0, 0, 232, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(525, 21, 23, 21, 2, 1, 3, 1, 3, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 233, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(526, 21, 23, 21, 2, 1, 4, 1, 4, 4, 'NA', 'NA', 1, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 234, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(527, 21, 23, 21, 2, 1, 5, 1, 5, 6, 'NA', 'NA', 1, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 235, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(528, 21, 23, 21, 2, 1, 6, 1, 6, 66, 'NA', 'NA', 1, 66, 0, 0, 0, 0, 0, 0, 0, 0, 0, 236, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(529, 21, 23, 21, 2, 1, 7, 2, 1, 14, 'NA', 'NA', 1, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 237, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(530, 21, 23, 21, 2, 1, 8, 2, 2, 1, 'NA', 'NA', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 238, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(531, 21, 23, 21, 2, 1, 9, 2, 3, 10, 'NA', 'NA', 1, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 239, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(532, 21, 23, 21, 2, 1, 10, 2, 4, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2310, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(533, 21, 23, 21, 2, 1, 11, 2, 5, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2311, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(534, 21, 23, 21, 2, 1, 12, 2, 6, 33, 'NA', 'NA', 1, 33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2312, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(535, 21, 23, 21, 2, 1, 37, 50, 1, 12, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12, 2337, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(536, 21, 23, 21, 2, 1, 38, 50, 6, 60, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 37, 2338, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(537, 22, 24, 21, 3, 1, 1, 1, 1, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 241, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(538, 22, 24, 21, 3, 1, 2, 1, 2, 56, 'NA', 'NA', 1, 56, 0, 0, 0, 0, 0, 0, 0, 0, 0, 242, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(539, 22, 24, 21, 3, 1, 3, 1, 3, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 243, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(540, 22, 24, 21, 3, 1, 4, 1, 4, 4, 'NA', 'NA', 1, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 244, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(541, 22, 24, 21, 3, 1, 5, 1, 5, 6, 'NA', 'NA', 1, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 245, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(542, 22, 24, 21, 3, 1, 6, 1, 6, 66, 'NA', 'NA', 1, 66, 0, 0, 0, 0, 0, 0, 0, 0, 0, 246, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(543, 22, 24, 21, 3, 1, 7, 2, 1, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 247, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(544, 22, 24, 21, 3, 1, 8, 2, 2, 3, 'NA', 'NA', 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 248, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(545, 22, 24, 21, 3, 1, 9, 2, 3, 3, 'NA', 'NA', 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 249, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(546, 22, 24, 21, 3, 1, 10, 2, 4, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2410, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(547, 22, 24, 21, 3, 1, 11, 2, 5, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2411, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(548, 22, 24, 21, 3, 1, 12, 2, 6, 6, 'NA', 'NA', 1, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2412, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(549, 22, 24, 21, 3, 1, 37, 50, 1, 4, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 2437, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(550, 22, 24, 21, 3, 1, 38, 50, 6, 22, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 2438, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(551, 23, 25, 21, 4, 1, 1, 1, 1, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 251, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(552, 23, 25, 21, 4, 1, 2, 1, 2, 56, 'NA', 'NA', 1, 56, 0, 0, 0, 0, 0, 0, 0, 0, 0, 252, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(553, 23, 25, 21, 4, 1, 3, 1, 3, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 253, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(554, 23, 25, 21, 4, 1, 4, 1, 4, 4, 'NA', 'NA', 1, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 254, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(555, 23, 25, 21, 4, 1, 5, 1, 5, 6, 'NA', 'NA', 1, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 255, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(556, 23, 25, 21, 4, 1, 6, 1, 6, 66, 'NA', 'NA', 1, 66, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(557, 23, 25, 21, 4, 1, 7, 2, 1, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 257, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(558, 23, 25, 21, 4, 1, 8, 2, 2, 3, 'NA', 'NA', 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 258, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(559, 23, 25, 21, 4, 1, 9, 2, 3, 3, 'NA', 'NA', 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 259, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(560, 23, 25, 21, 4, 1, 10, 2, 4, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2510, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(561, 23, 25, 21, 4, 1, 11, 2, 5, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2511, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(562, 23, 25, 21, 4, 1, 12, 2, 6, 6, 'NA', 'NA', 1, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2512, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(563, 23, 25, 21, 4, 1, 37, 50, 1, 4, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 2537, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(564, 23, 25, 21, 4, 1, 38, 50, 6, 33, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 2538, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(565, 24, 26, 21, 5, 1, 1, 1, 1, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 261, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(566, 24, 26, 21, 5, 1, 2, 1, 2, 56, 'NA', 'NA', 1, 56, 0, 0, 0, 0, 0, 0, 0, 0, 0, 262, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(567, 24, 26, 21, 5, 1, 3, 1, 3, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 263, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(568, 24, 26, 21, 5, 1, 4, 1, 4, 4, 'NA', 'NA', 1, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 264, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(569, 24, 26, 21, 5, 1, 5, 1, 5, 6, 'NA', 'NA', 1, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 265, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(570, 24, 26, 21, 5, 1, 6, 1, 6, 66, 'NA', 'NA', 1, 66, 0, 0, 0, 0, 0, 0, 0, 0, 0, 266, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(571, 24, 26, 21, 5, 1, 7, 2, 1, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 267, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(572, 24, 26, 21, 5, 1, 8, 2, 2, 3, 'NA', 'NA', 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 268, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(573, 24, 26, 21, 5, 1, 9, 2, 3, 3, 'NA', 'NA', 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 269, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(574, 24, 26, 21, 5, 1, 10, 2, 4, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2610, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(575, 24, 26, 21, 5, 1, 11, 2, 5, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2611, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(576, 24, 26, 21, 5, 1, 12, 2, 6, 6, 'NA', 'NA', 1, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2612, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(577, 24, 26, 21, 5, 1, 37, 50, 1, 4, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 2637, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(578, 24, 26, 21, 5, 1, 38, 50, 6, 49, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 2638, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(579, 25, 27, 21, 6, 1, 1, 1, 1, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 271, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(580, 25, 27, 21, 6, 1, 2, 1, 2, 3, 'NA', 'NA', 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 272, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(581, 25, 27, 21, 6, 1, 3, 1, 3, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 273, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(582, 25, 27, 21, 6, 1, 4, 1, 4, 5, 'NA', 'NA', 1, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 274, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(583, 25, 27, 21, 6, 1, 5, 1, 5, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 275, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(584, 25, 27, 21, 6, 1, 6, 1, 6, 8, 'NA', 'NA', 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 276, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(585, 25, 27, 21, 6, 1, 7, 2, 1, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 277, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(586, 25, 27, 21, 6, 1, 8, 2, 2, 3, 'NA', 'NA', 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 278, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(587, 25, 27, 21, 6, 1, 9, 2, 3, 3, 'NA', 'NA', 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 279, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(588, 25, 27, 21, 6, 1, 10, 2, 4, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2710, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(589, 25, 27, 21, 6, 1, 11, 2, 5, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2711, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(590, 25, 27, 21, 6, 1, 12, 2, 6, 6, 'NA', 'NA', 1, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2712, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(591, 25, 27, 21, 6, 1, 37, 50, 1, 4, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 2737, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(592, 25, 27, 21, 6, 1, 38, 50, 6, 19, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 2738, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(593, 26, 28, 21, 7, 1, 1, 1, 1, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 281, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(594, 26, 28, 21, 7, 1, 2, 1, 2, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 282, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(595, 26, 28, 21, 7, 1, 3, 1, 3, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 283, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(596, 26, 28, 21, 7, 1, 4, 1, 4, 4, 'NA', 'NA', 1, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 284, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(597, 26, 28, 21, 7, 1, 5, 1, 5, 6, 'NA', 'NA', 1, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 285, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(598, 26, 28, 21, 7, 1, 6, 1, 6, 66, 'NA', 'NA', 1, 66, 0, 0, 0, 0, 0, 0, 0, 0, 0, 286, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(599, 26, 28, 21, 7, 1, 7, 2, 1, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 287, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(600, 26, 28, 21, 7, 1, 8, 2, 2, 3, 'NA', 'NA', 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 288, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(601, 26, 28, 21, 7, 1, 9, 2, 3, 3, 'NA', 'NA', 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 289, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(602, 26, 28, 21, 7, 1, 10, 2, 4, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2810, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(603, 26, 28, 21, 7, 1, 11, 2, 5, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2811, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(604, 26, 28, 21, 7, 1, 12, 2, 6, 6, 'NA', 'NA', 1, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2812, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(605, 26, 28, 21, 7, 1, 37, 50, 1, 4, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 2837, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(606, 26, 28, 21, 7, 1, 38, 50, 6, 50, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 2838, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(607, 27, 29, 21, 8, 1, 1, 1, 1, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 291, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(608, 27, 29, 21, 8, 1, 2, 1, 2, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 292, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(609, 27, 29, 21, 8, 1, 3, 1, 3, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 293, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(610, 27, 29, 21, 8, 1, 4, 1, 4, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 294, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(611, 27, 29, 21, 8, 1, 5, 1, 5, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 295, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(612, 27, 29, 21, 8, 1, 6, 1, 6, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 296, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(613, 27, 29, 21, 8, 1, 7, 2, 1, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 297, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(614, 27, 29, 21, 8, 1, 8, 2, 2, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 298, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(615, 27, 29, 21, 8, 1, 9, 2, 3, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 299, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(616, 27, 29, 21, 8, 1, 10, 2, 4, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2910, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(617, 27, 29, 21, 8, 1, 11, 2, 5, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2911, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(618, 27, 29, 21, 8, 1, 12, 2, 6, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2912, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(619, 27, 29, 21, 8, 1, 37, 50, 1, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2937, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(620, 27, 29, 21, 8, 1, 38, 50, 6, 45, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2938, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(621, 27, 29, 21, 8, 1, 39, 60, 1, 47, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 47, 2939, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41');
INSERT INTO `1_ss1` (`id`, `edssid`, `sen`, `ssen`, `sfr`, `bf`, `fr`, `tx`, `sas`, `n`, `notes`, `slc`, `st`, `ni`, `nb`, `sid01`, `sid02`, `sid03`, `sid04`, `sid05`, `sid06`, `sid07`, `nd`, `senfr`, `userid`, `submitted`, `created_at`, `updated_at`) VALUES
(622, 27, 29, 21, 8, 1, 40, 60, 6, 24, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 78, 2940, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(623, 27, 29, 21, 8, 1, 41, 70, 1, 38, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 38, 2941, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(624, 27, 29, 21, 8, 1, 42, 70, 6, 15, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 102, 2942, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(625, 27, 29, 21, 8, 1, 43, 80, 1, 24, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 59, 2943, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(626, 27, 29, 21, 8, 1, 44, 80, 6, 5, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 126, 2944, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(627, 28, 30, 21, 9, 1, 1, 1, 1, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 301, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(628, 28, 30, 21, 9, 1, 2, 1, 2, 3, 'NA', 'NA', 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 302, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(629, 28, 30, 21, 9, 1, 3, 1, 3, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 303, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(630, 28, 30, 21, 9, 1, 4, 1, 4, 5, 'NA', 'NA', 1, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 304, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(631, 28, 30, 21, 9, 1, 5, 1, 5, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 305, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(632, 28, 30, 21, 9, 1, 6, 1, 6, 8, 'NA', 'NA', 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 306, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(633, 28, 30, 21, 9, 1, 7, 2, 1, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 307, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(634, 28, 30, 21, 9, 1, 8, 2, 2, 3, 'NA', 'NA', 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 308, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(635, 28, 30, 21, 9, 1, 9, 2, 3, 3, 'NA', 'NA', 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 309, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(636, 28, 30, 21, 9, 1, 10, 2, 4, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3010, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(637, 28, 30, 21, 9, 1, 11, 2, 5, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3011, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(638, 28, 30, 21, 9, 1, 12, 2, 6, 6, 'NA', 'NA', 1, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3012, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(639, 28, 30, 21, 9, 1, 37, 50, 1, 4, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 3037, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(640, 28, 30, 21, 9, 1, 38, 50, 6, 32, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 3038, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(642, 29, 31, 30, 1, 1, 2, 1, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 312, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(643, 29, 31, 30, 1, 1, 3, 1, 2, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 313, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(644, 29, 31, 30, 1, 1, 4, 1, 3, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 314, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(641, 29, 31, 30, 1, 1, 1, 1, 4, 5, 'NA', 'NA', 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 2, 311, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(645, 29, 31, 30, 1, 1, 6, 1, 5, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 316, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(646, 29, 31, 30, 1, 1, 7, 1, 6, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 317, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(647, 29, 31, 30, 1, 1, 8, 2, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 318, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(648, 29, 31, 30, 1, 1, 9, 2, 2, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 319, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(649, 29, 31, 30, 1, 1, 10, 2, 3, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3110, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(650, 29, 31, 30, 1, 1, 11, 2, 4, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3111, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(651, 29, 31, 30, 1, 1, 12, 2, 5, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3112, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(652, 29, 31, 30, 1, 1, 13, 2, 6, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3113, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(653, 29, 31, 30, 1, 1, 14, 3, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3114, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(654, 29, 31, 30, 1, 1, 15, 3, 2, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3115, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(655, 29, 31, 30, 1, 1, 16, 3, 3, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3116, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(656, 29, 31, 30, 1, 1, 17, 3, 4, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3117, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(657, 29, 31, 30, 1, 1, 18, 3, 5, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3118, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(658, 29, 31, 30, 1, 1, 19, 3, 6, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3119, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(659, 29, 31, 30, 1, 1, 20, 4, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3120, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(660, 29, 31, 30, 1, 1, 21, 4, 2, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3121, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(661, 29, 31, 30, 1, 1, 22, 4, 3, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3122, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(662, 29, 31, 30, 1, 1, 23, 4, 4, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3123, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(663, 29, 31, 30, 1, 1, 24, 4, 5, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3124, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(664, 29, 31, 30, 1, 1, 25, 4, 6, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3125, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(665, 29, 31, 30, 1, 1, 26, 5, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3126, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(666, 29, 31, 30, 1, 1, 27, 5, 2, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3127, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(667, 29, 31, 30, 1, 1, 28, 5, 3, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3128, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(668, 29, 31, 30, 1, 1, 29, 5, 4, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3129, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(669, 29, 31, 30, 1, 1, 30, 5, 5, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3130, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(670, 29, 31, 30, 1, 1, 31, 5, 6, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3131, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(671, 29, 31, 30, 1, 1, 32, 6, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3132, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(672, 29, 31, 30, 1, 1, 33, 6, 2, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3133, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(673, 29, 31, 30, 1, 1, 34, 6, 3, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3134, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(674, 29, 31, 30, 1, 1, 35, 6, 4, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3135, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(675, 29, 31, 30, 1, 1, 36, 6, 5, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3136, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(676, 29, 31, 30, 1, 1, 37, 6, 6, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3137, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(677, 29, 31, 30, 1, 1, 38, 9, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3138, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(678, 29, 31, 30, 1, 1, 39, 9, 2, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3139, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(679, 29, 31, 30, 1, 1, 40, 9, 3, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3140, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(680, 29, 31, 30, 1, 1, 41, 9, 4, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3141, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(681, 29, 31, 30, 1, 1, 42, 9, 5, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3142, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(682, 29, 31, 30, 1, 1, 43, 9, 6, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3143, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(683, 29, 31, 30, 1, 1, 44, 10, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3144, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(684, 29, 31, 30, 1, 1, 45, 10, 2, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3145, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(685, 29, 31, 30, 1, 1, 46, 10, 3, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3146, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(686, 29, 31, 30, 1, 1, 47, 10, 4, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3147, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(687, 29, 31, 30, 1, 1, 48, 10, 5, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3148, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(688, 29, 31, 30, 1, 1, 49, 10, 6, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3149, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(689, 29, 31, 30, 1, 1, 50, 11, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3150, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(690, 29, 31, 30, 1, 1, 51, 11, 2, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3151, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(691, 29, 31, 30, 1, 1, 52, 11, 3, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3152, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(692, 29, 31, 30, 1, 1, 53, 11, 4, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3153, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(693, 29, 31, 30, 1, 1, 54, 11, 5, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3154, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(694, 29, 31, 30, 1, 1, 55, 11, 6, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3155, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(695, 29, 31, 30, 1, 1, 56, 50, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3156, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(696, 29, 31, 30, 1, 1, 57, 50, 6, 35, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3157, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(697, 29, 31, 30, 1, 1, 58, 60, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3158, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(698, 29, 31, 30, 1, 1, 59, 60, 6, 6, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3159, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(699, 29, 31, 30, 1, 1, 60, 70, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3160, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(700, 29, 31, 30, 1, 1, 61, 70, 6, 14, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3161, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(701, 29, 31, 30, 1, 1, 62, 80, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3162, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(702, 29, 31, 30, 1, 1, 63, 80, 6, 17, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3163, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(703, 30, 32, 30, 2, 1, 1, 1, 5, 10, 'NA', 'NA', 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 321, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(704, 31, 33, 31, 2, 1, 1, 1, 1, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 331, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(705, 31, 33, 31, 2, 1, 2, 1, 2, 3, 'NA', 'NA', 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 332, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(706, 31, 33, 31, 2, 1, 3, 1, 3, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 333, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(707, 31, 33, 31, 2, 1, 4, 1, 4, 5, 'NA', 'NA', 1, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 334, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(708, 31, 33, 31, 2, 1, 5, 1, 5, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 335, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(709, 31, 33, 31, 2, 1, 6, 1, 6, 8, 'NA', 'NA', 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 336, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(710, 31, 33, 31, 2, 1, 7, 2, 1, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 337, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(711, 31, 33, 31, 2, 1, 8, 2, 2, 3, 'NA', 'NA', 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 338, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(712, 31, 33, 31, 2, 1, 9, 2, 3, 3, 'NA', 'NA', 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 339, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(713, 31, 33, 31, 2, 1, 10, 2, 4, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3310, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(714, 31, 33, 31, 2, 1, 11, 2, 5, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3311, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(715, 31, 33, 31, 2, 1, 12, 2, 6, 6, 'NA', 'NA', 1, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3312, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(716, 31, 33, 31, 2, 1, 37, 50, 1, 4, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 3337, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(717, 31, 33, 31, 2, 1, 38, 50, 6, 30, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 3338, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(718, 32, 34, 31, 3, 1, 1, 1, 1, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 341, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(719, 32, 34, 31, 3, 1, 2, 1, 2, 56, 'NA', 'NA', 1, 56, 0, 0, 0, 0, 0, 0, 0, 0, 0, 342, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(720, 32, 34, 31, 3, 1, 3, 1, 3, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 343, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(721, 32, 34, 31, 3, 1, 4, 1, 4, 4, 'NA', 'NA', 1, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 344, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(722, 32, 34, 31, 3, 1, 5, 1, 5, 6, 'NA', 'NA', 1, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 345, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(723, 32, 34, 31, 3, 1, 6, 1, 6, 66, 'NA', 'NA', 1, 66, 0, 0, 0, 0, 0, 0, 0, 0, 0, 346, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(724, 32, 34, 31, 3, 1, 7, 2, 1, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 347, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(725, 32, 34, 31, 3, 1, 8, 2, 2, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 348, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(726, 32, 34, 31, 3, 1, 9, 2, 3, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 349, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(727, 32, 34, 31, 3, 1, 10, 2, 4, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3410, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(728, 32, 34, 31, 3, 1, 11, 2, 5, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3411, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(729, 32, 34, 31, 3, 1, 12, 2, 6, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3412, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(730, 32, 34, 31, 3, 1, 37, 50, 1, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3437, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(731, 32, 34, 31, 3, 1, 38, 50, 6, 58, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3438, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(732, 33, 35, 31, 4, 1, 1, 1, 1, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 351, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(733, 33, 35, 31, 4, 1, 2, 1, 2, 56, 'NA', 'NA', 1, 56, 0, 0, 0, 0, 0, 0, 0, 0, 0, 352, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(734, 33, 35, 31, 4, 1, 3, 1, 3, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 353, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(735, 33, 35, 31, 4, 1, 4, 1, 4, 4, 'NA', 'NA', 1, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 354, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(736, 33, 35, 31, 4, 1, 5, 1, 5, 6, 'NA', 'NA', 1, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 355, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(737, 33, 35, 31, 4, 1, 6, 1, 6, 66, 'NA', 'NA', 1, 66, 0, 0, 0, 0, 0, 0, 0, 0, 0, 356, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(738, 33, 35, 31, 4, 1, 7, 2, 1, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 357, '1001', 'submitted_via_web', '2021-09-15 14:48:41', '2021-09-15 14:48:41'),
(739, 33, 35, 31, 4, 1, 8, 2, 2, 3, 'NA', 'NA', 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 358, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(740, 33, 35, 31, 4, 1, 9, 2, 3, 3, 'NA', 'NA', 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 359, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(741, 33, 35, 31, 4, 1, 10, 2, 4, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3510, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(742, 33, 35, 31, 4, 1, 11, 2, 5, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3511, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(743, 33, 35, 31, 4, 1, 12, 2, 6, 6, 'NA', 'NA', 1, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3512, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(744, 33, 35, 31, 4, 1, 37, 50, 1, 4, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 3537, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(745, 33, 35, 31, 4, 1, 38, 50, 6, 33, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 3538, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(746, 34, 36, 31, 5, 1, 1, 1, 1, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 361, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(747, 34, 36, 31, 5, 1, 2, 1, 2, 56, 'NA', 'NA', 1, 56, 0, 0, 0, 0, 0, 0, 0, 0, 0, 362, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(748, 34, 36, 31, 5, 1, 3, 1, 3, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 363, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(749, 34, 36, 31, 5, 1, 4, 1, 4, 4, 'NA', 'NA', 1, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 364, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(750, 34, 36, 31, 5, 1, 5, 1, 5, 6, 'NA', 'NA', 1, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 365, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(751, 34, 36, 31, 5, 1, 6, 1, 6, 66, 'NA', 'NA', 1, 66, 0, 0, 0, 0, 0, 0, 0, 0, 0, 366, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(752, 34, 36, 31, 5, 1, 7, 2, 1, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 367, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(753, 34, 36, 31, 5, 1, 8, 2, 2, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 368, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(754, 34, 36, 31, 5, 1, 9, 2, 3, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 369, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(755, 34, 36, 31, 5, 1, 10, 2, 4, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3610, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(756, 34, 36, 31, 5, 1, 11, 2, 5, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3611, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(757, 34, 36, 31, 5, 1, 12, 2, 6, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3612, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(758, 34, 36, 31, 5, 1, 37, 50, 1, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3637, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(759, 34, 36, 31, 5, 1, 38, 50, 6, 22, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3638, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(760, 35, 37, 31, 6, 1, 1, 1, 1, 34, 'NA', 'NA', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 371, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(761, 35, 37, 31, 6, 1, 2, 1, 2, 13, 'NA', 'NA', 1, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 372, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(762, 35, 37, 31, 6, 1, 3, 1, 3, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 373, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(763, 35, 37, 31, 6, 1, 4, 1, 4, 4, 'NA', 'NA', 1, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 374, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(764, 35, 37, 31, 6, 1, 5, 1, 5, 6, 'NA', 'NA', 1, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 375, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(765, 35, 37, 31, 6, 1, 6, 1, 6, 23, 'NA', 'NA', 1, 23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 376, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(766, 35, 37, 31, 6, 1, 7, 2, 1, 14, 'NA', 'NA', 1, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 377, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(767, 35, 37, 31, 6, 1, 8, 2, 2, 1, 'NA', 'NA', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 378, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(768, 35, 37, 31, 6, 1, 9, 2, 3, 12, 'NA', 'NA', 1, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 379, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(769, 35, 37, 31, 6, 1, 10, 2, 4, 20, 'NA', 'NA', 1, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3710, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(770, 35, 37, 31, 6, 1, 11, 2, 5, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3711, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(771, 35, 37, 31, 6, 1, 12, 2, 6, 33, 'NA', 'NA', 1, 33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3712, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(772, 35, 37, 31, 6, 1, 37, 50, 1, 12, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12, 3737, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(773, 35, 37, 31, 6, 1, 38, 50, 6, 44, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 37, 3738, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(774, 36, 38, 31, 7, 1, 1, 1, 1, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 381, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(775, 36, 38, 31, 7, 1, 2, 1, 2, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 382, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(776, 36, 38, 31, 7, 1, 3, 1, 3, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 383, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(777, 36, 38, 31, 7, 1, 4, 1, 4, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 384, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(778, 36, 38, 31, 7, 1, 5, 1, 5, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 385, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(779, 36, 38, 31, 7, 1, 6, 1, 6, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 386, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(780, 36, 38, 31, 7, 1, 7, 2, 1, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 387, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(781, 36, 38, 31, 7, 1, 8, 2, 2, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 388, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(782, 36, 38, 31, 7, 1, 9, 2, 3, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 389, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(783, 36, 38, 31, 7, 1, 10, 2, 4, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3810, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(784, 36, 38, 31, 7, 1, 11, 2, 5, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3811, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(785, 36, 38, 31, 7, 1, 12, 2, 6, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3812, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(786, 36, 38, 31, 7, 1, 37, 50, 1, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3837, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(787, 36, 38, 31, 7, 1, 38, 50, 6, 37, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3838, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(788, 37, 39, 31, 8, 1, 1, 1, 1, 29, 'NA', 'NA', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 391, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(789, 37, 39, 31, 8, 1, 2, 1, 2, 13, 'NA', 'NA', 1, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 392, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(790, 37, 39, 31, 8, 1, 3, 1, 3, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 393, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(791, 37, 39, 31, 8, 1, 4, 1, 4, 4, 'NA', 'NA', 1, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 394, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(792, 37, 39, 31, 8, 1, 5, 1, 5, 6, 'NA', 'NA', 1, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 395, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(793, 37, 39, 31, 8, 1, 6, 1, 6, 23, 'NA', 'NA', 1, 23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 396, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(794, 37, 39, 31, 8, 1, 7, 2, 1, 14, 'NA', 'NA', 1, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 397, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(795, 37, 39, 31, 8, 1, 8, 2, 2, 1, 'NA', 'NA', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 398, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(796, 37, 39, 31, 8, 1, 9, 2, 3, 12, 'NA', 'NA', 1, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 399, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(797, 37, 39, 31, 8, 1, 10, 2, 4, 20, 'NA', 'NA', 1, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3910, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(798, 37, 39, 31, 8, 1, 11, 2, 5, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3911, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(799, 37, 39, 31, 8, 1, 12, 2, 6, 33, 'NA', 'NA', 1, 33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3912, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(800, 37, 39, 31, 8, 1, 37, 50, 1, 12, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12, 3937, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(801, 37, 39, 31, 8, 1, 38, 50, 6, 50, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 37, 3938, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(802, 38, 40, 31, 9, 1, 1, 1, 1, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 401, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(803, 38, 40, 31, 9, 1, 2, 1, 2, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 402, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(804, 38, 40, 31, 9, 1, 3, 1, 3, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 403, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(805, 38, 40, 31, 9, 1, 4, 1, 4, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 404, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(806, 38, 40, 31, 9, 1, 5, 1, 5, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 405, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(807, 38, 40, 31, 9, 1, 6, 1, 6, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 406, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(808, 38, 40, 31, 9, 1, 7, 2, 1, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 407, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(809, 38, 40, 31, 9, 1, 8, 2, 2, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 408, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(810, 38, 40, 31, 9, 1, 9, 2, 3, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 409, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(811, 38, 40, 31, 9, 1, 10, 2, 4, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4010, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(812, 38, 40, 31, 9, 1, 11, 2, 5, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4011, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(813, 38, 40, 31, 9, 1, 12, 2, 6, 0, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4012, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(814, 38, 40, 31, 9, 1, 37, 50, 1, 7, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 4037, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(815, 38, 40, 31, 9, 1, 38, 50, 6, 50, 'NA', 'NA', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 17, 4038, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(816, 38, 40, 31, 9, 1, 39, 60, 1, 47, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 47, 4039, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(817, 38, 40, 31, 9, 1, 40, 60, 6, 18, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 78, 4040, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(818, 38, 40, 31, 9, 1, 41, 70, 1, 38, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 38, 4041, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(819, 38, 40, 31, 9, 1, 42, 70, 6, 16, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 102, 4042, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(820, 38, 40, 31, 9, 1, 43, 80, 1, 22, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 59, 4043, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(821, 38, 40, 31, 9, 1, 44, 80, 6, 14, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 126, 4044, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(823, 39, 66, 65, 1, 1, 2, 1, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 662, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(824, 39, 66, 65, 1, 1, 3, 1, 2, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 663, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(825, 39, 66, 65, 1, 1, 4, 1, 3, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 664, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(822, 39, 66, 65, 1, 1, 1, 1, 4, 5, 'NA', 'NA', 0, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 661, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(826, 39, 66, 65, 1, 1, 6, 1, 5, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 666, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(827, 39, 66, 65, 1, 1, 7, 1, 6, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 667, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(828, 39, 66, 65, 1, 1, 8, 2, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 668, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(829, 39, 66, 65, 1, 1, 9, 2, 2, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 669, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(830, 39, 66, 65, 1, 1, 10, 2, 3, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6610, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(831, 39, 66, 65, 1, 1, 11, 2, 4, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6611, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(832, 39, 66, 65, 1, 1, 12, 2, 5, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6612, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(833, 39, 66, 65, 1, 1, 13, 2, 6, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6613, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(834, 39, 66, 65, 1, 1, 14, 3, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6614, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(835, 39, 66, 65, 1, 1, 15, 3, 2, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6615, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(836, 39, 66, 65, 1, 1, 16, 3, 3, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6616, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(837, 39, 66, 65, 1, 1, 17, 3, 4, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6617, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(838, 39, 66, 65, 1, 1, 18, 3, 5, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6618, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(839, 39, 66, 65, 1, 1, 19, 3, 6, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6619, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(840, 39, 66, 65, 1, 1, 20, 4, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6620, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(841, 39, 66, 65, 1, 1, 21, 4, 2, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6621, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(842, 39, 66, 65, 1, 1, 22, 4, 3, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6622, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(843, 39, 66, 65, 1, 1, 23, 4, 4, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6623, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(844, 39, 66, 65, 1, 1, 24, 4, 5, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6624, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(845, 39, 66, 65, 1, 1, 25, 4, 6, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6625, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(846, 39, 66, 65, 1, 1, 26, 5, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6626, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(847, 39, 66, 65, 1, 1, 27, 5, 2, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6627, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(848, 39, 66, 65, 1, 1, 28, 5, 3, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6628, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(849, 39, 66, 65, 1, 1, 29, 5, 4, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6629, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(850, 39, 66, 65, 1, 1, 30, 5, 5, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6630, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(851, 39, 66, 65, 1, 1, 31, 5, 6, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6631, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(852, 39, 66, 65, 1, 1, 32, 6, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6632, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(853, 39, 66, 65, 1, 1, 33, 6, 2, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6633, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(854, 39, 66, 65, 1, 1, 34, 6, 3, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6634, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(855, 39, 66, 65, 1, 1, 35, 6, 4, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6635, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(856, 39, 66, 65, 1, 1, 36, 6, 5, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6636, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(857, 39, 66, 65, 1, 1, 37, 6, 6, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6637, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(858, 39, 66, 65, 1, 1, 38, 9, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6638, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(859, 39, 66, 65, 1, 1, 39, 9, 2, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6639, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(860, 39, 66, 65, 1, 1, 40, 9, 3, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6640, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(861, 39, 66, 65, 1, 1, 41, 9, 4, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6641, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(862, 39, 66, 65, 1, 1, 42, 9, 5, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6642, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(863, 39, 66, 65, 1, 1, 43, 9, 6, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6643, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(864, 39, 66, 65, 1, 1, 44, 10, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6644, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(865, 39, 66, 65, 1, 1, 45, 10, 2, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6645, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(866, 39, 66, 65, 1, 1, 46, 10, 3, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6646, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(867, 39, 66, 65, 1, 1, 47, 10, 4, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6647, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(868, 39, 66, 65, 1, 1, 48, 10, 5, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6648, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(869, 39, 66, 65, 1, 1, 49, 10, 6, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6649, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(870, 39, 66, 65, 1, 1, 50, 11, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6650, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(871, 39, 66, 65, 1, 1, 51, 11, 2, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6651, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(872, 39, 66, 65, 1, 1, 52, 11, 3, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6652, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(873, 39, 66, 65, 1, 1, 53, 11, 4, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6653, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(874, 39, 66, 65, 1, 1, 54, 11, 5, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6654, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(875, 39, 66, 65, 1, 1, 55, 11, 6, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6655, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(876, 39, 66, 65, 1, 1, 56, 50, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6656, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(877, 39, 66, 65, 1, 1, 57, 50, 6, 54, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6657, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(878, 39, 66, 65, 1, 1, 58, 60, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6658, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(879, 39, 66, 65, 1, 1, 59, 60, 6, 6, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6659, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(880, 39, 66, 65, 1, 1, 60, 70, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6660, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(881, 39, 66, 65, 1, 1, 61, 70, 6, 12, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6661, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(882, 39, 66, 65, 1, 1, 62, 80, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6662, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(883, 39, 66, 65, 1, 1, 63, 80, 6, 17, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6663, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(885, 40, 67, 65, 2, 1, 2, 1, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 672, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(886, 40, 67, 65, 2, 1, 3, 1, 2, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 673, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(887, 40, 67, 65, 2, 1, 4, 1, 3, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 674, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(888, 40, 67, 65, 2, 1, 5, 1, 4, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 675, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(889, 40, 67, 65, 2, 1, 6, 1, 5, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 676, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(890, 40, 67, 65, 2, 1, 7, 1, 6, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 677, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(891, 40, 67, 65, 2, 1, 8, 2, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 678, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(892, 40, 67, 65, 2, 1, 9, 2, 2, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 679, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(893, 40, 67, 65, 2, 1, 10, 2, 3, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6710, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(884, 40, 67, 65, 2, 1, 1, 2, 4, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 671, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(894, 40, 67, 65, 2, 1, 12, 2, 5, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6712, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(895, 40, 67, 65, 2, 1, 13, 2, 6, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6713, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(896, 40, 67, 65, 2, 1, 14, 3, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6714, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(897, 40, 67, 65, 2, 1, 15, 3, 2, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6715, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(898, 40, 67, 65, 2, 1, 16, 3, 3, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6716, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(899, 40, 67, 65, 2, 1, 17, 3, 4, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6717, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(900, 40, 67, 65, 2, 1, 18, 3, 5, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6718, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(901, 40, 67, 65, 2, 1, 19, 3, 6, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6719, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(902, 40, 67, 65, 2, 1, 20, 4, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6720, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(903, 40, 67, 65, 2, 1, 21, 4, 2, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6721, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(904, 40, 67, 65, 2, 1, 22, 4, 3, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6722, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(905, 40, 67, 65, 2, 1, 23, 4, 4, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6723, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(906, 40, 67, 65, 2, 1, 24, 4, 5, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6724, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(907, 40, 67, 65, 2, 1, 25, 4, 6, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6725, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(908, 40, 67, 65, 2, 1, 26, 5, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6726, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(909, 40, 67, 65, 2, 1, 27, 5, 2, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6727, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(910, 40, 67, 65, 2, 1, 28, 5, 3, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6728, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(911, 40, 67, 65, 2, 1, 29, 5, 4, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6729, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(912, 40, 67, 65, 2, 1, 30, 5, 5, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6730, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(913, 40, 67, 65, 2, 1, 31, 5, 6, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6731, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(914, 40, 67, 65, 2, 1, 32, 6, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6732, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(915, 40, 67, 65, 2, 1, 33, 6, 2, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6733, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(916, 40, 67, 65, 2, 1, 34, 6, 3, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6734, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(917, 40, 67, 65, 2, 1, 35, 6, 4, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6735, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(918, 40, 67, 65, 2, 1, 36, 6, 5, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6736, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(919, 40, 67, 65, 2, 1, 37, 6, 6, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6737, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(920, 40, 67, 65, 2, 1, 38, 9, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6738, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(921, 40, 67, 65, 2, 1, 39, 9, 2, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6739, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(922, 40, 67, 65, 2, 1, 40, 9, 3, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6740, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(923, 40, 67, 65, 2, 1, 41, 9, 4, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6741, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(924, 40, 67, 65, 2, 1, 42, 9, 5, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6742, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(925, 40, 67, 65, 2, 1, 43, 9, 6, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6743, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(926, 40, 67, 65, 2, 1, 44, 10, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6744, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(927, 40, 67, 65, 2, 1, 45, 10, 2, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6745, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(928, 40, 67, 65, 2, 1, 46, 10, 3, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6746, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42');
INSERT INTO `1_ss1` (`id`, `edssid`, `sen`, `ssen`, `sfr`, `bf`, `fr`, `tx`, `sas`, `n`, `notes`, `slc`, `st`, `ni`, `nb`, `sid01`, `sid02`, `sid03`, `sid04`, `sid05`, `sid06`, `sid07`, `nd`, `senfr`, `userid`, `submitted`, `created_at`, `updated_at`) VALUES
(929, 40, 67, 65, 2, 1, 47, 10, 4, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6747, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(930, 40, 67, 65, 2, 1, 48, 10, 5, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6748, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(931, 40, 67, 65, 2, 1, 49, 10, 6, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6749, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(932, 40, 67, 65, 2, 1, 50, 11, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6750, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(933, 40, 67, 65, 2, 1, 51, 11, 2, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6751, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(934, 40, 67, 65, 2, 1, 52, 11, 3, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6752, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(935, 40, 67, 65, 2, 1, 53, 11, 4, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6753, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(936, 40, 67, 65, 2, 1, 54, 11, 5, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6754, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(937, 40, 67, 65, 2, 1, 55, 11, 6, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6755, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(938, 40, 67, 65, 2, 1, 56, 50, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6756, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(939, 40, 67, 65, 2, 1, 57, 50, 6, 35, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6757, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(940, 40, 67, 65, 2, 1, 58, 60, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6758, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(941, 40, 67, 65, 2, 1, 59, 60, 6, 23, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6759, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(942, 40, 67, 65, 2, 1, 60, 70, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6760, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(943, 40, 67, 65, 2, 1, 61, 70, 6, 13, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6761, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(944, 40, 67, 65, 2, 1, 62, 80, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6762, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(945, 40, 67, 65, 2, 1, 63, 80, 6, 19, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6763, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(948, 41, 71, 70, 1, 1, 3, 1, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 713, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(949, 41, 71, 70, 1, 1, 4, 1, 2, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 714, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(950, 41, 71, 70, 1, 1, 5, 1, 3, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 715, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(946, 41, 71, 70, 1, 1, 1, 1, 4, 4, 'NA', 'NA', 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 711, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(951, 41, 71, 70, 1, 1, 7, 1, 5, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 717, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(952, 41, 71, 70, 1, 1, 8, 1, 6, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 718, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(953, 41, 71, 70, 1, 1, 9, 2, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 719, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(954, 41, 71, 70, 1, 1, 10, 2, 2, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7110, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(955, 41, 71, 70, 1, 1, 11, 2, 3, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7111, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(947, 41, 71, 70, 1, 1, 2, 2, 4, 5, 'NA', 'NA', 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 712, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(956, 41, 71, 70, 1, 1, 13, 2, 5, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7113, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(957, 41, 71, 70, 1, 1, 14, 2, 6, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7114, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(958, 41, 71, 70, 1, 1, 15, 3, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7115, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(959, 41, 71, 70, 1, 1, 16, 3, 2, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7116, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(960, 41, 71, 70, 1, 1, 17, 3, 3, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7117, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(961, 41, 71, 70, 1, 1, 18, 3, 4, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7118, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(962, 41, 71, 70, 1, 1, 19, 3, 5, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7119, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(963, 41, 71, 70, 1, 1, 20, 3, 6, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7120, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(964, 41, 71, 70, 1, 1, 21, 4, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7121, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(965, 41, 71, 70, 1, 1, 22, 4, 2, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7122, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(966, 41, 71, 70, 1, 1, 23, 4, 3, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7123, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(967, 41, 71, 70, 1, 1, 24, 4, 4, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7124, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(968, 41, 71, 70, 1, 1, 25, 4, 5, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7125, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(969, 41, 71, 70, 1, 1, 26, 4, 6, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7126, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(970, 41, 71, 70, 1, 1, 27, 5, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7127, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(971, 41, 71, 70, 1, 1, 28, 5, 2, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7128, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(972, 41, 71, 70, 1, 1, 29, 5, 3, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7129, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(973, 41, 71, 70, 1, 1, 30, 5, 4, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7130, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(974, 41, 71, 70, 1, 1, 31, 5, 5, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7131, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(975, 41, 71, 70, 1, 1, 32, 5, 6, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7132, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(976, 41, 71, 70, 1, 1, 33, 6, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7133, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(977, 41, 71, 70, 1, 1, 34, 6, 2, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7134, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(978, 41, 71, 70, 1, 1, 35, 6, 3, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7135, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(979, 41, 71, 70, 1, 1, 36, 6, 4, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7136, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(980, 41, 71, 70, 1, 1, 37, 6, 5, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7137, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(981, 41, 71, 70, 1, 1, 38, 6, 6, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7138, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(982, 41, 71, 70, 1, 1, 39, 9, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7139, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(983, 41, 71, 70, 1, 1, 40, 9, 2, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7140, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(984, 41, 71, 70, 1, 1, 41, 9, 3, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7141, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(985, 41, 71, 70, 1, 1, 42, 9, 4, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7142, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(986, 41, 71, 70, 1, 1, 43, 9, 5, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7143, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(987, 41, 71, 70, 1, 1, 44, 9, 6, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7144, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(988, 41, 71, 70, 1, 1, 45, 10, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7145, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(989, 41, 71, 70, 1, 1, 46, 10, 2, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7146, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(990, 41, 71, 70, 1, 1, 47, 10, 3, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7147, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(991, 41, 71, 70, 1, 1, 48, 10, 4, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7148, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(992, 41, 71, 70, 1, 1, 49, 10, 5, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7149, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(993, 41, 71, 70, 1, 1, 50, 10, 6, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7150, '1001', 'submitted_via_web', '2021-09-15 14:48:42', '2021-09-15 14:48:42'),
(994, 41, 71, 70, 1, 1, 51, 11, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7151, '1001', 'submitted_via_web', '2021-09-15 14:48:43', '2021-09-15 14:48:43'),
(995, 41, 71, 70, 1, 1, 52, 11, 2, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7152, '1001', 'submitted_via_web', '2021-09-15 14:48:43', '2021-09-15 14:48:43'),
(996, 41, 71, 70, 1, 1, 53, 11, 3, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7153, '1001', 'submitted_via_web', '2021-09-15 14:48:43', '2021-09-15 14:48:43'),
(997, 41, 71, 70, 1, 1, 54, 11, 4, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7154, '1001', 'submitted_via_web', '2021-09-15 14:48:43', '2021-09-15 14:48:43'),
(998, 41, 71, 70, 1, 1, 55, 11, 5, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7155, '1001', 'submitted_via_web', '2021-09-15 14:48:43', '2021-09-15 14:48:43'),
(999, 41, 71, 70, 1, 1, 56, 11, 6, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7156, '1001', 'submitted_via_web', '2021-09-15 14:48:43', '2021-09-15 14:48:43'),
(1000, 41, 71, 70, 1, 1, 57, 50, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7157, '1001', 'submitted_via_web', '2021-09-15 14:48:43', '2021-09-15 14:48:43'),
(1001, 41, 71, 70, 1, 1, 58, 50, 6, 21, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7158, '1001', 'submitted_via_web', '2021-09-15 14:48:43', '2021-09-15 14:48:43'),
(1002, 41, 71, 70, 1, 1, 59, 60, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7159, '1001', 'submitted_via_web', '2021-09-15 14:48:43', '2021-09-15 14:48:43'),
(1003, 41, 71, 70, 1, 1, 60, 60, 6, 8, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7160, '1001', 'submitted_via_web', '2021-09-15 14:48:43', '2021-09-15 14:48:43'),
(1004, 41, 71, 70, 1, 1, 61, 70, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7161, '1001', 'submitted_via_web', '2021-09-15 14:48:43', '2021-09-15 14:48:43'),
(1005, 41, 71, 70, 1, 1, 62, 70, 6, 11, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7162, '1001', 'submitted_via_web', '2021-09-15 14:48:43', '2021-09-15 14:48:43'),
(1006, 41, 71, 70, 1, 1, 63, 80, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7163, '1001', 'submitted_via_web', '2021-09-15 14:48:43', '2021-09-15 14:48:43'),
(1007, 41, 71, 70, 1, 1, 64, 80, 6, 17, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7164, '1001', 'submitted_via_web', '2021-09-15 14:48:43', '2021-09-15 14:48:43'),
(1009, 42, 72, 70, 2, 1, 2, 1, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 722, '1001', 'submitted_via_web', '2021-09-15 14:48:43', '2021-09-15 14:48:43'),
(1008, 42, 72, 70, 2, 1, 1, 1, 2, 2, 'NA', 'NA', 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 721, '1001', 'submitted_via_web', '2021-09-15 14:48:43', '2021-09-15 14:48:43'),
(1010, 42, 72, 70, 2, 1, 4, 1, 3, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 724, '1001', 'submitted_via_web', '2021-09-15 14:48:43', '2021-09-15 14:48:43'),
(1011, 42, 72, 70, 2, 1, 5, 1, 4, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 725, '1001', 'submitted_via_web', '2021-09-15 14:48:43', '2021-09-15 14:48:43'),
(1012, 42, 72, 70, 2, 1, 6, 1, 5, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 726, '1001', 'submitted_via_web', '2021-09-15 14:48:43', '2021-09-15 14:48:43'),
(1013, 42, 72, 70, 2, 1, 7, 1, 6, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 727, '1001', 'submitted_via_web', '2021-09-15 14:48:43', '2021-09-15 14:48:43'),
(1014, 42, 72, 70, 2, 1, 8, 2, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 728, '1001', 'submitted_via_web', '2021-09-15 14:48:43', '2021-09-15 14:48:43'),
(1015, 42, 72, 70, 2, 1, 9, 2, 2, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 729, '1001', 'submitted_via_web', '2021-09-15 14:48:43', '2021-09-15 14:48:43'),
(1016, 42, 72, 70, 2, 1, 10, 2, 3, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7210, '1001', 'submitted_via_web', '2021-09-15 14:48:43', '2021-09-15 14:48:43'),
(1017, 42, 72, 70, 2, 1, 11, 2, 4, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7211, '1001', 'submitted_via_web', '2021-09-15 14:48:43', '2021-09-15 14:48:43'),
(1018, 42, 72, 70, 2, 1, 12, 2, 5, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7212, '1001', 'submitted_via_web', '2021-09-15 14:48:43', '2021-09-15 14:48:43'),
(1019, 42, 72, 70, 2, 1, 13, 2, 6, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7213, '1001', 'submitted_via_web', '2021-09-15 14:48:43', '2021-09-15 14:48:43'),
(1020, 42, 72, 70, 2, 1, 14, 3, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7214, '1001', 'submitted_via_web', '2021-09-15 14:48:43', '2021-09-15 14:48:43'),
(1021, 42, 72, 70, 2, 1, 15, 3, 2, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7215, '1001', 'submitted_via_web', '2021-09-15 14:48:43', '2021-09-15 14:48:43'),
(1022, 42, 72, 70, 2, 1, 16, 3, 3, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7216, '1001', 'submitted_via_web', '2021-09-15 14:48:43', '2021-09-15 14:48:43'),
(1023, 42, 72, 70, 2, 1, 17, 3, 4, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7217, '1001', 'submitted_via_web', '2021-09-15 14:48:43', '2021-09-15 14:48:43'),
(1024, 42, 72, 70, 2, 1, 18, 3, 5, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7218, '1001', 'submitted_via_web', '2021-09-15 14:48:43', '2021-09-15 14:48:43'),
(1025, 42, 72, 70, 2, 1, 19, 3, 6, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7219, '1001', 'submitted_via_web', '2021-09-15 14:48:43', '2021-09-15 14:48:43'),
(1026, 42, 72, 70, 2, 1, 20, 4, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7220, '1001', 'submitted_via_web', '2021-09-15 14:48:43', '2021-09-15 14:48:43'),
(1027, 42, 72, 70, 2, 1, 21, 4, 2, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7221, '1001', 'submitted_via_web', '2021-09-15 14:48:43', '2021-09-15 14:48:43'),
(1028, 42, 72, 70, 2, 1, 22, 4, 3, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7222, '1001', 'submitted_via_web', '2021-09-15 14:48:43', '2021-09-15 14:48:43'),
(1029, 42, 72, 70, 2, 1, 23, 4, 4, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7223, '1001', 'submitted_via_web', '2021-09-15 14:48:43', '2021-09-15 14:48:43'),
(1030, 42, 72, 70, 2, 1, 24, 4, 5, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7224, '1001', 'submitted_via_web', '2021-09-15 14:48:43', '2021-09-15 14:48:43'),
(1031, 42, 72, 70, 2, 1, 25, 4, 6, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7225, '1001', 'submitted_via_web', '2021-09-15 14:48:43', '2021-09-15 14:48:43'),
(1032, 42, 72, 70, 2, 1, 26, 5, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7226, '1001', 'submitted_via_web', '2021-09-15 14:48:43', '2021-09-15 14:48:43'),
(1033, 42, 72, 70, 2, 1, 27, 5, 2, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7227, '1001', 'submitted_via_web', '2021-09-15 14:48:43', '2021-09-15 14:48:43'),
(1034, 42, 72, 70, 2, 1, 28, 5, 3, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7228, '1001', 'submitted_via_web', '2021-09-15 14:48:43', '2021-09-15 14:48:43'),
(1035, 42, 72, 70, 2, 1, 29, 5, 4, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7229, '1001', 'submitted_via_web', '2021-09-15 14:48:43', '2021-09-15 14:48:43'),
(1036, 42, 72, 70, 2, 1, 30, 5, 5, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7230, '1001', 'submitted_via_web', '2021-09-15 14:48:43', '2021-09-15 14:48:43'),
(1037, 42, 72, 70, 2, 1, 31, 5, 6, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7231, '1001', 'submitted_via_web', '2021-09-15 14:48:43', '2021-09-15 14:48:43'),
(1038, 42, 72, 70, 2, 1, 32, 6, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7232, '1001', 'submitted_via_web', '2021-09-15 14:48:43', '2021-09-15 14:48:43'),
(1039, 42, 72, 70, 2, 1, 33, 6, 2, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7233, '1001', 'submitted_via_web', '2021-09-15 14:48:43', '2021-09-15 14:48:43'),
(1040, 42, 72, 70, 2, 1, 34, 6, 3, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7234, '1001', 'submitted_via_web', '2021-09-15 14:48:43', '2021-09-15 14:48:43'),
(1041, 42, 72, 70, 2, 1, 35, 6, 4, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7235, '1001', 'submitted_via_web', '2021-09-15 14:48:43', '2021-09-15 14:48:43'),
(1042, 42, 72, 70, 2, 1, 36, 6, 5, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7236, '1001', 'submitted_via_web', '2021-09-15 14:48:43', '2021-09-15 14:48:43'),
(1043, 42, 72, 70, 2, 1, 37, 6, 6, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7237, '1001', 'submitted_via_web', '2021-09-15 14:48:43', '2021-09-15 14:48:43'),
(1044, 42, 72, 70, 2, 1, 38, 9, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7238, '1001', 'submitted_via_web', '2021-09-15 14:48:43', '2021-09-15 14:48:43'),
(1045, 42, 72, 70, 2, 1, 39, 9, 2, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7239, '1001', 'submitted_via_web', '2021-09-15 14:48:43', '2021-09-15 14:48:43'),
(1046, 42, 72, 70, 2, 1, 40, 9, 3, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7240, '1001', 'submitted_via_web', '2021-09-15 14:48:43', '2021-09-15 14:48:43'),
(1047, 42, 72, 70, 2, 1, 41, 9, 4, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7241, '1001', 'submitted_via_web', '2021-09-15 14:48:43', '2021-09-15 14:48:43'),
(1048, 42, 72, 70, 2, 1, 42, 9, 5, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7242, '1001', 'submitted_via_web', '2021-09-15 14:48:43', '2021-09-15 14:48:43'),
(1049, 42, 72, 70, 2, 1, 43, 9, 6, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7243, '1001', 'submitted_via_web', '2021-09-15 14:48:43', '2021-09-15 14:48:43'),
(1050, 42, 72, 70, 2, 1, 44, 10, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7244, '1001', 'submitted_via_web', '2021-09-15 14:48:43', '2021-09-15 14:48:43'),
(1051, 42, 72, 70, 2, 1, 45, 10, 2, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7245, '1001', 'submitted_via_web', '2021-09-15 14:48:43', '2021-09-15 14:48:43'),
(1052, 42, 72, 70, 2, 1, 46, 10, 3, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7246, '1001', 'submitted_via_web', '2021-09-15 14:48:43', '2021-09-15 14:48:43'),
(1053, 42, 72, 70, 2, 1, 47, 10, 4, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7247, '1001', 'submitted_via_web', '2021-09-15 14:48:43', '2021-09-15 14:48:43'),
(1054, 42, 72, 70, 2, 1, 48, 10, 5, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7248, '1001', 'submitted_via_web', '2021-09-15 14:48:43', '2021-09-15 14:48:43'),
(1055, 42, 72, 70, 2, 1, 49, 10, 6, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7249, '1001', 'submitted_via_web', '2021-09-15 14:48:43', '2021-09-15 14:48:43'),
(1056, 42, 72, 70, 2, 1, 50, 11, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7250, '1001', 'submitted_via_web', '2021-09-15 14:48:43', '2021-09-15 14:48:43'),
(1057, 42, 72, 70, 2, 1, 51, 11, 2, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7251, '1001', 'submitted_via_web', '2021-09-15 14:48:43', '2021-09-15 14:48:43'),
(1058, 42, 72, 70, 2, 1, 52, 11, 3, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7252, '1001', 'submitted_via_web', '2021-09-15 14:48:43', '2021-09-15 14:48:43'),
(1059, 42, 72, 70, 2, 1, 53, 11, 4, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7253, '1001', 'submitted_via_web', '2021-09-15 14:48:43', '2021-09-15 14:48:43'),
(1060, 42, 72, 70, 2, 1, 54, 11, 5, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7254, '1001', 'submitted_via_web', '2021-09-15 14:48:43', '2021-09-15 14:48:43'),
(1061, 42, 72, 70, 2, 1, 55, 11, 6, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7255, '1001', 'submitted_via_web', '2021-09-15 14:48:43', '2021-09-15 14:48:43'),
(1062, 42, 72, 70, 2, 1, 56, 50, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7256, '1001', 'submitted_via_web', '2021-09-15 14:48:43', '2021-09-15 14:48:43'),
(1063, 42, 72, 70, 2, 1, 57, 50, 6, 22, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7257, '1001', 'submitted_via_web', '2021-09-15 14:48:43', '2021-09-15 14:48:43'),
(1064, 42, 72, 70, 2, 1, 58, 60, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7258, '1001', 'submitted_via_web', '2021-09-15 14:48:43', '2021-09-15 14:48:43'),
(1065, 42, 72, 70, 2, 1, 59, 60, 6, 23, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7259, '1001', 'submitted_via_web', '2021-09-15 14:48:43', '2021-09-15 14:48:43'),
(1066, 42, 72, 70, 2, 1, 60, 70, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7260, '1001', 'submitted_via_web', '2021-09-15 14:48:43', '2021-09-15 14:48:43'),
(1067, 42, 72, 70, 2, 1, 61, 70, 6, 14, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7261, '1001', 'submitted_via_web', '2021-09-15 14:48:43', '2021-09-15 14:48:43'),
(1068, 42, 72, 70, 2, 1, 62, 80, 1, 0, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7262, '1001', 'submitted_via_web', '2021-09-15 14:48:43', '2021-09-15 14:48:43'),
(1069, 42, 72, 70, 2, 1, 63, 80, 6, 5, 'NA', 'NA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7263, '1001', 'submitted_via_web', '2021-09-15 14:48:43', '2021-09-15 14:48:43');

-- --------------------------------------------------------

--
-- Table structure for table `1_ss1template`
--

DROP TABLE IF EXISTS `1_ss1template`;
CREATE TABLE IF NOT EXISTS `1_ss1template` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sen` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ssen` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sfr` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bf` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fr` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sas` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `n` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slc` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `st` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ni` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nb` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sid01` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sid02` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sid03` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sid04` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sid05` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sid06` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sid07` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nd` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `1_ss2`
--

DROP TABLE IF EXISTS `1_ss2`;
CREATE TABLE IF NOT EXISTS `1_ss2` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Hold data which is auto increment to links to SO',
  `edssid` int NOT NULL COMMENT 'Store value from table EDSS id',
  `sen` int NOT NULL COMMENT 'unique identifier for SS2 form',
  `ssen` int NOT NULL COMMENT 'unique identifier for SS2 form',
  `sfr` int NOT NULL COMMENT 'unique identifier for SS2form',
  `hf` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Hold status of Habitat types ( names)',
  `hbt` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Hold status of Habitat types ( names)',
  `htr` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Hold status of Habitat Type treated (1: Yes, 2: No)',
  `hw` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Hold status of Habitat wet (1: Yes, 2: No)',
  `hs` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Hold status Habitat Parameter (1: <10m, 2: 10-100m, 3: >100m)',
  `dnh` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Hold status of distance next house (measured in steps)',
  `fr` int NOT NULL COMMENT 'unique identifier of each row on the data collected',
  `dip` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'number of dipping effort (dio)',
  `tx` int NOT NULL DEFAULT '-99' COMMENT 'taxon identification number',
  `bfEgg` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'larvae stage  (measured in steps)',
  `bfL1` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'larvae stage 1 (L1)',
  `bfL2` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'larvae stage 2 (L2)',
  `bfL3` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'larvae stage 3 (L3)',
  `bfL4` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'larvae stage 4 (L4)',
  `L1L2` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'larvae stage L1L2 (L1L2)',
  `L3L4` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'larvae stage L3L4 (L3L4)',
  `tlv` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'larvae stage total larvae (tlv)',
  `pu` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Hold status of pupae (1: Total)',
  `vl` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Hold status of vegitation length(1: Absent, 2: Short grasses, 3: Tall grasses)',
  `rl` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Hold status of rice length (1: Absent, 2: Short grasses, 3: Tall grasses)',
  `vt` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Hold status of treated (1: Yes, 2: No)',
  `notes` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'No data (-99)' COMMENT 'On site observations about collection ',
  `slc` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Unique label code for each composition of taxon plus sex and abdominal status (Sample Lable Code SLC)',
  `ni` int DEFAULT '0' COMMENT 'no of individual ',
  `nb` int DEFAULT '0' COMMENT 'no of batched ',
  `sid01` int DEFAULT '0' COMMENT 'sample type sample identification 1',
  `sid02` int DEFAULT '0' COMMENT 'sample type sample identification 2',
  `sid03` int DEFAULT '0' COMMENT 'sample type sample identification 3',
  `sid04` int DEFAULT '0' COMMENT 'sample type sample identification 4',
  `sid05` int DEFAULT '0' COMMENT 'sample type sample identification 5',
  `sid06` int DEFAULT '0' COMMENT 'sample type sample identification 6',
  `sid07` int DEFAULT '0' COMMENT 'sample type sample identification 7',
  `nod` int DEFAULT NULL COMMENT 'number of discarded (This is the number of mosquitoes discarded)',
  `senfr` int NOT NULL,
  `userid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Submitted by userid',
  `submitted` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Channel used to submit',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`edssid`,`userid`,`sen`,`fr`),
  UNIQUE KEY `id` (`id`),
  KEY `fk_ss2_tx` (`tx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `1_ss2template`
--

DROP TABLE IF EXISTS `1_ss2template`;
CREATE TABLE IF NOT EXISTS `1_ss2template` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sen` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ssen` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sfr` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hf` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `htc` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `htr` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hw` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hs` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fr` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bf` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pu` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vl` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vt` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ndi01` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ndi02` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ndi03` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ndi04` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ndi05` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ndi06` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ndi07` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ndi08` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ndi09` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ndi10` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `n` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slc` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ni` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nb` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sid01` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sid02` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sid03` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sid04` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sid05` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sid06` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sid07` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nd` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `1_ss3`
--

DROP TABLE IF EXISTS `1_ss3`;
CREATE TABLE IF NOT EXISTS `1_ss3` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Hold data which is auto increment to links to SO',
  `edssid` int DEFAULT NULL COMMENT 'Store value from table EDSS id',
  `sen` int NOT NULL COMMENT 'unique identifier for ss3 form',
  `ssen` int NOT NULL COMMENT 'unique identifier for ss3 form',
  `sfr` int NOT NULL COMMENT 'unique identifier for ss3 form',
  `fr` int NOT NULL COMMENT 'unique identifier of each row on the data collected',
  `dot` date NOT NULL COMMENT 'date of test',
  `ga` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'gps accuracy',
  `gds` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'gps data source',
  `sgds` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'specify gps data source',
  `ndis` int NOT NULL COMMENT 'nets distributed over the past 3years',
  `mo` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'mosquito origin',
  `mst` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'mosquito species tested',
  `ma` int NOT NULL COMMENT 'mosquito age',
  `tb` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'type of bottle bioassay',
  `bia` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'is it bioassay for intensity assay',
  `it` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'type of insecticide tested',
  `SynT` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'what synergist was tested',
  `ic` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'insecticide concentration',
  `sc` int NOT NULL COMMENT 'synergist concentration',
  `SRTemp` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Storage room temperature',
  `ETMax` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Maximum Exposure Temperature',
  `ETMin` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Minimum Exposure Temperature',
  `HTMax` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Maximum Holding Temperature',
  `HTMin` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Minimum Holding Temperature',
  `EHMax` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Maximum Humidity Exposure',
  `EHMin` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Minimum Humidity Exposure',
  `HHMax` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Maximum Holding Humidity ',
  `HHMin` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Minimum Holding Humidity',
  `mti1` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Bottle1 Insecticide',
  `mti2` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Bottle2 Insecticide',
  `mti3` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Bottle3 Insecticide',
  `mti4` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Bottle4 Insecticide',
  `mti5` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Bottle5 Insecticide',
  `mti6` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Bottle6 Insecticide',
  `mts` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Solvent Control',
  `mtisy1` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Bottle1 Insecticide & Synergist',
  `mtisy2` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Bottle2 Insecticide & Synergist',
  `mtisy3` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Bottle3 Insecticide & Synergist',
  `mtisy4` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Bottle1 Insecticide & Synergist',
  `mtisy5` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Bottle1 Insecticide & Synergist',
  `mtisy6` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Bottle1 Insecticide & Synergist',
  `mtsy` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Synergist Control',
  `BTCI1` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Bottle Code Bottle1 Insecticide',
  `BTCI2` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Bottle Code Bottle1 Insecticide',
  `BTCI3` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Bottle Code Bottle1 Insecticide',
  `BTCI4` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Bottle Code Bottle1 Insecticide',
  `BTCI5` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Bottle Code Bottle1 Insecticide',
  `BTCI6` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Bottle Code Bottle1 Insecticide',
  `BC_S` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Bottle code Solvent Control',
  `BTCSy_I1` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Bottle Code Bottle1 Synergist & Insecticide',
  `BTCSy_I2` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Bottle Code Bottle1 Synergist & Insecticide',
  `BTCSy_I3` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Bottle Code Bottle1 Synergist & Insecticide',
  `BTCSy_I4` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Bottle Code Bottle1 Synergist & Insecticide',
  `BC_Sy` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Bottle Code Synergist Control',
  `DBC_I1` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Date Bottle was Coated Bottle1 Insecticide',
  `DBC_I2` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Date Bottle was Coated Bottle1 Insecticide',
  `DBC_I3` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Date Bottle was Coated Bottle1 Insecticide',
  `DBC_I4` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Date Bottle was Coated Bottle1 Insecticide',
  `DBC_I5` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Date Bottle was Coated Bottle1 Insecticide',
  `DBC_I6` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Date Bottle was Coated Bottle1 Insecticide',
  `DBC_S` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Date Bottle was Coated Solvent Control',
  `DBC_SyI1` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Date Bottle was Coated Bottle1 Synergist & Insecticide',
  `DBC_SyI2` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Date Bottle was Coated Bottle1 Synergist & Insecticide',
  `DBC_SyI3` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Date Bottle was Coated Bottle1 Synergist & Insecticide',
  `DBC_SyI4` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Date Bottle was Coated Bottle1 Synergist & Insecticide',
  `DBC_Sy` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Date Bottle was Coated Synergist Control',
  `TBC_I1` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Times Bottle coated used Bottle1 Insecticide',
  `TBC_I2` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Times Bottle coated used Bottle1 Insecticide',
  `TBC_I3` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Times Bottle coated used Bottle1 Insecticide',
  `TBC_I4` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Times Bottle coated used Bottle1 Insecticide',
  `TBC_I5` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Times Bottle coated used Bottle1 Insecticide',
  `TBC_I6` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Times Bottle coated used Bottle1 Insecticide',
  `TBC_S` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Times Bottle coated used Solvent Control',
  `TBC_SyI1` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Times Bottle coated used Bottle1 Synergist & Insecticide',
  `TBC_SyI2` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Times Bottle coated used Bottle1 Synergist & Insecticide',
  `TBC_SyI3` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Times Bottle coated used Bottle1 Synergist & Insecticide',
  `TBC_SyI4` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Times Bottle coated used Bottle1 Synergist & Insecticide',
  `TBC_Sy` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Times Bottle coated used Synergist Control',
  `KD_D0` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Knock Down/ Dead Time 0min',
  `KD_D15` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Knock Down/ Dead Time 15min',
  `KD_D30` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Knock Down/ Dead Time 30min',
  `KD_D45` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Knock Down/ Dead Time 45min',
  `KD_D60` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Knock Down/ Dead Time 60min',
  `KD_D75` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Knock Down/ Dead Time 75min',
  `KD_D90` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Knock Down/ Dead Time 90min',
  `KD_D105` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Knock Down/ Dead Time 105min',
  `KD_D120` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Knock Down/ Dead Time 120min',
  `KD_D24` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Knock Down/ Dead Time 24hr',
  `KD_D72` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Knock Down/ Dead Time 72hr',
  `KD_D1D` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Knock Down/ Dead Time Day1',
  `KD_D2D` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Knock Down/ Dead Time Day2',
  `KD_D3D` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Knock Down/ Dead Time Day3',
  `KD_D4D` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Knock Down/ Dead Time Day4',
  `KD_D5D` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Knock Down/ Dead Time Day5',
  `KD_D6D` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Knock Down/ Dead Time Day6',
  `KD_D7D` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Knock Down/ Dead Time Day7',
  `rt` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Room Type',
  `spd` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Date of Spray',
  `liu` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Last Insecticide Used',
  `elcm` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Exposed Location of Control Mosquitoes',
  `mt1` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Cone Height 0.5m',
  `mt2` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Cone Height 1.0m',
  `mt3` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Cone Height 2.0m',
  `mt4` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Cone Height Other',
  `mkd1` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mosquitoes K/D 30min Cone Height 0.5m',
  `mkd2` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mosquitoes K/D 60min Cone Height 0.5m',
  `mkd3` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mosquitoes K/D Day1 Cone Height 0.5m',
  `mkd4` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mosquitoes K/D Day2 Cone Height 0.5m',
  `mkd5` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mosquitoes K/D Day3 Cone Height 0.5m',
  `mkd6` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mosquitoes K/D 30min Cone Height 1.0m',
  `mkd7` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mosquitoes K/D 60min Cone Height 1.0m',
  `mkd8` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mosquitoes K/D Day1 Cone Height 1.0m',
  `mkd9` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mosquitoes K/D Day2 Cone Height 1.0m',
  `mkd10` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mosquitoes K/D Day3 Cone Height 1.0m',
  `mkd11` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mosquitoes K/D 30min Cone Height 1.5m',
  `mkd12` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mosquitoes K/D 30min Cone Height 1.5m',
  `mkd13` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mosquitoes K/D 30min Cone Height 1.5m',
  `mkd14` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mosquitoes K/D Day2 Cone Height 1.5m',
  `mkd15` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mosquitoes K/D Day3 Cone Height 1.5m',
  `mkd16` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mosquitoes K/D 30min Cone Height 2.0m',
  `mkd17` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mosquitoes K/D 60min Cone Height 2.0m',
  `mkd18` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mosquitoes K/D Day1 Cone Height 2.0m',
  `mkd19` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mosquitoes K/D Day2 Cone Height 2.0m',
  `mkd20` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mosquitoes K/D Day3 Cone Height 2.0m',
  `O1` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mosquitoes K/D in net other1 mins',
  `O2` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mosquitoes K/D in net other2 mins',
  `O3` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mosquitoes K/D in net other3 mins',
  `mtir1` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Rep1 Insecticide',
  `mtir2` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Rep2 Insecticide',
  `mtir3` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Rep3 Insecticide',
  `mtir4` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Rep4 Insecticide',
  `mtir5` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Rep5 Insecticide',
  `mtir6` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Rep6 Insecticide',
  `mtsr1` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Rep1 Solvent Control',
  `mtsr2` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Rep2 Solvent Control',
  `mtsr3` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Rep3 Solvent Control',
  `mtsr4` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Rep4 Solvent Control',
  `mtisyr1` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Rep1 Insecticide & Synergist',
  `mtisyr2` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Rep2 Insecticide & Synergist',
  `mtisyr3` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Rep3 Insecticide & Synergist',
  `mtisyr4` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Rep4 Insecticide & Synergist',
  `mtsyr1` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Rep1 Synergist Control',
  `mtsyr2` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Rep2 Synergist Control',
  `mtsyr3` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Rep3 Synergist Control',
  `mtsyr4` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Rep4 Synergist Control',
  `tcir1` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Tube Code Rep1 Insecticide',
  `tcir2` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Tube Code Rep2 Insecticide',
  `tcir3` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Tube Code Rep3 Insecticide',
  `tcir4` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Tube Code Rep4 Insecticide',
  `tcir5` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Tube Code Rep5 Insecticide',
  `tcir6` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Tube Code Rep6 Insecticide',
  `tc_sr1` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Tube Code Rep1 Solvent Control',
  `tc_sr2` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Tube Code Rep2 Solvent Control',
  `tc_sr3` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Tube Code Rep3 Solvent Control',
  `tc_sr4` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Tube Code Rep4 Solvent Control',
  `tc_syir1` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Tube Code Rep1 Insecticide & Synergist',
  `tc_syir2` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Tube Code Rep2 Insecticide & Synergist',
  `tc_syir3` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Tube Code Rep3 Insecticide & Synergist',
  `tc_syir4` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Tube Code Rep4 Insecticide & Synergist',
  `tc_sy1r` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Tube Code Rep1 Synergist Control',
  `tc_sy2r` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Tube Code Rep2 Synergist Control',
  `tc_sy3r` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Tube Code Rep3 Synergist Control',
  `tc_sy4r` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Tube Code Rep4 Synergist Control',
  `id_ir1` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Impregnation Date Tube1 Insecticide',
  `id_ir2` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Impregnation Date Tube2 Insecticide',
  `id_ir3` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Impregnation Date Tube3 Insecticide',
  `id_ir4` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Impregnation Date Tube4 Insecticide',
  `id_ir5` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Impregnation Date Tube5 Insecticide',
  `id_ir6` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Impregnation Date Tube6 Insecticide',
  `id_sr1` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Impregnation Date Tube1 Solvent Control',
  `id_sr2` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Impregnation Date Tube2 Solvent Control',
  `id_sr3` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Impregnation Date Tube3 Solvent Control',
  `id_sr4` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Impregnation Date Tube4 Solvent Control',
  `id_syr1` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Impregnation Date Tube1 Synergist Control',
  `id_syr2` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Impregnation Date Tube2 Synergist Control',
  `id_syr3` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Impregnation Date Tube3 Synergist Control',
  `id_syr4` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Impregnation Date Tube4 Synergist Control',
  `edi1` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Expiry Date - Rep1 Insecticide(EDI1)',
  `edi2` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Expiry Date - Rep2 Insecticide(EDI2)',
  `edi3` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Expiry Date - Rep3 Insecticide(EDI3)',
  `edi4` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Expiry Date - Rep4 Insecticide(EDI4)',
  `edi5` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Expiry Date - Rep5 Insecticide(EDI5)',
  `edi6` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Expiry Date - Rep6 Insecticide(EDI6)',
  `eds1` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Expiry Date - Rep1 Solvent Control',
  `eds2` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Expiry Date - Rep2 Solvent Control',
  `eds3` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Expiry Date - Rep3 Solvent Control',
  `eds4` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Expiry Date - Rep4 Solvent Control',
  `edisy1` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Expiry Date - Rep1 Insecticide & Synergist',
  `edisy2` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Expiry Date - Rep2 Insecticide & Synergist',
  `edisy3` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Expiry Date - Rep3 Insecticide & Synergist',
  `edisy4` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Expiry Date - Rep4 Insecticide & Synergist',
  `edsy1` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Expiry Date - Rep1 Synergist Control',
  `edsy2` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Expiry Date - Rep2 Synergist Control',
  `edsy3` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Expiry Date - Rep3 Synergist Control',
  `edsy4` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Expiry Date - Rep4 Synergist Control',
  `senfr` int NOT NULL,
  `userid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Submitted by userid',
  `submitted` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Channel used to submit',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`userid`,`sen`,`fr`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `1_ss3template`
--

DROP TABLE IF EXISTS `1_ss3template`;
CREATE TABLE IF NOT EXISTS `1_ss3template` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sen` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ssen` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sfr` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sd` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fd` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fr` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dd` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sas` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mt` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ch` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `la` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ft` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bf` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hp` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `oth5` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `oth6` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `oth7` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `oth8` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `n` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slc` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `st` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ni` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nb` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sid01` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sid02` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sid03` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sid04` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sid05` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sid06` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sid07` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nd` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `1_ss4`
--

DROP TABLE IF EXISTS `1_ss4`;
CREATE TABLE IF NOT EXISTS `1_ss4` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Hold data which is auto increment to links to SO',
  `edssid` int NOT NULL COMMENT 'unique identifier for SS4 form',
  `sen` int NOT NULL COMMENT 'unique identifier for SS4 form',
  `ssen` int NOT NULL COMMENT 'unique identifier for SS4 form',
  `sfr` int NOT NULL COMMENT 'unique identifier for SS4 form',
  `fr` int NOT NULL COMMENT 'unique identifier of each row on the data collected',
  `su` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT 'substracte (type of soil for snail to lay eggs)',
  `sa` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'salinity',
  `dso` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Dissolved oxygen ',
  `dr` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '-99' COMMENT 'Number of dredges',
  `ph` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'potential of hydrogen',
  `co` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT ' Conductivity ms',
  `wda` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT 'wild domestic animal  (define jind of animals)',
  `act` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT 'activity (define either human activities )',
  `hc` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT 'activity (Health centres )',
  `wn` int UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Hold status of water body name (1: Yes, 2: No)',
  `wl` int UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Hold status of water level (1: Yes, 2: No)',
  `de` int UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Hold status of depth (1: Yes, 2: No)',
  `ret` int UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Hold status of flow rate (1: Yes, 2: No)',
  `wt` int UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Hold status of water body type (1: Yes, 2: No)',
  `lwt` int UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Hold status of longevity of water body type (1: Yes, 2: No)',
  `sp` int UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Hold status of snail present(1: Yes, 2: No)',
  `spc` int UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Hold status of snail species collected (1: Yes, 2: No)',
  `n` int NOT NULL COMMENT 'number of observed (Records the total number of mosquitoes observed in each specific subgroup)',
  `sps` int UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Hold status of snail species shedded (1: Yes, 2: No)',
  `tc` int UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Hold status of type of cercaria (1: Yes, 2: No)',
  `nc` int UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Bumber of cercaria shadded (1: Yes, 2: No)',
  `nd` int DEFAULT NULL COMMENT 'number of discarded (This is the number of mosquitoes discarded)',
  `senfr` int NOT NULL,
  `userid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Submitted by userid',
  `submitted` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Channel used to submit',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`edssid`,`userid`,`sen`,`fr`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `1_ssso`
--

DROP TABLE IF EXISTS `1_ssso`;
CREATE TABLE IF NOT EXISTS `1_ssso` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Hold data which is auto increment to links to SO',
  `ss1id` int DEFAULT NULL COMMENT 'Hold data link to SS1',
  `ss2id` int DEFAULT NULL COMMENT 'Hold data link to SS2',
  `ss3id` int DEFAULT NULL COMMENT 'Hold data link to SS3',
  `ss4id` int DEFAULT NULL COMMENT 'Hold data link to SS4',
  PRIMARY KEY (`id`),
  KEY `fk_ss1id` (`ss1id`),
  KEY `fk_ss2id` (`ss2id`),
  KEY `fk_ss3id` (`ss3id`),
  KEY `fk_ss4id` (`ss4id`)
) ENGINE=InnoDB AUTO_INCREMENT=1070 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `1_ssso`
--

INSERT INTO `1_ssso` (`id`, `ss1id`, `ss2id`, `ss3id`, `ss4id`) VALUES
(1, 1, NULL, NULL, NULL),
(2, 2, NULL, NULL, NULL),
(3, 3, NULL, NULL, NULL),
(4, 4, NULL, NULL, NULL),
(5, 5, NULL, NULL, NULL),
(6, 6, NULL, NULL, NULL),
(7, 7, NULL, NULL, NULL),
(8, 8, NULL, NULL, NULL),
(9, 9, NULL, NULL, NULL),
(10, 10, NULL, NULL, NULL),
(11, 11, NULL, NULL, NULL),
(12, 12, NULL, NULL, NULL),
(13, 13, NULL, NULL, NULL),
(14, 14, NULL, NULL, NULL),
(15, 15, NULL, NULL, NULL),
(16, 16, NULL, NULL, NULL),
(17, 17, NULL, NULL, NULL),
(18, 18, NULL, NULL, NULL),
(19, 19, NULL, NULL, NULL),
(20, 20, NULL, NULL, NULL),
(21, 21, NULL, NULL, NULL),
(22, 22, NULL, NULL, NULL),
(23, 23, NULL, NULL, NULL),
(24, 24, NULL, NULL, NULL),
(25, 25, NULL, NULL, NULL),
(26, 26, NULL, NULL, NULL),
(27, 27, NULL, NULL, NULL),
(28, 28, NULL, NULL, NULL),
(29, 29, NULL, NULL, NULL),
(30, 30, NULL, NULL, NULL),
(31, 31, NULL, NULL, NULL),
(32, 32, NULL, NULL, NULL),
(33, 33, NULL, NULL, NULL),
(34, 34, NULL, NULL, NULL),
(35, 35, NULL, NULL, NULL),
(36, 36, NULL, NULL, NULL),
(37, 37, NULL, NULL, NULL),
(38, 38, NULL, NULL, NULL),
(39, 39, NULL, NULL, NULL),
(40, 40, NULL, NULL, NULL),
(41, 41, NULL, NULL, NULL),
(42, 42, NULL, NULL, NULL),
(43, 43, NULL, NULL, NULL),
(44, 44, NULL, NULL, NULL),
(45, 45, NULL, NULL, NULL),
(46, 46, NULL, NULL, NULL),
(47, 47, NULL, NULL, NULL),
(48, 48, NULL, NULL, NULL),
(49, 49, NULL, NULL, NULL),
(50, 50, NULL, NULL, NULL),
(51, 51, NULL, NULL, NULL),
(52, 52, NULL, NULL, NULL),
(53, 53, NULL, NULL, NULL),
(54, 54, NULL, NULL, NULL),
(55, 55, NULL, NULL, NULL),
(56, 56, NULL, NULL, NULL),
(57, 57, NULL, NULL, NULL),
(58, 58, NULL, NULL, NULL),
(59, 59, NULL, NULL, NULL),
(60, 60, NULL, NULL, NULL),
(61, 61, NULL, NULL, NULL),
(62, 62, NULL, NULL, NULL),
(63, 63, NULL, NULL, NULL),
(64, 64, NULL, NULL, NULL),
(65, 65, NULL, NULL, NULL),
(66, 66, NULL, NULL, NULL),
(67, 67, NULL, NULL, NULL),
(68, 68, NULL, NULL, NULL),
(69, 69, NULL, NULL, NULL),
(70, 70, NULL, NULL, NULL),
(71, 71, NULL, NULL, NULL),
(72, 72, NULL, NULL, NULL),
(73, 73, NULL, NULL, NULL),
(74, 74, NULL, NULL, NULL),
(75, 75, NULL, NULL, NULL),
(76, 76, NULL, NULL, NULL),
(77, 77, NULL, NULL, NULL),
(78, 78, NULL, NULL, NULL),
(79, 79, NULL, NULL, NULL),
(80, 80, NULL, NULL, NULL),
(81, 81, NULL, NULL, NULL),
(82, 82, NULL, NULL, NULL),
(83, 83, NULL, NULL, NULL),
(84, 84, NULL, NULL, NULL),
(85, 85, NULL, NULL, NULL),
(86, 86, NULL, NULL, NULL),
(87, 87, NULL, NULL, NULL),
(88, 88, NULL, NULL, NULL),
(89, 89, NULL, NULL, NULL),
(90, 90, NULL, NULL, NULL),
(91, 91, NULL, NULL, NULL),
(92, 92, NULL, NULL, NULL),
(93, 93, NULL, NULL, NULL),
(94, 94, NULL, NULL, NULL),
(95, 95, NULL, NULL, NULL),
(96, 96, NULL, NULL, NULL),
(97, 97, NULL, NULL, NULL),
(98, 98, NULL, NULL, NULL),
(99, 99, NULL, NULL, NULL),
(100, 100, NULL, NULL, NULL),
(101, 101, NULL, NULL, NULL),
(102, 102, NULL, NULL, NULL),
(103, 103, NULL, NULL, NULL),
(104, 104, NULL, NULL, NULL),
(105, 105, NULL, NULL, NULL),
(106, 106, NULL, NULL, NULL),
(107, 107, NULL, NULL, NULL),
(108, 108, NULL, NULL, NULL),
(109, 109, NULL, NULL, NULL),
(110, 110, NULL, NULL, NULL),
(111, 111, NULL, NULL, NULL),
(112, 112, NULL, NULL, NULL),
(113, 113, NULL, NULL, NULL),
(114, 114, NULL, NULL, NULL),
(115, 115, NULL, NULL, NULL),
(116, 116, NULL, NULL, NULL),
(117, 117, NULL, NULL, NULL),
(118, 118, NULL, NULL, NULL),
(119, 119, NULL, NULL, NULL),
(120, 120, NULL, NULL, NULL),
(121, 121, NULL, NULL, NULL),
(122, 122, NULL, NULL, NULL),
(123, 123, NULL, NULL, NULL),
(124, 124, NULL, NULL, NULL),
(125, 125, NULL, NULL, NULL),
(126, 126, NULL, NULL, NULL),
(127, 127, NULL, NULL, NULL),
(128, 128, NULL, NULL, NULL),
(129, 129, NULL, NULL, NULL),
(130, 130, NULL, NULL, NULL),
(131, 131, NULL, NULL, NULL),
(132, 132, NULL, NULL, NULL),
(133, 133, NULL, NULL, NULL),
(134, 134, NULL, NULL, NULL),
(135, 135, NULL, NULL, NULL),
(136, 136, NULL, NULL, NULL),
(137, 137, NULL, NULL, NULL),
(138, 138, NULL, NULL, NULL),
(139, 139, NULL, NULL, NULL),
(140, 140, NULL, NULL, NULL),
(141, 141, NULL, NULL, NULL),
(142, 142, NULL, NULL, NULL),
(143, 143, NULL, NULL, NULL),
(144, 144, NULL, NULL, NULL),
(145, 145, NULL, NULL, NULL),
(146, 146, NULL, NULL, NULL),
(147, 147, NULL, NULL, NULL),
(148, 148, NULL, NULL, NULL),
(149, 149, NULL, NULL, NULL),
(150, 150, NULL, NULL, NULL),
(151, 151, NULL, NULL, NULL),
(152, 152, NULL, NULL, NULL),
(153, 153, NULL, NULL, NULL),
(154, 154, NULL, NULL, NULL),
(155, 155, NULL, NULL, NULL),
(156, 156, NULL, NULL, NULL),
(157, 157, NULL, NULL, NULL),
(158, 158, NULL, NULL, NULL),
(159, 159, NULL, NULL, NULL),
(160, 160, NULL, NULL, NULL),
(161, 161, NULL, NULL, NULL),
(162, 162, NULL, NULL, NULL),
(163, 163, NULL, NULL, NULL),
(164, 164, NULL, NULL, NULL),
(165, 165, NULL, NULL, NULL),
(166, 166, NULL, NULL, NULL),
(167, 167, NULL, NULL, NULL),
(168, 168, NULL, NULL, NULL),
(169, 169, NULL, NULL, NULL),
(170, 170, NULL, NULL, NULL),
(171, 171, NULL, NULL, NULL),
(172, 172, NULL, NULL, NULL),
(173, 173, NULL, NULL, NULL),
(174, 174, NULL, NULL, NULL),
(175, 175, NULL, NULL, NULL),
(176, 176, NULL, NULL, NULL),
(177, 177, NULL, NULL, NULL),
(178, 178, NULL, NULL, NULL),
(179, 179, NULL, NULL, NULL),
(180, 180, NULL, NULL, NULL),
(181, 181, NULL, NULL, NULL),
(182, 182, NULL, NULL, NULL),
(183, 183, NULL, NULL, NULL),
(184, 184, NULL, NULL, NULL),
(185, 185, NULL, NULL, NULL),
(186, 186, NULL, NULL, NULL),
(187, 187, NULL, NULL, NULL),
(188, 188, NULL, NULL, NULL),
(189, 189, NULL, NULL, NULL),
(190, 190, NULL, NULL, NULL),
(191, 191, NULL, NULL, NULL),
(192, 192, NULL, NULL, NULL),
(193, 193, NULL, NULL, NULL),
(194, 194, NULL, NULL, NULL),
(195, 195, NULL, NULL, NULL),
(196, 196, NULL, NULL, NULL),
(197, 197, NULL, NULL, NULL),
(198, 198, NULL, NULL, NULL),
(199, 199, NULL, NULL, NULL),
(200, 200, NULL, NULL, NULL),
(201, 201, NULL, NULL, NULL),
(202, 202, NULL, NULL, NULL),
(203, 203, NULL, NULL, NULL),
(204, 204, NULL, NULL, NULL),
(205, 205, NULL, NULL, NULL),
(206, 206, NULL, NULL, NULL),
(207, 207, NULL, NULL, NULL),
(208, 208, NULL, NULL, NULL),
(209, 209, NULL, NULL, NULL),
(210, 210, NULL, NULL, NULL),
(211, 211, NULL, NULL, NULL),
(212, 212, NULL, NULL, NULL),
(213, 213, NULL, NULL, NULL),
(214, 214, NULL, NULL, NULL),
(215, 215, NULL, NULL, NULL),
(216, 216, NULL, NULL, NULL),
(217, 217, NULL, NULL, NULL),
(218, 218, NULL, NULL, NULL),
(219, 219, NULL, NULL, NULL),
(220, 220, NULL, NULL, NULL),
(221, 221, NULL, NULL, NULL),
(222, 222, NULL, NULL, NULL),
(223, 223, NULL, NULL, NULL),
(224, 224, NULL, NULL, NULL),
(225, 225, NULL, NULL, NULL),
(226, 226, NULL, NULL, NULL),
(227, 227, NULL, NULL, NULL),
(228, 228, NULL, NULL, NULL),
(229, 229, NULL, NULL, NULL),
(230, 230, NULL, NULL, NULL),
(231, 231, NULL, NULL, NULL),
(232, 232, NULL, NULL, NULL),
(233, 233, NULL, NULL, NULL),
(234, 234, NULL, NULL, NULL),
(235, 235, NULL, NULL, NULL),
(236, 236, NULL, NULL, NULL),
(237, 237, NULL, NULL, NULL),
(238, 238, NULL, NULL, NULL),
(239, 239, NULL, NULL, NULL),
(240, 240, NULL, NULL, NULL),
(241, 241, NULL, NULL, NULL),
(242, 242, NULL, NULL, NULL),
(243, 243, NULL, NULL, NULL),
(244, 244, NULL, NULL, NULL),
(245, 245, NULL, NULL, NULL),
(246, 246, NULL, NULL, NULL),
(247, 247, NULL, NULL, NULL),
(248, 248, NULL, NULL, NULL),
(249, 249, NULL, NULL, NULL),
(250, 250, NULL, NULL, NULL),
(251, 251, NULL, NULL, NULL),
(252, 252, NULL, NULL, NULL),
(253, 253, NULL, NULL, NULL),
(254, 254, NULL, NULL, NULL),
(255, 255, NULL, NULL, NULL),
(256, 256, NULL, NULL, NULL),
(257, 257, NULL, NULL, NULL),
(258, 258, NULL, NULL, NULL),
(259, 259, NULL, NULL, NULL),
(260, 260, NULL, NULL, NULL),
(261, 261, NULL, NULL, NULL),
(262, 262, NULL, NULL, NULL),
(263, 263, NULL, NULL, NULL),
(264, 264, NULL, NULL, NULL),
(265, 265, NULL, NULL, NULL),
(266, 266, NULL, NULL, NULL),
(267, 267, NULL, NULL, NULL),
(268, 268, NULL, NULL, NULL),
(269, 269, NULL, NULL, NULL),
(270, 270, NULL, NULL, NULL),
(271, 271, NULL, NULL, NULL),
(272, 272, NULL, NULL, NULL),
(273, 273, NULL, NULL, NULL),
(274, 274, NULL, NULL, NULL),
(275, 275, NULL, NULL, NULL),
(276, 276, NULL, NULL, NULL),
(277, 277, NULL, NULL, NULL),
(278, 278, NULL, NULL, NULL),
(279, 279, NULL, NULL, NULL),
(280, 280, NULL, NULL, NULL),
(281, 281, NULL, NULL, NULL),
(282, 282, NULL, NULL, NULL),
(283, 283, NULL, NULL, NULL),
(284, 284, NULL, NULL, NULL),
(285, 285, NULL, NULL, NULL),
(286, 286, NULL, NULL, NULL),
(287, 287, NULL, NULL, NULL),
(288, 288, NULL, NULL, NULL),
(289, 289, NULL, NULL, NULL),
(290, 290, NULL, NULL, NULL),
(291, 291, NULL, NULL, NULL),
(292, 292, NULL, NULL, NULL),
(293, 293, NULL, NULL, NULL),
(294, 294, NULL, NULL, NULL),
(295, 295, NULL, NULL, NULL),
(296, 296, NULL, NULL, NULL),
(297, 297, NULL, NULL, NULL),
(298, 298, NULL, NULL, NULL),
(299, 299, NULL, NULL, NULL),
(300, 300, NULL, NULL, NULL),
(301, 301, NULL, NULL, NULL),
(302, 302, NULL, NULL, NULL),
(303, 303, NULL, NULL, NULL),
(304, 304, NULL, NULL, NULL),
(305, 305, NULL, NULL, NULL),
(306, 306, NULL, NULL, NULL),
(307, 307, NULL, NULL, NULL),
(308, 308, NULL, NULL, NULL),
(309, 309, NULL, NULL, NULL),
(310, 310, NULL, NULL, NULL),
(311, 311, NULL, NULL, NULL),
(312, 312, NULL, NULL, NULL),
(313, 313, NULL, NULL, NULL),
(314, 314, NULL, NULL, NULL),
(315, 315, NULL, NULL, NULL),
(316, 316, NULL, NULL, NULL),
(317, 317, NULL, NULL, NULL),
(318, 318, NULL, NULL, NULL),
(319, 319, NULL, NULL, NULL),
(320, 320, NULL, NULL, NULL),
(321, 321, NULL, NULL, NULL),
(322, 322, NULL, NULL, NULL),
(323, 323, NULL, NULL, NULL),
(324, 324, NULL, NULL, NULL),
(325, 325, NULL, NULL, NULL),
(326, 326, NULL, NULL, NULL),
(327, 327, NULL, NULL, NULL),
(328, 328, NULL, NULL, NULL),
(329, 329, NULL, NULL, NULL),
(330, 330, NULL, NULL, NULL),
(331, 331, NULL, NULL, NULL),
(332, 332, NULL, NULL, NULL),
(333, 333, NULL, NULL, NULL),
(334, 334, NULL, NULL, NULL),
(335, 335, NULL, NULL, NULL),
(336, 336, NULL, NULL, NULL),
(337, 337, NULL, NULL, NULL),
(338, 338, NULL, NULL, NULL),
(339, 339, NULL, NULL, NULL),
(340, 340, NULL, NULL, NULL),
(341, 341, NULL, NULL, NULL),
(342, 342, NULL, NULL, NULL),
(343, 343, NULL, NULL, NULL),
(344, 344, NULL, NULL, NULL),
(345, 345, NULL, NULL, NULL),
(346, 346, NULL, NULL, NULL),
(347, 347, NULL, NULL, NULL),
(348, 348, NULL, NULL, NULL),
(349, 349, NULL, NULL, NULL),
(350, 350, NULL, NULL, NULL),
(351, 351, NULL, NULL, NULL),
(352, 352, NULL, NULL, NULL),
(353, 353, NULL, NULL, NULL),
(354, 354, NULL, NULL, NULL),
(355, 355, NULL, NULL, NULL),
(356, 356, NULL, NULL, NULL),
(357, 357, NULL, NULL, NULL),
(358, 358, NULL, NULL, NULL),
(359, 359, NULL, NULL, NULL),
(360, 360, NULL, NULL, NULL),
(361, 361, NULL, NULL, NULL),
(362, 362, NULL, NULL, NULL),
(363, 363, NULL, NULL, NULL),
(364, 364, NULL, NULL, NULL),
(365, 365, NULL, NULL, NULL),
(366, 366, NULL, NULL, NULL),
(367, 367, NULL, NULL, NULL),
(368, 368, NULL, NULL, NULL),
(369, 369, NULL, NULL, NULL),
(370, 370, NULL, NULL, NULL),
(371, 371, NULL, NULL, NULL),
(372, 372, NULL, NULL, NULL),
(373, 373, NULL, NULL, NULL),
(374, 374, NULL, NULL, NULL),
(375, 375, NULL, NULL, NULL),
(376, 376, NULL, NULL, NULL),
(377, 377, NULL, NULL, NULL),
(378, 378, NULL, NULL, NULL),
(379, 379, NULL, NULL, NULL),
(380, 380, NULL, NULL, NULL),
(381, 381, NULL, NULL, NULL),
(382, 382, NULL, NULL, NULL),
(383, 383, NULL, NULL, NULL),
(384, 384, NULL, NULL, NULL),
(385, 385, NULL, NULL, NULL),
(386, 386, NULL, NULL, NULL),
(387, 387, NULL, NULL, NULL),
(388, 388, NULL, NULL, NULL),
(389, 389, NULL, NULL, NULL),
(390, 390, NULL, NULL, NULL),
(391, 391, NULL, NULL, NULL),
(392, 392, NULL, NULL, NULL),
(393, 393, NULL, NULL, NULL),
(394, 394, NULL, NULL, NULL),
(395, 395, NULL, NULL, NULL),
(396, 396, NULL, NULL, NULL),
(397, 397, NULL, NULL, NULL),
(398, 398, NULL, NULL, NULL),
(399, 399, NULL, NULL, NULL),
(400, 400, NULL, NULL, NULL),
(401, 401, NULL, NULL, NULL),
(402, 402, NULL, NULL, NULL),
(403, 403, NULL, NULL, NULL),
(404, 404, NULL, NULL, NULL),
(405, 405, NULL, NULL, NULL),
(406, 406, NULL, NULL, NULL),
(407, 407, NULL, NULL, NULL),
(408, 408, NULL, NULL, NULL),
(409, 409, NULL, NULL, NULL),
(410, 410, NULL, NULL, NULL),
(411, 411, NULL, NULL, NULL),
(412, 412, NULL, NULL, NULL),
(413, 413, NULL, NULL, NULL),
(414, 414, NULL, NULL, NULL),
(415, 415, NULL, NULL, NULL),
(416, 416, NULL, NULL, NULL),
(417, 417, NULL, NULL, NULL),
(418, 418, NULL, NULL, NULL),
(419, 419, NULL, NULL, NULL),
(420, 420, NULL, NULL, NULL),
(421, 421, NULL, NULL, NULL),
(422, 422, NULL, NULL, NULL),
(423, 423, NULL, NULL, NULL),
(424, 424, NULL, NULL, NULL),
(425, 425, NULL, NULL, NULL),
(426, 426, NULL, NULL, NULL),
(427, 427, NULL, NULL, NULL),
(428, 428, NULL, NULL, NULL),
(429, 429, NULL, NULL, NULL),
(430, 430, NULL, NULL, NULL),
(431, 431, NULL, NULL, NULL),
(432, 432, NULL, NULL, NULL),
(433, 433, NULL, NULL, NULL),
(434, 434, NULL, NULL, NULL),
(435, 435, NULL, NULL, NULL),
(436, 436, NULL, NULL, NULL),
(437, 437, NULL, NULL, NULL),
(438, 438, NULL, NULL, NULL),
(439, 439, NULL, NULL, NULL),
(440, 440, NULL, NULL, NULL),
(441, 441, NULL, NULL, NULL),
(442, 442, NULL, NULL, NULL),
(443, 443, NULL, NULL, NULL),
(444, 444, NULL, NULL, NULL),
(445, 445, NULL, NULL, NULL),
(446, 446, NULL, NULL, NULL),
(447, 447, NULL, NULL, NULL),
(448, 448, NULL, NULL, NULL),
(449, 449, NULL, NULL, NULL),
(450, 450, NULL, NULL, NULL),
(451, 451, NULL, NULL, NULL),
(452, 452, NULL, NULL, NULL),
(453, 453, NULL, NULL, NULL),
(454, 454, NULL, NULL, NULL),
(455, 455, NULL, NULL, NULL),
(456, 456, NULL, NULL, NULL),
(457, 457, NULL, NULL, NULL),
(458, 458, NULL, NULL, NULL),
(459, 459, NULL, NULL, NULL),
(460, 460, NULL, NULL, NULL),
(461, 461, NULL, NULL, NULL),
(462, 462, NULL, NULL, NULL),
(463, 463, NULL, NULL, NULL),
(464, 464, NULL, NULL, NULL),
(465, 465, NULL, NULL, NULL),
(466, 466, NULL, NULL, NULL),
(467, 467, NULL, NULL, NULL),
(468, 468, NULL, NULL, NULL),
(469, 469, NULL, NULL, NULL),
(470, 470, NULL, NULL, NULL),
(471, 471, NULL, NULL, NULL),
(472, 472, NULL, NULL, NULL),
(473, 473, NULL, NULL, NULL),
(474, 474, NULL, NULL, NULL),
(475, 475, NULL, NULL, NULL),
(476, 476, NULL, NULL, NULL),
(477, 477, NULL, NULL, NULL),
(478, 478, NULL, NULL, NULL),
(479, 479, NULL, NULL, NULL),
(480, 480, NULL, NULL, NULL),
(481, 481, NULL, NULL, NULL),
(482, 482, NULL, NULL, NULL),
(483, 483, NULL, NULL, NULL),
(484, 484, NULL, NULL, NULL),
(485, 485, NULL, NULL, NULL),
(486, 486, NULL, NULL, NULL),
(487, 487, NULL, NULL, NULL),
(488, 488, NULL, NULL, NULL),
(489, 489, NULL, NULL, NULL),
(490, 490, NULL, NULL, NULL),
(491, 491, NULL, NULL, NULL),
(492, 492, NULL, NULL, NULL),
(493, 493, NULL, NULL, NULL),
(494, 494, NULL, NULL, NULL),
(495, 495, NULL, NULL, NULL),
(496, 496, NULL, NULL, NULL),
(497, 497, NULL, NULL, NULL),
(498, 498, NULL, NULL, NULL),
(499, 499, NULL, NULL, NULL),
(500, 500, NULL, NULL, NULL),
(501, 501, NULL, NULL, NULL),
(502, 502, NULL, NULL, NULL),
(503, 503, NULL, NULL, NULL),
(504, 504, NULL, NULL, NULL),
(505, 505, NULL, NULL, NULL),
(506, 506, NULL, NULL, NULL),
(507, 507, NULL, NULL, NULL),
(508, 508, NULL, NULL, NULL),
(509, 509, NULL, NULL, NULL),
(510, 510, NULL, NULL, NULL),
(511, 511, NULL, NULL, NULL),
(512, 512, NULL, NULL, NULL),
(513, 513, NULL, NULL, NULL),
(514, 514, NULL, NULL, NULL),
(515, 515, NULL, NULL, NULL),
(516, 516, NULL, NULL, NULL),
(517, 517, NULL, NULL, NULL),
(518, 518, NULL, NULL, NULL),
(519, 519, NULL, NULL, NULL),
(520, 520, NULL, NULL, NULL),
(521, 521, NULL, NULL, NULL),
(522, 522, NULL, NULL, NULL),
(523, 523, NULL, NULL, NULL),
(524, 524, NULL, NULL, NULL),
(525, 525, NULL, NULL, NULL),
(526, 526, NULL, NULL, NULL),
(527, 527, NULL, NULL, NULL),
(528, 528, NULL, NULL, NULL),
(529, 529, NULL, NULL, NULL),
(530, 530, NULL, NULL, NULL),
(531, 531, NULL, NULL, NULL),
(532, 532, NULL, NULL, NULL),
(533, 533, NULL, NULL, NULL),
(534, 534, NULL, NULL, NULL),
(535, 535, NULL, NULL, NULL),
(536, 536, NULL, NULL, NULL),
(537, 537, NULL, NULL, NULL),
(538, 538, NULL, NULL, NULL),
(539, 539, NULL, NULL, NULL),
(540, 540, NULL, NULL, NULL),
(541, 541, NULL, NULL, NULL),
(542, 542, NULL, NULL, NULL),
(543, 543, NULL, NULL, NULL),
(544, 544, NULL, NULL, NULL),
(545, 545, NULL, NULL, NULL),
(546, 546, NULL, NULL, NULL),
(547, 547, NULL, NULL, NULL),
(548, 548, NULL, NULL, NULL),
(549, 549, NULL, NULL, NULL),
(550, 550, NULL, NULL, NULL),
(551, 551, NULL, NULL, NULL),
(552, 552, NULL, NULL, NULL),
(553, 553, NULL, NULL, NULL),
(554, 554, NULL, NULL, NULL),
(555, 555, NULL, NULL, NULL),
(556, 556, NULL, NULL, NULL),
(557, 557, NULL, NULL, NULL),
(558, 558, NULL, NULL, NULL),
(559, 559, NULL, NULL, NULL),
(560, 560, NULL, NULL, NULL),
(561, 561, NULL, NULL, NULL),
(562, 562, NULL, NULL, NULL),
(563, 563, NULL, NULL, NULL),
(564, 564, NULL, NULL, NULL),
(565, 565, NULL, NULL, NULL),
(566, 566, NULL, NULL, NULL),
(567, 567, NULL, NULL, NULL),
(568, 568, NULL, NULL, NULL),
(569, 569, NULL, NULL, NULL),
(570, 570, NULL, NULL, NULL),
(571, 571, NULL, NULL, NULL),
(572, 572, NULL, NULL, NULL),
(573, 573, NULL, NULL, NULL),
(574, 574, NULL, NULL, NULL),
(575, 575, NULL, NULL, NULL),
(576, 576, NULL, NULL, NULL),
(577, 577, NULL, NULL, NULL),
(578, 578, NULL, NULL, NULL),
(579, 579, NULL, NULL, NULL),
(580, 580, NULL, NULL, NULL),
(581, 581, NULL, NULL, NULL),
(582, 582, NULL, NULL, NULL),
(583, 583, NULL, NULL, NULL),
(584, 584, NULL, NULL, NULL),
(585, 585, NULL, NULL, NULL),
(586, 586, NULL, NULL, NULL),
(587, 587, NULL, NULL, NULL),
(588, 588, NULL, NULL, NULL),
(589, 589, NULL, NULL, NULL),
(590, 590, NULL, NULL, NULL),
(591, 591, NULL, NULL, NULL),
(592, 592, NULL, NULL, NULL),
(593, 593, NULL, NULL, NULL),
(594, 594, NULL, NULL, NULL),
(595, 595, NULL, NULL, NULL),
(596, 596, NULL, NULL, NULL),
(597, 597, NULL, NULL, NULL),
(598, 598, NULL, NULL, NULL),
(599, 599, NULL, NULL, NULL),
(600, 600, NULL, NULL, NULL),
(601, 601, NULL, NULL, NULL),
(602, 602, NULL, NULL, NULL),
(603, 603, NULL, NULL, NULL),
(604, 604, NULL, NULL, NULL),
(605, 605, NULL, NULL, NULL),
(606, 606, NULL, NULL, NULL),
(607, 607, NULL, NULL, NULL),
(608, 608, NULL, NULL, NULL),
(609, 609, NULL, NULL, NULL),
(610, 610, NULL, NULL, NULL),
(611, 611, NULL, NULL, NULL),
(612, 612, NULL, NULL, NULL),
(613, 613, NULL, NULL, NULL),
(614, 614, NULL, NULL, NULL),
(615, 615, NULL, NULL, NULL),
(616, 616, NULL, NULL, NULL),
(617, 617, NULL, NULL, NULL),
(618, 618, NULL, NULL, NULL),
(619, 619, NULL, NULL, NULL),
(620, 620, NULL, NULL, NULL),
(621, 621, NULL, NULL, NULL),
(622, 622, NULL, NULL, NULL),
(623, 623, NULL, NULL, NULL),
(624, 624, NULL, NULL, NULL),
(625, 625, NULL, NULL, NULL),
(626, 626, NULL, NULL, NULL),
(627, 627, NULL, NULL, NULL),
(628, 628, NULL, NULL, NULL),
(629, 629, NULL, NULL, NULL),
(630, 630, NULL, NULL, NULL),
(631, 631, NULL, NULL, NULL),
(632, 632, NULL, NULL, NULL),
(633, 633, NULL, NULL, NULL),
(634, 634, NULL, NULL, NULL),
(635, 635, NULL, NULL, NULL),
(636, 636, NULL, NULL, NULL),
(637, 637, NULL, NULL, NULL),
(638, 638, NULL, NULL, NULL),
(639, 639, NULL, NULL, NULL),
(640, 640, NULL, NULL, NULL),
(641, 641, NULL, NULL, NULL),
(642, 642, NULL, NULL, NULL),
(643, 643, NULL, NULL, NULL),
(644, 644, NULL, NULL, NULL),
(645, 645, NULL, NULL, NULL),
(646, 646, NULL, NULL, NULL),
(647, 647, NULL, NULL, NULL),
(648, 648, NULL, NULL, NULL),
(649, 649, NULL, NULL, NULL),
(650, 650, NULL, NULL, NULL),
(651, 651, NULL, NULL, NULL),
(652, 652, NULL, NULL, NULL),
(653, 653, NULL, NULL, NULL),
(654, 654, NULL, NULL, NULL),
(655, 655, NULL, NULL, NULL),
(656, 656, NULL, NULL, NULL),
(657, 657, NULL, NULL, NULL),
(658, 658, NULL, NULL, NULL),
(659, 659, NULL, NULL, NULL),
(660, 660, NULL, NULL, NULL),
(661, 661, NULL, NULL, NULL),
(662, 662, NULL, NULL, NULL),
(663, 663, NULL, NULL, NULL),
(664, 664, NULL, NULL, NULL),
(665, 665, NULL, NULL, NULL),
(666, 666, NULL, NULL, NULL),
(667, 667, NULL, NULL, NULL),
(668, 668, NULL, NULL, NULL),
(669, 669, NULL, NULL, NULL),
(670, 670, NULL, NULL, NULL),
(671, 671, NULL, NULL, NULL),
(672, 672, NULL, NULL, NULL),
(673, 673, NULL, NULL, NULL),
(674, 674, NULL, NULL, NULL),
(675, 675, NULL, NULL, NULL),
(676, 676, NULL, NULL, NULL),
(677, 677, NULL, NULL, NULL),
(678, 678, NULL, NULL, NULL),
(679, 679, NULL, NULL, NULL),
(680, 680, NULL, NULL, NULL),
(681, 681, NULL, NULL, NULL),
(682, 682, NULL, NULL, NULL),
(683, 683, NULL, NULL, NULL),
(684, 684, NULL, NULL, NULL),
(685, 685, NULL, NULL, NULL),
(686, 686, NULL, NULL, NULL),
(687, 687, NULL, NULL, NULL),
(688, 688, NULL, NULL, NULL),
(689, 689, NULL, NULL, NULL),
(690, 690, NULL, NULL, NULL),
(691, 691, NULL, NULL, NULL),
(692, 692, NULL, NULL, NULL),
(693, 693, NULL, NULL, NULL),
(694, 694, NULL, NULL, NULL),
(695, 695, NULL, NULL, NULL),
(696, 696, NULL, NULL, NULL),
(697, 697, NULL, NULL, NULL),
(698, 698, NULL, NULL, NULL),
(699, 699, NULL, NULL, NULL),
(700, 700, NULL, NULL, NULL),
(701, 701, NULL, NULL, NULL),
(702, 702, NULL, NULL, NULL),
(703, 703, NULL, NULL, NULL),
(704, 704, NULL, NULL, NULL),
(705, 705, NULL, NULL, NULL),
(706, 706, NULL, NULL, NULL),
(707, 707, NULL, NULL, NULL),
(708, 708, NULL, NULL, NULL),
(709, 709, NULL, NULL, NULL),
(710, 710, NULL, NULL, NULL),
(711, 711, NULL, NULL, NULL),
(712, 712, NULL, NULL, NULL),
(713, 713, NULL, NULL, NULL),
(714, 714, NULL, NULL, NULL),
(715, 715, NULL, NULL, NULL),
(716, 716, NULL, NULL, NULL),
(717, 717, NULL, NULL, NULL),
(718, 718, NULL, NULL, NULL),
(719, 719, NULL, NULL, NULL),
(720, 720, NULL, NULL, NULL),
(721, 721, NULL, NULL, NULL),
(722, 722, NULL, NULL, NULL),
(723, 723, NULL, NULL, NULL),
(724, 724, NULL, NULL, NULL),
(725, 725, NULL, NULL, NULL),
(726, 726, NULL, NULL, NULL),
(727, 727, NULL, NULL, NULL),
(728, 728, NULL, NULL, NULL),
(729, 729, NULL, NULL, NULL),
(730, 730, NULL, NULL, NULL),
(731, 731, NULL, NULL, NULL),
(732, 732, NULL, NULL, NULL),
(733, 733, NULL, NULL, NULL),
(734, 734, NULL, NULL, NULL),
(735, 735, NULL, NULL, NULL),
(736, 736, NULL, NULL, NULL),
(737, 737, NULL, NULL, NULL),
(738, 738, NULL, NULL, NULL),
(739, 739, NULL, NULL, NULL),
(740, 740, NULL, NULL, NULL),
(741, 741, NULL, NULL, NULL),
(742, 742, NULL, NULL, NULL),
(743, 743, NULL, NULL, NULL),
(744, 744, NULL, NULL, NULL),
(745, 745, NULL, NULL, NULL),
(746, 746, NULL, NULL, NULL),
(747, 747, NULL, NULL, NULL),
(748, 748, NULL, NULL, NULL),
(749, 749, NULL, NULL, NULL),
(750, 750, NULL, NULL, NULL),
(751, 751, NULL, NULL, NULL),
(752, 752, NULL, NULL, NULL),
(753, 753, NULL, NULL, NULL),
(754, 754, NULL, NULL, NULL),
(755, 755, NULL, NULL, NULL),
(756, 756, NULL, NULL, NULL),
(757, 757, NULL, NULL, NULL),
(758, 758, NULL, NULL, NULL),
(759, 759, NULL, NULL, NULL),
(760, 760, NULL, NULL, NULL),
(761, 761, NULL, NULL, NULL),
(762, 762, NULL, NULL, NULL),
(763, 763, NULL, NULL, NULL),
(764, 764, NULL, NULL, NULL),
(765, 765, NULL, NULL, NULL),
(766, 766, NULL, NULL, NULL),
(767, 767, NULL, NULL, NULL),
(768, 768, NULL, NULL, NULL),
(769, 769, NULL, NULL, NULL),
(770, 770, NULL, NULL, NULL),
(771, 771, NULL, NULL, NULL),
(772, 772, NULL, NULL, NULL),
(773, 773, NULL, NULL, NULL),
(774, 774, NULL, NULL, NULL),
(775, 775, NULL, NULL, NULL),
(776, 776, NULL, NULL, NULL),
(777, 777, NULL, NULL, NULL),
(778, 778, NULL, NULL, NULL),
(779, 779, NULL, NULL, NULL),
(780, 780, NULL, NULL, NULL),
(781, 781, NULL, NULL, NULL),
(782, 782, NULL, NULL, NULL),
(783, 783, NULL, NULL, NULL),
(784, 784, NULL, NULL, NULL),
(785, 785, NULL, NULL, NULL),
(786, 786, NULL, NULL, NULL),
(787, 787, NULL, NULL, NULL),
(788, 788, NULL, NULL, NULL),
(789, 789, NULL, NULL, NULL),
(790, 790, NULL, NULL, NULL),
(791, 791, NULL, NULL, NULL),
(792, 792, NULL, NULL, NULL),
(793, 793, NULL, NULL, NULL),
(794, 794, NULL, NULL, NULL),
(795, 795, NULL, NULL, NULL),
(796, 796, NULL, NULL, NULL),
(797, 797, NULL, NULL, NULL),
(798, 798, NULL, NULL, NULL),
(799, 799, NULL, NULL, NULL),
(800, 800, NULL, NULL, NULL),
(801, 801, NULL, NULL, NULL),
(802, 802, NULL, NULL, NULL),
(803, 803, NULL, NULL, NULL),
(804, 804, NULL, NULL, NULL),
(805, 805, NULL, NULL, NULL),
(806, 806, NULL, NULL, NULL),
(807, 807, NULL, NULL, NULL),
(808, 808, NULL, NULL, NULL),
(809, 809, NULL, NULL, NULL),
(810, 810, NULL, NULL, NULL),
(811, 811, NULL, NULL, NULL),
(812, 812, NULL, NULL, NULL),
(813, 813, NULL, NULL, NULL),
(814, 814, NULL, NULL, NULL),
(815, 815, NULL, NULL, NULL),
(816, 816, NULL, NULL, NULL),
(817, 817, NULL, NULL, NULL),
(818, 818, NULL, NULL, NULL),
(819, 819, NULL, NULL, NULL),
(820, 820, NULL, NULL, NULL),
(821, 821, NULL, NULL, NULL),
(822, 822, NULL, NULL, NULL),
(823, 823, NULL, NULL, NULL),
(824, 824, NULL, NULL, NULL),
(825, 825, NULL, NULL, NULL),
(826, 826, NULL, NULL, NULL),
(827, 827, NULL, NULL, NULL),
(828, 828, NULL, NULL, NULL),
(829, 829, NULL, NULL, NULL),
(830, 830, NULL, NULL, NULL),
(831, 831, NULL, NULL, NULL),
(832, 832, NULL, NULL, NULL),
(833, 833, NULL, NULL, NULL),
(834, 834, NULL, NULL, NULL),
(835, 835, NULL, NULL, NULL),
(836, 836, NULL, NULL, NULL),
(837, 837, NULL, NULL, NULL),
(838, 838, NULL, NULL, NULL),
(839, 839, NULL, NULL, NULL),
(840, 840, NULL, NULL, NULL),
(841, 841, NULL, NULL, NULL),
(842, 842, NULL, NULL, NULL),
(843, 843, NULL, NULL, NULL),
(844, 844, NULL, NULL, NULL),
(845, 845, NULL, NULL, NULL),
(846, 846, NULL, NULL, NULL),
(847, 847, NULL, NULL, NULL),
(848, 848, NULL, NULL, NULL),
(849, 849, NULL, NULL, NULL),
(850, 850, NULL, NULL, NULL),
(851, 851, NULL, NULL, NULL),
(852, 852, NULL, NULL, NULL),
(853, 853, NULL, NULL, NULL),
(854, 854, NULL, NULL, NULL),
(855, 855, NULL, NULL, NULL),
(856, 856, NULL, NULL, NULL),
(857, 857, NULL, NULL, NULL),
(858, 858, NULL, NULL, NULL),
(859, 859, NULL, NULL, NULL),
(860, 860, NULL, NULL, NULL),
(861, 861, NULL, NULL, NULL),
(862, 862, NULL, NULL, NULL),
(863, 863, NULL, NULL, NULL),
(864, 864, NULL, NULL, NULL),
(865, 865, NULL, NULL, NULL),
(866, 866, NULL, NULL, NULL),
(867, 867, NULL, NULL, NULL),
(868, 868, NULL, NULL, NULL),
(869, 869, NULL, NULL, NULL),
(870, 870, NULL, NULL, NULL),
(871, 871, NULL, NULL, NULL),
(872, 872, NULL, NULL, NULL),
(873, 873, NULL, NULL, NULL),
(874, 874, NULL, NULL, NULL),
(875, 875, NULL, NULL, NULL),
(876, 876, NULL, NULL, NULL),
(877, 877, NULL, NULL, NULL),
(878, 878, NULL, NULL, NULL),
(879, 879, NULL, NULL, NULL),
(880, 880, NULL, NULL, NULL),
(881, 881, NULL, NULL, NULL),
(882, 882, NULL, NULL, NULL),
(883, 883, NULL, NULL, NULL),
(884, 884, NULL, NULL, NULL),
(885, 885, NULL, NULL, NULL),
(886, 886, NULL, NULL, NULL),
(887, 887, NULL, NULL, NULL),
(888, 888, NULL, NULL, NULL),
(889, 889, NULL, NULL, NULL),
(890, 890, NULL, NULL, NULL),
(891, 891, NULL, NULL, NULL),
(892, 892, NULL, NULL, NULL),
(893, 893, NULL, NULL, NULL),
(894, 894, NULL, NULL, NULL),
(895, 895, NULL, NULL, NULL),
(896, 896, NULL, NULL, NULL),
(897, 897, NULL, NULL, NULL),
(898, 898, NULL, NULL, NULL),
(899, 899, NULL, NULL, NULL),
(900, 900, NULL, NULL, NULL),
(901, 901, NULL, NULL, NULL),
(902, 902, NULL, NULL, NULL),
(903, 903, NULL, NULL, NULL),
(904, 904, NULL, NULL, NULL),
(905, 905, NULL, NULL, NULL),
(906, 906, NULL, NULL, NULL),
(907, 907, NULL, NULL, NULL),
(908, 908, NULL, NULL, NULL),
(909, 909, NULL, NULL, NULL),
(910, 910, NULL, NULL, NULL),
(911, 911, NULL, NULL, NULL),
(912, 912, NULL, NULL, NULL),
(913, 913, NULL, NULL, NULL),
(914, 914, NULL, NULL, NULL),
(915, 915, NULL, NULL, NULL),
(916, 916, NULL, NULL, NULL),
(917, 917, NULL, NULL, NULL),
(918, 918, NULL, NULL, NULL),
(919, 919, NULL, NULL, NULL),
(920, 920, NULL, NULL, NULL),
(921, 921, NULL, NULL, NULL),
(922, 922, NULL, NULL, NULL),
(923, 923, NULL, NULL, NULL),
(924, 924, NULL, NULL, NULL),
(925, 925, NULL, NULL, NULL),
(926, 926, NULL, NULL, NULL),
(927, 927, NULL, NULL, NULL),
(928, 928, NULL, NULL, NULL),
(929, 929, NULL, NULL, NULL),
(930, 930, NULL, NULL, NULL),
(931, 931, NULL, NULL, NULL),
(932, 932, NULL, NULL, NULL),
(933, 933, NULL, NULL, NULL),
(934, 934, NULL, NULL, NULL),
(935, 935, NULL, NULL, NULL),
(936, 936, NULL, NULL, NULL),
(937, 937, NULL, NULL, NULL),
(938, 938, NULL, NULL, NULL),
(939, 939, NULL, NULL, NULL),
(940, 940, NULL, NULL, NULL),
(941, 941, NULL, NULL, NULL),
(942, 942, NULL, NULL, NULL),
(943, 943, NULL, NULL, NULL),
(944, 944, NULL, NULL, NULL),
(945, 945, NULL, NULL, NULL),
(946, 946, NULL, NULL, NULL),
(947, 947, NULL, NULL, NULL),
(948, 948, NULL, NULL, NULL),
(949, 949, NULL, NULL, NULL),
(950, 950, NULL, NULL, NULL),
(951, 951, NULL, NULL, NULL),
(952, 952, NULL, NULL, NULL),
(953, 953, NULL, NULL, NULL),
(954, 954, NULL, NULL, NULL),
(955, 955, NULL, NULL, NULL),
(956, 956, NULL, NULL, NULL),
(957, 957, NULL, NULL, NULL),
(958, 958, NULL, NULL, NULL),
(959, 959, NULL, NULL, NULL),
(960, 960, NULL, NULL, NULL),
(961, 961, NULL, NULL, NULL),
(962, 962, NULL, NULL, NULL),
(963, 963, NULL, NULL, NULL),
(964, 964, NULL, NULL, NULL),
(965, 965, NULL, NULL, NULL),
(966, 966, NULL, NULL, NULL),
(967, 967, NULL, NULL, NULL),
(968, 968, NULL, NULL, NULL),
(969, 969, NULL, NULL, NULL),
(970, 970, NULL, NULL, NULL),
(971, 971, NULL, NULL, NULL),
(972, 972, NULL, NULL, NULL),
(973, 973, NULL, NULL, NULL),
(974, 974, NULL, NULL, NULL),
(975, 975, NULL, NULL, NULL),
(976, 976, NULL, NULL, NULL),
(977, 977, NULL, NULL, NULL),
(978, 978, NULL, NULL, NULL),
(979, 979, NULL, NULL, NULL),
(980, 980, NULL, NULL, NULL),
(981, 981, NULL, NULL, NULL),
(982, 982, NULL, NULL, NULL),
(983, 983, NULL, NULL, NULL),
(984, 984, NULL, NULL, NULL),
(985, 985, NULL, NULL, NULL),
(986, 986, NULL, NULL, NULL),
(987, 987, NULL, NULL, NULL),
(988, 988, NULL, NULL, NULL),
(989, 989, NULL, NULL, NULL),
(990, 990, NULL, NULL, NULL),
(991, 991, NULL, NULL, NULL),
(992, 992, NULL, NULL, NULL),
(993, 993, NULL, NULL, NULL),
(994, 994, NULL, NULL, NULL),
(995, 995, NULL, NULL, NULL),
(996, 996, NULL, NULL, NULL),
(997, 997, NULL, NULL, NULL),
(998, 998, NULL, NULL, NULL),
(999, 999, NULL, NULL, NULL),
(1000, 1000, NULL, NULL, NULL),
(1001, 1001, NULL, NULL, NULL),
(1002, 1002, NULL, NULL, NULL),
(1003, 1003, NULL, NULL, NULL),
(1004, 1004, NULL, NULL, NULL),
(1005, 1005, NULL, NULL, NULL),
(1006, 1006, NULL, NULL, NULL),
(1007, 1007, NULL, NULL, NULL),
(1008, 1008, NULL, NULL, NULL),
(1009, 1009, NULL, NULL, NULL),
(1010, 1010, NULL, NULL, NULL),
(1011, 1011, NULL, NULL, NULL),
(1012, 1012, NULL, NULL, NULL),
(1013, 1013, NULL, NULL, NULL),
(1014, 1014, NULL, NULL, NULL),
(1015, 1015, NULL, NULL, NULL),
(1016, 1016, NULL, NULL, NULL),
(1017, 1017, NULL, NULL, NULL),
(1018, 1018, NULL, NULL, NULL),
(1019, 1019, NULL, NULL, NULL),
(1020, 1020, NULL, NULL, NULL),
(1021, 1021, NULL, NULL, NULL),
(1022, 1022, NULL, NULL, NULL),
(1023, 1023, NULL, NULL, NULL),
(1024, 1024, NULL, NULL, NULL),
(1025, 1025, NULL, NULL, NULL),
(1026, 1026, NULL, NULL, NULL),
(1027, 1027, NULL, NULL, NULL),
(1028, 1028, NULL, NULL, NULL),
(1029, 1029, NULL, NULL, NULL),
(1030, 1030, NULL, NULL, NULL),
(1031, 1031, NULL, NULL, NULL),
(1032, 1032, NULL, NULL, NULL),
(1033, 1033, NULL, NULL, NULL),
(1034, 1034, NULL, NULL, NULL),
(1035, 1035, NULL, NULL, NULL),
(1036, 1036, NULL, NULL, NULL),
(1037, 1037, NULL, NULL, NULL),
(1038, 1038, NULL, NULL, NULL),
(1039, 1039, NULL, NULL, NULL),
(1040, 1040, NULL, NULL, NULL),
(1041, 1041, NULL, NULL, NULL),
(1042, 1042, NULL, NULL, NULL),
(1043, 1043, NULL, NULL, NULL),
(1044, 1044, NULL, NULL, NULL),
(1045, 1045, NULL, NULL, NULL),
(1046, 1046, NULL, NULL, NULL),
(1047, 1047, NULL, NULL, NULL),
(1048, 1048, NULL, NULL, NULL),
(1049, 1049, NULL, NULL, NULL),
(1050, 1050, NULL, NULL, NULL),
(1051, 1051, NULL, NULL, NULL),
(1052, 1052, NULL, NULL, NULL),
(1053, 1053, NULL, NULL, NULL),
(1054, 1054, NULL, NULL, NULL),
(1055, 1055, NULL, NULL, NULL),
(1056, 1056, NULL, NULL, NULL),
(1057, 1057, NULL, NULL, NULL),
(1058, 1058, NULL, NULL, NULL),
(1059, 1059, NULL, NULL, NULL),
(1060, 1060, NULL, NULL, NULL),
(1061, 1061, NULL, NULL, NULL),
(1062, 1062, NULL, NULL, NULL),
(1063, 1063, NULL, NULL, NULL),
(1064, 1064, NULL, NULL, NULL),
(1065, 1065, NULL, NULL, NULL),
(1066, 1066, NULL, NULL, NULL),
(1067, 1067, NULL, NULL, NULL),
(1068, 1068, NULL, NULL, NULL),
(1069, 1069, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `1_st1`
--

DROP TABLE IF EXISTS `1_st1`;
CREATE TABLE IF NOT EXISTS `1_st1` (
  `id_` int NOT NULL AUTO_INCREMENT,
  `projectregsite_id` int NOT NULL,
  `sen` int NOT NULL,
  `ssen` int NOT NULL,
  `sfr` int NOT NULL,
  `fr` int NOT NULL,
  `rc` int NOT NULL,
  `sbf` int DEFAULT NULL,
  `sslc` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sst` int DEFAULT NULL,
  `ssid` int NOT NULL,
  `stx` int DEFAULT NULL,
  `userid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Submitted by userid',
  `submitted` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Channel used to submit',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`sen`,`fr`,`rc`,`ssid`,`userid`),
  UNIQUE KEY `id_` (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `1_st2`
--

DROP TABLE IF EXISTS `1_st2`;
CREATE TABLE IF NOT EXISTS `1_st2` (
  `id_` int NOT NULL AUTO_INCREMENT,
  `projectregsite_id` int NOT NULL,
  `sen` int NOT NULL,
  `fr` int NOT NULL,
  `ssen` int NOT NULL,
  `ns` int NOT NULL,
  `fst` int DEFAULT NULL,
  `ff` int NOT NULL,
  `rcn` int NOT NULL,
  `userid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Submitted by userid',
  `submitted` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Channel used to submit',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`userid`,`sen`,`fr`),
  UNIQUE KEY `id_` (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `1_taxon`
--

DROP TABLE IF EXISTS `1_taxon`;
CREATE TABLE IF NOT EXISTS `1_taxon` (
  `id` int NOT NULL AUTO_INCREMENT,
  `number` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `1_treatment`
--

DROP TABLE IF EXISTS `1_treatment`;
CREATE TABLE IF NOT EXISTS `1_treatment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `number` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tr` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `1_treatment_two`
--

DROP TABLE IF EXISTS `1_treatment_two`;
CREATE TABLE IF NOT EXISTS `1_treatment_two` (
  `id` int NOT NULL AUTO_INCREMENT,
  `number` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tr` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `2_audit_trail`
--

DROP TABLE IF EXISTS `2_audit_trail`;
CREATE TABLE IF NOT EXISTS `2_audit_trail` (
  `auditid` int NOT NULL AUTO_INCREMENT,
  `auditsen` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `auditfr` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `auditformtype` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `audituser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `auditdate` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `auditaction` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `auditdetail` varchar(350) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`auditid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `2_bodypart`
--

DROP TABLE IF EXISTS `2_bodypart`;
CREATE TABLE IF NOT EXISTS `2_bodypart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `number` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bp` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `2_cluster`
--

DROP TABLE IF EXISTS `2_cluster`;
CREATE TABLE IF NOT EXISTS `2_cluster` (
  `id` int NOT NULL AUTO_INCREMENT,
  `number` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cr` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `2_colonycode`
--

DROP TABLE IF EXISTS `2_colonycode`;
CREATE TABLE IF NOT EXISTS `2_colonycode` (
  `id` int NOT NULL AUTO_INCREMENT,
  `number` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cc` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `2_compound`
--

DROP TABLE IF EXISTS `2_compound`;
CREATE TABLE IF NOT EXISTS `2_compound` (
  `id` int NOT NULL AUTO_INCREMENT,
  `number` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cp` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `2_custgraph`
--

DROP TABLE IF EXISTS `2_custgraph`;
CREATE TABLE IF NOT EXISTS `2_custgraph` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pc` int NOT NULL,
  `location` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `num_split` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `p_attri` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `p_attri2` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `2_custlabel`
--

DROP TABLE IF EXISTS `2_custlabel`;
CREATE TABLE IF NOT EXISTS `2_custlabel` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pc` int NOT NULL,
  `location` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `num_split` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `p_attri` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `p_attri2` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `2_ed1`
--

DROP TABLE IF EXISTS `2_ed1`;
CREATE TABLE IF NOT EXISTS `2_ed1` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Hold data which is auto increment links to SS',
  `projectregsite_id` int NOT NULL COMMENT 'Store value from table projectregsite id',
  `sen` int NOT NULL COMMENT 'unique identifier for ED1 form',
  `fr` int NOT NULL COMMENT 'unique identifier of each row on the data collected',
  `dt` date NOT NULL COMMENT 'date of collection (morning on which the mosquitoes were collected)',
  `re` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT 'Region (Define specific Region in the Country)',
  `di` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT 'District (Define specific District in a Region )',
  `sec` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT 'Sector/Council (Define specific Sector in the District)',
  `cew` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT 'Cell/Ward (Define specific Cell/ in the Sector)',
  `vis` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT 'Village/Street (Define specific Village/Street in the Cell/Ward)',
  `ea` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT 'Enumaration area (Define geographic location within the study site)',
  `cr` bigint DEFAULT '0' COMMENT 'Cluster (The smallest geographic statistical unit within enumaration area)',
  `cp` int DEFAULT '0' COMMENT 'Compound or Plot (A specific physical area within an identifiable owner)',
  `tcu` bigint DEFAULT '-99' COMMENT 'Hold Ten Cell Unit',
  `hh` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT 'Household (A person or group of people who live together in the same dwelling unit)',
  `nah` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT 'Animals in Household (An animal or group of animals who live together with people in same dwelling unit)',
  `sid` int DEFAULT '0' COMMENT 'Structure ID (A free standing building that can have one or more room for residential or commercial use)',
  `me` int NOT NULL DEFAULT '-99' COMMENT 'Method (The method by which the mosquitoes were collected or trapped)',
  `ind` int NOT NULL COMMENT 'hold collection was made indoors a house or hut',
  `ht` int DEFAULT NULL COMMENT 'Habitat Type (Classification of the aquatic habitat in which the collection was made)',
  `st` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Start Time (The time that the collection started in 24 time )',
  `ft` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Finish Time (The time that the collection finish in 24 time)',
  `hp` int DEFAULT NULL COMMENT 'Hold Period (The period of time for which the mosquitoes were held for survival analysis after they were collected)',
  `rnd` int DEFAULT '-99' COMMENT 'Round (One cycle or rotation of the treatment )',
  `blk` int DEFAULT '-99' COMMENT 'Block (A set of position through which treatments are rotated in a Latin)',
  `shh` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '-99' COMMENT 'A project specific house or experiment hut',
  `stn` int DEFAULT '-99' COMMENT 'A project specific where station where a trap may be positioned',
  `vi` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Initial of person that caught the mosquitoes',
  `tr` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Treatment (Coding for the unique experimental treatment)',
  `dy` int DEFAULT '-99' COMMENT 'Experiment Day (The consecutive nth day since the experiment commenced)',
  `tmp` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Temperature',
  `hmd` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Humidity',
  `ws` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'wind speed',
  `hs` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '-99' COMMENT 'Number of household sampled',
  `vc` int DEFAULT '2' COMMENT 'Legitimacy of the collection',
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'On site observation about the collection',
  `gps` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Site geolocation',
  `dsen` int NOT NULL COMMENT 'Destination form serial number',
  `livestock` int DEFAULT NULL,
  `hoccupant` int DEFAULT NULL,
  `heaves` int DEFAULT NULL,
  `nss` int DEFAULT NULL,
  `nbh` int DEFAULT NULL,
  `oth` int DEFAULT NULL,
  `sn` int DEFAULT '-99' COMMENT 'Season',
  `wtc` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '-99' COMMENT 'Weather Conditions',
  `agrt` int DEFAULT '-99' COMMENT 'Agriculture',
  `invn` int DEFAULT '-99' COMMENT 'Intervention',
  `lvk` int DEFAULT '-99' COMMENT 'Livestock',
  `rfe` int DEFAULT '-99' COMMENT 'Roof type',
  `wle` int DEFAULT '-99' COMMENT 'Wall type',
  `evs` int DEFAULT '-99' COMMENT 'Eaves',
  `bv` int DEFAULT '-99' COMMENT 'Block ventilation',
  `bvs` int DEFAULT '-99' COMMENT 'Block ventilation screening',
  `wsn` int DEFAULT '-99' COMMENT 'Window screening',
  `wsnc` int DEFAULT '-99' COMMENT 'Window screening Condition',
  `ckl` int DEFAULT '-99' COMMENT 'Cooking location',
  `cke` int DEFAULT '-99' COMMENT 'Cooking Energy source',
  `sp` int DEFAULT '-99' COMMENT 'Sprayed',
  `lsd` date DEFAULT NULL COMMENT 'Last spray date',
  `ise` int DEFAULT '-99' COMMENT 'Insectside',
  `userid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Submitted by userid',
  `submitted` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Channel used to submit',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`projectregsite_id`,`userid`,`sen`,`fr`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `2_ed1`
--

INSERT INTO `2_ed1` (`id`, `projectregsite_id`, `sen`, `fr`, `dt`, `re`, `di`, `sec`, `cew`, `vis`, `ea`, `cr`, `cp`, `tcu`, `hh`, `nah`, `sid`, `me`, `ind`, `ht`, `st`, `ft`, `hp`, `rnd`, `blk`, `shh`, `stn`, `vi`, `tr`, `dy`, `tmp`, `hmd`, `ws`, `hs`, `vc`, `notes`, `gps`, `dsen`, `livestock`, `hoccupant`, `heaves`, `nss`, `nbh`, `oth`, `sn`, `wtc`, `agrt`, `invn`, `lvk`, `rfe`, `wle`, `evs`, `bv`, `bvs`, `wsn`, `wsnc`, `ckl`, `cke`, `sp`, `lsd`, `ise`, `userid`, `submitted`, `created_at`, `updated_at`) VALUES
(1, 6, 1, 1, '2021-08-03', '0', '0', '0', '0', '0', '0', 0, 0, -99, '0', '0', 0, 1, 2, NULL, '1500', '1800', NULL, -99, -99, '-99', -99, NULL, NULL, -99, NULL, NULL, NULL, '-99', 1, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, -99, '-99', -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, NULL, -99, '1001', 'submitted_via_web', '2021-09-15 15:53:28', '2021-09-15 15:53:28'),
(2, 6, 1, 2, '2021-07-06', '0', '0', '0', '0', '0', '0', 0, 0, -99, '0', '0', 0, 1, 2, NULL, '1500', '1800', NULL, -99, -99, '-99', -99, NULL, NULL, -99, NULL, NULL, NULL, '-99', 1, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, -99, '-99', -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, NULL, -99, '1001', 'submitted_via_web', '2021-09-15 15:53:28', '2021-09-15 15:53:28'),
(3, 6, 1, 3, '2021-07-08', '0', '0', '0', '0', '0', '0', 0, 0, -99, '0', '0', 0, 1, 2, NULL, '1500', '1800', NULL, -99, -99, '-99', -99, NULL, NULL, -99, NULL, NULL, NULL, '-99', 1, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, -99, '-99', -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, NULL, -99, '1001', 'submitted_via_web', '2021-09-15 15:53:28', '2021-09-15 15:53:28'),
(4, 6, 1, 4, '2021-06-16', '0', '0', '0', '0', '0', '0', 0, 0, -99, '0', '0', 0, 1, 2, NULL, '1500', '1800', NULL, -99, -99, '-99', -99, NULL, NULL, -99, NULL, NULL, NULL, '-99', 1, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, -99, '-99', -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, NULL, -99, '1001', 'submitted_via_web', '2021-09-15 15:53:28', '2021-09-15 15:53:28'),
(5, 6, 1, 5, '2021-05-19', '0', '0', '0', '0', '0', '0', 0, 0, -99, '0', '0', 0, 1, 2, NULL, '1500', '1800', NULL, -99, -99, '-99', -99, NULL, NULL, -99, NULL, NULL, NULL, '-99', 1, NULL, NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL, -99, '-99', -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, NULL, -99, '1001', 'submitted_via_web', '2021-09-15 15:53:28', '2021-09-15 15:53:28'),
(6, 6, 1, 6, '2021-04-21', '0', '0', '0', '0', '0', '0', 0, 0, -99, '0', '0', 0, 1, 2, NULL, '1500', '1800', NULL, -99, -99, '-99', -99, NULL, NULL, -99, NULL, NULL, NULL, '-99', 1, NULL, NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, -99, '-99', -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, NULL, -99, '1001', 'submitted_via_web', '2021-09-15 15:53:28', '2021-09-15 15:53:28'),
(7, 6, 1, 7, '2021-03-17', '0', '0', '0', '0', '0', '0', 0, 0, -99, '0', '0', 0, 1, 2, NULL, '1500', '1800', NULL, -99, -99, '-99', -99, NULL, NULL, -99, NULL, NULL, NULL, '-99', 1, NULL, NULL, 8, NULL, NULL, NULL, NULL, NULL, NULL, -99, '-99', -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, NULL, -99, '1001', 'submitted_via_web', '2021-09-15 15:53:28', '2021-09-15 15:53:28'),
(8, 6, 1, 8, '2021-02-11', '0', '0', '0', '0', '0', '0', 0, 0, -99, '0', '0', 0, 1, 2, NULL, '1500', '1800', NULL, -99, -99, '-99', -99, NULL, NULL, -99, NULL, NULL, NULL, '-99', 1, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, -99, '-99', -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, NULL, -99, '1001', 'submitted_via_web', '2021-09-15 15:53:28', '2021-09-15 15:53:28'),
(9, 6, 1, 9, '2021-01-21', '0', '0', '0', '0', '0', '0', 0, 0, -99, '0', '0', 0, 1, 2, NULL, '1500', '1800', NULL, -99, -99, '-99', -99, NULL, NULL, -99, NULL, NULL, NULL, '-99', 1, NULL, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, -99, '-99', -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, NULL, -99, '1001', 'submitted_via_web', '2021-09-15 15:53:28', '2021-09-15 15:53:28'),
(10, 6, 1, 10, '2021-05-05', '0', '0', '0', '0', '0', '0', 0, 0, -99, '0', '0', 0, 1, 2, NULL, '1500', '1800', NULL, -99, -99, '-99', -99, NULL, NULL, -99, NULL, NULL, NULL, '-99', 1, NULL, NULL, 11, NULL, NULL, NULL, NULL, NULL, NULL, -99, '-99', -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, NULL, -99, '1001', 'submitted_via_web', '2021-09-15 15:53:28', '2021-09-15 15:53:28'),
(11, 6, 1, 11, '2021-05-03', '0', '0', '0', '0', '0', '0', 0, 0, -99, '0', '0', 0, 1, 2, NULL, '1500', '1800', NULL, -99, -99, '-99', -99, NULL, NULL, -99, NULL, NULL, NULL, '-99', 1, NULL, NULL, 12, NULL, NULL, NULL, NULL, NULL, NULL, -99, '-99', -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, NULL, -99, '1001', 'submitted_via_web', '2021-09-15 15:53:28', '2021-09-15 15:53:28'),
(12, 6, 1, 12, '2021-02-13', '0', '0', '0', '0', '0', '0', 0, 0, -99, '0', '0', 0, 1, 2, NULL, '1500', '1800', NULL, -99, -99, '-99', -99, NULL, NULL, -99, NULL, NULL, NULL, '-99', 1, NULL, NULL, 13, NULL, NULL, NULL, NULL, NULL, NULL, -99, '-99', -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, NULL, -99, '1001', 'submitted_via_web', '2021-09-15 15:53:28', '2021-09-15 15:53:28'),
(13, 6, 1, 13, '2021-09-01', '0', '0', '0', '0', '0', '0', 0, 0, -99, '0', '0', 0, 1, 2, NULL, '1500', '1800', NULL, -99, -99, '-99', -99, NULL, NULL, -99, NULL, NULL, NULL, '-99', 1, NULL, NULL, 14, NULL, NULL, NULL, NULL, NULL, NULL, -99, '-99', -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, NULL, -99, '1001', 'submitted_via_web', '2021-09-15 15:53:28', '2021-09-15 15:53:28'),
(14, 6, 1, 14, '2021-10-09', '0', '0', '0', '0', '0', '0', 0, 0, -99, '0', '0', 0, 1, 2, NULL, '1500', '1800', NULL, -99, -99, '-99', -99, NULL, NULL, -99, NULL, NULL, NULL, '-99', 1, NULL, NULL, 15, NULL, NULL, NULL, NULL, NULL, NULL, -99, '-99', -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, NULL, -99, '1001', 'submitted_via_web', '2021-09-15 15:53:28', '2021-09-15 15:53:28'),
(15, 6, 1, 15, '2021-08-06', '0', '0', '0', '0', '0', '0', 0, 0, -99, '0', '0', 0, 1, 2, NULL, '1500', '1800', NULL, -99, -99, '-99', -99, NULL, NULL, -99, NULL, NULL, NULL, '-99', 1, NULL, NULL, 16, NULL, NULL, NULL, NULL, NULL, NULL, -99, '-99', -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, NULL, -99, '1001', 'submitted_via_web', '2021-09-15 15:53:28', '2021-09-15 15:53:28'),
(16, 6, 1, 16, '2021-08-01', '0', '0', '0', '0', '0', '0', 0, 0, -99, '0', '0', 0, 1, 2, NULL, '1500', '1800', NULL, -99, -99, '-99', -99, NULL, NULL, -99, NULL, NULL, NULL, '-99', 1, NULL, NULL, 17, NULL, NULL, NULL, NULL, NULL, NULL, -99, '-99', -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, NULL, -99, '1001', 'submitted_via_web', '2021-09-15 15:53:28', '2021-09-15 15:53:28'),
(17, 6, 1, 17, '2021-08-06', '0', '0', '0', '0', '0', '0', 0, 0, -99, '0', '0', 0, 1, 2, NULL, '1500', '1800', NULL, -99, -99, '-99', -99, NULL, NULL, -99, NULL, NULL, NULL, '-99', 1, NULL, NULL, 18, NULL, NULL, NULL, NULL, NULL, NULL, -99, '-99', -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, NULL, -99, '1001', 'submitted_via_web', '2021-09-15 15:53:28', '2021-09-15 15:53:28'),
(18, 6, 1, 18, '2021-08-19', '0', '0', '0', '0', '0', '0', 0, 0, -99, '0', '0', 0, 1, 2, NULL, '1500', '1800', NULL, -99, -99, '-99', -99, NULL, NULL, -99, NULL, NULL, NULL, '-99', 1, NULL, NULL, 19, NULL, NULL, NULL, NULL, NULL, NULL, -99, '-99', -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, NULL, -99, '1001', 'submitted_via_web', '2021-09-15 15:53:28', '2021-09-15 15:53:28'),
(19, 6, 1, 19, '2021-04-20', '0', '0', '0', '0', '0', '0', 0, 0, -99, '0', '0', 0, 1, 2, NULL, '1500', '1800', NULL, -99, -99, '-99', -99, NULL, NULL, -99, NULL, NULL, NULL, '-99', 1, NULL, NULL, 20, NULL, NULL, NULL, NULL, NULL, NULL, -99, '-99', -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, NULL, -99, '1001', 'submitted_via_web', '2021-09-15 15:53:28', '2021-09-15 15:53:28');

-- --------------------------------------------------------

--
-- Table structure for table `2_ed1template`
--

DROP TABLE IF EXISTS `2_ed1template`;
CREATE TABLE IF NOT EXISTS `2_ed1template` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Hold data which is auto increment links to SS',
  `sen` int NOT NULL COMMENT 'unique identifier for ED1 form',
  `fr` int NOT NULL COMMENT 'unique identifier of each row on the data collected',
  `dt` date DEFAULT NULL COMMENT 'date of collection (morning on which the mosquitoes were collected)',
  `re` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT 'Region (Define specific Region in the Country)',
  `di` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT 'District (Define specific District in a Region )',
  `sec` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT 'Sector/Council (Define specific Sector in the District)',
  `cew` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT 'Cell/Ward (Define specific Cell/ in the Sector)',
  `vis` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT 'Village/Street (Define specific Village/Street in the Cell/Ward)',
  `ea` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT 'Enumaration area (Define geographic location within the study site)',
  `cr` bigint DEFAULT '0' COMMENT 'Cluster (The smallest geographic statistical unit within enumaration area)',
  `cp` int DEFAULT '0' COMMENT 'Compound or Plot (A specific physical area within an identifiable owner)',
  `tcu` bigint DEFAULT '-99' COMMENT 'Hold Ten Cell Unit',
  `hh` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT 'Household (A person or group of people who live together in the same dwelling unit)',
  `nah` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT 'Animals in Household (An animal or group of animals who live together with people in same dwelling unit)',
  `sid` int DEFAULT '0' COMMENT 'Structure ID (A free standing building that can have one or more room for residential or commercial use)',
  `me` int DEFAULT '-99' COMMENT 'Method (The method by which the mosquitoes were collected or trapped)',
  `ind` int DEFAULT NULL COMMENT 'hold collection was made indoors a house or hut',
  `ht` int DEFAULT NULL COMMENT 'Habitat Type (Classification of the aquatic habitat in which the collection was made)',
  `st` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Start Time (The time that the collection started in 24 time )',
  `ft` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Finish Time (The time that the collection finish in 24 time)',
  `hp` int DEFAULT NULL COMMENT 'Hold Period (The period of time for which the mosquitoes were held for survival analysis after they were collected)',
  `rnd` int DEFAULT '-99' COMMENT 'Round (One cycle or rotation of the treatment )',
  `blk` int DEFAULT '-99' COMMENT 'Block (A set of position through which treatments are rotated in a Latin)',
  `shh` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '-99' COMMENT 'A project specific house or experiment hut',
  `stn` int DEFAULT '-99' COMMENT 'A project specific where station where a trap may be positioned',
  `vi` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Initial of person that caught the mosquitoes',
  `tr` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Treatment (Coding for the unique experimental treatment)',
  `dy` int DEFAULT '-99' COMMENT 'Experiment Day (The consecutive nth day since the experiment commenced)',
  `tmp` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Temperature',
  `hmd` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Humidity',
  `ws` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'wind speed',
  `hs` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '-99' COMMENT 'Number of household sampled',
  `vc` int DEFAULT '2' COMMENT 'Legitimacy of the collection',
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'On site observation about the collection',
  `gps` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Site geolocation',
  `dsen` int NOT NULL COMMENT 'Destination form serial number',
  `livestock` int DEFAULT '-99',
  `hoccupant` int DEFAULT '-99',
  `heaves` int DEFAULT '-99',
  `nss` int DEFAULT '-99',
  `nbh` int DEFAULT '-99',
  `oth` int DEFAULT '-99',
  `sn` int DEFAULT '-99' COMMENT 'Season',
  `wtc` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '-99' COMMENT 'Weather Conditions',
  `agrt` int DEFAULT '-99' COMMENT 'Agriculture',
  `invn` int DEFAULT '-99' COMMENT 'Intervention',
  `lvk` int DEFAULT '-99' COMMENT 'Livestock',
  `rfe` int DEFAULT '-99' COMMENT 'Roof type',
  `wle` int DEFAULT '-99' COMMENT 'Wall type',
  `evs` int DEFAULT '-99' COMMENT 'Eaves',
  `bv` int DEFAULT '-99' COMMENT 'Block ventilation',
  `bvs` int DEFAULT '-99' COMMENT 'Block ventilation screening',
  `wsn` int DEFAULT '-99' COMMENT 'Window screening',
  `wsnc` int DEFAULT '-99' COMMENT 'Window screening Condition',
  `ckl` int DEFAULT '-99' COMMENT 'Cooking location',
  `cke` int DEFAULT '-99' COMMENT 'Cooking Energy source',
  `sp` int DEFAULT '-99' COMMENT 'Sprayed',
  `lsd` date DEFAULT NULL COMMENT 'Last spray date',
  `ise` int DEFAULT '-99' COMMENT 'Insectside',
  `userid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Submitted by userid',
  `submitted` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Channel used to submit',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `2_ed2`
--

DROP TABLE IF EXISTS `2_ed2`;
CREATE TABLE IF NOT EXISTS `2_ed2` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Hold data which is auto increment links to SS',
  `projectregsite_id` int NOT NULL COMMENT 'Store value from table projectregsite id (Foreign Key)',
  `sen` int NOT NULL COMMENT 'unique identifier for ED2 form',
  `fr` int NOT NULL COMMENT 'unique identifier of each row on the data collected',
  `ssen` int DEFAULT '-99',
  `sfr` int DEFAULT '-99',
  `slc` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '-99',
  `sbp` int DEFAULT '-99',
  `sst` int DEFAULT '-99',
  `ssid` int DEFAULT '-99',
  `scc` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '-99',
  `stx` int DEFAULT '-99' COMMENT 'Store taxon code foreign key from Taxon table',
  `ssas` int DEFAULT '-99' COMMENT 'Store sex code foreign key from SexAbdominal table',
  `ag` int DEFAULT '-99',
  `n` int NOT NULL COMMENT 'Store number of mosqutoes caught',
  `sd` date DEFAULT NULL COMMENT 'started date of the experiment',
  `st` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '-99' COMMENT 'started time of the experiment',
  `tr` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '-99' COMMENT 'Treatment (Coding for the unique experimental treatment)',
  `vi` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'NA' COMMENT 'Initial of person that caught the mosquitoes',
  `rnd` int DEFAULT '-99' COMMENT 'Round (One cycle or rotation of the treatment )',
  `dy` int DEFAULT '-99' COMMENT 'Experiment Day (The consecutive nth day since the experiment commenced)',
  `oth1` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '-99' COMMENT 'Other Any additional experimental details',
  `oth2` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '-99' COMMENT 'Pther Any additional experimental details',
  `oth3` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '-99' COMMENT 'Pther Any additional experimental details',
  `va` int DEFAULT NULL COMMENT 'Valid Assay Legitimacy of the experimental assay',
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'On site observation about the collection',
  `dsen` int NOT NULL COMMENT 'Destination form serial number',
  `userid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Submitted by userid',
  `submitted` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Channel used to submit',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`projectregsite_id`,`userid`,`sen`,`fr`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `2_ed2template`
--

DROP TABLE IF EXISTS `2_ed2template`;
CREATE TABLE IF NOT EXISTS `2_ed2template` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sen` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fr` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ssen` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sfr` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slc` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sbp` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sst` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ssid` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scc` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stx` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ssas` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ag` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `n` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sd` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `st` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tr` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vi` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rep` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rnd` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dy` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `oth1` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `oth2` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `oth3` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `va` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dsen` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `2_edss`
--

DROP TABLE IF EXISTS `2_edss`;
CREATE TABLE IF NOT EXISTS `2_edss` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Hold data which is auto increment links to EDSS',
  `ed1id` int DEFAULT NULL COMMENT 'Hold data which is coming from Ed1',
  `ed2id` int DEFAULT NULL COMMENT 'Hold data which is coming from  Ed2',
  PRIMARY KEY (`id`),
  KEY `fk_edss_ed1id` (`ed1id`),
  KEY `fk_edss_ed2id` (`ed2id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `2_edss`
--

INSERT INTO `2_edss` (`id`, `ed1id`, `ed2id`) VALUES
(1, 1, NULL),
(2, 2, NULL),
(3, 3, NULL),
(4, 4, NULL),
(5, 5, NULL),
(6, 6, NULL),
(7, 7, NULL),
(8, 8, NULL),
(9, 9, NULL),
(10, 10, NULL),
(11, 11, NULL),
(12, 12, NULL),
(13, 13, NULL),
(14, 14, NULL),
(15, 15, NULL),
(16, 16, NULL),
(17, 17, NULL),
(18, 18, NULL),
(19, 19, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `2_enumerationarea`
--

DROP TABLE IF EXISTS `2_enumerationarea`;
CREATE TABLE IF NOT EXISTS `2_enumerationarea` (
  `id` int NOT NULL AUTO_INCREMENT,
  `number` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ea` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `2_habitattype`
--

DROP TABLE IF EXISTS `2_habitattype`;
CREATE TABLE IF NOT EXISTS `2_habitattype` (
  `id` int NOT NULL AUTO_INCREMENT,
  `number` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ht` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `2_location`
--

DROP TABLE IF EXISTS `2_location`;
CREATE TABLE IF NOT EXISTS `2_location` (
  `id` int NOT NULL AUTO_INCREMENT,
  `number` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ind` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `2_location`
--

INSERT INTO `2_location` (`id`, `number`, `ind`) VALUES
(1, '1', 'In'),
(2, '2', 'Out');

-- --------------------------------------------------------

--
-- Table structure for table `2_method`
--

DROP TABLE IF EXISTS `2_method`;
CREATE TABLE IF NOT EXISTS `2_method` (
  `id` int NOT NULL AUTO_INCREMENT,
  `number` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `me` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `2_replicate`
--

DROP TABLE IF EXISTS `2_replicate`;
CREATE TABLE IF NOT EXISTS `2_replicate` (
  `id` int NOT NULL AUTO_INCREMENT,
  `number` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rep` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `2_sas`
--

DROP TABLE IF EXISTS `2_sas`;
CREATE TABLE IF NOT EXISTS `2_sas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `number` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sas` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `2_so1`
--

DROP TABLE IF EXISTS `2_so1`;
CREATE TABLE IF NOT EXISTS `2_so1` (
  `id_` int NOT NULL AUTO_INCREMENT COMMENT 'Hold data which is auto increment',
  `sssoid` int NOT NULL,
  `sen` int NOT NULL,
  `ssen` int NOT NULL,
  `sfr` int NOT NULL,
  `fr` int NOT NULL,
  `rc` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sbf` int DEFAULT NULL,
  `sslc` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sst` int DEFAULT NULL,
  `ssid` int NOT NULL,
  `stx` int DEFAULT NULL,
  `species` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'NRQ',
  `kdr` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'NRQ',
  `pf` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'NRQ',
  `pv` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'NRQ',
  `po` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'NRQ',
  `pm` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'NRQ',
  `human` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'NRQ',
  `chicken` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'NRQ',
  `goat` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'NRQ',
  `bovine` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'NRQ',
  `dog` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'NRQ',
  `cat` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'NRQ',
  `rat` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'NRQ',
  `bps` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'NRQ',
  `userid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Submitted by userid',
  `submitted` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Channel used to submit',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`sssoid`,`ssen`,`sfr`,`ssid`,`userid`),
  UNIQUE KEY `id_` (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `2_so2`
--

DROP TABLE IF EXISTS `2_so2`;
CREATE TABLE IF NOT EXISTS `2_so2` (
  `id_` int NOT NULL AUTO_INCREMENT COMMENT 'Hold data which is auto increment',
  `sssoid` int NOT NULL,
  `sen` int NOT NULL,
  `ssen` int NOT NULL,
  `sfr` int NOT NULL,
  `fr` int NOT NULL,
  `sbf` int DEFAULT NULL,
  `sslc` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sst` int DEFAULT NULL,
  `ssid` int NOT NULL,
  `stx` int DEFAULT NULL,
  `ssas` int DEFAULT NULL,
  `ms` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'NRQ',
  `pr` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'NRQ',
  `inf` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'NRQ',
  `os` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'NRQ',
  `wl` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'NRQ',
  `bps` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'NRQ',
  `userid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Submitted by userid',
  `submitted` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Channel used to submit',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`sssoid`,`ssen`,`sfr`,`ssid`,`userid`),
  UNIQUE KEY `id_` (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `2_sost`
--

DROP TABLE IF EXISTS `2_sost`;
CREATE TABLE IF NOT EXISTS `2_sost` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Hold data which is auto increment to links to SO',
  `so1id` int DEFAULT NULL COMMENT 'Hold data link to SS1',
  `so2id` int DEFAULT NULL COMMENT 'Hold data link to SS2',
  `so3id` int DEFAULT NULL COMMENT 'Hold data link to SS3',
  PRIMARY KEY (`id`),
  KEY `fk_ss1id` (`so1id`),
  KEY `fk_ss2id` (`so2id`),
  KEY `fk_ss3id` (`so3id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `2_ss1`
--

DROP TABLE IF EXISTS `2_ss1`;
CREATE TABLE IF NOT EXISTS `2_ss1` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Hold data which is auto increment to links to SO',
  `edssid` int NOT NULL COMMENT 'unique identifier for SS1 form',
  `sen` int NOT NULL COMMENT 'unique identifier for SS1 form',
  `ssen` int NOT NULL COMMENT 'unique identifier for SS1 form',
  `sfr` int NOT NULL COMMENT 'unique identifier for SS1 form',
  `bf` int DEFAULT '1' COMMENT 'body part (The body type of the sample)',
  `fr` int NOT NULL COMMENT 'unique identifier of each row on the data collected',
  `tx` int NOT NULL COMMENT 'taxon identification number',
  `sas` int NOT NULL COMMENT 'sex and abdominal status',
  `n` int NOT NULL COMMENT 'number of observed (Records the total number of mosquitoes observed in each specific subgroup)',
  `notes` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'NA',
  `slc` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'NA',
  `st` int DEFAULT '0' COMMENT 'sample type (Designates the category of sample as either individual or batch)',
  `ni` int DEFAULT '0' COMMENT 'no of individual ',
  `nb` int DEFAULT '0' COMMENT 'no of batched ',
  `sid01` int DEFAULT '0' COMMENT 'sample type sample identification 1',
  `sid02` int DEFAULT '0' COMMENT 'sample type sample identification 2',
  `sid03` int DEFAULT '0' COMMENT 'sample type sample identification 3',
  `sid04` int DEFAULT '0' COMMENT 'sample type sample identification 4',
  `sid05` int DEFAULT '0' COMMENT 'sample type sample identification 5',
  `sid06` int DEFAULT '0' COMMENT 'sample type sample identification 6',
  `sid07` int DEFAULT '0' COMMENT 'sample type sample identification 7',
  `nd` int DEFAULT NULL COMMENT 'number of discarded (This is the number of mosquitoes discarded)',
  `senfr` int NOT NULL,
  `userid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Submitted by userid',
  `submitted` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Channel used to submit',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`edssid`,`userid`,`sen`,`tx`,`sas`),
  UNIQUE KEY `id` (`id`),
  KEY `tx` (`tx`),
  KEY `bf` (`bf`),
  KEY `sas` (`sas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `2_ss1template`
--

DROP TABLE IF EXISTS `2_ss1template`;
CREATE TABLE IF NOT EXISTS `2_ss1template` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sen` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ssen` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sfr` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bf` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fr` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sas` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `n` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slc` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `st` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ni` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nb` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sid01` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sid02` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sid03` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sid04` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sid05` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sid06` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sid07` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nd` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `2_ss2`
--

DROP TABLE IF EXISTS `2_ss2`;
CREATE TABLE IF NOT EXISTS `2_ss2` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Hold data which is auto increment to links to SO',
  `edssid` int NOT NULL COMMENT 'Store value from table EDSS id',
  `sen` int NOT NULL COMMENT 'unique identifier for SS2 form',
  `ssen` int NOT NULL COMMENT 'unique identifier for SS2 form',
  `sfr` int NOT NULL COMMENT 'unique identifier for SS2form',
  `hf` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Hold status of Habitat types ( names)',
  `hbt` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Hold status of Habitat types ( names)',
  `htr` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Hold status of Habitat Type treated (1: Yes, 2: No)',
  `hw` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Hold status of Habitat wet (1: Yes, 2: No)',
  `hs` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Hold status Habitat Parameter (1: <10m, 2: 10-100m, 3: >100m)',
  `dnh` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Hold status of distance next house (measured in steps)',
  `fr` int NOT NULL COMMENT 'unique identifier of each row on the data collected',
  `dip` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'number of dipping effort (dio)',
  `tx` int NOT NULL DEFAULT '-99' COMMENT 'taxon identification number',
  `bfEgg` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'larvae stage  (measured in steps)',
  `bfL1` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'larvae stage 1 (L1)',
  `bfL2` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'larvae stage 2 (L2)',
  `bfL3` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'larvae stage 3 (L3)',
  `bfL4` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'larvae stage 4 (L4)',
  `L1L2` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'larvae stage L1L2 (L1L2)',
  `L3L4` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'larvae stage L3L4 (L3L4)',
  `tlv` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'larvae stage total larvae (tlv)',
  `pu` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Hold status of pupae (1: Total)',
  `vl` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Hold status of vegitation length(1: Absent, 2: Short grasses, 3: Tall grasses)',
  `rl` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Hold status of rice length (1: Absent, 2: Short grasses, 3: Tall grasses)',
  `vt` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Hold status of treated (1: Yes, 2: No)',
  `notes` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'No data (-99)' COMMENT 'On site observations about collection ',
  `slc` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Unique label code for each composition of taxon plus sex and abdominal status (Sample Lable Code SLC)',
  `ni` int DEFAULT '0' COMMENT 'no of individual ',
  `nb` int DEFAULT '0' COMMENT 'no of batched ',
  `sid01` int DEFAULT '0' COMMENT 'sample type sample identification 1',
  `sid02` int DEFAULT '0' COMMENT 'sample type sample identification 2',
  `sid03` int DEFAULT '0' COMMENT 'sample type sample identification 3',
  `sid04` int DEFAULT '0' COMMENT 'sample type sample identification 4',
  `sid05` int DEFAULT '0' COMMENT 'sample type sample identification 5',
  `sid06` int DEFAULT '0' COMMENT 'sample type sample identification 6',
  `sid07` int DEFAULT '0' COMMENT 'sample type sample identification 7',
  `nod` int DEFAULT NULL COMMENT 'number of discarded (This is the number of mosquitoes discarded)',
  `senfr` int NOT NULL,
  `userid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Submitted by userid',
  `submitted` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Channel used to submit',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`edssid`,`userid`,`sen`,`fr`),
  UNIQUE KEY `id` (`id`),
  KEY `fk_ss2_tx` (`tx`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `2_ss2`
--

INSERT INTO `2_ss2` (`id`, `edssid`, `sen`, `ssen`, `sfr`, `hf`, `hbt`, `htr`, `hw`, `hs`, `dnh`, `fr`, `dip`, `tx`, `bfEgg`, `bfL1`, `bfL2`, `bfL3`, `bfL4`, `L1L2`, `L3L4`, `tlv`, `pu`, `vl`, `rl`, `vt`, `notes`, `slc`, `ni`, `nb`, `sid01`, `sid02`, `sid03`, `sid04`, `sid05`, `sid06`, `sid07`, `nod`, `senfr`, `userid`, `submitted`, `created_at`, `updated_at`) VALUES
(1, 2, 3, 1, 2, '', '', '', '2', '2', '', 4, '2', 50, '', '2', '4', '50', '10', '9', '8', '12', '2', '', '', '', 'No data (-99)', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, '1001', 'submitted_via_web', '2021-09-15 15:53:50', '2021-09-15 15:53:50'),
(2, 3, 4, 1, 3, '', '', '', '1', '3', '', 6, '3', 99, '', '3', '5', '70', '15', '15', '12', '18', '5', '', '', '', 'No data (-99)', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, '1001', 'submitted_via_web', '2021-09-15 15:53:50', '2021-09-15 15:53:50'),
(3, 4, 5, 1, 4, '', '', '', '2', '1', '', 7, '4', 50, '', '4', '6', '30', '20', '21', '16', '24', '8', '', '', '', 'No data (-99)', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, '1001', 'submitted_via_web', '2021-09-15 15:53:50', '2021-09-15 15:53:50'),
(4, 5, 6, 1, 5, '', '', '', '1', '2', '', 8, '5', 1, '', '5', '7', '20', '25', '27', '20', '30', '10', '', '', '', 'No data (-99)', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, '1001', 'submitted_via_web', '2021-09-15 15:53:50', '2021-09-15 15:53:50'),
(5, 6, 7, 1, 6, '', '', '', '2', '3', '', 9, '6', 99, '', '6', '8', '10', '30', '33', '24', '36', '12', '', '', '', 'No data (-99)', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, '1001', 'submitted_via_web', '2021-09-15 15:53:50', '2021-09-15 15:53:50'),
(6, 7, 8, 1, 7, '', '', '', '1', '1', '', 10, '7', 1, '', '7', '9', '5', '35', '39', '28', '42', '14', '', '', '', 'No data (-99)', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, '1001', 'submitted_via_web', '2021-09-15 15:53:50', '2021-09-15 15:53:50'),
(7, 8, 9, 1, 8, '', '', '', '2', '2', '', 11, '8', 50, '', '8', '10', '3', '40', '45', '32', '48', '16', '', '', '', 'No data (-99)', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, '1001', 'submitted_via_web', '2021-09-15 15:53:50', '2021-09-15 15:53:50'),
(8, 9, 10, 1, 9, '', '', '', '1', '3', '', 12, '9', 99, '', '9', '11', '50', '45', '51', '36', '54', '18', '', '', '', 'No data (-99)', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, '1001', 'submitted_via_web', '2021-09-15 15:53:50', '2021-09-15 15:53:50'),
(9, 10, 11, 1, 10, '', '', '', '2', '1', '', 13, '10', 50, '', '10', '12', '70', '50', '57', '40', '60', '20', '', '', '', 'No data (-99)', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11, '1001', 'submitted_via_web', '2021-09-15 15:53:50', '2021-09-15 15:53:50'),
(10, 11, 12, 1, 11, '', '', '', '1', '2', '', 14, '11', 1, '', '11', '13', '30', '55', '63', '44', '66', '22', '', '', '', 'No data (-99)', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12, '1001', 'submitted_via_web', '2021-09-15 15:53:50', '2021-09-15 15:53:50'),
(11, 12, 13, 1, 12, '', '', '', '2', '3', '', 15, '12', 50, '', '12', '14', '20', '60', '69', '48', '72', '24', '', '', '', 'No data (-99)', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13, '1001', 'submitted_via_web', '2021-09-15 15:53:50', '2021-09-15 15:53:50'),
(12, 13, 14, 1, 13, '', '', '', '1', '1', '', 16, '13', 99, '', '13', '15', '10', '65', '75', '52', '78', '26', '', '', '', 'No data (-99)', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 14, '1001', 'submitted_via_web', '2021-09-15 15:53:50', '2021-09-15 15:53:50'),
(13, 14, 15, 1, 14, '', '', '', '2', '2', '', 17, '14', 50, '', '14', '16', '0', '70', '81', '56', '84', '28', '', '', '', 'No data (-99)', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15, '1001', 'submitted_via_web', '2021-09-15 15:53:50', '2021-09-15 15:53:50'),
(14, 15, 16, 1, 15, '', '', '', '1', '3', '', 18, '15', 1, '', '15', '17', '4', '75', '87', '60', '90', '30', '', '', '', 'No data (-99)', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 16, '1001', 'submitted_via_web', '2021-09-15 15:53:50', '2021-09-15 15:53:50'),
(15, 16, 17, 1, 16, '', '', '', '2', '1', '', 19, '16', 50, '', '16', '18', '5', '80', '93', '64', '96', '32', '', '', '', 'No data (-99)', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 17, '1001', 'submitted_via_web', '2021-09-15 15:53:50', '2021-09-15 15:53:50'),
(16, 17, 18, 1, 17, '', '', '', '1', '2', '', 20, '17', 99, '', '17', '19', '32', '85', '99', '68', '102', '34', '', '', '', 'No data (-99)', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 18, '1001', 'submitted_via_web', '2021-09-15 15:53:50', '2021-09-15 15:53:50'),
(17, 18, 19, 1, 18, '', '', '', '2', '3', '', 21, '18', 50, '', '18', '20', '20', '90', '105', '72', '108', '36', '', '', '', 'No data (-99)', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 19, '1001', 'submitted_via_web', '2021-09-15 15:53:50', '2021-09-15 15:53:50'),
(18, 19, 20, 1, 19, '', '', '', '1', '1', '', 22, '19', 99, '', '19', '21', '75', '95', '111', '76', '114', '38', '', '', '', 'No data (-99)', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, '1001', 'submitted_via_web', '2021-09-15 15:53:50', '2021-09-15 15:53:50');

-- --------------------------------------------------------

--
-- Table structure for table `2_ss2template`
--

DROP TABLE IF EXISTS `2_ss2template`;
CREATE TABLE IF NOT EXISTS `2_ss2template` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sen` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ssen` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sfr` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hf` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `htc` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `htr` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hw` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hs` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fr` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bf` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pu` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vl` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vt` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ndi01` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ndi02` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ndi03` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ndi04` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ndi05` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ndi06` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ndi07` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ndi08` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ndi09` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ndi10` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `n` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slc` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ni` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nb` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sid01` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sid02` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sid03` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sid04` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sid05` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sid06` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sid07` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nd` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `2_ss3`
--

DROP TABLE IF EXISTS `2_ss3`;
CREATE TABLE IF NOT EXISTS `2_ss3` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Hold data which is auto increment to links to SO',
  `edssid` int DEFAULT NULL COMMENT 'Store value from table EDSS id',
  `sen` int NOT NULL COMMENT 'unique identifier for ss3 form',
  `ssen` int NOT NULL COMMENT 'unique identifier for ss3 form',
  `sfr` int NOT NULL COMMENT 'unique identifier for ss3 form',
  `fr` int NOT NULL COMMENT 'unique identifier of each row on the data collected',
  `dot` date NOT NULL COMMENT 'date of test',
  `ga` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'gps accuracy',
  `gds` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'gps data source',
  `sgds` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'specify gps data source',
  `ndis` int NOT NULL COMMENT 'nets distributed over the past 3years',
  `mo` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'mosquito origin',
  `mst` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'mosquito species tested',
  `ma` int NOT NULL COMMENT 'mosquito age',
  `tb` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'type of bottle bioassay',
  `bia` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'is it bioassay for intensity assay',
  `it` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'type of insecticide tested',
  `SynT` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'what synergist was tested',
  `ic` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'insecticide concentration',
  `sc` int NOT NULL COMMENT 'synergist concentration',
  `SRTemp` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Storage room temperature',
  `ETMax` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Maximum Exposure Temperature',
  `ETMin` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Minimum Exposure Temperature',
  `HTMax` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Maximum Holding Temperature',
  `HTMin` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Minimum Holding Temperature',
  `EHMax` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Maximum Humidity Exposure',
  `EHMin` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Minimum Humidity Exposure',
  `HHMax` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Maximum Holding Humidity ',
  `HHMin` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Minimum Holding Humidity',
  `mti1` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Bottle1 Insecticide',
  `mti2` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Bottle2 Insecticide',
  `mti3` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Bottle3 Insecticide',
  `mti4` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Bottle4 Insecticide',
  `mti5` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Bottle5 Insecticide',
  `mti6` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Bottle6 Insecticide',
  `mts` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Solvent Control',
  `mtisy1` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Bottle1 Insecticide & Synergist',
  `mtisy2` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Bottle2 Insecticide & Synergist',
  `mtisy3` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Bottle3 Insecticide & Synergist',
  `mtisy4` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Bottle1 Insecticide & Synergist',
  `mtisy5` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Bottle1 Insecticide & Synergist',
  `mtisy6` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Bottle1 Insecticide & Synergist',
  `mtsy` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Synergist Control',
  `BTCI1` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Bottle Code Bottle1 Insecticide',
  `BTCI2` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Bottle Code Bottle1 Insecticide',
  `BTCI3` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Bottle Code Bottle1 Insecticide',
  `BTCI4` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Bottle Code Bottle1 Insecticide',
  `BTCI5` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Bottle Code Bottle1 Insecticide',
  `BTCI6` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Bottle Code Bottle1 Insecticide',
  `BC_S` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Bottle code Solvent Control',
  `BTCSy_I1` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Bottle Code Bottle1 Synergist & Insecticide',
  `BTCSy_I2` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Bottle Code Bottle1 Synergist & Insecticide',
  `BTCSy_I3` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Bottle Code Bottle1 Synergist & Insecticide',
  `BTCSy_I4` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Bottle Code Bottle1 Synergist & Insecticide',
  `BC_Sy` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Bottle Code Synergist Control',
  `DBC_I1` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Date Bottle was Coated Bottle1 Insecticide',
  `DBC_I2` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Date Bottle was Coated Bottle1 Insecticide',
  `DBC_I3` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Date Bottle was Coated Bottle1 Insecticide',
  `DBC_I4` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Date Bottle was Coated Bottle1 Insecticide',
  `DBC_I5` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Date Bottle was Coated Bottle1 Insecticide',
  `DBC_I6` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Date Bottle was Coated Bottle1 Insecticide',
  `DBC_S` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Date Bottle was Coated Solvent Control',
  `DBC_SyI1` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Date Bottle was Coated Bottle1 Synergist & Insecticide',
  `DBC_SyI2` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Date Bottle was Coated Bottle1 Synergist & Insecticide',
  `DBC_SyI3` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Date Bottle was Coated Bottle1 Synergist & Insecticide',
  `DBC_SyI4` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Date Bottle was Coated Bottle1 Synergist & Insecticide',
  `DBC_Sy` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Date Bottle was Coated Synergist Control',
  `TBC_I1` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Times Bottle coated used Bottle1 Insecticide',
  `TBC_I2` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Times Bottle coated used Bottle1 Insecticide',
  `TBC_I3` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Times Bottle coated used Bottle1 Insecticide',
  `TBC_I4` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Times Bottle coated used Bottle1 Insecticide',
  `TBC_I5` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Times Bottle coated used Bottle1 Insecticide',
  `TBC_I6` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Times Bottle coated used Bottle1 Insecticide',
  `TBC_S` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Times Bottle coated used Solvent Control',
  `TBC_SyI1` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Times Bottle coated used Bottle1 Synergist & Insecticide',
  `TBC_SyI2` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Times Bottle coated used Bottle1 Synergist & Insecticide',
  `TBC_SyI3` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Times Bottle coated used Bottle1 Synergist & Insecticide',
  `TBC_SyI4` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Times Bottle coated used Bottle1 Synergist & Insecticide',
  `TBC_Sy` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Times Bottle coated used Synergist Control',
  `KD_D0` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Knock Down/ Dead Time 0min',
  `KD_D15` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Knock Down/ Dead Time 15min',
  `KD_D30` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Knock Down/ Dead Time 30min',
  `KD_D45` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Knock Down/ Dead Time 45min',
  `KD_D60` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Knock Down/ Dead Time 60min',
  `KD_D75` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Knock Down/ Dead Time 75min',
  `KD_D90` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Knock Down/ Dead Time 90min',
  `KD_D105` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Knock Down/ Dead Time 105min',
  `KD_D120` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Knock Down/ Dead Time 120min',
  `KD_D24` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Knock Down/ Dead Time 24hr',
  `KD_D72` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Knock Down/ Dead Time 72hr',
  `KD_D1D` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Knock Down/ Dead Time Day1',
  `KD_D2D` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Knock Down/ Dead Time Day2',
  `KD_D3D` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Knock Down/ Dead Time Day3',
  `KD_D4D` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Knock Down/ Dead Time Day4',
  `KD_D5D` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Knock Down/ Dead Time Day5',
  `KD_D6D` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Knock Down/ Dead Time Day6',
  `KD_D7D` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Knock Down/ Dead Time Day7',
  `rt` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Room Type',
  `spd` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Date of Spray',
  `liu` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Last Insecticide Used',
  `elcm` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Exposed Location of Control Mosquitoes',
  `mt1` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Cone Height 0.5m',
  `mt2` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Cone Height 1.0m',
  `mt3` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Cone Height 2.0m',
  `mt4` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Cone Height Other',
  `mkd1` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mosquitoes K/D 30min Cone Height 0.5m',
  `mkd2` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mosquitoes K/D 60min Cone Height 0.5m',
  `mkd3` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mosquitoes K/D Day1 Cone Height 0.5m',
  `mkd4` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mosquitoes K/D Day2 Cone Height 0.5m',
  `mkd5` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mosquitoes K/D Day3 Cone Height 0.5m',
  `mkd6` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mosquitoes K/D 30min Cone Height 1.0m',
  `mkd7` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mosquitoes K/D 60min Cone Height 1.0m',
  `mkd8` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mosquitoes K/D Day1 Cone Height 1.0m',
  `mkd9` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mosquitoes K/D Day2 Cone Height 1.0m',
  `mkd10` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mosquitoes K/D Day3 Cone Height 1.0m',
  `mkd11` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mosquitoes K/D 30min Cone Height 1.5m',
  `mkd12` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mosquitoes K/D 30min Cone Height 1.5m',
  `mkd13` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mosquitoes K/D 30min Cone Height 1.5m',
  `mkd14` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mosquitoes K/D Day2 Cone Height 1.5m',
  `mkd15` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mosquitoes K/D Day3 Cone Height 1.5m',
  `mkd16` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mosquitoes K/D 30min Cone Height 2.0m',
  `mkd17` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mosquitoes K/D 60min Cone Height 2.0m',
  `mkd18` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mosquitoes K/D Day1 Cone Height 2.0m',
  `mkd19` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mosquitoes K/D Day2 Cone Height 2.0m',
  `mkd20` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mosquitoes K/D Day3 Cone Height 2.0m',
  `O1` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mosquitoes K/D in net other1 mins',
  `O2` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mosquitoes K/D in net other2 mins',
  `O3` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mosquitoes K/D in net other3 mins',
  `mtir1` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Rep1 Insecticide',
  `mtir2` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Rep2 Insecticide',
  `mtir3` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Rep3 Insecticide',
  `mtir4` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Rep4 Insecticide',
  `mtir5` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Rep5 Insecticide',
  `mtir6` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Rep6 Insecticide',
  `mtsr1` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Rep1 Solvent Control',
  `mtsr2` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Rep2 Solvent Control',
  `mtsr3` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Rep3 Solvent Control',
  `mtsr4` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Rep4 Solvent Control',
  `mtisyr1` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Rep1 Insecticide & Synergist',
  `mtisyr2` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Rep2 Insecticide & Synergist',
  `mtisyr3` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Rep3 Insecticide & Synergist',
  `mtisyr4` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Rep4 Insecticide & Synergist',
  `mtsyr1` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Rep1 Synergist Control',
  `mtsyr2` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Rep2 Synergist Control',
  `mtsyr3` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Rep3 Synergist Control',
  `mtsyr4` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Rep4 Synergist Control',
  `tcir1` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Tube Code Rep1 Insecticide',
  `tcir2` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Tube Code Rep2 Insecticide',
  `tcir3` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Tube Code Rep3 Insecticide',
  `tcir4` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Tube Code Rep4 Insecticide',
  `tcir5` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Tube Code Rep5 Insecticide',
  `tcir6` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Tube Code Rep6 Insecticide',
  `tc_sr1` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Tube Code Rep1 Solvent Control',
  `tc_sr2` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Tube Code Rep2 Solvent Control',
  `tc_sr3` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Tube Code Rep3 Solvent Control',
  `tc_sr4` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Tube Code Rep4 Solvent Control',
  `tc_syir1` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Tube Code Rep1 Insecticide & Synergist',
  `tc_syir2` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Tube Code Rep2 Insecticide & Synergist',
  `tc_syir3` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Tube Code Rep3 Insecticide & Synergist',
  `tc_syir4` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Tube Code Rep4 Insecticide & Synergist',
  `tc_sy1r` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Tube Code Rep1 Synergist Control',
  `tc_sy2r` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Tube Code Rep2 Synergist Control',
  `tc_sy3r` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Tube Code Rep3 Synergist Control',
  `tc_sy4r` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Tube Code Rep4 Synergist Control',
  `id_ir1` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Impregnation Date Tube1 Insecticide',
  `id_ir2` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Impregnation Date Tube2 Insecticide',
  `id_ir3` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Impregnation Date Tube3 Insecticide',
  `id_ir4` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Impregnation Date Tube4 Insecticide',
  `id_ir5` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Impregnation Date Tube5 Insecticide',
  `id_ir6` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Impregnation Date Tube6 Insecticide',
  `id_sr1` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Impregnation Date Tube1 Solvent Control',
  `id_sr2` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Impregnation Date Tube2 Solvent Control',
  `id_sr3` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Impregnation Date Tube3 Solvent Control',
  `id_sr4` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Impregnation Date Tube4 Solvent Control',
  `id_syr1` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Impregnation Date Tube1 Synergist Control',
  `id_syr2` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Impregnation Date Tube2 Synergist Control',
  `id_syr3` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Impregnation Date Tube3 Synergist Control',
  `id_syr4` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Impregnation Date Tube4 Synergist Control',
  `edi1` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Expiry Date - Rep1 Insecticide(EDI1)',
  `edi2` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Expiry Date - Rep2 Insecticide(EDI2)',
  `edi3` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Expiry Date - Rep3 Insecticide(EDI3)',
  `edi4` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Expiry Date - Rep4 Insecticide(EDI4)',
  `edi5` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Expiry Date - Rep5 Insecticide(EDI5)',
  `edi6` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Expiry Date - Rep6 Insecticide(EDI6)',
  `eds1` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Expiry Date - Rep1 Solvent Control',
  `eds2` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Expiry Date - Rep2 Solvent Control',
  `eds3` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Expiry Date - Rep3 Solvent Control',
  `eds4` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Expiry Date - Rep4 Solvent Control',
  `edisy1` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Expiry Date - Rep1 Insecticide & Synergist',
  `edisy2` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Expiry Date - Rep2 Insecticide & Synergist',
  `edisy3` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Expiry Date - Rep3 Insecticide & Synergist',
  `edisy4` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Expiry Date - Rep4 Insecticide & Synergist',
  `edsy1` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Expiry Date - Rep1 Synergist Control',
  `edsy2` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Expiry Date - Rep2 Synergist Control',
  `edsy3` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Expiry Date - Rep3 Synergist Control',
  `edsy4` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Expiry Date - Rep4 Synergist Control',
  `senfr` int NOT NULL,
  `userid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Submitted by userid',
  `submitted` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Channel used to submit',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`userid`,`sen`,`fr`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `2_ss3template`
--

DROP TABLE IF EXISTS `2_ss3template`;
CREATE TABLE IF NOT EXISTS `2_ss3template` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sen` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ssen` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sfr` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sd` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fd` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fr` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dd` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sas` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mt` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ch` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `la` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ft` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bf` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hp` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `oth5` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `oth6` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `oth7` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `oth8` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `n` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slc` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `st` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ni` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nb` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sid01` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sid02` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sid03` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sid04` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sid05` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sid06` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sid07` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nd` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `2_ss4`
--

DROP TABLE IF EXISTS `2_ss4`;
CREATE TABLE IF NOT EXISTS `2_ss4` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Hold data which is auto increment to links to SO',
  `edssid` int NOT NULL COMMENT 'unique identifier for SS4 form',
  `sen` int NOT NULL COMMENT 'unique identifier for SS4 form',
  `ssen` int NOT NULL COMMENT 'unique identifier for SS4 form',
  `sfr` int NOT NULL COMMENT 'unique identifier for SS4 form',
  `fr` int NOT NULL COMMENT 'unique identifier of each row on the data collected',
  `su` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT 'substracte (type of soil for snail to lay eggs)',
  `sa` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'salinity',
  `dso` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Dissolved oxygen ',
  `dr` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '-99' COMMENT 'Number of dredges',
  `ph` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'potential of hydrogen',
  `co` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT ' Conductivity ms',
  `wda` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT 'wild domestic animal  (define jind of animals)',
  `act` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT 'activity (define either human activities )',
  `hc` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT 'activity (Health centres )',
  `wn` int UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Hold status of water body name (1: Yes, 2: No)',
  `wl` int UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Hold status of water level (1: Yes, 2: No)',
  `de` int UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Hold status of depth (1: Yes, 2: No)',
  `ret` int UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Hold status of flow rate (1: Yes, 2: No)',
  `wt` int UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Hold status of water body type (1: Yes, 2: No)',
  `lwt` int UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Hold status of longevity of water body type (1: Yes, 2: No)',
  `sp` int UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Hold status of snail present(1: Yes, 2: No)',
  `spc` int UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Hold status of snail species collected (1: Yes, 2: No)',
  `n` int NOT NULL COMMENT 'number of observed (Records the total number of mosquitoes observed in each specific subgroup)',
  `sps` int UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Hold status of snail species shedded (1: Yes, 2: No)',
  `tc` int UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Hold status of type of cercaria (1: Yes, 2: No)',
  `nc` int UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Bumber of cercaria shadded (1: Yes, 2: No)',
  `nd` int DEFAULT NULL COMMENT 'number of discarded (This is the number of mosquitoes discarded)',
  `senfr` int NOT NULL,
  `userid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Submitted by userid',
  `submitted` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Channel used to submit',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`edssid`,`userid`,`sen`,`fr`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `2_ssso`
--

DROP TABLE IF EXISTS `2_ssso`;
CREATE TABLE IF NOT EXISTS `2_ssso` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Hold data which is auto increment to links to SO',
  `ss1id` int DEFAULT NULL COMMENT 'Hold data link to SS1',
  `ss2id` int DEFAULT NULL COMMENT 'Hold data link to SS2',
  `ss3id` int DEFAULT NULL COMMENT 'Hold data link to SS3',
  `ss4id` int DEFAULT NULL COMMENT 'Hold data link to SS4',
  PRIMARY KEY (`id`),
  KEY `fk_ss1id` (`ss1id`),
  KEY `fk_ss2id` (`ss2id`),
  KEY `fk_ss3id` (`ss3id`),
  KEY `fk_ss4id` (`ss4id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `2_ssso`
--

INSERT INTO `2_ssso` (`id`, `ss1id`, `ss2id`, `ss3id`, `ss4id`) VALUES
(1, NULL, 1, NULL, NULL),
(2, NULL, 2, NULL, NULL),
(3, NULL, 3, NULL, NULL),
(4, NULL, 4, NULL, NULL),
(5, NULL, 5, NULL, NULL),
(6, NULL, 6, NULL, NULL),
(7, NULL, 7, NULL, NULL),
(8, NULL, 8, NULL, NULL),
(9, NULL, 9, NULL, NULL),
(10, NULL, 10, NULL, NULL),
(11, NULL, 11, NULL, NULL),
(12, NULL, 12, NULL, NULL),
(13, NULL, 13, NULL, NULL),
(14, NULL, 14, NULL, NULL),
(15, NULL, 15, NULL, NULL),
(16, NULL, 16, NULL, NULL),
(17, NULL, 17, NULL, NULL),
(18, NULL, 18, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `2_st1`
--

DROP TABLE IF EXISTS `2_st1`;
CREATE TABLE IF NOT EXISTS `2_st1` (
  `id_` int NOT NULL AUTO_INCREMENT,
  `projectregsite_id` int NOT NULL,
  `sen` int NOT NULL,
  `ssen` int NOT NULL,
  `sfr` int NOT NULL,
  `fr` int NOT NULL,
  `rc` int NOT NULL,
  `sbf` int DEFAULT NULL,
  `sslc` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sst` int DEFAULT NULL,
  `ssid` int NOT NULL,
  `stx` int DEFAULT NULL,
  `userid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Submitted by userid',
  `submitted` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Channel used to submit',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`sen`,`fr`,`rc`,`ssid`,`userid`),
  UNIQUE KEY `id_` (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `2_st2`
--

DROP TABLE IF EXISTS `2_st2`;
CREATE TABLE IF NOT EXISTS `2_st2` (
  `id_` int NOT NULL AUTO_INCREMENT,
  `projectregsite_id` int NOT NULL,
  `sen` int NOT NULL,
  `fr` int NOT NULL,
  `ssen` int NOT NULL,
  `ns` int NOT NULL,
  `fst` int DEFAULT NULL,
  `ff` int NOT NULL,
  `rcn` int NOT NULL,
  `userid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Submitted by userid',
  `submitted` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Channel used to submit',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`userid`,`sen`,`fr`),
  UNIQUE KEY `id_` (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `2_taxon`
--

DROP TABLE IF EXISTS `2_taxon`;
CREATE TABLE IF NOT EXISTS `2_taxon` (
  `id` int NOT NULL AUTO_INCREMENT,
  `number` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `2_treatment`
--

DROP TABLE IF EXISTS `2_treatment`;
CREATE TABLE IF NOT EXISTS `2_treatment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `number` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tr` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `2_treatment_two`
--

DROP TABLE IF EXISTS `2_treatment_two`;
CREATE TABLE IF NOT EXISTS `2_treatment_two` (
  `id` int NOT NULL AUTO_INCREMENT,
  `number` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tr` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `3_audit_trail`
--

DROP TABLE IF EXISTS `3_audit_trail`;
CREATE TABLE IF NOT EXISTS `3_audit_trail` (
  `auditid` int NOT NULL AUTO_INCREMENT,
  `auditsen` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `auditfr` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `auditformtype` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `audituser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `auditdate` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `auditaction` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `auditdetail` varchar(350) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`auditid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `3_bodypart`
--

DROP TABLE IF EXISTS `3_bodypart`;
CREATE TABLE IF NOT EXISTS `3_bodypart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `number` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bp` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `3_cluster`
--

DROP TABLE IF EXISTS `3_cluster`;
CREATE TABLE IF NOT EXISTS `3_cluster` (
  `id` int NOT NULL AUTO_INCREMENT,
  `number` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cr` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `3_colonycode`
--

DROP TABLE IF EXISTS `3_colonycode`;
CREATE TABLE IF NOT EXISTS `3_colonycode` (
  `id` int NOT NULL AUTO_INCREMENT,
  `number` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cc` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `3_compound`
--

DROP TABLE IF EXISTS `3_compound`;
CREATE TABLE IF NOT EXISTS `3_compound` (
  `id` int NOT NULL AUTO_INCREMENT,
  `number` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cp` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `3_custgraph`
--

DROP TABLE IF EXISTS `3_custgraph`;
CREATE TABLE IF NOT EXISTS `3_custgraph` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pc` int NOT NULL,
  `location` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `num_split` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `p_attri` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `p_attri2` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `3_custlabel`
--

DROP TABLE IF EXISTS `3_custlabel`;
CREATE TABLE IF NOT EXISTS `3_custlabel` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pc` int NOT NULL,
  `location` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `num_split` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `p_attri` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `p_attri2` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `3_ed1`
--

DROP TABLE IF EXISTS `3_ed1`;
CREATE TABLE IF NOT EXISTS `3_ed1` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Hold data which is auto increment links to SS',
  `projectregsite_id` int NOT NULL COMMENT 'Store value from table projectregsite id',
  `sen` int NOT NULL COMMENT 'unique identifier for ED1 form',
  `fr` int NOT NULL COMMENT 'unique identifier of each row on the data collected',
  `dt` date NOT NULL COMMENT 'date of collection (morning on which the mosquitoes were collected)',
  `re` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT 'Region (Define specific Region in the Country)',
  `di` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT 'District (Define specific District in a Region )',
  `sec` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT 'Sector/Council (Define specific Sector in the District)',
  `cew` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT 'Cell/Ward (Define specific Cell/ in the Sector)',
  `vis` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT 'Village/Street (Define specific Village/Street in the Cell/Ward)',
  `ea` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT 'Enumaration area (Define geographic location within the study site)',
  `cr` bigint DEFAULT '0' COMMENT 'Cluster (The smallest geographic statistical unit within enumaration area)',
  `cp` int DEFAULT '0' COMMENT 'Compound or Plot (A specific physical area within an identifiable owner)',
  `tcu` bigint DEFAULT '-99' COMMENT 'Hold Ten Cell Unit',
  `hh` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT 'Household (A person or group of people who live together in the same dwelling unit)',
  `nah` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT 'Animals in Household (An animal or group of animals who live together with people in same dwelling unit)',
  `sid` int DEFAULT '0' COMMENT 'Structure ID (A free standing building that can have one or more room for residential or commercial use)',
  `me` int NOT NULL DEFAULT '-99' COMMENT 'Method (The method by which the mosquitoes were collected or trapped)',
  `ind` int NOT NULL COMMENT 'hold collection was made indoors a house or hut',
  `ht` int DEFAULT NULL COMMENT 'Habitat Type (Classification of the aquatic habitat in which the collection was made)',
  `st` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Start Time (The time that the collection started in 24 time )',
  `ft` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Finish Time (The time that the collection finish in 24 time)',
  `hp` int DEFAULT NULL COMMENT 'Hold Period (The period of time for which the mosquitoes were held for survival analysis after they were collected)',
  `rnd` int DEFAULT '-99' COMMENT 'Round (One cycle or rotation of the treatment )',
  `blk` int DEFAULT '-99' COMMENT 'Block (A set of position through which treatments are rotated in a Latin)',
  `shh` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '-99' COMMENT 'A project specific house or experiment hut',
  `stn` int DEFAULT '-99' COMMENT 'A project specific where station where a trap may be positioned',
  `vi` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Initial of person that caught the mosquitoes',
  `tr` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Treatment (Coding for the unique experimental treatment)',
  `dy` int DEFAULT '-99' COMMENT 'Experiment Day (The consecutive nth day since the experiment commenced)',
  `tmp` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Temperature',
  `hmd` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Humidity',
  `ws` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'wind speed',
  `hs` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '-99' COMMENT 'Number of household sampled',
  `vc` int DEFAULT '2' COMMENT 'Legitimacy of the collection',
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'On site observation about the collection',
  `gps` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Site geolocation',
  `dsen` int NOT NULL COMMENT 'Destination form serial number',
  `livestock` int DEFAULT NULL,
  `hoccupant` int DEFAULT NULL,
  `heaves` int DEFAULT NULL,
  `nss` int DEFAULT NULL,
  `nbh` int DEFAULT NULL,
  `oth` int DEFAULT NULL,
  `sn` int DEFAULT '-99' COMMENT 'Season',
  `wtc` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '-99' COMMENT 'Weather Conditions',
  `agrt` int DEFAULT '-99' COMMENT 'Agriculture',
  `invn` int DEFAULT '-99' COMMENT 'Intervention',
  `lvk` int DEFAULT '-99' COMMENT 'Livestock',
  `rfe` int DEFAULT '-99' COMMENT 'Roof type',
  `wle` int DEFAULT '-99' COMMENT 'Wall type',
  `evs` int DEFAULT '-99' COMMENT 'Eaves',
  `bv` int DEFAULT '-99' COMMENT 'Block ventilation',
  `bvs` int DEFAULT '-99' COMMENT 'Block ventilation screening',
  `wsn` int DEFAULT '-99' COMMENT 'Window screening',
  `wsnc` int DEFAULT '-99' COMMENT 'Window screening Condition',
  `ckl` int DEFAULT '-99' COMMENT 'Cooking location',
  `cke` int DEFAULT '-99' COMMENT 'Cooking Energy source',
  `sp` int DEFAULT '-99' COMMENT 'Sprayed',
  `lsd` date DEFAULT NULL COMMENT 'Last spray date',
  `ise` int DEFAULT '-99' COMMENT 'Insectside',
  `userid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Submitted by userid',
  `submitted` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Channel used to submit',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`projectregsite_id`,`userid`,`sen`,`fr`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `3_ed1`
--

INSERT INTO `3_ed1` (`id`, `projectregsite_id`, `sen`, `fr`, `dt`, `re`, `di`, `sec`, `cew`, `vis`, `ea`, `cr`, `cp`, `tcu`, `hh`, `nah`, `sid`, `me`, `ind`, `ht`, `st`, `ft`, `hp`, `rnd`, `blk`, `shh`, `stn`, `vi`, `tr`, `dy`, `tmp`, `hmd`, `ws`, `hs`, `vc`, `notes`, `gps`, `dsen`, `livestock`, `hoccupant`, `heaves`, `nss`, `nbh`, `oth`, `sn`, `wtc`, `agrt`, `invn`, `lvk`, `rfe`, `wle`, `evs`, `bv`, `bvs`, `wsn`, `wsnc`, `ckl`, `cke`, `sp`, `lsd`, `ise`, `userid`, `submitted`, `created_at`, `updated_at`) VALUES
(1, 7, 1, 1, '2021-01-03', '0', '0', '0', '0', '0', '0', 0, 0, -99, '0', '0', 0, 1, 2, NULL, '16:34', '17:35', NULL, -99, -99, '-99', -99, NULL, NULL, -99, NULL, NULL, NULL, '-99', 1, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, -99, '-99', -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, NULL, -99, '1001', 'submitted_via_web', '2021-09-15 15:54:52', '2021-09-15 15:54:52'),
(2, 7, 1, 2, '2021-02-05', '0', '0', '0', '0', '0', '0', 0, 0, -99, '0', '0', 0, 1, 2, NULL, '16:34', '17:35', NULL, -99, -99, '-99', -99, NULL, NULL, -99, NULL, NULL, NULL, '-99', 1, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, -99, '-99', -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, NULL, -99, '1001', 'submitted_via_web', '2021-09-15 15:54:52', '2021-09-15 15:54:52'),
(3, 7, 1, 3, '2021-03-03', '0', '0', '0', '0', '0', '0', 0, 0, -99, '0', '0', 0, 1, 2, NULL, '16:34', '17:35', NULL, -99, -99, '-99', -99, NULL, NULL, -99, NULL, NULL, NULL, '-99', 1, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, -99, '-99', -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, NULL, -99, '1001', 'submitted_via_web', '2021-09-15 15:54:52', '2021-09-15 15:54:52'),
(4, 7, 1, 4, '2021-07-13', '0', '0', '0', '0', '0', '0', 0, 0, -99, '0', '0', 0, 1, 2, NULL, '16:34', '17:35', NULL, -99, -99, '-99', -99, NULL, NULL, -99, NULL, NULL, NULL, '-99', 1, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, -99, '-99', -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, NULL, -99, '1001', 'submitted_via_web', '2021-09-15 15:54:52', '2021-09-15 15:54:52'),
(5, 7, 1, 5, '2021-08-04', '0', '0', '0', '0', '0', '0', 0, 0, -99, '0', '0', 0, 1, 2, NULL, '16:34', '17:35', NULL, -99, -99, '-99', -99, NULL, NULL, -99, NULL, NULL, NULL, '-99', 1, NULL, NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL, -99, '-99', -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, NULL, -99, '1001', 'submitted_via_web', '2021-09-15 15:54:52', '2021-09-15 15:54:52'),
(6, 7, 1, 6, '2021-10-09', '0', '0', '0', '0', '0', '0', 0, 0, -99, '0', '0', 0, 1, 2, NULL, '16:34', '17:35', NULL, -99, -99, '-99', -99, NULL, NULL, -99, NULL, NULL, NULL, '-99', 1, NULL, NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, -99, '-99', -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, NULL, -99, '1001', 'submitted_via_web', '2021-09-15 15:54:52', '2021-09-15 15:54:52'),
(7, 7, 1, 7, '2021-11-13', '0', '0', '0', '0', '0', '0', 0, 0, -99, '0', '0', 0, 1, 2, NULL, '16:34', '17:35', NULL, -99, -99, '-99', -99, NULL, NULL, -99, NULL, NULL, NULL, '-99', 1, NULL, NULL, 8, NULL, NULL, NULL, NULL, NULL, NULL, -99, '-99', -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, NULL, -99, '1001', 'submitted_via_web', '2021-09-15 15:54:52', '2021-09-15 15:54:52'),
(8, 7, 1, 8, '2021-12-31', '0', '0', '0', '0', '0', '0', 0, 0, -99, '0', '0', 0, 1, 2, NULL, '16:34', '17:35', NULL, -99, -99, '-99', -99, NULL, NULL, -99, NULL, NULL, NULL, '-99', 1, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, -99, '-99', -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, NULL, -99, '1001', 'submitted_via_web', '2021-09-15 15:54:52', '2021-09-15 15:54:52'),
(9, 7, 1, 9, '2021-08-20', '0', '0', '0', '0', '0', '0', 0, 0, -99, '0', '0', 0, 1, 2, NULL, '16:34', '17:35', NULL, -99, -99, '-99', -99, NULL, NULL, -99, NULL, NULL, NULL, '-99', 1, NULL, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, -99, '-99', -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, NULL, -99, '1001', 'submitted_via_web', '2021-09-15 15:54:52', '2021-09-15 15:54:52'),
(10, 7, 1, 10, '2021-02-12', '0', '0', '0', '0', '0', '0', 0, 0, -99, '0', '0', 0, 1, 2, NULL, '16:34', '17:35', NULL, -99, -99, '-99', -99, NULL, NULL, -99, NULL, NULL, NULL, '-99', 1, NULL, NULL, 11, NULL, NULL, NULL, NULL, NULL, NULL, -99, '-99', -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, NULL, -99, '1001', 'submitted_via_web', '2021-09-15 15:54:52', '2021-09-15 15:54:52'),
(11, 7, 1, 11, '2021-06-20', '0', '0', '0', '0', '0', '0', 0, 0, -99, '0', '0', 0, 1, 2, NULL, '16:34', '17:35', NULL, -99, -99, '-99', -99, NULL, NULL, -99, NULL, NULL, NULL, '-99', 1, NULL, NULL, 12, NULL, NULL, NULL, NULL, NULL, NULL, -99, '-99', -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, NULL, -99, '1001', 'submitted_via_web', '2021-09-15 15:54:52', '2021-09-15 15:54:52'),
(12, 7, 1, 12, '2021-08-01', '0', '0', '0', '0', '0', '0', 0, 0, -99, '0', '0', 0, 1, 2, NULL, '16:34', '17:35', NULL, -99, -99, '-99', -99, NULL, NULL, -99, NULL, NULL, NULL, '-99', 1, NULL, NULL, 13, NULL, NULL, NULL, NULL, NULL, NULL, -99, '-99', -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, NULL, -99, '1001', 'submitted_via_web', '2021-09-15 15:54:52', '2021-09-15 15:54:52'),
(13, 7, 1, 13, '2021-08-07', '0', '0', '0', '0', '0', '0', 0, 0, -99, '0', '0', 0, 1, 2, NULL, '16:34', '17:35', NULL, -99, -99, '-99', -99, NULL, NULL, -99, NULL, NULL, NULL, '-99', 1, NULL, NULL, 14, NULL, NULL, NULL, NULL, NULL, NULL, -99, '-99', -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, NULL, -99, '1001', 'submitted_via_web', '2021-09-15 15:54:52', '2021-09-15 15:54:52'),
(14, 7, 1, 14, '2021-08-25', '0', '0', '0', '0', '0', '0', 0, 0, -99, '0', '0', 0, 1, 2, NULL, '16:34', '17:35', NULL, -99, -99, '-99', -99, NULL, NULL, -99, NULL, NULL, NULL, '-99', 1, NULL, NULL, 15, NULL, NULL, NULL, NULL, NULL, NULL, -99, '-99', -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, NULL, -99, '1001', 'submitted_via_web', '2021-09-15 15:54:52', '2021-09-15 15:54:52'),
(15, 7, 1, 15, '2021-02-05', '0', '0', '0', '0', '0', '0', 0, 0, -99, '0', '0', 0, 1, 2, NULL, '16:34', '17:35', NULL, -99, -99, '-99', -99, NULL, NULL, -99, NULL, NULL, NULL, '-99', 1, NULL, NULL, 16, NULL, NULL, NULL, NULL, NULL, NULL, -99, '-99', -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, NULL, -99, '1001', 'submitted_via_web', '2021-09-15 15:54:52', '2021-09-15 15:54:52'),
(16, 7, 1, 16, '2021-03-03', '0', '0', '0', '0', '0', '0', 0, 0, -99, '0', '0', 0, 1, 2, NULL, '16:34', '17:35', NULL, -99, -99, '-99', -99, NULL, NULL, -99, NULL, NULL, NULL, '-99', 1, NULL, NULL, 17, NULL, NULL, NULL, NULL, NULL, NULL, -99, '-99', -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, NULL, -99, '1001', 'submitted_via_web', '2021-09-15 15:54:52', '2021-09-15 15:54:52'),
(17, 7, 1, 17, '2021-07-13', '0', '0', '0', '0', '0', '0', 0, 0, -99, '0', '0', 0, 1, 2, NULL, '16:34', '17:35', NULL, -99, -99, '-99', -99, NULL, NULL, -99, NULL, NULL, NULL, '-99', 1, NULL, NULL, 18, NULL, NULL, NULL, NULL, NULL, NULL, -99, '-99', -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, NULL, -99, '1001', 'submitted_via_web', '2021-09-15 15:54:52', '2021-09-15 15:54:52'),
(18, 7, 1, 18, '2021-11-13', '0', '0', '0', '0', '0', '0', 0, 0, -99, '0', '0', 0, 1, 2, NULL, '16:34', '17:35', NULL, -99, -99, '-99', -99, NULL, NULL, -99, NULL, NULL, NULL, '-99', 1, NULL, NULL, 19, NULL, NULL, NULL, NULL, NULL, NULL, -99, '-99', -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, NULL, -99, '1001', 'submitted_via_web', '2021-09-15 15:54:52', '2021-09-15 15:54:52'),
(19, 7, 1, 19, '2021-12-31', '0', '0', '0', '0', '0', '0', 0, 0, -99, '0', '0', 0, 1, 2, NULL, '16:34', '17:35', NULL, -99, -99, '-99', -99, NULL, NULL, -99, NULL, NULL, NULL, '-99', 1, NULL, NULL, 20, NULL, NULL, NULL, NULL, NULL, NULL, -99, '-99', -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, -99, NULL, -99, '1001', 'submitted_via_web', '2021-09-15 15:54:52', '2021-09-15 15:54:52');

-- --------------------------------------------------------

--
-- Table structure for table `3_ed1template`
--

DROP TABLE IF EXISTS `3_ed1template`;
CREATE TABLE IF NOT EXISTS `3_ed1template` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Hold data which is auto increment links to SS',
  `sen` int NOT NULL COMMENT 'unique identifier for ED1 form',
  `fr` int NOT NULL COMMENT 'unique identifier of each row on the data collected',
  `dt` date DEFAULT NULL COMMENT 'date of collection (morning on which the mosquitoes were collected)',
  `re` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT 'Region (Define specific Region in the Country)',
  `di` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT 'District (Define specific District in a Region )',
  `sec` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT 'Sector/Council (Define specific Sector in the District)',
  `cew` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT 'Cell/Ward (Define specific Cell/ in the Sector)',
  `vis` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT 'Village/Street (Define specific Village/Street in the Cell/Ward)',
  `ea` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT 'Enumaration area (Define geographic location within the study site)',
  `cr` bigint DEFAULT '0' COMMENT 'Cluster (The smallest geographic statistical unit within enumaration area)',
  `cp` int DEFAULT '0' COMMENT 'Compound or Plot (A specific physical area within an identifiable owner)',
  `tcu` bigint DEFAULT '-99' COMMENT 'Hold Ten Cell Unit',
  `hh` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT 'Household (A person or group of people who live together in the same dwelling unit)',
  `nah` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT 'Animals in Household (An animal or group of animals who live together with people in same dwelling unit)',
  `sid` int DEFAULT '0' COMMENT 'Structure ID (A free standing building that can have one or more room for residential or commercial use)',
  `me` int DEFAULT '-99' COMMENT 'Method (The method by which the mosquitoes were collected or trapped)',
  `ind` int DEFAULT NULL COMMENT 'hold collection was made indoors a house or hut',
  `ht` int DEFAULT NULL COMMENT 'Habitat Type (Classification of the aquatic habitat in which the collection was made)',
  `st` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Start Time (The time that the collection started in 24 time )',
  `ft` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Finish Time (The time that the collection finish in 24 time)',
  `hp` int DEFAULT NULL COMMENT 'Hold Period (The period of time for which the mosquitoes were held for survival analysis after they were collected)',
  `rnd` int DEFAULT '-99' COMMENT 'Round (One cycle or rotation of the treatment )',
  `blk` int DEFAULT '-99' COMMENT 'Block (A set of position through which treatments are rotated in a Latin)',
  `shh` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '-99' COMMENT 'A project specific house or experiment hut',
  `stn` int DEFAULT '-99' COMMENT 'A project specific where station where a trap may be positioned',
  `vi` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Initial of person that caught the mosquitoes',
  `tr` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Treatment (Coding for the unique experimental treatment)',
  `dy` int DEFAULT '-99' COMMENT 'Experiment Day (The consecutive nth day since the experiment commenced)',
  `tmp` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Temperature',
  `hmd` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Humidity',
  `ws` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'wind speed',
  `hs` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '-99' COMMENT 'Number of household sampled',
  `vc` int DEFAULT '2' COMMENT 'Legitimacy of the collection',
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'On site observation about the collection',
  `gps` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Site geolocation',
  `dsen` int NOT NULL COMMENT 'Destination form serial number',
  `livestock` int DEFAULT '-99',
  `hoccupant` int DEFAULT '-99',
  `heaves` int DEFAULT '-99',
  `nss` int DEFAULT '-99',
  `nbh` int DEFAULT '-99',
  `oth` int DEFAULT '-99',
  `sn` int DEFAULT '-99' COMMENT 'Season',
  `wtc` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '-99' COMMENT 'Weather Conditions',
  `agrt` int DEFAULT '-99' COMMENT 'Agriculture',
  `invn` int DEFAULT '-99' COMMENT 'Intervention',
  `lvk` int DEFAULT '-99' COMMENT 'Livestock',
  `rfe` int DEFAULT '-99' COMMENT 'Roof type',
  `wle` int DEFAULT '-99' COMMENT 'Wall type',
  `evs` int DEFAULT '-99' COMMENT 'Eaves',
  `bv` int DEFAULT '-99' COMMENT 'Block ventilation',
  `bvs` int DEFAULT '-99' COMMENT 'Block ventilation screening',
  `wsn` int DEFAULT '-99' COMMENT 'Window screening',
  `wsnc` int DEFAULT '-99' COMMENT 'Window screening Condition',
  `ckl` int DEFAULT '-99' COMMENT 'Cooking location',
  `cke` int DEFAULT '-99' COMMENT 'Cooking Energy source',
  `sp` int DEFAULT '-99' COMMENT 'Sprayed',
  `lsd` date DEFAULT NULL COMMENT 'Last spray date',
  `ise` int DEFAULT '-99' COMMENT 'Insectside',
  `userid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Submitted by userid',
  `submitted` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Channel used to submit',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `3_ed2`
--

DROP TABLE IF EXISTS `3_ed2`;
CREATE TABLE IF NOT EXISTS `3_ed2` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Hold data which is auto increment links to SS',
  `projectregsite_id` int NOT NULL COMMENT 'Store value from table projectregsite id (Foreign Key)',
  `sen` int NOT NULL COMMENT 'unique identifier for ED2 form',
  `fr` int NOT NULL COMMENT 'unique identifier of each row on the data collected',
  `ssen` int DEFAULT '-99',
  `sfr` int DEFAULT '-99',
  `slc` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '-99',
  `sbp` int DEFAULT '-99',
  `sst` int DEFAULT '-99',
  `ssid` int DEFAULT '-99',
  `scc` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '-99',
  `stx` int DEFAULT '-99' COMMENT 'Store taxon code foreign key from Taxon table',
  `ssas` int DEFAULT '-99' COMMENT 'Store sex code foreign key from SexAbdominal table',
  `ag` int DEFAULT '-99',
  `n` int NOT NULL COMMENT 'Store number of mosqutoes caught',
  `sd` date DEFAULT NULL COMMENT 'started date of the experiment',
  `st` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '-99' COMMENT 'started time of the experiment',
  `tr` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '-99' COMMENT 'Treatment (Coding for the unique experimental treatment)',
  `vi` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'NA' COMMENT 'Initial of person that caught the mosquitoes',
  `rnd` int DEFAULT '-99' COMMENT 'Round (One cycle or rotation of the treatment )',
  `dy` int DEFAULT '-99' COMMENT 'Experiment Day (The consecutive nth day since the experiment commenced)',
  `oth1` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '-99' COMMENT 'Other Any additional experimental details',
  `oth2` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '-99' COMMENT 'Pther Any additional experimental details',
  `oth3` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '-99' COMMENT 'Pther Any additional experimental details',
  `va` int DEFAULT NULL COMMENT 'Valid Assay Legitimacy of the experimental assay',
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'On site observation about the collection',
  `dsen` int NOT NULL COMMENT 'Destination form serial number',
  `userid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Submitted by userid',
  `submitted` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Channel used to submit',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`projectregsite_id`,`userid`,`sen`,`fr`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `3_ed2template`
--

DROP TABLE IF EXISTS `3_ed2template`;
CREATE TABLE IF NOT EXISTS `3_ed2template` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sen` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fr` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ssen` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sfr` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slc` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sbp` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sst` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ssid` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scc` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stx` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ssas` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ag` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `n` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sd` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `st` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tr` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vi` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rep` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rnd` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dy` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `oth1` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `oth2` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `oth3` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `va` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dsen` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `3_edss`
--

DROP TABLE IF EXISTS `3_edss`;
CREATE TABLE IF NOT EXISTS `3_edss` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Hold data which is auto increment links to EDSS',
  `ed1id` int DEFAULT NULL COMMENT 'Hold data which is coming from Ed1',
  `ed2id` int DEFAULT NULL COMMENT 'Hold data which is coming from  Ed2',
  PRIMARY KEY (`id`),
  KEY `fk_edss_ed1id` (`ed1id`),
  KEY `fk_edss_ed2id` (`ed2id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `3_edss`
--

INSERT INTO `3_edss` (`id`, `ed1id`, `ed2id`) VALUES
(1, 1, NULL),
(2, 2, NULL),
(3, 3, NULL),
(4, 4, NULL),
(5, 5, NULL),
(6, 6, NULL),
(7, 7, NULL),
(8, 8, NULL),
(9, 9, NULL),
(10, 10, NULL),
(11, 11, NULL),
(12, 12, NULL),
(13, 13, NULL),
(14, 14, NULL),
(15, 15, NULL),
(16, 16, NULL),
(17, 17, NULL),
(18, 18, NULL),
(19, 19, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `3_enumerationarea`
--

DROP TABLE IF EXISTS `3_enumerationarea`;
CREATE TABLE IF NOT EXISTS `3_enumerationarea` (
  `id` int NOT NULL AUTO_INCREMENT,
  `number` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ea` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `3_habitattype`
--

DROP TABLE IF EXISTS `3_habitattype`;
CREATE TABLE IF NOT EXISTS `3_habitattype` (
  `id` int NOT NULL AUTO_INCREMENT,
  `number` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ht` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `3_location`
--

DROP TABLE IF EXISTS `3_location`;
CREATE TABLE IF NOT EXISTS `3_location` (
  `id` int NOT NULL AUTO_INCREMENT,
  `number` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ind` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `3_location`
--

INSERT INTO `3_location` (`id`, `number`, `ind`) VALUES
(1, '1', 'In'),
(2, '2', 'Out');

-- --------------------------------------------------------

--
-- Table structure for table `3_method`
--

DROP TABLE IF EXISTS `3_method`;
CREATE TABLE IF NOT EXISTS `3_method` (
  `id` int NOT NULL AUTO_INCREMENT,
  `number` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `me` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `3_replicate`
--

DROP TABLE IF EXISTS `3_replicate`;
CREATE TABLE IF NOT EXISTS `3_replicate` (
  `id` int NOT NULL AUTO_INCREMENT,
  `number` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rep` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `3_sas`
--

DROP TABLE IF EXISTS `3_sas`;
CREATE TABLE IF NOT EXISTS `3_sas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `number` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sas` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `3_so1`
--

DROP TABLE IF EXISTS `3_so1`;
CREATE TABLE IF NOT EXISTS `3_so1` (
  `id_` int NOT NULL AUTO_INCREMENT COMMENT 'Hold data which is auto increment',
  `sssoid` int NOT NULL,
  `sen` int NOT NULL,
  `ssen` int NOT NULL,
  `sfr` int NOT NULL,
  `fr` int NOT NULL,
  `rc` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sbf` int DEFAULT NULL,
  `sslc` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sst` int DEFAULT NULL,
  `ssid` int NOT NULL,
  `stx` int DEFAULT NULL,
  `species` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'NRQ',
  `kdr` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'NRQ',
  `pf` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'NRQ',
  `pv` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'NRQ',
  `po` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'NRQ',
  `pm` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'NRQ',
  `human` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'NRQ',
  `chicken` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'NRQ',
  `goat` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'NRQ',
  `bovine` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'NRQ',
  `dog` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'NRQ',
  `cat` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'NRQ',
  `rat` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'NRQ',
  `bps` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'NRQ',
  `userid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Submitted by userid',
  `submitted` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Channel used to submit',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`sssoid`,`ssen`,`sfr`,`ssid`,`userid`),
  UNIQUE KEY `id_` (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `3_so2`
--

DROP TABLE IF EXISTS `3_so2`;
CREATE TABLE IF NOT EXISTS `3_so2` (
  `id_` int NOT NULL AUTO_INCREMENT COMMENT 'Hold data which is auto increment',
  `sssoid` int NOT NULL,
  `sen` int NOT NULL,
  `ssen` int NOT NULL,
  `sfr` int NOT NULL,
  `fr` int NOT NULL,
  `sbf` int DEFAULT NULL,
  `sslc` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sst` int DEFAULT NULL,
  `ssid` int NOT NULL,
  `stx` int DEFAULT NULL,
  `ssas` int DEFAULT NULL,
  `ms` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'NRQ',
  `pr` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'NRQ',
  `inf` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'NRQ',
  `os` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'NRQ',
  `wl` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'NRQ',
  `bps` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'NRQ',
  `userid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Submitted by userid',
  `submitted` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Channel used to submit',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`sssoid`,`ssen`,`sfr`,`ssid`,`userid`),
  UNIQUE KEY `id_` (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `3_sost`
--

DROP TABLE IF EXISTS `3_sost`;
CREATE TABLE IF NOT EXISTS `3_sost` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Hold data which is auto increment to links to SO',
  `so1id` int DEFAULT NULL COMMENT 'Hold data link to SS1',
  `so2id` int DEFAULT NULL COMMENT 'Hold data link to SS2',
  `so3id` int DEFAULT NULL COMMENT 'Hold data link to SS3',
  PRIMARY KEY (`id`),
  KEY `fk_ss1id` (`so1id`),
  KEY `fk_ss2id` (`so2id`),
  KEY `fk_ss3id` (`so3id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `3_ss1`
--

DROP TABLE IF EXISTS `3_ss1`;
CREATE TABLE IF NOT EXISTS `3_ss1` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Hold data which is auto increment to links to SO',
  `edssid` int NOT NULL COMMENT 'unique identifier for SS1 form',
  `sen` int NOT NULL COMMENT 'unique identifier for SS1 form',
  `ssen` int NOT NULL COMMENT 'unique identifier for SS1 form',
  `sfr` int NOT NULL COMMENT 'unique identifier for SS1 form',
  `bf` int DEFAULT '1' COMMENT 'body part (The body type of the sample)',
  `fr` int NOT NULL COMMENT 'unique identifier of each row on the data collected',
  `tx` int NOT NULL COMMENT 'taxon identification number',
  `sas` int NOT NULL COMMENT 'sex and abdominal status',
  `n` int NOT NULL COMMENT 'number of observed (Records the total number of mosquitoes observed in each specific subgroup)',
  `notes` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'NA',
  `slc` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'NA',
  `st` int DEFAULT '0' COMMENT 'sample type (Designates the category of sample as either individual or batch)',
  `ni` int DEFAULT '0' COMMENT 'no of individual ',
  `nb` int DEFAULT '0' COMMENT 'no of batched ',
  `sid01` int DEFAULT '0' COMMENT 'sample type sample identification 1',
  `sid02` int DEFAULT '0' COMMENT 'sample type sample identification 2',
  `sid03` int DEFAULT '0' COMMENT 'sample type sample identification 3',
  `sid04` int DEFAULT '0' COMMENT 'sample type sample identification 4',
  `sid05` int DEFAULT '0' COMMENT 'sample type sample identification 5',
  `sid06` int DEFAULT '0' COMMENT 'sample type sample identification 6',
  `sid07` int DEFAULT '0' COMMENT 'sample type sample identification 7',
  `nd` int DEFAULT NULL COMMENT 'number of discarded (This is the number of mosquitoes discarded)',
  `senfr` int NOT NULL,
  `userid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Submitted by userid',
  `submitted` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Channel used to submit',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`edssid`,`userid`,`sen`,`tx`,`sas`),
  UNIQUE KEY `id` (`id`),
  KEY `tx` (`tx`),
  KEY `bf` (`bf`),
  KEY `sas` (`sas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `3_ss1template`
--

DROP TABLE IF EXISTS `3_ss1template`;
CREATE TABLE IF NOT EXISTS `3_ss1template` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sen` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ssen` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sfr` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bf` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fr` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sas` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `n` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slc` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `st` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ni` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nb` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sid01` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sid02` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sid03` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sid04` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sid05` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sid06` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sid07` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nd` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `3_ss2`
--

DROP TABLE IF EXISTS `3_ss2`;
CREATE TABLE IF NOT EXISTS `3_ss2` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Hold data which is auto increment to links to SO',
  `edssid` int NOT NULL COMMENT 'Store value from table EDSS id',
  `sen` int NOT NULL COMMENT 'unique identifier for SS2 form',
  `ssen` int NOT NULL COMMENT 'unique identifier for SS2 form',
  `sfr` int NOT NULL COMMENT 'unique identifier for SS2form',
  `hf` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Hold status of Habitat types ( names)',
  `hbt` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Hold status of Habitat types ( names)',
  `htr` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Hold status of Habitat Type treated (1: Yes, 2: No)',
  `hw` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Hold status of Habitat wet (1: Yes, 2: No)',
  `hs` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Hold status Habitat Parameter (1: <10m, 2: 10-100m, 3: >100m)',
  `dnh` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Hold status of distance next house (measured in steps)',
  `fr` int NOT NULL COMMENT 'unique identifier of each row on the data collected',
  `dip` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'number of dipping effort (dio)',
  `tx` int NOT NULL DEFAULT '-99' COMMENT 'taxon identification number',
  `bfEgg` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'larvae stage  (measured in steps)',
  `bfL1` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'larvae stage 1 (L1)',
  `bfL2` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'larvae stage 2 (L2)',
  `bfL3` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'larvae stage 3 (L3)',
  `bfL4` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'larvae stage 4 (L4)',
  `L1L2` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'larvae stage L1L2 (L1L2)',
  `L3L4` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'larvae stage L3L4 (L3L4)',
  `tlv` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'larvae stage total larvae (tlv)',
  `pu` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Hold status of pupae (1: Total)',
  `vl` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Hold status of vegitation length(1: Absent, 2: Short grasses, 3: Tall grasses)',
  `rl` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Hold status of rice length (1: Absent, 2: Short grasses, 3: Tall grasses)',
  `vt` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Hold status of treated (1: Yes, 2: No)',
  `notes` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'No data (-99)' COMMENT 'On site observations about collection ',
  `slc` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Unique label code for each composition of taxon plus sex and abdominal status (Sample Lable Code SLC)',
  `ni` int DEFAULT '0' COMMENT 'no of individual ',
  `nb` int DEFAULT '0' COMMENT 'no of batched ',
  `sid01` int DEFAULT '0' COMMENT 'sample type sample identification 1',
  `sid02` int DEFAULT '0' COMMENT 'sample type sample identification 2',
  `sid03` int DEFAULT '0' COMMENT 'sample type sample identification 3',
  `sid04` int DEFAULT '0' COMMENT 'sample type sample identification 4',
  `sid05` int DEFAULT '0' COMMENT 'sample type sample identification 5',
  `sid06` int DEFAULT '0' COMMENT 'sample type sample identification 6',
  `sid07` int DEFAULT '0' COMMENT 'sample type sample identification 7',
  `nod` int DEFAULT NULL COMMENT 'number of discarded (This is the number of mosquitoes discarded)',
  `senfr` int NOT NULL,
  `userid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Submitted by userid',
  `submitted` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Channel used to submit',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`edssid`,`userid`,`sen`,`fr`),
  UNIQUE KEY `id` (`id`),
  KEY `fk_ss2_tx` (`tx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `3_ss2template`
--

DROP TABLE IF EXISTS `3_ss2template`;
CREATE TABLE IF NOT EXISTS `3_ss2template` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sen` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ssen` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sfr` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hf` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `htc` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `htr` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hw` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hs` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fr` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bf` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pu` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vl` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vt` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ndi01` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ndi02` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ndi03` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ndi04` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ndi05` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ndi06` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ndi07` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ndi08` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ndi09` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ndi10` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `n` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slc` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ni` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nb` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sid01` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sid02` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sid03` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sid04` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sid05` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sid06` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sid07` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nd` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `3_ss3`
--

DROP TABLE IF EXISTS `3_ss3`;
CREATE TABLE IF NOT EXISTS `3_ss3` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Hold data which is auto increment to links to SO',
  `edssid` int DEFAULT NULL COMMENT 'Store value from table EDSS id',
  `sen` int NOT NULL COMMENT 'unique identifier for ss3 form',
  `ssen` int NOT NULL COMMENT 'unique identifier for ss3 form',
  `sfr` int NOT NULL COMMENT 'unique identifier for ss3 form',
  `fr` int NOT NULL COMMENT 'unique identifier of each row on the data collected',
  `dot` date NOT NULL COMMENT 'date of test',
  `ga` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'gps accuracy',
  `gds` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'gps data source',
  `sgds` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'specify gps data source',
  `ndis` int NOT NULL COMMENT 'nets distributed over the past 3years',
  `mo` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'mosquito origin',
  `mst` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'mosquito species tested',
  `ma` int NOT NULL COMMENT 'mosquito age',
  `tb` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'type of bottle bioassay',
  `bia` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'is it bioassay for intensity assay',
  `it` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'type of insecticide tested',
  `SynT` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'what synergist was tested',
  `ic` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'insecticide concentration',
  `sc` int NOT NULL COMMENT 'synergist concentration',
  `SRTemp` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Storage room temperature',
  `ETMax` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Maximum Exposure Temperature',
  `ETMin` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Minimum Exposure Temperature',
  `HTMax` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Maximum Holding Temperature',
  `HTMin` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Minimum Holding Temperature',
  `EHMax` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Maximum Humidity Exposure',
  `EHMin` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Minimum Humidity Exposure',
  `HHMax` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Maximum Holding Humidity ',
  `HHMin` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Minimum Holding Humidity',
  `mti1` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Bottle1 Insecticide',
  `mti2` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Bottle2 Insecticide',
  `mti3` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Bottle3 Insecticide',
  `mti4` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Bottle4 Insecticide',
  `mti5` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Bottle5 Insecticide',
  `mti6` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Bottle6 Insecticide',
  `mts` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Solvent Control',
  `mtisy1` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Bottle1 Insecticide & Synergist',
  `mtisy2` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Bottle2 Insecticide & Synergist',
  `mtisy3` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Bottle3 Insecticide & Synergist',
  `mtisy4` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Bottle1 Insecticide & Synergist',
  `mtisy5` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Bottle1 Insecticide & Synergist',
  `mtisy6` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Bottle1 Insecticide & Synergist',
  `mtsy` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Synergist Control',
  `BTCI1` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Bottle Code Bottle1 Insecticide',
  `BTCI2` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Bottle Code Bottle1 Insecticide',
  `BTCI3` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Bottle Code Bottle1 Insecticide',
  `BTCI4` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Bottle Code Bottle1 Insecticide',
  `BTCI5` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Bottle Code Bottle1 Insecticide',
  `BTCI6` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Bottle Code Bottle1 Insecticide',
  `BC_S` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Bottle code Solvent Control',
  `BTCSy_I1` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Bottle Code Bottle1 Synergist & Insecticide',
  `BTCSy_I2` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Bottle Code Bottle1 Synergist & Insecticide',
  `BTCSy_I3` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Bottle Code Bottle1 Synergist & Insecticide',
  `BTCSy_I4` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Bottle Code Bottle1 Synergist & Insecticide',
  `BC_Sy` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Bottle Code Synergist Control',
  `DBC_I1` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Date Bottle was Coated Bottle1 Insecticide',
  `DBC_I2` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Date Bottle was Coated Bottle1 Insecticide',
  `DBC_I3` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Date Bottle was Coated Bottle1 Insecticide',
  `DBC_I4` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Date Bottle was Coated Bottle1 Insecticide',
  `DBC_I5` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Date Bottle was Coated Bottle1 Insecticide',
  `DBC_I6` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Date Bottle was Coated Bottle1 Insecticide',
  `DBC_S` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Date Bottle was Coated Solvent Control',
  `DBC_SyI1` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Date Bottle was Coated Bottle1 Synergist & Insecticide',
  `DBC_SyI2` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Date Bottle was Coated Bottle1 Synergist & Insecticide',
  `DBC_SyI3` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Date Bottle was Coated Bottle1 Synergist & Insecticide',
  `DBC_SyI4` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Date Bottle was Coated Bottle1 Synergist & Insecticide',
  `DBC_Sy` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Date Bottle was Coated Synergist Control',
  `TBC_I1` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Times Bottle coated used Bottle1 Insecticide',
  `TBC_I2` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Times Bottle coated used Bottle1 Insecticide',
  `TBC_I3` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Times Bottle coated used Bottle1 Insecticide',
  `TBC_I4` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Times Bottle coated used Bottle1 Insecticide',
  `TBC_I5` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Times Bottle coated used Bottle1 Insecticide',
  `TBC_I6` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Times Bottle coated used Bottle1 Insecticide',
  `TBC_S` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Times Bottle coated used Solvent Control',
  `TBC_SyI1` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Times Bottle coated used Bottle1 Synergist & Insecticide',
  `TBC_SyI2` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Times Bottle coated used Bottle1 Synergist & Insecticide',
  `TBC_SyI3` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Times Bottle coated used Bottle1 Synergist & Insecticide',
  `TBC_SyI4` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Times Bottle coated used Bottle1 Synergist & Insecticide',
  `TBC_Sy` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Times Bottle coated used Synergist Control',
  `KD_D0` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Knock Down/ Dead Time 0min',
  `KD_D15` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Knock Down/ Dead Time 15min',
  `KD_D30` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Knock Down/ Dead Time 30min',
  `KD_D45` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Knock Down/ Dead Time 45min',
  `KD_D60` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Knock Down/ Dead Time 60min',
  `KD_D75` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Knock Down/ Dead Time 75min',
  `KD_D90` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Knock Down/ Dead Time 90min',
  `KD_D105` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Knock Down/ Dead Time 105min',
  `KD_D120` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Knock Down/ Dead Time 120min',
  `KD_D24` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Knock Down/ Dead Time 24hr',
  `KD_D72` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Knock Down/ Dead Time 72hr',
  `KD_D1D` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Knock Down/ Dead Time Day1',
  `KD_D2D` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Knock Down/ Dead Time Day2',
  `KD_D3D` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Knock Down/ Dead Time Day3',
  `KD_D4D` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Knock Down/ Dead Time Day4',
  `KD_D5D` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Knock Down/ Dead Time Day5',
  `KD_D6D` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Knock Down/ Dead Time Day6',
  `KD_D7D` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Knock Down/ Dead Time Day7',
  `rt` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Room Type',
  `spd` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Date of Spray',
  `liu` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Last Insecticide Used',
  `elcm` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Exposed Location of Control Mosquitoes',
  `mt1` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Cone Height 0.5m',
  `mt2` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Cone Height 1.0m',
  `mt3` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Cone Height 2.0m',
  `mt4` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Cone Height Other',
  `mkd1` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mosquitoes K/D 30min Cone Height 0.5m',
  `mkd2` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mosquitoes K/D 60min Cone Height 0.5m',
  `mkd3` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mosquitoes K/D Day1 Cone Height 0.5m',
  `mkd4` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mosquitoes K/D Day2 Cone Height 0.5m',
  `mkd5` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mosquitoes K/D Day3 Cone Height 0.5m',
  `mkd6` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mosquitoes K/D 30min Cone Height 1.0m',
  `mkd7` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mosquitoes K/D 60min Cone Height 1.0m',
  `mkd8` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mosquitoes K/D Day1 Cone Height 1.0m',
  `mkd9` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mosquitoes K/D Day2 Cone Height 1.0m',
  `mkd10` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mosquitoes K/D Day3 Cone Height 1.0m',
  `mkd11` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mosquitoes K/D 30min Cone Height 1.5m',
  `mkd12` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mosquitoes K/D 30min Cone Height 1.5m',
  `mkd13` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mosquitoes K/D 30min Cone Height 1.5m',
  `mkd14` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mosquitoes K/D Day2 Cone Height 1.5m',
  `mkd15` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mosquitoes K/D Day3 Cone Height 1.5m',
  `mkd16` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mosquitoes K/D 30min Cone Height 2.0m',
  `mkd17` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mosquitoes K/D 60min Cone Height 2.0m',
  `mkd18` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mosquitoes K/D Day1 Cone Height 2.0m',
  `mkd19` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mosquitoes K/D Day2 Cone Height 2.0m',
  `mkd20` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mosquitoes K/D Day3 Cone Height 2.0m',
  `O1` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mosquitoes K/D in net other1 mins',
  `O2` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mosquitoes K/D in net other2 mins',
  `O3` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mosquitoes K/D in net other3 mins',
  `mtir1` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Rep1 Insecticide',
  `mtir2` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Rep2 Insecticide',
  `mtir3` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Rep3 Insecticide',
  `mtir4` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Rep4 Insecticide',
  `mtir5` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Rep5 Insecticide',
  `mtir6` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Rep6 Insecticide',
  `mtsr1` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Rep1 Solvent Control',
  `mtsr2` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Rep2 Solvent Control',
  `mtsr3` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Rep3 Solvent Control',
  `mtsr4` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Rep4 Solvent Control',
  `mtisyr1` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Rep1 Insecticide & Synergist',
  `mtisyr2` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Rep2 Insecticide & Synergist',
  `mtisyr3` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Rep3 Insecticide & Synergist',
  `mtisyr4` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Rep4 Insecticide & Synergist',
  `mtsyr1` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Rep1 Synergist Control',
  `mtsyr2` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Rep2 Synergist Control',
  `mtsyr3` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Rep3 Synergist Control',
  `mtsyr4` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'No of Mosquitoes Tested Rep4 Synergist Control',
  `tcir1` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Tube Code Rep1 Insecticide',
  `tcir2` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Tube Code Rep2 Insecticide',
  `tcir3` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Tube Code Rep3 Insecticide',
  `tcir4` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Tube Code Rep4 Insecticide',
  `tcir5` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Tube Code Rep5 Insecticide',
  `tcir6` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Tube Code Rep6 Insecticide',
  `tc_sr1` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Tube Code Rep1 Solvent Control',
  `tc_sr2` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Tube Code Rep2 Solvent Control',
  `tc_sr3` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Tube Code Rep3 Solvent Control',
  `tc_sr4` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Tube Code Rep4 Solvent Control',
  `tc_syir1` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Tube Code Rep1 Insecticide & Synergist',
  `tc_syir2` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Tube Code Rep2 Insecticide & Synergist',
  `tc_syir3` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Tube Code Rep3 Insecticide & Synergist',
  `tc_syir4` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Tube Code Rep4 Insecticide & Synergist',
  `tc_sy1r` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Tube Code Rep1 Synergist Control',
  `tc_sy2r` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Tube Code Rep2 Synergist Control',
  `tc_sy3r` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Tube Code Rep3 Synergist Control',
  `tc_sy4r` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Tube Code Rep4 Synergist Control',
  `id_ir1` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Impregnation Date Tube1 Insecticide',
  `id_ir2` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Impregnation Date Tube2 Insecticide',
  `id_ir3` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Impregnation Date Tube3 Insecticide',
  `id_ir4` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Impregnation Date Tube4 Insecticide',
  `id_ir5` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Impregnation Date Tube5 Insecticide',
  `id_ir6` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Impregnation Date Tube6 Insecticide',
  `id_sr1` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Impregnation Date Tube1 Solvent Control',
  `id_sr2` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Impregnation Date Tube2 Solvent Control',
  `id_sr3` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Impregnation Date Tube3 Solvent Control',
  `id_sr4` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Impregnation Date Tube4 Solvent Control',
  `id_syr1` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Impregnation Date Tube1 Synergist Control',
  `id_syr2` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Impregnation Date Tube2 Synergist Control',
  `id_syr3` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Impregnation Date Tube3 Synergist Control',
  `id_syr4` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Impregnation Date Tube4 Synergist Control',
  `edi1` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Expiry Date - Rep1 Insecticide(EDI1)',
  `edi2` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Expiry Date - Rep2 Insecticide(EDI2)',
  `edi3` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Expiry Date - Rep3 Insecticide(EDI3)',
  `edi4` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Expiry Date - Rep4 Insecticide(EDI4)',
  `edi5` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Expiry Date - Rep5 Insecticide(EDI5)',
  `edi6` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Expiry Date - Rep6 Insecticide(EDI6)',
  `eds1` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Expiry Date - Rep1 Solvent Control',
  `eds2` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Expiry Date - Rep2 Solvent Control',
  `eds3` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Expiry Date - Rep3 Solvent Control',
  `eds4` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Expiry Date - Rep4 Solvent Control',
  `edisy1` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Expiry Date - Rep1 Insecticide & Synergist',
  `edisy2` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Expiry Date - Rep2 Insecticide & Synergist',
  `edisy3` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Expiry Date - Rep3 Insecticide & Synergist',
  `edisy4` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Expiry Date - Rep4 Insecticide & Synergist',
  `edsy1` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Expiry Date - Rep1 Synergist Control',
  `edsy2` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Expiry Date - Rep2 Synergist Control',
  `edsy3` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Expiry Date - Rep3 Synergist Control',
  `edsy4` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Expiry Date - Rep4 Synergist Control',
  `senfr` int NOT NULL,
  `userid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Submitted by userid',
  `submitted` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Channel used to submit',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`userid`,`sen`,`fr`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `3_ss3template`
--

DROP TABLE IF EXISTS `3_ss3template`;
CREATE TABLE IF NOT EXISTS `3_ss3template` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sen` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ssen` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sfr` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sd` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fd` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fr` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dd` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sas` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mt` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ch` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `la` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ft` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bf` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hp` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `oth5` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `oth6` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `oth7` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `oth8` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `n` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slc` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `st` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ni` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nb` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sid01` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sid02` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sid03` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sid04` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sid05` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sid06` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sid07` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nd` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `3_ss4`
--

DROP TABLE IF EXISTS `3_ss4`;
CREATE TABLE IF NOT EXISTS `3_ss4` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Hold data which is auto increment to links to SO',
  `edssid` int NOT NULL COMMENT 'unique identifier for SS4 form',
  `sen` int NOT NULL COMMENT 'unique identifier for SS4 form',
  `ssen` int NOT NULL COMMENT 'unique identifier for SS4 form',
  `sfr` int NOT NULL COMMENT 'unique identifier for SS4 form',
  `fr` int NOT NULL COMMENT 'unique identifier of each row on the data collected',
  `su` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT 'substracte (type of soil for snail to lay eggs)',
  `sa` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'salinity',
  `dso` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Dissolved oxygen ',
  `dr` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '-99' COMMENT 'Number of dredges',
  `ph` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'potential of hydrogen',
  `co` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT ' Conductivity ms',
  `wda` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT 'wild domestic animal  (define jind of animals)',
  `act` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT 'activity (define either human activities )',
  `hc` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT 'activity (Health centres )',
  `wn` int UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Hold status of water body name (1: Yes, 2: No)',
  `wl` int UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Hold status of water level (1: Yes, 2: No)',
  `de` int UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Hold status of depth (1: Yes, 2: No)',
  `ret` int UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Hold status of flow rate (1: Yes, 2: No)',
  `wt` int UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Hold status of water body type (1: Yes, 2: No)',
  `lwt` int UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Hold status of longevity of water body type (1: Yes, 2: No)',
  `sp` int UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Hold status of snail present(1: Yes, 2: No)',
  `spc` int UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Hold status of snail species collected (1: Yes, 2: No)',
  `n` int NOT NULL COMMENT 'number of observed (Records the total number of mosquitoes observed in each specific subgroup)',
  `sps` int UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Hold status of snail species shedded (1: Yes, 2: No)',
  `tc` int UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Hold status of type of cercaria (1: Yes, 2: No)',
  `nc` int UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Bumber of cercaria shadded (1: Yes, 2: No)',
  `nd` int DEFAULT NULL COMMENT 'number of discarded (This is the number of mosquitoes discarded)',
  `senfr` int NOT NULL,
  `userid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Submitted by userid',
  `submitted` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Channel used to submit',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`edssid`,`userid`,`sen`,`fr`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `3_ss4`
--

INSERT INTO `3_ss4` (`id`, `edssid`, `sen`, `ssen`, `sfr`, `fr`, `su`, `sa`, `dso`, `dr`, `ph`, `co`, `wda`, `act`, `hc`, `wn`, `wl`, `de`, `ret`, `wt`, `lwt`, `sp`, `spc`, `n`, `sps`, `tc`, `nc`, `nd`, `senfr`, `userid`, `submitted`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 1, 1, 2, '0', NULL, NULL, '-99', NULL, NULL, '0', '0', '20', 2, 1, 3, 2, 2, 3, 1, 2, 12, 1, 1, 1, NULL, 220, '1001', 'submitted_via_web', '2021-09-15 15:55:08', '2021-09-15 15:55:08'),
(2, 2, 3, 1, 2, 3, '0', NULL, NULL, '-99', NULL, NULL, '0', '0', '21', 2, 1, 3, 2, 2, 3, 1, 1, 19, 1, 1, 1, NULL, 321, '1001', 'submitted_via_web', '2021-09-15 15:55:08', '2021-09-15 15:55:08'),
(3, 3, 4, 1, 3, 4, '0', NULL, NULL, '-99', NULL, NULL, '0', '0', '22', 2, 1, 3, 2, 2, 3, 1, 2, 3, 1, 1, 1, NULL, 422, '1001', 'submitted_via_web', '2021-09-15 15:55:08', '2021-09-15 15:55:08'),
(4, 4, 5, 1, 4, 5, '0', NULL, NULL, '-99', NULL, NULL, '0', '0', '23', 2, 1, 3, 2, 2, 3, 1, 1, 6, 1, 1, 1, NULL, 523, '1001', 'submitted_via_web', '2021-09-15 15:55:08', '2021-09-15 15:55:08'),
(5, 5, 6, 1, 5, 6, '0', NULL, NULL, '-99', NULL, NULL, '0', '0', '24', 2, 1, 3, 2, 2, 3, 1, 2, 29, 1, 1, 1, NULL, 624, '1001', 'submitted_via_web', '2021-09-15 15:55:08', '2021-09-15 15:55:08'),
(6, 6, 7, 1, 6, 7, '0', NULL, NULL, '-99', NULL, NULL, '0', '0', '25', 2, 1, 3, 2, 2, 3, 1, 1, 5, 1, 1, 1, NULL, 725, '1001', 'submitted_via_web', '2021-09-15 15:55:08', '2021-09-15 15:55:08'),
(7, 7, 8, 1, 7, 8, '0', NULL, NULL, '-99', NULL, NULL, '0', '0', '26', 2, 1, 3, 2, 2, 3, 1, 2, 10, 1, 1, 1, NULL, 826, '1001', 'submitted_via_web', '2021-09-15 15:55:08', '2021-09-15 15:55:08'),
(8, 8, 9, 1, 8, 9, '0', NULL, NULL, '-99', NULL, NULL, '0', '0', '27', 2, 1, 3, 2, 2, 3, 1, 2, 15, 1, 1, 1, NULL, 927, '1001', 'submitted_via_web', '2021-09-15 15:55:08', '2021-09-15 15:55:08'),
(9, 9, 10, 1, 9, 10, '0', NULL, NULL, '-99', NULL, NULL, '0', '0', '28', 2, 1, 3, 2, 2, 3, 1, 1, 20, 1, 1, 1, NULL, 1028, '1001', 'submitted_via_web', '2021-09-15 15:55:08', '2021-09-15 15:55:08'),
(10, 10, 11, 1, 10, 11, '0', NULL, NULL, '-99', NULL, NULL, '0', '0', '29', 2, 1, 3, 2, 2, 3, 1, 2, 25, 1, 1, 1, NULL, 1129, '1001', 'submitted_via_web', '2021-09-15 15:55:08', '2021-09-15 15:55:08'),
(11, 11, 12, 1, 11, 12, '0', NULL, NULL, '-99', NULL, NULL, '0', '0', '30', 2, 1, 3, 2, 2, 3, 1, 1, 9, 1, 1, 1, NULL, 1230, '1001', 'submitted_via_web', '2021-09-15 15:55:08', '2021-09-15 15:55:08'),
(12, 12, 13, 1, 12, 13, '0', NULL, NULL, '-99', NULL, NULL, '0', '0', '31', 2, 1, 3, 2, 2, 3, 1, 2, 18, 1, 1, 1, NULL, 1331, '1001', 'submitted_via_web', '2021-09-15 15:55:08', '2021-09-15 15:55:08'),
(13, 13, 14, 1, 13, 14, '0', NULL, NULL, '-99', NULL, NULL, '0', '0', '32', 2, 1, 3, 2, 2, 3, 1, 1, 27, 1, 1, 1, NULL, 1432, '1001', 'submitted_via_web', '2021-09-15 15:55:08', '2021-09-15 15:55:08'),
(14, 14, 15, 1, 14, 15, '0', NULL, NULL, '-99', NULL, NULL, '0', '0', '33', 2, 1, 3, 2, 2, 3, 1, 2, 36, 1, 1, 1, NULL, 1533, '1001', 'submitted_via_web', '2021-09-15 15:55:08', '2021-09-15 15:55:08'),
(15, 15, 16, 1, 15, 16, '0', NULL, NULL, '-99', NULL, NULL, '0', '0', '34', 2, 1, 3, 2, 2, 3, 1, 1, 7, 1, 1, 1, NULL, 1634, '1001', 'submitted_via_web', '2021-09-15 15:55:08', '2021-09-15 15:55:08'),
(16, 16, 17, 1, 16, 17, '0', NULL, NULL, '-99', NULL, NULL, '0', '0', '35', 2, 1, 3, 2, 2, 3, 1, 1, 14, 1, 1, 1, NULL, 1735, '1001', 'submitted_via_web', '2021-09-15 15:55:08', '2021-09-15 15:55:08'),
(17, 17, 18, 1, 17, 18, '0', NULL, NULL, '-99', NULL, NULL, '0', '0', '36', 2, 1, 3, 2, 2, 3, 1, 2, 21, 1, 1, 1, NULL, 1836, '1001', 'submitted_via_web', '2021-09-15 15:55:08', '2021-09-15 15:55:08'),
(18, 18, 19, 1, 18, 19, '0', NULL, NULL, '-99', NULL, NULL, '0', '0', '37', 2, 1, 3, 2, 2, 3, 1, 1, 28, 1, 1, 1, NULL, 1937, '1001', 'submitted_via_web', '2021-09-15 15:55:08', '2021-09-15 15:55:08'),
(19, 19, 20, 1, 19, 20, '0', NULL, NULL, '-99', NULL, NULL, '0', '0', '38', 2, 1, 3, 2, 2, 3, 1, 2, 35, 1, 1, 1, NULL, 2038, '1001', 'submitted_via_web', '2021-09-15 15:55:08', '2021-09-15 15:55:08');

-- --------------------------------------------------------

--
-- Table structure for table `3_ssso`
--

DROP TABLE IF EXISTS `3_ssso`;
CREATE TABLE IF NOT EXISTS `3_ssso` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Hold data which is auto increment to links to SO',
  `ss1id` int DEFAULT NULL COMMENT 'Hold data link to SS1',
  `ss2id` int DEFAULT NULL COMMENT 'Hold data link to SS2',
  `ss3id` int DEFAULT NULL COMMENT 'Hold data link to SS3',
  `ss4id` int DEFAULT NULL COMMENT 'Hold data link to SS4',
  PRIMARY KEY (`id`),
  KEY `fk_ss1id` (`ss1id`),
  KEY `fk_ss2id` (`ss2id`),
  KEY `fk_ss3id` (`ss3id`),
  KEY `fk_ss4id` (`ss4id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `3_ssso`
--

INSERT INTO `3_ssso` (`id`, `ss1id`, `ss2id`, `ss3id`, `ss4id`) VALUES
(1, NULL, NULL, NULL, 1),
(2, NULL, NULL, NULL, 2),
(3, NULL, NULL, NULL, 3),
(4, NULL, NULL, NULL, 4),
(5, NULL, NULL, NULL, 5),
(6, NULL, NULL, NULL, 6),
(7, NULL, NULL, NULL, 7),
(8, NULL, NULL, NULL, 8),
(9, NULL, NULL, NULL, 9),
(10, NULL, NULL, NULL, 10),
(11, NULL, NULL, NULL, 11),
(12, NULL, NULL, NULL, 12),
(13, NULL, NULL, NULL, 13),
(14, NULL, NULL, NULL, 14),
(15, NULL, NULL, NULL, 15),
(16, NULL, NULL, NULL, 16),
(17, NULL, NULL, NULL, 17),
(18, NULL, NULL, NULL, 18),
(19, NULL, NULL, NULL, 19);

-- --------------------------------------------------------

--
-- Table structure for table `3_st1`
--

DROP TABLE IF EXISTS `3_st1`;
CREATE TABLE IF NOT EXISTS `3_st1` (
  `id_` int NOT NULL AUTO_INCREMENT,
  `projectregsite_id` int NOT NULL,
  `sen` int NOT NULL,
  `ssen` int NOT NULL,
  `sfr` int NOT NULL,
  `fr` int NOT NULL,
  `rc` int NOT NULL,
  `sbf` int DEFAULT NULL,
  `sslc` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sst` int DEFAULT NULL,
  `ssid` int NOT NULL,
  `stx` int DEFAULT NULL,
  `userid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Submitted by userid',
  `submitted` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Channel used to submit',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`sen`,`fr`,`rc`,`ssid`,`userid`),
  UNIQUE KEY `id_` (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `3_st2`
--

DROP TABLE IF EXISTS `3_st2`;
CREATE TABLE IF NOT EXISTS `3_st2` (
  `id_` int NOT NULL AUTO_INCREMENT,
  `projectregsite_id` int NOT NULL,
  `sen` int NOT NULL,
  `fr` int NOT NULL,
  `ssen` int NOT NULL,
  `ns` int NOT NULL,
  `fst` int DEFAULT NULL,
  `ff` int NOT NULL,
  `rcn` int NOT NULL,
  `userid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Submitted by userid',
  `submitted` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Channel used to submit',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`userid`,`sen`,`fr`),
  UNIQUE KEY `id_` (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `3_taxon`
--

DROP TABLE IF EXISTS `3_taxon`;
CREATE TABLE IF NOT EXISTS `3_taxon` (
  `id` int NOT NULL AUTO_INCREMENT,
  `number` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `3_treatment`
--

DROP TABLE IF EXISTS `3_treatment`;
CREATE TABLE IF NOT EXISTS `3_treatment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `number` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tr` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `3_treatment_two`
--

DROP TABLE IF EXISTS `3_treatment_two`;
CREATE TABLE IF NOT EXISTS `3_treatment_two` (
  `id` int NOT NULL AUTO_INCREMENT,
  `number` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tr` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

--
-- Dumping data for table `custed`
--

INSERT INTO `custed` (`pc`, `ft`, `num_split`, `p_attri`, `p_attri2`) VALUES
(1, 'ED1', 12, 'sen,fr,dt,ea,me,ind,st,ft,vi,vc,notes,dsen', 'Serial No. (SEN),Formrow (FR),Date of collection (DT),Enumeration area (EA),Method (ME),Indoor/Outdoor (IND),Start time (ST),Finish time (FT),Volunteer initials (VI),Valid catch (VC),Notes (Notes),Destination Form Serial (DSEN)'),
(1, 'ED2', 6, 'sen,fr,n,sd,st,dsen', 'Serial No. (SEN),Formrow (FR),Number of Mosquitoes (N),Start Date (SD),Start Time (ST),Destination Form Serial (DSEN)'),
(2, 'ED1', 9, 'sen,fr,dt,me,ind,st,ft,vc,dsen', 'Serial No. (SEN),Formrow (FR),Date of collection (DT),Method (ME),Indoor/Outdoor (IND),Start time (ST),Finish time (FT),Valid catch (VC),Destination Form Serial (DSEN)'),
(3, 'ED1', 9, 'sen,fr,dt,me,ind,st,ft,vc,dsen', 'Serial No. (SEN),Formrow (FR),Date of collection (DT),Method (ME),Indoor/Outdoor (IND),Start time (ST),Finish time (FT),Valid catch (VC),Destination Form Serial (DSEN)');

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

--
-- Dumping data for table `custss`
--

INSERT INTO `custss` (`pc`, `ft`, `num_split`, `p_attri`, `p_attri2`) VALUES
(1, 'SS1', 11, 'sen,ssen,sfr,bf,fr,tx,sas,n,st,ni,nd', 'Serial No. (SEN),ED Form Serial Number (SSEN),ED Form row (SFR),Body Form (BF),Form row (FR),Taxon (TX),Sex and Abdominal Status (SAS),Number Caught (N),Sample Type (ST),No. of Individuals (NI),No. Discarded (ND)'),
(2, 'SS2', 36, 'sen,ssen,sfr,fr,hf,hbt,htr,hw,hs,dnh,vl,rl,vt,dip,tx,bfegg,bfl1,bfl2,bfl3,bfl4,l1l2,l3l4,tlv,pu,notes,slc,ni,nb,sid01,sid02,sid03,sid04,sid05,sid06,sid07,nod', 'Serial No. (SEN),ED Form Serial Number (SSEN),ED Form row (SFR),Form row (FR),Habitat ID (HF),Habitat type (HBT),Habitat treated (HTR),Habitat Wet (HW),Habitat Size (HS),Distance to next house (DNH),Vegetation (VL),Rice length (RL),Treated(VT),Dipping effort (DIP),Taxon (TX),bfEgg (bfEgg),Larval stage_L1 (bfL1),Larval stage_L2 (bfL2),Larval stage_L3 (bfL3),Larval stage_L4 (bfL4),Larval stage_L1L2 (L1L2),Larval stage_L3L4 (L3L4),Total larvae (TLV),Pupae(PU),Notes (Notes),Sample Label Code (SLC),No. of Individual (NI),No. of Batches (NB),No. In Batch 1 (SID01),No. In Batch 2 (SID02),No. In Batch 3 (SID03),No. In Batch 4 (SID04),No. In Batch 5 (SID05),No. In Batch 6 (SID06),No. In Batch 7 (SID07),No. Discarded (NOD)'),
(3, 'SS4', 17, 'sen,ssen,sfr,fr,hc,wn,wl,de,ret,wt,lwt,sp,spc,n,sps,tc,nc', 'Serial No. (SEN),ED Form Serial Number (SSEN),ED Form row (SFR),Form row (FR),Health Centres (HC),Water Body Name (WN),Water Level (WL),Depth (DE),Flow Rate (RET),Water Body Type (WT),Longevity of Water Body Type (LWT),Snail Present (SP),Snail Species Collected (SPC),Number Collected (N),Snail Species Shedded (SPS),Type of Cercaria (TC),Number Cercaria Shedded (NC)');

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

--
-- Dumping data for table `custst`
--

INSERT INTO `custst` (`pc`, `ft`, `num_split`, `p_attri`, `p_attri2`) VALUES
(1, 'ST2', 4, 'sen,fr,ssen,fst', 'Serial No. (SEN),Formrow (FR),Box & Form Serial Number (SSEN),Storage Temperature (FST)');

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

--
-- Dumping data for table `grantproject`
--

INSERT INTO `grantproject` (`pid`, `staff_id`, `created_by`, `datecreated`) VALUES
(1, 1001, 1001, '2021-08-15 21:22:40'),
(2, 1001, 1001, '2021-08-19 09:58:40'),
(3, 1001, 1001, '2021-09-08 10:37:14');

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
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `history_log`
--

INSERT INTO `history_log` (`log_id`, `user_id`, `user_name`, `action`, `date`) VALUES
(1, 1001, 'skiware', 'Has signed in', '2021-08-28 18:12:44'),
(2, 1001, 'skiware', 'Has signed in', '2021-08-29 07:12:28'),
(3, 1001, 'skiware', 'Has signed in', '2021-08-29 14:24:53'),
(4, 1001, 'skiware', 'Has signed in', '2021-08-30 14:15:41'),
(5, 1001, 'skiware', 'Has signed in', '2021-08-30 16:53:59'),
(6, 1001, 'skiware', 'Has signed in', '2021-08-30 18:41:24'),
(7, 1001, 'skiware', 'Has signed out', '2021-08-30 19:04:12'),
(8, 1001, 'skiware', 'Has signed in', '2021-08-30 19:04:19'),
(9, 1001, 'skiware', 'Has signed in', '2021-09-04 11:14:41'),
(10, 1001, 'skiware', 'Has signed out', '2021-09-04 11:32:12'),
(11, 1001, 'skiware', 'Has signed in', '2021-09-04 11:34:50'),
(12, 1001, 'skiware', 'Has signed out', '2021-09-04 11:35:21'),
(13, 1001, 'skiware', 'Has signed in', '2021-09-04 12:09:17'),
(14, 1001, 'skiware', 'Has signed out', '2021-09-04 12:14:51'),
(15, 1001, 'skiware', 'Has signed in', '2021-09-04 12:15:07'),
(16, 1001, 'skiware', 'Has signed out', '2021-09-04 12:20:39'),
(17, 1001, 'skiware', 'Has signed in', '2021-09-04 12:20:57'),
(18, 1001, 'skiware', 'Has signed in', '2021-09-04 13:22:15'),
(19, 1001, 'skiware', 'Has signed out', '2021-09-04 13:37:07'),
(20, 1001, 'skiware', 'Has signed in', '2021-09-04 13:37:28'),
(21, 1001, 'skiware', 'Has signed in', '2021-09-04 14:40:24'),
(22, 1001, 'skiware', 'Has signed in', '2021-09-04 14:56:06'),
(23, 1001, 'skiware', 'Has signed in', '2021-09-04 18:34:42'),
(24, 1001, 'skiware', 'Has signed in', '2021-09-04 22:25:36'),
(25, 1001, 'skiware', 'Has signed out', '2021-09-04 22:27:43'),
(26, 1001, 'skiware', 'Has signed in', '2021-09-06 12:54:26'),
(27, 1001, 'skiware', 'Has signed out', '2021-09-06 13:15:08'),
(28, 1001, 'skiware', 'Has signed in', '2021-09-06 13:15:18'),
(29, 1001, 'skiware', 'Has signed out', '2021-09-06 13:17:35'),
(30, 1001, 'skiware', 'Has signed in', '2021-09-06 13:18:28'),
(31, 1001, 'skiware', 'Has signed in', '2021-09-06 18:43:59'),
(32, 1001, 'skiware', 'Has signed out', '2021-09-06 18:57:09'),
(33, 1001, 'skiware', 'Has signed in', '2021-09-06 18:57:15'),
(34, 1001, 'skiware', 'Has signed in', '2021-09-06 21:05:16'),
(35, 1001, 'skiware', 'Has signed out', '2021-09-06 21:47:43'),
(36, 1001, 'skiware', 'Has signed in', '2021-09-06 21:47:53'),
(37, 1001, 'skiware', 'Has signed in', '2021-09-07 01:04:39'),
(38, 1001, 'skiware', 'Has signed in', '2021-09-07 09:48:41'),
(39, 1001, 'skiware', 'Has signed out', '2021-09-07 10:09:10'),
(40, 1001, 'skiware', 'Has signed in', '2021-09-07 10:09:32'),
(41, 1001, 'skiware', 'Has signed in', '2021-09-07 11:17:38'),
(42, 1001, 'skiware', 'Has signed in', '2021-09-07 11:24:10'),
(43, 1001, 'skiware', 'Has signed in', '2021-09-07 13:00:46'),
(44, 1001, 'skiware', 'Has signed in', '2021-09-07 14:51:44'),
(45, 1001, 'skiware', 'Has signed in', '2021-09-07 22:02:46'),
(46, 1001, 'skiware', 'Has signed in', '2021-09-08 10:51:41'),
(47, 1001, 'skiware', 'Has signed in', '2021-09-08 14:22:22'),
(48, 1001, 'skiware', 'Has signed in', '2021-09-08 21:40:16'),
(49, 1001, 'skiware', 'Has signed out', '2021-09-08 22:27:56'),
(50, 1003, 'demo_admin', 'Has signed out', '2021-09-12 22:07:25'),
(51, 1003, 'demo_admin', 'Has signed in', '2021-09-12 22:07:59'),
(52, 1003, 'demo_admin', 'Has signed out', '2021-09-12 22:09:03'),
(53, 1001, 'skiware', 'Has signed in', '2021-09-12 22:09:11'),
(54, 1001, 'skiware', 'Has signed out', '2021-09-12 22:57:56'),
(55, 1001, 'skiware', 'Has signed out', '2021-09-15 06:27:28'),
(56, 1001, 'skiware', 'Has signed in', '2021-09-15 06:28:04'),
(57, 1001, 'skiware', 'Has signed in', '2021-09-15 14:08:20'),
(58, 1001, 'skiware', 'Has signed in', '2021-09-15 14:44:10');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `projectreg`
--

INSERT INTO `projectreg` (`id`, `pc`, `expno`, `pn`, `pp`, `eap`, `rsn`, `pin`, `esd`, `efd`) VALUES
(1, 'ment', 0001, 'demodata', '99', '1', 1001, 1001, '2021-08-01', '2021-08-31'),
(2, 'ment', 0002, 'demodata', '99', '1', 1001, 1001, '2021-08-01', '2021-08-31'),
(3, 'ment', 0004, 'demodata', '99', '1', 1001, 1001, '2021-09-01', '2021-09-30');

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `projectregsite`
--

INSERT INTO `projectregsite` (`id`, `site_id`, `projectreg_id`) VALUES
(5, 2, 1),
(6, 2, 2),
(7, 2, 3);

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

--
-- Dumping data for table `sampletype`
--

INSERT INTO `sampletype` (`sample_code`, `sample_desc`) VALUES
(-99, 'No data'),
(1, 'Individual'),
(2, 'Batch'),
(3, 'Pool');

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
(1001, 'Samson', 'Sifael', 'Kiware', 'skiware', '$2y$10$0SpPvA0llpAbDerZpz7mD.u2Efy76Z.dpef/rjEIUY8IazvrMMOuu', 1, 1, '+2551019804553', 'skiware@ihi.or.tz', 1, 1, 1, 1, '', '2015-03-01 09:22:00', '2021-09-15 14:44:10'),
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
SET FOREIGN_KEY_CHECKS=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
