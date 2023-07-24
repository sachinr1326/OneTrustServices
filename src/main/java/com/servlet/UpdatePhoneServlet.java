package com.servlet;

import java.io.IOException;

import com.entities.User;
import com.helper.AlertManager;
import com.model.UserModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


public class UpdatePhoneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public UpdatePhoneServlet() {
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String phone=request.getParameter("phone");
		String userid=request.getParameter("userid");
		 
		User user = new UserModel().find(userid);
		user.setPhone(phone);
		new UserModel().update(user);
		 new AlertManager().addAlert(response, "Phone", "Phone Update Successfully", "success");
			
		 response.sendRedirect("myprofile.jsp");
	}

}
