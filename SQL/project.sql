-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.11.2-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- project 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `project` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `project`;

-- 테이블 project.tbl_actionlog 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbl_actionlog` (
  `lno` int(11) NOT NULL AUTO_INCREMENT COMMENT '관리번호',
  `type` varchar(10) NOT NULL COMMENT '로그타입',
  `nickname` varchar(20) DEFAULT NULL COMMENT '기록자',
  `date` datetime NOT NULL COMMENT '기록시간',
  `URL` varchar(200) DEFAULT NULL COMMENT 'Clone시 URL',
  PRIMARY KEY (`lno`),
  KEY `FK_tbl_actionlog_tbl_member` (`nickname`),
  CONSTRAINT `FK_tbl_actionlog_tbl_member` FOREIGN KEY (`nickname`) REFERENCES `tbl_member` (`nickname`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=225 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='로그';

-- 테이블 데이터 project.tbl_actionlog:~111 rows (대략적) 내보내기
/*!40000 ALTER TABLE `tbl_actionlog` DISABLE KEYS */;
INSERT INTO `tbl_actionlog` (`lno`, `type`, `nickname`, `date`, `URL`) VALUES
	(107, 'scan', '관리자', '2023-07-05 17:23:04', NULL),
	(108, 'scan', '관리자', '2023-07-05 17:23:40', NULL),
	(109, 'scan', '관리자', '2023-07-05 17:33:36', NULL),
	(110, 'scan', '관리자', '2023-07-05 17:33:54', NULL),
	(111, 'scan', '관리자', '2023-07-05 17:34:55', NULL),
	(112, 'scan', '관리자', '2023-07-05 17:36:47', NULL),
	(113, 'scan', '관리자', '2023-07-05 17:38:31', NULL),
	(114, 'scan', '관리자', '2023-07-05 17:39:18', NULL),
	(115, 'scan', '관리자', '2023-07-05 17:40:29', NULL),
	(116, 'scan', '관리자', '2023-07-05 17:41:09', NULL),
	(117, 'scan', '관리자', '2023-07-05 17:43:29', NULL),
	(118, 'dictionary', '관리자', '2023-07-05 17:44:06', NULL),
	(119, 'dictionary', '관리자', '2023-07-05 17:44:20', NULL),
	(120, 'clone', '관리자', '2023-07-05 17:44:58', 'http://192.168.0.71:8090/MonkeyGameTown/gameSelect.jsp'),
	(121, 'clone', '관리자', '2023-07-05 17:45:29', 'http://192.168.0.71:8090/MonkeyGameTown/gameSelect.jsp'),
	(122, 'scan', '테스터2', '2023-07-05 18:11:58', NULL),
	(123, 'scan', '테스터2', '2023-07-05 18:34:55', NULL),
	(124, 'scan', '테스터2', '2023-07-05 18:35:48', NULL),
	(125, 'scan', '테스터2', '2023-07-05 18:36:00', NULL),
	(126, 'scan', '테스터2', '2023-07-05 18:36:08', NULL),
	(127, 'scan', '관리자', '2023-07-06 13:09:06', NULL),
	(128, 'scan', '관리자', '2023-07-06 13:09:27', NULL),
	(129, 'clone', 'aaa', '2023-07-07 16:38:15', 'www.google.com'),
	(130, 'clone', 'aaa', '2023-07-07 16:39:42', 'www.google.com'),
	(131, 'dictionary', 'aaa', '2023-07-07 16:41:23', NULL),
	(132, 'dictionary', 'aaa', '2023-07-07 16:42:41', NULL),
	(133, 'scan', '관리자', '2023-07-07 17:50:02', NULL),
	(134, 'scan', '관리자', '2023-07-07 17:50:18', NULL),
	(135, 'scan', '관리자', '2023-07-07 17:53:59', NULL),
	(136, 'scan', '관리자', '2023-07-07 17:56:35', NULL),
	(137, 'scan', '관리자', '2023-07-07 17:56:47', NULL),
	(138, 'scan', '관리자', '2023-07-07 17:56:58', NULL),
	(139, 'scan', '관리자', '2023-07-07 17:57:30', NULL),
	(140, 'clone', '관리자', '2023-07-07 18:08:05', 'www.google.com'),
	(141, 'clone', '관리자', '2023-07-07 18:18:53', 'https://dinorunner.com/ko/'),
	(142, 'clone', '관리자', '2023-07-10 16:54:02', 'http://192.168.0.186:8090/hrd_001/loginForm.jsp'),
	(143, 'dictionary', '관리자', '2023-07-10 16:59:58', NULL),
	(144, 'scan', '관리자', '2023-07-10 17:04:51', NULL),
	(145, 'scan', '관리자', '2023-07-10 17:05:54', NULL),
	(146, 'clone', '관리자', '2023-07-11 10:44:27', 'http://192.168.0.71:8090/MonkeyGameTown/gameSelect.jsp'),
	(147, 'clone', '관리자', '2023-07-12 11:46:51', 'https://passorder.co.kr'),
	(148, 'mirroring', '관리자', '2023-07-13 12:52:16', 'http://192.168.0.186:8090/hrd_001/loginForm.jsp'),
	(149, 'mirroring', '관리자', '2023-07-13 12:53:40', 'http://192.168.0.186:8090/hrd_001/loginForm.jsp'),
	(150, 'mirroring', '관리자', '2023-07-13 12:55:12', 'http://192.168.0.71:8090/MonkeyGameTown/'),
	(151, 'mirroring', '관리자', '2023-07-13 12:56:04', 'http://192.168.0.71:8090/MonkeyGameTown/gameSelect.jsp'),
	(152, 'mirroring', '관리자', '2023-07-13 12:56:38', 'http://192.168.0.71:8090/MonkeyGameTown/gameSelect.jsp'),
	(153, 'mirroring', '관리자', '2023-07-13 12:57:40', 'http://192.168.0.71:8090/MonkeyGameTown/gameSelect.jsp'),
	(154, 'mirroring', '관리자', '2023-07-13 12:57:56', 'http://192.168.0.186:8090/hrd_001/loginForm.jsp'),
	(155, 'mirroring', '관리자', '2023-07-13 12:58:21', 'http://192.168.0.186:8090/hrd_001/loginForm.jsp'),
	(156, 'mirroring', '관리자', '2023-07-13 13:01:26', 'http://192.168.0.186:8090/hrd_001/loginForm.jsp'),
	(157, 'mirroring', '관리자', '2023-07-13 13:03:54', 'http://192.168.0.186:8090/hrd_001/loginForm.jsp'),
	(158, 'mirroring', '관리자', '2023-07-13 13:05:59', 'http://192.168.0.186:8090/hrd_001/loginForm.jsp'),
	(159, 'mirroring', '관리자', '2023-07-13 13:06:09', 'blog.naver.com/ma5ter'),
	(160, 'clone', '관리자', '2023-07-13 13:06:28', 'http://192.168.0.71:8090/MonkeyGameTown/gameSelect.jsp'),
	(161, 'dictionary', '관리자', '2023-07-21 13:05:05', NULL),
	(162, 'dictionary', '관리자', '2023-07-24 11:16:05', NULL),
	(163, 'dictionary', '관리자', '2023-07-24 11:19:51', NULL),
	(164, 'dictionary', '관리자', '2023-07-24 11:24:31', NULL),
	(165, 'dictionary', '관리자', '2023-07-24 11:24:54', NULL),
	(166, 'dictionary', '관리자', '2023-07-24 11:25:41', NULL),
	(167, 'dictionary', '관리자', '2023-07-24 11:29:02', NULL),
	(168, 'dictionary', '관리자', '2023-07-24 11:30:45', NULL),
	(169, 'dictionary', '관리자', '2023-07-24 11:40:54', NULL),
	(170, 'dictionary', '관리자', '2023-07-24 11:50:08', NULL),
	(171, 'dictionary', '관리자', '2023-07-24 12:08:19', NULL),
	(172, 'dictionary', '관리자', '2023-07-24 12:14:26', NULL),
	(173, 'dictionary', '관리자', '2023-07-24 12:16:10', NULL),
	(174, 'dictionary', '관리자', '2023-07-24 12:30:37', NULL),
	(175, 'dictionary', '관리자', '2023-07-24 12:37:30', NULL),
	(176, 'dictionary', '관리자', '2023-07-24 12:38:05', NULL),
	(177, 'dictionary', '관리자', '2023-07-24 12:38:57', NULL),
	(178, 'dictionary', '관리자', '2023-07-24 12:44:30', NULL),
	(179, 'dictionary', '관리자', '2023-07-24 12:45:18', NULL),
	(180, 'dictionary', '관리자', '2023-07-24 14:26:37', NULL),
	(181, 'dictionary', '관리자', '2023-07-24 14:57:49', NULL),
	(182, 'dictionary', '관리자', '2023-07-24 14:58:56', NULL),
	(183, 'dictionary', '관리자', '2023-07-24 15:00:14', NULL),
	(184, 'dictionary', '관리자', '2023-07-24 15:00:27', NULL),
	(185, 'dictionary', '관리자', '2023-07-24 16:55:45', NULL),
	(186, 'dictionary', '관리자', '2023-07-24 18:35:03', NULL),
	(187, 'dictionary', '관리자', '2023-07-26 11:54:17', NULL),
	(188, 'office', '관리자', '2023-07-26 11:58:13', NULL),
	(189, 'office', '관리자', '2023-07-26 11:58:39', NULL),
	(190, 'office', '관리자', '2023-07-26 11:58:56', NULL),
	(191, 'office', '관리자', '2023-07-26 12:06:07', NULL),
	(192, 'archive', '관리자', '2023-07-26 14:24:28', NULL),
	(193, 'archive', '관리자', '2023-07-26 14:25:32', NULL),
	(194, 'archive', '관리자', '2023-07-26 14:27:14', NULL),
	(195, 'clone', '관리자', '2023-07-27 09:45:23', 'http://192.168.0.71:8090/MonkeyGameTown/BoardServlet'),
	(196, 'clone', '관리자', '2023-07-27 09:46:28', 'http://192.168.0.71:8090/MonkeyGameTown/BoardServlet'),
	(197, 'clone', '관리자', '2023-07-27 09:46:41', 'http://192.168.0.71:8090/MonkeyGameTown/BoardServlet'),
	(198, 'clone', '관리자', '2023-07-27 09:47:04', 'http://192.168.0.71:8090/MonkeyGameTown/adminManage.jsp'),
	(199, 'clone', '관리자', '2023-07-27 09:47:17', 'http://192.168.0.71:8090/MonkeyGameTown/adminManage.jsp'),
	(200, 'clone', '관리자', '2023-07-27 09:47:47', 'http://192.168.0.71:8090/MonkeyGameTown/admin.jsp'),
	(201, 'clone', '관리자', '2023-07-27 09:48:28', 'http://192.168.0.71:8090/MonkeyGameTown/adminManage.jsp'),
	(202, 'clone', '긴팔원숭이', '2023-07-27 11:27:10', 'https://allets.com/contents/?contentsId=28817'),
	(203, 'clone', 'test3', '2023-07-27 11:37:42', 'http://linforum.kr/'),
	(204, 'mirroring', 'test3', '2023-07-27 11:38:50', 'http://linforum.kr/'),
	(205, 'clone', '관리자', '2023-08-09 10:17:25', 'http://hoowave.dothome.co.kr'),
	(206, 'clone', '관리자', '2023-08-09 10:20:16', 'http://hoowave.dothome.co.kr'),
	(207, 'mirroring', '관리자', '2023-08-09 10:49:00', 'http://hoowave.dothome.co.kr'),
	(208, 'dictionary', '관리자', '2023-08-09 10:52:45', NULL),
	(209, 'office', '관리자', '2023-08-09 11:00:29', NULL),
	(210, 'office', '관리자', '2023-08-09 11:04:11', NULL),
	(211, 'office', '관리자', '2023-08-09 11:04:38', NULL),
	(212, 'office', '관리자', '2023-08-09 11:06:33', NULL),
	(213, 'archive', '관리자', '2023-08-09 12:05:33', NULL),
	(214, 'scan', '관리자', '2023-08-09 12:07:38', NULL),
	(215, 'scan', '관리자', '2023-08-09 12:08:23', NULL),
	(216, 'scan', '관리자', '2023-08-09 12:08:53', NULL),
	(217, 'scan', '관리자', '2023-08-09 12:09:27', NULL),
	(218, 'scan', '관리자', '2023-08-09 12:09:49', NULL),
	(219, 'scan', '관리자', '2023-08-09 12:10:13', NULL),
	(220, 'scan', '관리자', '2023-08-09 12:11:29', NULL),
	(221, 'scan', '관리자', '2023-08-09 12:11:43', NULL),
	(222, 'clone', '관리자', '2023-08-17 10:09:21', '192.168.0.71:8090/MonkeyGameTown'),
	(223, 'clone', '관리자', '2023-08-17 13:16:33', 'http://192.168.0.71:8060/MonkeyGameTown/'),
	(224, 'scan', '관리자', '2023-08-17 13:18:10', NULL);
/*!40000 ALTER TABLE `tbl_actionlog` ENABLE KEYS */;

-- 테이블 project.tbl_board 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbl_board` (
  `bno` int(11) NOT NULL AUTO_INCREMENT COMMENT '게시글번호',
  `type` varchar(50) NOT NULL COMMENT '게시판 카테고리',
  `title` varchar(100) NOT NULL COMMENT '제목',
  `content` text DEFAULT NULL COMMENT '내용',
  `date` datetime NOT NULL COMMENT '작성일',
  `writer` varchar(20) NOT NULL COMMENT '작성자',
  `hit` int(11) NOT NULL COMMENT '조회수',
  `del_yn` varchar(1) NOT NULL COMMENT '삭제여부',
  PRIMARY KEY (`bno`),
  KEY `FK_tbl_board_tbl_boardtype` (`type`),
  KEY `FK_tbl_board_tbl_member` (`writer`),
  CONSTRAINT `FK_tbl_board_tbl_boardtype` FOREIGN KEY (`type`) REFERENCES `tbl_boardtype` (`type`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_tbl_board_tbl_member` FOREIGN KEY (`writer`) REFERENCES `tbl_member` (`nickname`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='게시판';

-- 테이블 데이터 project.tbl_board:~29 rows (대략적) 내보내기
/*!40000 ALTER TABLE `tbl_board` DISABLE KEYS */;
INSERT INTO `tbl_board` (`bno`, `type`, `title`, `content`, `date`, `writer`, `hit`, `del_yn`) VALUES
	(1, 'notice', '공지1', '공지1내용', '2023-06-29 11:01:23', '관리자', 6, 'Y'),
	(2, 'notice', '공지2', '공지2내용', '2023-06-29 11:02:23', '관리자', 2, 'Y'),
	(3, 'notice', '공지3', '공지3내용', '2023-06-29 11:03:23', '관리자', 4, 'Y'),
	(4, 'free', '자유1', '자유1내용', '2023-06-29 11:00:23', '관리자', 0, 'N'),
	(5, 'free', '자유2', '자유2내용', '2023-06-29 11:01:23', '관리자', 0, 'N'),
	(6, 'free', '자유3', '자유3내용', '2023-06-29 11:02:23', '관리자', 0, 'N'),
	(7, 'free', '자유4', '자유4내용', '2023-06-29 11:03:23', '관리자', 0, 'N'),
	(8, 'free', '자유5', '자유5내용', '2023-06-29 11:04:23', '관리자', 0, 'N'),
	(9, 'free', '자유6', '자유6내용', '2023-06-29 11:05:23', '관리자', 0, 'N'),
	(10, 'free', '자유7', '자유7내용', '2023-06-29 11:06:23', '관리자', 0, 'N'),
	(11, 'free', '자유8', '자유8내용', '2023-06-29 11:07:23', '관리자', 0, 'N'),
	(12, 'free', '자유9', '자유9내용', '2023-06-29 11:08:23', '관리자', 0, 'N'),
	(13, 'free', '자유10', '자유10내용', '2023-06-29 11:09:23', '관리자', 0, 'N'),
	(14, 'free', '자유11', '자유11내용', '2023-06-29 11:10:23', '관리자', 0, 'N'),
	(15, 'free', '자유12', '자유12내용', '2023-06-29 11:11:23', '관리자', 1, 'N'),
	(16, 'qna', '개발질문1', '개발질문1내용', '2023-06-29 11:05:23', '관리자', 6, 'N'),
	(17, 'qna', '개발질문2수정', '개발질문2내용2', '2023-06-29 11:17:45', '관리자', 1, 'N'),
	(18, 'free', '하이', 'ㅎㅇgd', '2023-06-29 11:50:34', '테스터', 14, 'N'),
	(25, 'free', '테스트1', '테스트1', '2023-07-03 16:25:15', '관리자', 0, 'Y'),
	(27, 'attendance', '1퍼센트의 가능성, 그것이 나의 길이다. -나폴레옹', NULL, '2023-07-03 16:55:10', '관리자', 0, 'N'),
	(28, 'attendance', '피할수 없으면 즐겨라 -로버트 엘리엇', NULL, '2023-07-04 18:11:09', '관리자', 0, 'N'),
	(29, 'attendance', '눈물과 더불어 빵을 먹어 보지 않은 자는 인생의 참다운 맛을 모른다. -괴테', NULL, '2023-07-05 18:07:12', '테스터2', 0, 'N'),
	(30, 'welcome', '가입인사테스트요', '하잉', '2023-07-05 18:07:37', '테스터2', 12, 'N'),
	(31, 'attendance', '먼저핀꽃은 먼저진다 남보다 먼저 공을 세우려고 조급히 서둘것이 아니다 – 채근담', NULL, '2023-07-07 17:16:02', 'aaa', 0, 'N'),
	(32, 'attendance', '참을 인 세 번이면 호구  - 박명수', NULL, '2023-07-27 11:26:36', '긴팔원숭이', 0, 'N'),
	(33, 'free', 'gd', 'gd', '2023-07-27 11:36:52', 'test3', 8, 'N'),
	(34, 'attendance', '절대 어제를 후회하지 마라. 인생은 오늘의 내 안에 있고 내일은 스스로 만드는것이다. -L론허바드', NULL, '2023-07-27 11:38:39', 'test3', 0, 'N'),
	(35, 'notice', 'Lamer 공지사항', '라메르는 IT분야의 기술을 자유롭게 공유하는 커뮤니티 사이트입니다.\n\n중국과 미국을 비롯한 해외 사이트들의 경우 자신만의 해킹 노하우와 각종 보안 기술, 최신 기술 트렌드 기술에 대해 자유롭게 연구하고 공유하며 학습할 수 있습니다.\n\n그에 비해 국내에는 IT보안 커뮤니티는 많이 부족하며 한글로 작성된 기술 문서는 턱없이 부족하여 IT 보안 기술을 입문하는 분들에게는 쉽게 배울 수 없는 실정입니다. \n\n이러한 계기로 보안 기술을 자유롭게 공유할 수 있도록 라메르라는 사이트를 개설하게 되었습니다.\n\n입문자들에게도 쉽게 IT분야의 기술을 학습할 수 있고, 다양한 기술에 대해 연구할 수 있는 보안 커뮤니티 라메르가 인사드립니다.', '2023-07-27 11:55:49', '관리자', 40, 'N'),
	(36, 'notice', '포인트 획득 방법', '아래와 같이 포인트를 획득할 수 있습니다.\n회원가입시 : 100포인트\n출석게시판 : 50포인트\n추가예정..\n\n또한 사이트 즐겨찾기 이후 매일마다 출석게시판으로 쉽게 포인트를 획득하실 수 있습니다.\n\n포인트는 사이트 활성화 목적으로 봐주시면 감사하겠습니다.', '2023-07-27 12:12:30', '관리자', 15, 'N');
/*!40000 ALTER TABLE `tbl_board` ENABLE KEYS */;

-- 테이블 project.tbl_boardtype 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbl_boardtype` (
  `tno` int(11) NOT NULL AUTO_INCREMENT COMMENT '관리번호',
  `type` varchar(50) NOT NULL COMMENT '게시판카테고리',
  PRIMARY KEY (`tno`) USING BTREE,
  UNIQUE KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='게시판 카테고리';

-- 테이블 데이터 project.tbl_boardtype:~5 rows (대략적) 내보내기
/*!40000 ALTER TABLE `tbl_boardtype` DISABLE KEYS */;
INSERT INTO `tbl_boardtype` (`tno`, `type`) VALUES
	(5, 'attendance'),
	(2, 'free'),
	(1, 'notice'),
	(3, 'qna'),
	(4, 'welcome');
/*!40000 ALTER TABLE `tbl_boardtype` ENABLE KEYS */;

-- 테이블 project.tbl_comment 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbl_comment` (
  `cno` int(11) NOT NULL AUTO_INCREMENT COMMENT '댓글번호',
  `bno` int(11) NOT NULL COMMENT '게시글번호',
  `content` text NOT NULL COMMENT '내용',
  `date` datetime NOT NULL COMMENT '작성일',
  `writer` varchar(20) NOT NULL COMMENT '작성자',
  `del_yn` varchar(1) NOT NULL COMMENT '삭제여부',
  `groupno` int(11) NOT NULL COMMENT '댓글그룹번호',
  PRIMARY KEY (`cno`),
  KEY `FK_tbl_comment_tbl_board` (`bno`),
  CONSTRAINT `FK_tbl_comment_tbl_board` FOREIGN KEY (`bno`) REFERENCES `tbl_board` (`bno`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='댓글';

-- 테이블 데이터 project.tbl_comment:~48 rows (대략적) 내보내기
/*!40000 ALTER TABLE `tbl_comment` DISABLE KEYS */;
INSERT INTO `tbl_comment` (`cno`, `bno`, `content`, `date`, `writer`, `del_yn`, `groupno`) VALUES
	(1, 1, '댓글1', '2023-06-30 17:16:28', '테스터', 'N', 1),
	(2, 1, '댓글2', '2023-06-30 17:17:02', '테스터', 'N', 2),
	(3, 1, '댓글3', '2023-06-30 17:20:08', '테스터', 'N', 3),
	(4, 1, '댓글1의 답글1', '2023-06-30 17:20:57', '테스터', 'N', 1),
	(5, 1, '댓글1의 답글2', '2023-06-30 17:22:02', '테스터', 'N', 1),
	(6, 1, '댓글1의 답글3', '2023-06-30 17:22:17', '테스터', 'N', 1),
	(7, 1, '댓글2의 답글1', '2023-06-30 17:22:42', '테스터', 'N', 2),
	(8, 1, '댓글2의 답글2', '2023-06-30 17:23:08', '테스터', 'N', 2),
	(9, 1, '댓글2의 답글3', '2023-06-30 17:23:34', '테스터', 'N', 2),
	(10, 1, '댓글1의 답글4', '2023-06-30 17:35:53', '테스터', 'N', 1),
	(11, 1, '댓글1의 답글5', '2023-06-30 17:36:20', '테스터', 'N', 1),
	(12, 1, '댓글2의 답글4', '2023-06-30 17:36:36', '테스터', 'N', 2),
	(13, 1, '댓글2의 답글5', '2023-06-30 17:37:02', '테스터', 'N', 2),
	(14, 1, '댓글3의 답글1', '2023-06-30 17:37:20', '테스터', 'N', 3),
	(15, 1, '댓글3의 답글2', '2023-06-30 17:37:38', '테스터', 'N', 3),
	(16, 1, '댓글1의 답글6', '2023-06-30 17:37:58', '테스터', 'N', 1),
	(17, 1, '댓글2의 답글6', '2023-06-30 17:38:16', '테스터', 'N', 2),
	(18, 1, '댓글3의 답글3', '2023-06-30 17:38:31', '테스터', 'N', 3),
	(19, 1, '댓글2의 답글7', '2023-06-30 17:38:51', '테스터', 'N', 2),
	(20, 1, '댓글1의 답글7', '2023-06-30 17:39:25', '테스터', 'N', 1),
	(24, 1, '댓글4', '2023-06-30 18:41:03', '테스터', 'N', 4),
	(26, 3, '1', '2023-07-06 15:59:37', '관리자', 'N', 1),
	(27, 3, '2', '2023-07-06 15:59:47', '관리자', 'N', 2),
	(28, 3, '3', '2023-07-06 18:01:50', '관리자', 'N', 3),
	(29, 3, '4', '2023-07-06 18:03:10', '관리자', 'N', 4),
	(30, 3, 'gd', '2023-07-07 15:53:38', '테스터2', 'Y', 5),
	(31, 1, 'aaaaaaaaa', '2023-07-07 16:57:43', 'aaa', 'N', 5),
	(32, 18, '하이', '2023-07-10 17:20:58', '관리자', 'N', 1),
	(33, 3, '1-1', '2023-07-11 15:58:39', '테스터2', 'N', 1),
	(34, 3, '1-2', '2023-07-11 16:01:26', '테스터2', 'N', 1),
	(35, 3, '1-3', '2023-07-11 16:02:30', '테스터2', 'N', 1),
	(36, 3, '2-1', '2023-07-11 16:05:20', '테스터2', 'Y', 2),
	(37, 3, '2-2', '2023-07-11 16:08:50', '테스터2', 'N', 2),
	(38, 3, '1-4faf', '2023-07-11 16:10:15', '테스터2', 'N', 1),
	(39, 3, '5', '2023-07-11 16:12:13', '테스터2', 'N', 6),
	(40, 18, '하이2', '2023-07-11 16:14:10', '테스터2', 'N', 2),
	(41, 3, '1-5zz', '2023-07-11 16:15:50', '테스터2', 'Y', 1),
	(42, 3, '2-3', '2023-07-11 16:15:59', '테스터2', 'N', 2),
	(43, 3, '3-1', '2023-07-11 16:16:08', '테스터2', 'N', 3),
	(44, 3, 'gdgd', '2023-07-11 16:16:14', '테스터2', 'Y', 5),
	(45, 3, '6', '2023-07-11 16:24:16', '테스터2', 'N', 7),
	(46, 3, '5-1', '2023-07-11 16:24:22', '테스터2', 'N', 6),
	(47, 30, '인사 씨게 박습니다!!', '2023-07-27 11:26:51', '긴팔원숭이', 'N', 1),
	(48, 3, 'agfd', '2023-07-27 11:36:35', 'test3', 'N', 8),
	(49, 33, 'ged', '2023-07-27 11:36:57', 'test3', 'N', 1),
	(50, 33, 'www', '2023-07-27 11:37:00', 'test3', 'N', 1),
	(51, 33, 'd', '2023-07-27 11:37:07', 'test3', 'N', 2),
	(52, 33, 'd', '2023-07-27 11:37:10', 'test3', 'N', 1),
	(53, 18, 'vgz', '2023-07-27 11:51:50', '테스터', 'Y', 3),
	(54, 18, 'g', '2023-07-27 11:51:53', '테스터', 'N', 2),
	(55, 35, 'gd', '2023-08-17 13:18:58', '관리자', 'N', 1),
	(56, 35, 'zzggg', '2023-08-17 13:19:03', '관리자', 'N', 1);
/*!40000 ALTER TABLE `tbl_comment` ENABLE KEYS */;

-- 테이블 project.tbl_member 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbl_member` (
  `mid` int(11) NOT NULL AUTO_INCREMENT COMMENT '회원번호',
  `id` varchar(16) NOT NULL COMMENT '회원ID',
  `pw` varchar(16) NOT NULL COMMENT '회원PW',
  `permit` int(11) NOT NULL COMMENT '회원권한',
  `nickname` varchar(20) NOT NULL COMMENT '회원닉네임',
  `email` varchar(30) NOT NULL COMMENT '회원이메일',
  `point` int(11) NOT NULL COMMENT '회원포인트',
  PRIMARY KEY (`mid`),
  UNIQUE KEY `nickname` (`nickname`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='회원정보';

-- 테이블 데이터 project.tbl_member:~6 rows (대략적) 내보내기
/*!40000 ALTER TABLE `tbl_member` DISABLE KEYS */;
INSERT INTO `tbl_member` (`mid`, `id`, `pw`, `permit`, `nickname`, `email`, `point`) VALUES
	(1, 'test', '1234', 9, '관리자', 'test@test.com', 1580),
	(2, 'test1', '123456', 2, '테스터', 'test1@test.com', 100),
	(3, 'jhwq', '1234', 1, '긴팔원숭이', 'jhwq@apple.banana', 100),
	(4, 'test2', '123456', 1, '테스터2', 'test2@test.com', 70),
	(5, 'aaa', '1234', 1, 'aaa', 'aaa@green.com', 1050),
	(6, 'test3', '123456', 1, 'test3', 'test3@test3.com', 50);
/*!40000 ALTER TABLE `tbl_member` ENABLE KEYS */;

-- 테이블 project.tbl_sentence 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbl_sentence` (
  `sno` int(11) NOT NULL AUTO_INCREMENT,
  `sentense` varchar(100) NOT NULL,
  PRIMARY KEY (`sno`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='출석부 문장';

-- 테이블 데이터 project.tbl_sentence:~36 rows (대략적) 내보내기
/*!40000 ALTER TABLE `tbl_sentence` DISABLE KEYS */;
INSERT INTO `tbl_sentence` (`sno`, `sentense`) VALUES
	(1, '산다는것 그것은 치열한 전투이다. -로망로랑'),
	(2, '삶이 있는 한 희망은 있다 -키케로'),
	(3, '하루에 3시간을 걸으면 7년 후에 지구를 한바퀴 돌 수 있다. -사무엘존슨'),
	(4, '언제나 현재에 집중할수 있다면 행복할것이다. -파울로 코엘료'),
	(5, '진정으로 웃으려면 고통을 참아야하며, 나아가 고통을 즐길 줄 알아야 해 -찰리 채플린'),
	(6, '직업에서 행복을 찾아라. 아니면 행복이 무엇인지 절대 모를 것이다 -엘버트 허버드'),
	(7, '신은 용기있는자를 결코 버리지 않는다 -켄러'),
	(8, '문제점을 찾지 말고 해결책을 찾으라 – 헨리포드'),
	(9, '우리를 향해 열린 문을 보지 못하게 된다 – 헬렌켈러'),
	(10, '피할수 없으면 즐겨라 – 로버트 엘리엇'),
	(11, '단순하게 살아라. 현대인은 쓸데없는 절차와 일 때문에 얼마나 복잡한 삶을 살아가는가?-이드리스 샤흐'),
	(12, '먼저 자신을 비웃어라. 다른 사람이 당신을 비웃기 전에 – 엘사 맥스웰'),
	(13, '먼저핀꽃은 먼저진다 남보다 먼저 공을 세우려고 조급히 서둘것이 아니다 – 채근담'),
	(14, '행복한 삶을 살기위해 필요한 것은 거의 없다. -마르쿠스 아우렐리우스 안토니우스'),
	(15, '절대 어제를 후회하지 마라 . 인생은 오늘의 나 안에 있고 내일은 스스로 만드는 것이다 L.론허바드'),
	(16, '어리석은 자는 멀리서 행복을 찾고, 현명한 자는 자신의 발치에서 행복을 키워간다 -제임스 오펜하임'),
	(17, '너무 소심하고 까다롭게 자신의 행동을 고민하지 말라 . 모든 인생은 실험이다 . 더많이 실험할수록 더나아진다 – 랄프 왈도 에머슨'),
	(18, '한번의 실패와 영원한 실패를 혼동하지 마라 -F.스콧 핏제랄드'),
	(19, '피할수 없으면 즐겨라 -로버트 엘리엇'),
	(20, '절대 어제를 후회하지 마라. 인생은 오늘의 내 안에 있고 내일은 스스로 만드는것이다. -L론허바드'),
	(21, '계단을 밟아야 계단 위에 올라설수 있다. -터키속담'),
	(22, '오랫동안 꿈을 그리는 사람은 마침내 그 꿈을 닮아 간다, -앙드레 말로'),
	(23, '좋은 성과를 얻으려면 한 걸음 한 걸음이 힘차고 충실하지 않으면 안 된다, -단테'),
	(24, '행복은 습관이다,그것을 몸에 지니라 -허버드'),
	(25, '성공의 비결은 단 한 가지, 잘할 수 있는 일에 광적으로 집중하는 것이다.- 톰 모나건'),
	(26, '자신감 있는 표정을 지으면 자신감이 생긴다 -찰스다윈'),
	(27, '평생 살 것처럼 꿈을 꾸어라.그리고 내일 죽을 것처럼 오늘을 살아라. – 제임스 딘'),
	(28, '네 믿음은 네 생각이 된다 . 네 생각은 네 말이 된다. 네말은 네 행동이 된다 네행동은 네 습관이된다 . 네 습관은 네 가치가 된다 . 네 가치는 네 운명이 된다 – 간디'),
	(29, '1퍼센트의 가능성, 그것이 나의 길이다. -나폴레옹'),
	(30, '고통이 남기고 간 뒤를 보라! 고난이 지나면 반드시 기쁨이 스며든다. -괴테'),
	(31, '꿈을 계속 간직하고 있으면 반드시 실현할 때가 온다. -괴테'),
	(32, '화려한 일을 추구하지 말라. 중요한 것은 스스로의 재능이며, 자신의 행동에 쏟아 붓는 사랑의 정도이다. -머더 테레사'),
	(33, '마음만을 가지고 있어서는 안된다. 반드시 실천하여야 한다. -이소룡'),
	(34, '나이가 60이다 70이다 하는 것으로 그 사람이 늙었다 젊었다 할 수 없다. 늙고 젊은 것은 그 사람의 신념이 늙었느냐 젊었느냐 하는데 있다. -맥아더'),
	(35, '만약 우리가 할 수 있는 일을 모두 한다면 우리들은 우리자신에 깜짝 놀랄 것이다. -에디슨'),
	(36, '물러나서 조용하게 구하면 배울 수 있는 스승은 많다. 사람은 가는 곳마다 보는 것마다 모두 스승으로서 배울 것이 많은 법이다. -맹자'),
	(37, '눈물과 더불어 빵을 먹어 보지 않은 자는 인생의 참다운 맛을 모른다. -괴테'),
	(38, '진짜 문제는 사람들의 마음이다. 그것은 절대로 물리학이나 윤리학의 문제가 아니다. -아인슈타인'),
	(39, '해야 할 것을 하라. 모든 것은 타인의 행복을 위해서, 동시에 특히 나의 행복을 위해서이다. -톨스토이'),
	(40, '사람이 여행을 하는 것은 도착하기 위해서가 아니라 여행하기 위해서이다. -괴테');
/*!40000 ALTER TABLE `tbl_sentence` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
