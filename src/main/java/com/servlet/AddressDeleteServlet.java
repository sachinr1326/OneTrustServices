package com.servlet;

import java.io.IOException;

import com.helper.AlertManager;
import com.model.AddressModel;


import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class AddressDeleteServlet
 */
public class AddressDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public AddressDeleteServlet() {
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			 String id =   request.getParameter("id");
			 String category=request.getParameter("category");
			    new AddressModel().delete(new AddressModel().find(id));
			    new AlertManager().addAlert(response, "Address", " Address Remove Successfully", "danger");
				
			    if(category!=null) {
			    response.sendRedirect("Module-I/laundry.jsp?category="+category);
			    }
			    response.sendRedirect("address.jsp");
			    
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}

}
