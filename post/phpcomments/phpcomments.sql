CREATE DATABASE IF NOT EXISTS `phpcomments_advanced` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `phpcomments_advanced`;

CREATE TABLE IF NOT EXISTS `accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `display_name` varchar(50) NOT NULL,
  `role` enum('Admin','Member') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `accounts` (`id`, `email`, `password`, `display_name`, `role`) VALUES
(1, 'admin@example.com', '$2y$10$ZU7Jq5yZ1U/ifeJoJzvLbenjRyJVkSzmQKQc.X0KDPkfR3qs/iA7O', 'Admin', 'Admin');

CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` varchar(255) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT -1,
  `display_name` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `submit_date` datetime NOT NULL DEFAULT current_timestamp(),
  `edited_date` datetime NOT NULL DEFAULT current_timestamp(),
  `votes` int(11) NOT NULL DEFAULT 0,
  `approved` tinyint(1) NOT NULL DEFAULT 0,
  `acc_id` int(11) NOT NULL DEFAULT -1,
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `page_id` (`page_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE IF NOT EXISTS `comment_filters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `word` varchar(255) NOT NULL,
  `replacement` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE IF NOT EXISTS `comment_page_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;