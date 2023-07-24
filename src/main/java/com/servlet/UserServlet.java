package com.servlet;


import java.io.IOException;


import com.entities.User;
import com.helper.AlertManager;

import com.model.UserModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public UserServlet() {
       
    }

	
	
	@SuppressWarnings("deprecation")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	try {
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		String phone=request.getParameter("phone");
		byte[] image =null;
		User user=new User(name, email, phone,password,image);
		new UserModel().create(user);
		
		new AlertManager().addAlert(response, "Sign Up", "Sign Up Successfully", "success");
		
	  response.sendRedirect("home.jsp");

	} catch (Exception e) {
		e.printStackTrace();
	}
	
	
	
	}

}
