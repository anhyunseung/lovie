CREATE TABLE `bbm_info` (
  `BBM_SEQ` int(8) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `CONTENTS` varchar(3000) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REG_USER_NO` int(8) NOT NULL,
  `REG_DT` datetime NOT NULL,
  `CHG_USER_NO` int(8) DEFAULT NULL,
  `CHG_DT` datetime DEFAULT NULL,
  `USER_ID` varchar(10) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`BBM_SEQ`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


CREATE TABLE `comment_bbm` (
  `COM_SEQ` int(8) NOT NULL AUTO_INCREMENT,
  `CONTENTS` varchar(3000) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REG_USER_NO` int(8) NOT NULL,
  `REG_DT` datetime NOT NULL,
  `USER_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `BBM_SEQ` int(8) NOT NULL,
  `CHG_USER_NO` int(8) DEFAULT NULL,
  `CHG_DT` datetime DEFAULT NULL,
  PRIMARY KEY (`COM_SEQ`),
  KEY `BBM_SEQ_idx` (`BBM_SEQ`),
  CONSTRAINT `BBM_SEQ` FOREIGN KEY (`BBM_SEQ`) REFERENCES `bbm_info` (`bbm_seq`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


CREATE TABLE `comment_notice` (
  `NOTICE_SEQ` int(8) NOT NULL,
  `COM_SEQ` int(8) NOT NULL AUTO_INCREMENT,
  `CONTENTS` varchar(3000) COLLATE utf8_bin NOT NULL,
  `REG_USER_NO` int(8) NOT NULL,
  `REG_DT` datetime NOT NULL,
  `USER_ID` varchar(20) COLLATE utf8_bin NOT NULL,
  `CHG_USER_NO` int(8) DEFAULT NULL,
  `CHG_DT` datetime DEFAULT NULL,
  PRIMARY KEY (`COM_SEQ`),
  KEY `NOTICE_SEQ_idx` (`NOTICE_SEQ`),
  CONSTRAINT `NOTICE_SEQ` FOREIGN KEY (`NOTICE_SEQ`) REFERENCES `notice_info` (`NOTICE_SEQ`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


CREATE TABLE `inquiry_info` (
  `INQ_SEQ` int(8) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `CONTENTS` varchar(3000) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REG_USER_NO` int(8) NOT NULL,
  `REG_DT` datetime NOT NULL,
  `CHG_USER_NO` int(8) DEFAULT NULL,
  `CHG_DT` datetime DEFAULT NULL,
  `USER_ID` varchar(10) COLLATE utf8_bin NOT NULL,
  `EMAIL1` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `EMAIL2` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`INQ_SEQ`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


CREATE TABLE `notice_info` (
  `NOTICE_SEQ` int(8) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(50) COLLATE utf8_bin NOT NULL,
  `CONTENTS` varchar(3000) COLLATE utf8_bin NOT NULL,
  `REG_USER_NO` int(8) NOT NULL,
  `REG_DT` datetime NOT NULL,
  `CHG_USER_NO` int(8) DEFAULT NULL,
  `CHG_DT` datetime DEFAULT NULL,
  `USER_ID` varchar(10) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`NOTICE_SEQ`)
) ENGINE=InnoDB AUTO_INCREMENT=331 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


CREATE TABLE `user_info` (
  `USER_NO` int(8) NOT NULL AUTO_INCREMENT,
  `USER_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `USER_NAME` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PASSWORD` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `EMAIL1` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `EMAIL2` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `TEL_2` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `TEL_3` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `BIRTHDAY` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `TEL_1` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`USER_NO`,`USER_ID`),
  UNIQUE KEY `USER_ID_UNIQUE` (`USER_ID`),
  UNIQUE KEY `USER_NO_UNIQUE` (`USER_NO`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;