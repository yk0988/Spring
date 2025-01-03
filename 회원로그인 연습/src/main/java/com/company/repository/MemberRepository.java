package com.company.repository;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.company.dto.MemberDTO;

public interface  MemberRepository {

	int save(MemberDTO memberDTO) ;
	

	MemberDTO login(MemberDTO memberDTO);
	

	MemberDTO findById(Long id);

	List<MemberDTO> findAll();
	

	 MemberDTO findByMemberEmail(String loginEmail);

	int update(MemberDTO memberDTO);
	

}