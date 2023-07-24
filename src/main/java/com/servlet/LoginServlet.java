package com.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import com.entities.User;
import com.helper.AlertManager;

import com.model.UserModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public LoginServlet() {
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		try {
			
			String email=request.getParameter("email");
			String password=request.getParameter("password");
			
//		Userdao userdao	=new Userdao(FactoryProvider.getFactory());
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("email", email);
		map.put("password", password);
		User user=null;
		List<User> users=(List<User>) new UserModel().findUser(map);
		if(users.size()>0) {
			user=users.get(0);
		}
		if (user!=null) {
		
			Cookie loginCookie = new Cookie("user", ""+user.getId());
			loginCookie.setPath("/");
			response.addCookie(loginCookie);
      	
			
			new AlertManager().addAlert(response, "Login", "Login Successfully", "success");
			
			
			response.sendRedirect("home_two.jsp");
		}else {
			
			new AlertManager().addAlert(response, "Login Failed", "Invalid Email or Password ", "danger");
			

			response.sendRedirect("home.jsp");
		}
	
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
	}
      
	
	
	
	
}
