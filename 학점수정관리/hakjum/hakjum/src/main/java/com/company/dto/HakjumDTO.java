package com.company.dto;
/**
 * HakjumDTO 클래스는 학생의 성적 정보를 담는 데이터 전송 객체(DTO)
 * 학생 ID, 이름, 국어 점수, 영어 점수, 수학 점수 등을 포함.
 */
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class HakjumDTO {

    private Long studentId;
    private String studentName; 
    private int koreanScore;  
    private int englishScore; 
    private int mathScore;  
}
