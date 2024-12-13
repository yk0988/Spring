use webdb;

drop table if exists hakjum;

CREATE TABLE hakjum (
    studentId BIGINT PRIMARY KEY,  -- auto_increment 삭제(사용자 임의 학번 입력가능)
    studentName VARCHAR(20),
    koreanScore INT,
    englishScore INT,
    mathScore INT
);

select*from hakjum;
ALTER TABLE Hakjum MODIFY studentId BIGINT AUTO_INCREMENT;

INSERT INTO hakjum (studentId, studentName, koreanScore, englishScore, mathScore)
VALUES 
    (1001, '홍길동', 85, 90, 95),
    (1002, '김영희', 78, 84, 92),
    (1003, '이민호', 88, 76, 80);

