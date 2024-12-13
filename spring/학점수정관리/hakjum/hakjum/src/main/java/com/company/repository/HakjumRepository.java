package com.company.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.company.dto.HakjumDTO;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class HakjumRepository {

    // SqlSessionTemplate 객체를 통해 MyBatis SQL 세션을 처리
    private final SqlSessionTemplate sql;

    // 모든 학생의 정보를 조회하는 메서드
    public List<HakjumDTO> findAll() {
        // 'Hakjum.findAll' SQL 매퍼를 호출하여 모든 학생 정보 조회
        return sql.selectList("Hakjum.findAll");
    }

    // 학생 정보를 저장하는 메서드
    public int save(HakjumDTO hakjumDTO) {
        // 'Hakjum.save' SQL 매퍼를 호출하여 학생 정보를 데이터베이스에 삽입
        return sql.insert("Hakjum.save", hakjumDTO); 
    }

    // 학생 정보를 삭제하는 메서드
    public void delete(Long id) {
        // 'Hakjum.delete' SQL 매퍼를 호출하여 학생 정보 삭제
        sql.delete("Hakjum.delete", id);
    }

    // studentId로 특정 학생을 조회하는 메서드
    public HakjumDTO findBystudentId(Long studentId) {
        // 'Hakjum.findBystudentId' SQL 매퍼를 호출하여 studentId로 학생 정보 조회
        return sql.selectOne("Hakjum.findBystudentId", studentId);
    }

    // 학생 정보를 업데이트하는 메서드
    public int update(HakjumDTO hakjumDTO) {
        // 'Hakjum.update' SQL 매퍼를 호출하여 학생 정보 수정
        return sql.update("Hakjum.update", hakjumDTO);
    }

    // 학생의 로그인 정보를 조회하는 메서드
    public HakjumDTO login(HakjumDTO hakjumDTO) {
        // 'Hakjum.login' SQL 매퍼를 호출하여 로그인 정보 조회
        return sql.selectOne("Hakjum.login", hakjumDTO);
    }
}
