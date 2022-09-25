-- 지역 테이블 생성
CREATE TABLE LOCATIONS (
	   LOCATION_ID NUMBER
	 , LOCATION_NAME VARCHAR2(9)	CONSTRAINT NN_LOCATIONS_LOCATION_NAME NOT NULL
	 , CONSTRAINT PK_LOCATIONS_LOCATION_ID PRIMARY KEY(LOCATION_ID)
);

-- 직책 테이블 생성
CREATE TABLE JOBS (
	   JOB_ID NUMBER
	 , JOB_NAME VARCHAR2(12)	CONSTRAINT NN_JOBS_JOB_NAME NOT NULL
	 , CONSTRAINT PK_JOBS_JOB_ID PRIMARY KEY(JOB_ID)
);

-- 관심사 테이블 생성
CREATE TABLE CATEGORYS (
	   CATEGORY_ID NUMBER
	 , CATEGORY_NAME VARCHAR2(20)	CONSTRAINT NN_CATEGORYS_CATEGORY_NAME NOT NULL
	 , CONSTRAINT PK_CATEGORYS_CATEGORY_ID PRIMARY KEY(CATEGORY_ID)
);

-- 모임 테이블 생성
CREATE TABLE MOIM (
      MOIM_ID NUMBER
    , MOIM_TITLE VARCHAR2(100)			CONSTRAINT NN_MOIM_MOIM_TILTE NOT NULL
    , MOIM_INFO VARCHAR2(500)
    , MOIM_LIMIT NUMBER				DEFAULT(5)
    , MOIM_IMAGE_PATH VARCHAR2(500)
    , CATEGORY_ID NUMBER				CONSTRAINT NN_MOIM_CATEGORY_ID NOT NULL
    , LOCATION_ID NUMBER				CONSTRAINT NN_MOIM_LOCATION_ID NOT NULL
    , MOIM_CREATE_DATE DATE 			DEFAULT(SYSDATE)
    , CONSTRAINT PK_MOIM_MOIM_ID PRIMARY KEY(MOIM_ID)
    , CONSTRAINT FK_MOIM_LOCATION_ID FOREIGN KEY(LOCATION_ID) REFERENCES LOCATIONS(LOCATION_ID)
    , CONSTRAINT FK_MOIM_CATEGORY_ID FOREIGN KEY(CATEGORY_ID) REFERENCES CATEGORYS(CATEGORY_ID)
);

-- 회원 테이블 생성
CREATE TABLE MEMBERS (
                         MEMBER_ID VARCHAR2(15)
    , MEMBER_NAME VARCHAR2(20)			CONSTRAINT NN_MEMBERS_MEMBER_NAME NOT NULL
    , PASSWORD VARCHAR2(15)			CONSTRAINT NN_MEMBERS_PASSWORD NOT NULL
    , GENDER VARCHAR2(1)				CONSTRAINT CK_MEMBERS_GENDER CHECK(GENDER IN ('M', 'F'))
    , BIRTH VARCHAR2(10)
    , PHONE VARCHAR2(11)				CONSTRAINT NN_MEMBERS_PHONE NOT NULL
    , CATEGORY VARCHAR2(18)			CONSTRAINT NN_MEMBERS_CATEGORY NOT NULL
    , BOOKMARK VARCHAR2(50)
    , INFO_IMAGE_PATH VARCHAR2(500)
    , MEMBER_IMAGE_PATH VARCHAR2(500)
    , LOCATION_ID NUMBER				CONSTRAINT NN_MEMBERS_LOCATION_ID NOT NULL
    , CONSTRAINT PK_MEMBERS_MEMBER_ID PRIMARY KEY(MEMBER_ID)
    , CONSTRAINT FK_MEMBERS_LOCATION_ID FOREIGN KEY(LOCATION_ID) REFERENCES LOCATIONS(LOCATION_ID)
);
ALTER TABLE MEMBERS ADD LOGIN_TYPE VARCHAR2(10);
ALTER TABLE MEMBERS MODIFY MEMBER_ID VARCHAR2(30);
ALTER TABLE MEMBERS MODIFY BOOKMARK DEFAULT('0');

