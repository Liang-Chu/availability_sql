
CREATE TABLE `availability` (
  `id` uuid NOT NULL,
  `week_start_date` date DEFAULT NULL,
  `availability_binary` binary(42) DEFAULT NULL COMMENT '336 digits, each digits represent an 30 minutes interval throughout the week',
  `availability_hex` char(84) GENERATED ALWAYS AS (hex(`availability_binary`)) STORED,
  `next_availability_id` uuid DEFAULT NULL,
  `repeat` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `availability_availability_fk` (`next_availability_id`),
  CONSTRAINT `availability_availability_fk` FOREIGN KEY (`next_availability_id`) REFERENCES `availability` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;