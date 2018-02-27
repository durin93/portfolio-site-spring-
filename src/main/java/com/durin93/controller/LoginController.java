package com.durin93.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.durin93.domain.LoginInfo;
import com.durin93.persistence.LoginDAO;

@Controller
@RequestMapping ("/login/*")
public class LoginController {

	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	
	@Autowired
	LoginDAO loginDAO;

	@RequestMapping(value = "/loginCheck")
	public void loginCheck(Locale locale, Model model, LoginInfo loginInfo, HttpSession session,
			HttpServletResponse response) throws IOException {
		response.setContentType("text/html ; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if ((loginInfo.getUser_id() != null && !loginInfo.getUser_id().equals("") && loginInfo.getUser_pw() != null
				&& !loginInfo.getUser_pw().equals(""))) {

			if (loginDAO.loginCheck(loginInfo)) {
				session.setAttribute("login", 0);
				System.out.println("세션 추가됨");
				session.setAttribute("user_id", loginInfo.getUser_id());

				out.println("<script>location.href='/' ; </script>");
				out.flush();
				out.close();
			}

			if (loginDAO.loginCheck(loginInfo) == false) {
				out.println("<script>alert('로그인 정보를 확인하세요'); history.go(-1); </script>");
				out.flush();
				out.close();
			}

		}
	}
	
	@RequestMapping(value = "/logout")
	public ModelAndView logOut(ModelAndView mv, HttpSession session) {
		String page = "redirect:/";
		session.removeAttribute("user_id");
		mv.setViewName(page);
		return mv;
	}

}