-- 사진첩 테이블 생성
CREATE TABLE PHOTOS (
                        PHOTO_ID NUMBER
    , PHOTO_IMAGE_PATH VARCHAR2(500)
    , MOIM_ID NUMBER			CONSTRAINT NN_PHOTOS_MOIM_ID NOT NULL
    , MEMBER_ID VARCHAR2(15)			CONSTRAINT NN_PHOTOS_MEMBER_ID NOT NULL
    , PHOTO_CREATE_DATE DATE 			DEFAULT(SYSDATE)
    , CONSTRAINT PK_PHOTOS_PHOTO_ID PRIMARY KEY(PHOTO_ID)
    , CONSTRAINT FK_PHOTOS_MOIM_ID FOREIGN KEY(MOIM_ID) REFERENCES MOIM(MOIM_ID)
    , CONSTRAINT FK_PHOTOS_MEMBER_ID FOREIGN KEY(MEMBER_ID) REFERENCES MEMBERS(MEMBER_ID)
);

-- 정모 테이블 생성
CREATE TABLE MEETINGS (
                          MEETING_ID NUMBER
    , MEETING_TITLE VARCHAR2(100)	CONSTRAINT NN_MEETINGS_MEETING_TITLE NOT NULL
    , MEETING_DATE DATE 			DEFAULT(SYSDATE)
    , MEETING_TIME VARCHAR2(20)
    , MEETING_PLACE VARCHAR2(100)	CONSTRAINT NN_MEETINGS_MEETING_PLACE NOT NULL
    , MEETING_PRICE NUMBER 		DEFAULT(0)
    , MEETING_LIMIT NUMBER 		CONSTRAINT NN_MEETINGS_MEETING_LIMIT NOT NULL
    , MEETING_CREATE_DATE DATE 			DEFAULT(SYSDATE)
    , MOIM_ID NUMBER				CONSTRAINT NN_MEETINGS_MOIM_ID NOT NULL
    , CONSTRAINT PK_MEETINGS_MEETING_ID PRIMARY KEY(MEETING_ID)
    , CONSTRAINT FK_MEETINGS_MOIM_ID FOREIGN KEY(MOIM_ID) REFERENCES MOIM(MOIM_ID)
);
ALTER TABLE MEETINGS ADD MEETING_TIME VARCHAR2(20);

-- 게시판 테이블 생성
CREATE TABLE BOARDS (
                        BOARD_ID NUMBER
    , BOARD_TITLE VARCHAR2(100)		CONSTRAINT NN_BOARDS_BOARD_TITLE NOT NULL
    , CONTENT VARCHAR2(2000)
    , BOARD_CREATE_DATE DATE 			DEFAULT(SYSDATE)
    , "LIKE" NUMBER 				DEFAULT(0)
    , MOIM_ID NUMBER				CONSTRAINT NN_BOARDS_MOIM_ID NOT NULL
    , MEMBER_ID VARCHAR2(15)				CONSTRAINT NN_BOARDS_MEMBER_ID NOT NULL
    , CONSTRAINT PK_BOARDS_BOARD_ID PRIMARY KEY(BOARD_ID)
    , CONSTRAINT FK_BOARDS_MOIM_ID FOREIGN KEY(MOIM_ID) REFERENCES MOIM(MOIM_ID)
    , CONSTRAINT FK_BOARDS_MEMBER_ID FOREIGN KEY(MEMBER_ID) REFERENCES MEMBERS(MEMBER_ID)
);


