package com.company.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.company.dto.HakjumDTO;
import com.company.repository.HakjumRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class HakjumService {

    // HakjumRepository를 주입받아 데이터베이스와의 통신을 처리
    private final HakjumRepository hakjumRepository;

    // 특정 학생 정보를 studentId로 조회
    public HakjumDTO findBystudentId(Long id) {
        return hakjumRepository.findBystudentId(id); // Repository에서 학생 정보 조회
    }

    // 모든 학생 정보를 조회
    public List<HakjumDTO> findAll() {
        return hakjumRepository.findAll(); // Repository에서 모든 학생 정보 조회
    }

    // 특정 학생을 삭제
    public void delete(Long id) {
        hakjumRepository.delete(id); // Repository에서 학생 정보 삭제
    }

    // 학생 정보 저장
    public boolean save(HakjumDTO hakjumDTO) {
        try {
            hakjumRepository.save(hakjumDTO); // Repository에서 학생 정보 저장
            return true; // 저장 성공 시 true 반환
        } catch (Exception e) {
            return false; // 예외 발생 시 false 반환
        }
    }

    // 학생 정보 수정
    public boolean modify(HakjumDTO hakjumDTO) {
        try {
            hakjumRepository.update(hakjumDTO); // Repository에서 학생 정보 수정
            return true; // 수정 성공 시 true 반환
        } catch (Exception e) {
            return false; // 예외 발생 시 false 반환
        }
    }

    // 로그인 처리
    public boolean login(HakjumDTO hakjumDTO) {
        HakjumDTO loginHakjum = hakjumRepository.login(hakjumDTO); // Repository에서 로그인 정보 조회
        return loginHakjum != null; // 학생 정보가 존재하면 로그인 성공, 아니면 실패
    }
}
