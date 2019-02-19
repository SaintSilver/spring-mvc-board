CREATE SCHEMA `board` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE `board`.`tbl_board` (
  `bno` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(200) NOT NULL,
  `content` VARCHAR(5000) NOT NULL,
  `writer` VARCHAR(50) NOT NULL,
  `regDate` DATETIME NULL DEFAULT NOW(),
  `updateDate` DATETIME NULL DEFAULT NOW(),
  `replycnt` INT DEFAULT 0,
  PRIMARY KEY (`bno`));

INSERT INTO 
	board.tbl_board (title, content, writer)
VALUES 
	('제목 1111', '테스트 내용 1234', '테스터'),
	('제목 2222', '테스트 내용 1234', '테스터'),
	('제목 3333', '테스트 내용 1234', '테스터'),
	('제목 4444', '테스트 내용 1234', '테스터'),
	('제목 5555', '테스트 내용 1234', '테스터');
    
INSERT INTO 
	board.tbl_board (title, content, writer)
SELECT 
	title, content, writer
FROM board.tbl_board;

CREATE TABLE `board`.`tbl_reply` (
  `rno` INT NOT NULL AUTO_INCREMENT,
  `bno` INT NOT NULL,
  `reply` VARCHAR(1000) NOT NULL,
  `replyer` VARCHAR(50) NOT NULL,
  `replyDate` DATETIME NULL DEFAULT NOW(),
  `updateDate` DATETIME NULL DEFAULT NOW(),
  PRIMARY KEY (`rno`),
  INDEX `fk_reply_board_idx` (`bno` ASC) VISIBLE,
  CONSTRAINT `fk_reply_board`
    FOREIGN KEY (`bno`)
    REFERENCES `board`.`tbl_board` (`bno`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