--게시물 댓글 테이블 생성
CREATE TABLE BOARD_COMMENT (
     COMMENT_ID NUMBER
    , BOARD_ID NUMBER               CONSTRAINT NN_BOARD_COMMENT_BOARD_ID NOT NULL
    , CONTENT VARCHAR2(1000)        CONSTRAINT NN_BOARD_COMMENT_CONTENT NOT NULL
    , CONTENT_CREATE_DATE DATE 		DEFAULT(SYSDATE)
    , MOIM_ID NUMBER				CONSTRAINT NN_BOARD_COMMENT_MOIM_ID NOT NULL
    , MEMBER_ID VARCHAR2(15)		CONSTRAINT NN_BOARD_COMMENT_MEMBER_ID NOT NULL
    , CONSTRAINT PK_BOARD_COMMENT_COMMENT_ID PRIMARY KEY(COMMENT_ID)
    , CONSTRAINT FK_BOARD_COMMENT_MOIM_ID FOREIGN KEY(MOIM_ID) REFERENCES MOIM(MOIM_ID)
    , CONSTRAINT FK_BOARD_COMMENT_MEMBER_ID FOREIGN KEY(MEMBER_ID) REFERENCES MEMBERS(MEMBER_ID)
    , CONSTRAINT FK_BOARD_COMMENT_BOARD_ID FOREIGN KEY(BOARD_ID) REFERENCES BOARDS(BOARD_ID)
    );





-- 모임 참가자 테이블 생성
CREATE TABLE MOIM_PARTICIPANTS (
                                   MEMBER_ID VARCHAR2(15)		CONSTRAINT NN_MOIM_PARTICIPANTS_MEMBER_ID NOT NULL
    , MOIM_ID NUMBER		CONSTRAINT NN_MOIM_PARTICIPANTS_MOIM_ID NOT NULL
    , JOB_ID NUMBER		CONSTRAINT NN_MOIM_PARTICIPANTS_JOB_ID NOT NULL
    , CONSTRAINT FK_MOIM_PARTICIPANTS_MEMBER_ID FOREIGN KEY(MEMBER_ID) REFERENCES MEMBERS(MEMBER_ID)
    , CONSTRAINT FK_MOIM_PARTICIPANTS_MOIM_ID FOREIGN KEY(MOIM_ID) REFERENCES MOIM(MOIM_ID)
    , CONSTRAINT FK_MOIM_PARTICIPANTS_JOB_ID FOREIGN KEY(JOB_ID) REFERENCES JOBS(JOB_ID)
);

-- 정모 참가자 테이블 생성
CREATE TABLE MEETINGS_PARTICIPANTS (
                                       MEETING_ID NUMBER		CONSTRAINT NN_MEETINGS_PARTICIPANTS_MEETING_ID NOT NULL
    , MEMBER_ID VARCHAR2(15)		CONSTRAINT NN_MEETINGS_PARTICIPANTS_MEMBER_ID NOT NULL
    , MOIM_ID NUMBER		CONSTRAINT NN_MEETINGS_PARTICIPANT_MOIM_ID NOT NULL
    , CONSTRAINT FK_MEETINGS_PARTICIPANTS_MEMBER_ID FOREIGN KEY(MEMBER_ID) REFERENCES MEMBERS(MEMBER_ID)
    , CONSTRAINT FK_MEETINGS_PARTICIPANTS_MOIM_ID FOREIGN KEY(MOIM_ID) REFERENCES MOIM(MOIM_ID)
    , CONSTRAINT FK_MEETINGS_PARTICIPANTS_MEETING_ID FOREIGN KEY(MEETING_ID) REFERENCES MEETINGS(MEETING_ID)
);

CREATE SEQUENCE SQU_MOIM NOCACHE;
CREATE SEQUENCE SQU_BOARDS NOCACHE;
CREATE SEQUENCE SQU_MEETINGS NOCACHE;
CREATE SEQUENCE SQU_PHOTOS NOCACHE;
CREATE SEQUENCE SQU_COMMENT NOCACHE;

