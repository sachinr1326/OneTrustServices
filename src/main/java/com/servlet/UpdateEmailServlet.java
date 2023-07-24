package com.servlet;


import java.io.IOException;

import com.entities.User;
import com.helper.AlertManager;
import com.model.UserModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


public class UpdateEmailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public UpdateEmailServlet() {
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=request.getParameter("email");
		String userid=request.getParameter("userid");
		 
		User user = new UserModel().find(userid);
		user.setEmail(email);
		new UserModel().update(user);
		 new AlertManager().addAlert(response, "Email", "Email Update Successfully", "success");
			
		 response.sendRedirect("myprofile.jsp");
		
		
	}

}
