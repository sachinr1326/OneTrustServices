package com.servlet;

import java.io.IOException;

import com.helper.AlertManager;
import com.model.LaundryModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


public class LaundryServicesDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public LaundryServicesDeleteServlet() {
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	    String id =request.getParameter("id");
	    String category=request.getParameter("category");
	    new LaundryModel().delete(new LaundryModel().find(id));
	    new AlertManager().addAlert(response, "Service", "Service remove Successfully", "danger");
		
	    response.sendRedirect("Module-I/laundry.jsp?category="+category);
		
	}

}
