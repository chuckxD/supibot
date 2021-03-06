CREATE TABLE IF NOT EXISTS `chat_data`.`Command_Execution` (
  `Executed` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `User_Alias` INT(10) UNSIGNED NOT NULL,
  `Command` INT(10) UNSIGNED NOT NULL,
  `Platform` INT(10) UNSIGNED NOT NULL,
  `Channel` INT(10) UNSIGNED DEFAULT NULL,
  `Execution_Time` DECIMAL(10,3) UNSIGNED DEFAULT NULL,
  `Success` TINYINT(1) UNSIGNED NOT NULL,
  `Invocation` VARCHAR(50) NOT NULL,
  `Arguments` text DEFAULT NULL,
  `Result` VARCHAR(300) DEFAULT NULL,
  PRIMARY KEY (`User_Alias`,`Command`,`Executed`,`Platform`),
  KEY `FK_Command_Execution_Command` (`Command`),
  KEY `FK_Command_Execution_Channel` (`Channel`),
  KEY `Executed` (`Executed`),
  KEY `FK_Command_Execution_Platform` (`Platform`),
  CONSTRAINT `FK_Command_Execution_Channel` FOREIGN KEY (`Channel`) REFERENCES `Channel` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Command_Execution_Command` FOREIGN KEY (`Command`) REFERENCES `Command` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Command_Execution_Platform` FOREIGN KEY (`Platform`) REFERENCES `Platform` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Command_Execution_User_Alias` FOREIGN KEY (`User_Alias`) REFERENCES `User_Alias` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;