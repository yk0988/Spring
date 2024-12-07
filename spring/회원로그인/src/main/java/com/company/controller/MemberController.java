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
import org.springframework.web.bind.annotation.ResponseBody;

import com.company.dto.MemberDTO;
import com.company.service.MemberService;

import lombok.RequiredArgsConstructor;


@Controller
@RequestMapping("/member")
@RequiredArgsConstructor
public class MemberController {
  private final MemberService memberService;
  
  
	@GetMapping("/logout")
	 public String logout(){
		return"logout";
	 }
  
  
  @PostMapping("/email-check")
  public @ResponseBody String emailCheck(@RequestParam("memberEmail")
  String memberEmail) {
	  System.out.println("memberEmail="+memberEmail);
	  String checkResult = memberService.emailCheck(memberEmail);
	  return checkResult;
  }
  
  
  @PostMapping("/update")
  public String update(@ModelAttribute MemberDTO memberDTO) {
      boolean result = memberService.update(memberDTO);
      if (result) {
          // update 성공 시 리디렉션
          return "redirect:/member?id=" + memberDTO.getId();
      } else {
          // update 실패 시 "index" 페이지로 이동
          return "index";
      }
  }

  
  
  @GetMapping("/update")
  public String updateFrom(HttpSession session, Model model){
    //세션에 저장된 나의 이메일 가져오기
    String loginEmail = (String) session.getAttribute("loginEmail");
    MemberDTO memberDTO = memberService.findByMemberEmail(loginEmail);
    model.addAttribute("member", memberDTO);
    return "update";
  }
  
  @GetMapping("/delete")
  public String delete(@RequestParam("id") Long id){
    memberService.delete(id);
    return "redirect:/member/";
  }
  
  @GetMapping("/")
  public String findAll(Model model){
    List<MemberDTO> memberDTOList = memberService.findAll();
    model.addAttribute("memberList", memberDTOList);
    return "list";
  }
  
  
 @GetMapping
 public String findById(@RequestParam("id") Long id, Model model){
   MemberDTO memberDTO = memberService.findById(id);
   model.addAttribute("member", memberDTO);
   return "detail";
 }
 
 
  @GetMapping("/save")
  public String saveForm(){
    return "save";
  }

  @PostMapping("/save")
  public String save(@ModelAttribute MemberDTO memberDTO){
    int saveResult = memberService.save(memberDTO);
    if(saveResult > 0){
      return "login";
    }else{
      return "save";
    }
    
  }
  @GetMapping("login")
  public String loginForm(){
    return "login";
  }

  @PostMapping("/login")
  public String login(@ModelAttribute MemberDTO memberDTO, HttpSession session){
    boolean loginResult = memberService.login(memberDTO);
    if(loginResult){
      session.setAttribute("loginEmail", memberDTO.getMemberEmail());
      return "main";
    }else{
      return "login";
    }
  }
  
}