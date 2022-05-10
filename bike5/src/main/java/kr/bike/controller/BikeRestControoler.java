package kr.bike.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import kr.bike.entity.User;
import kr.bike.mapper.BikeMapper;

public class BikeRestControoler {
	@Autowired
	private BikeMapper bikeMapper;

	@GetMapping("main.do")
	public String main() {
		return "basic";
	}

	@PostMapping("/login.do")
	public String login(User uvo, HttpServletRequest request) {
		User vo = bikeMapper.userLogin(uvo);
		if(vo!=null) {
			// 로그인에 성공한 경우
			// 1. 세션객체(HttpSession)를 생성한다.
			HttpSession session = request.getSession();
			// 2. 회원인증을 했다는 사실을 객체 바인딩
			session.setAttribute("uvo", vo);
		}
		return "redirect:/main.do";
	}
	@PostMapping("/logout.do")
	   public String logout(HttpServletRequest request) {
	      //로그아웃 처리~
	      HttpSession session=request.getSession();
	      session.invalidate();// 무효화
	      return "redirect:/main.do";
	   }

}
