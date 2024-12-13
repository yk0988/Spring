package com.company.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.company.dto.HakjumDTO;
import com.company.service.HakjumService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/Hakjum")
@RequiredArgsConstructor
@Log4j
public class HakjumController {

    private final HakjumService hakjumService;

    // 로그아웃
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate(); // 세션을 무효화하여 로그아웃 처리
        return "redirect:/Hakjum/login"; // 로그인 페이지로 리다이렉트
    }

    // 모든 회원 목록 조회
    @GetMapping({ "", "/list", "/index" })
    public String findAll(Model model) {
        List<HakjumDTO> hakjumDTOList = hakjumService.findAll();
        model.addAttribute("hakjumList", hakjumDTOList);
        return "list"; // 회원 목록 페이지로 이동
    }

    @GetMapping("/delete")
    public String delete(@RequestParam("id") Long id) {
        hakjumService.delete(id);
        return "redirect:/Hakjum/"; // 삭제 후 회원 목록 페이지로 리다이렉트
    }

    // 학생 등록 폼
    @GetMapping("/save")
    public String saveForm() {
        return "save"; // 학생 등록 페이지로 이동
    }

    // 학생 등록 처리
    @PostMapping("/save")
    public String save(@ModelAttribute HakjumDTO hakjumDTO,
            RedirectAttributes rttr) {
        if (hakjumService.save(hakjumDTO)) {
            return "redirect:/Hakjum/"; // 저장 후 회원 목록 페이지로 리다이렉트
        } else {
            rttr.addAttribute("message", "학번 중복");
            return "redirect:/Hakjum/save"; // 저장 실패 시 등록 페이지로 돌아가기
        }
    }

    // 학생 수정 폼
    @GetMapping("/modify")
    public String modify(@RequestParam("studentId") Long studentId, Model model) {
        HakjumDTO hakjumDTO = hakjumService.findBystudentId(studentId);
        model.addAttribute("hakjum", hakjumDTO);
        log.info("MODIFY 옴");
        log.info(hakjumDTO);
        return "modify"; // 수정 페이지로 이동
    }

    // 학생 정보 수정 처리
    @PostMapping("/modify")
    public String modify(@ModelAttribute HakjumDTO hakjumDTO,
            RedirectAttributes rttr) {
        if (hakjumService.modify(hakjumDTO)) {
            return "redirect:/Hakjum/"; // 수정 후 회원 목록 페이지로 리다이렉트
        } else {
            rttr.addAttribute("message", "뭔지 모르지만 아무튼 오류");
            return "redirect:/Hakjum/modify"; // 수정 실패 시 수정 페이지로 돌아가기
        }
    }

    // 로그인 폼
    @GetMapping("/login")
    public String loginForm() {
        return "login"; // 로그인 페이지로 이동
    }

    // 로그인 처리
    @PostMapping("/login")
    public String login(@ModelAttribute("HakjumDTO") HakjumDTO hakjumDTO,
            HttpSession session,
            RedirectAttributes rttr) {
        // 로그인 처리
        boolean loginResult = hakjumService.login(hakjumDTO);
        // 로그인 성공 시
        if (loginResult) {
            // 세션에 학생 이름 저장
            session.setAttribute("StudentName", hakjumDTO.getStudentName());
            // 로그인 성공 후 회원 정보 페이지로 리다이렉트
            rttr.addAttribute("studentId", hakjumDTO.getStudentId());
            return "redirect:/Hakjum/showMemberInfo";  
        } else {
            // 로그인 실패 시 로그인 페이지로 돌아감
            return "redirect:/Hakjum/login";  
        }
    }

    // 회원 정보 페이지
    @GetMapping("/showMemberInfo")
    public String showMemberInfo(@RequestParam("studentId") Long studentId, Model model) {
        HakjumDTO hakjumDTO = hakjumService.findBystudentId(studentId);
        model.addAttribute("hakjumDTO", hakjumDTO);
        log.info("LOGIN 성공 옴");
        log.info(hakjumDTO);
        return "showMemberInfo"; // 회원 정보 페이지로 이동
    }

    // 특정 회원 상세 조회
    @GetMapping("/detail")
    public String findById(@RequestParam("studentId") Long studentId, Model model) {
        HakjumDTO hakjumDTO = hakjumService.findBystudentId(studentId);
        model.addAttribute("hakjum", hakjumDTO);
        return "detail"; // 회원 상세 페이지로 이동
    }
}