-- 각 테이블 조회
SELECT * FROM LOCATIONS;
SELECT * FROM JOBS;
SELECT * FROM CATEGORYS;
SELECT * FROM MOIM;
SELECT * FROM MEMBERS;
SELECT * FROM PHOTOS;
SELECT * FROM MEETINGS;
SELECT * FROM BOARDS;
SELECT * FROM MOIM_PARTICIPANTS;
SELECT * FROM MEETINGS_PARTICIPANTS;
SELECT * FROM BOARD_COMMENT;


-- 각 테이블 삭제
DROP TABLE MEETINGS_PARTICIPANTS;
DROP TABLE MOIM_PARTICIPANTS;
DROP TABLE BOARDS;
DROP TABLE MEETINGS;
DROP TABLE PHOTOS;
DROP TABLE MEMBERS;
DROP TABLE MOIM;
DROP TABLE CATEGORYS;
DROP TABLE JOBS;
DROP TABLE LOCATIONS;
DROP TABLE BOARD_COMMENT;

-- 제약조건 확인
SELECT * FROM USER_CONSTRAINTS;

-- 지역 테이블 내용 추가
INSERT INTO LOCATIONS VALUES (1, '서울');
INSERT INTO LOCATIONS VALUES (2, '인천');
INSERT INTO LOCATIONS VALUES (3, '경기');
INSERT INTO LOCATIONS VALUES (4, '강원');
INSERT INTO LOCATIONS VALUES (5, '충청남');
INSERT INTO LOCATIONS VALUES (6, '충청북');
INSERT INTO LOCATIONS VALUES (7, '세종');
INSERT INTO LOCATIONS VALUES (8, '대전');
INSERT INTO LOCATIONS VALUES (9, '전라북');
INSERT INTO LOCATIONS VALUES (10, '전라남');
INSERT INTO LOCATIONS VALUES (11, '광주');
INSERT INTO LOCATIONS VALUES (12, '경상북');
INSERT INTO LOCATIONS VALUES (13, '경상남');
INSERT INTO LOCATIONS VALUES (14, '대구');
INSERT INTO LOCATIONS VALUES (15, '울산');
INSERT INTO LOCATIONS VALUES (16, '부산');
INSERT INTO LOCATIONS VALUES (17, '제주');

-- 직책 테이블 내용 추가
INSERT INTO JOBS VALUES (1, '모임장');
INSERT INTO JOBS VALUES (2, '관리자');
INSERT INTO JOBS VALUES (3, '일반회원');

-- 관심사 테이블 내용 추가
INSERT INTO CATEGORYS VALUES (1, '아웃도어/여행');
INSERT INTO CATEGORYS VALUES (2, '운동/스포츠');
INSERT INTO CATEGORYS VALUES (3, '인문학/책/글');
INSERT INTO CATEGORYS VALUES (4, '외국/언어');
INSERT INTO CATEGORYS VALUES (5, '문화/공연/축제');
INSERT INTO CATEGORYS VALUES (6, '음악/악기');
INSERT INTO CATEGORYS VALUES (7, '공예/만들기');
INSERT INTO CATEGORYS VALUES (8, '댄스/무용');
INSERT INTO CATEGORYS VALUES (9, '봉사활동');
INSERT INTO CATEGORYS VALUES (10, '사교/인맥');
INSERT INTO CATEGORYS VALUES (11, '차/오토바이');
INSERT INTO CATEGORYS VALUES (12, '사진/영상');
INSERT INTO CATEGORYS VALUES (13, '야구관람');
INSERT INTO CATEGORYS VALUES (14, '게임/오락');
INSERT INTO CATEGORYS VALUES (15, '요리/제조');
INSERT INTO CATEGORYS VALUES (16, '반려동물');
INSERT INTO CATEGORYS VALUES (17, '가족/결혼');
INSERT INTO CATEGORYS VALUES (18, '자유주제');