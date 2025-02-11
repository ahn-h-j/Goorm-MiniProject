-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        11.6.2-MariaDB-ubu2404 - mariadb.org binary distribution
-- 서버 OS:                        debian-linux-gnu
-- HeidiSQL 버전:                  12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- 테이블 youtube.ADMINS 구조 내보내기
CREATE TABLE IF NOT EXISTS `ADMINS` (
  `admin_seq` int(11) NOT NULL AUTO_INCREMENT COMMENT '관리자순번',
  `admin_id` varchar(50) NOT NULL COMMENT '관리자아이디',
  `admin_pw` varchar(100) NOT NULL COMMENT '관리자비밀번호',
  `reg_seq` int(11) NOT NULL COMMENT '등록자순번',
  `use_yn` char(1) NOT NULL DEFAULT 'Y' COMMENT '사용여부',
  `reg_date` timestamp NOT NULL DEFAULT current_timestamp() COMMENT '등록일',
  PRIMARY KEY (`admin_seq`),
  UNIQUE KEY `admin_id` (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci COMMENT='관리자정보';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 youtube.MEMBERS 구조 내보내기
CREATE TABLE IF NOT EXISTS `MEMBERS` (
  `member_seq` int(11) NOT NULL AUTO_INCREMENT COMMENT '회원순번',
  `member_id` varchar(50) NOT NULL COMMENT '회원아이디',
  `member_pw` varchar(100) NOT NULL COMMENT '비밀번호',
  `member_nick` varchar(50) NOT NULL COMMENT '닉네임',
  `member_profile` varchar(100) DEFAULT NULL COMMENT '프로필사진',
  `member_info` varchar(400) DEFAULT NULL COMMENT '소개',
  `use_yn` char(1) DEFAULT 'Y' COMMENT '사용여부',
  `reg_date` timestamp NULL DEFAULT current_timestamp() COMMENT '등록일',
  PRIMARY KEY (`member_seq`),
  UNIQUE KEY `member_id` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci COMMENT='회원테이블';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 youtube.VIDEOS 구조 내보내기
CREATE TABLE IF NOT EXISTS `VIDEOS` (
  `video_seq` int(11) NOT NULL AUTO_INCREMENT COMMENT '동영상순번',
  `video` varchar(200) NOT NULL COMMENT '동영상',
  `video_thumnail` varchar(100) NOT NULL COMMENT '썸네일',
  `member_seq` int(11) NOT NULL COMMENT '작성자',
  `reg_date` timestamp NOT NULL DEFAULT current_timestamp() COMMENT '작성일',
  `publish_yn` tinyint(1) NOT NULL DEFAULT 0 COMMENT '공개여부',
  `delete_yn` char(1) NOT NULL COMMENT '삭제여부',
  PRIMARY KEY (`video_seq`),
  KEY `FK_VIDEOS_MEMBERS` (`member_seq`),
  CONSTRAINT `FK_VIDEOS_MEMBERS` FOREIGN KEY (`member_seq`) REFERENCES `MEMBERS` (`member_seq`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci COMMENT='업로드 동영상';

-- 내보낼 데이터가 선택되어 있지 않습니다.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
