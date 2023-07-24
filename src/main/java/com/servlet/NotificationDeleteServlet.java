package com.servlet;

import java.io.IOException;

import com.model.NotificationMessageModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class NotificationDeleteServlet
 */
public class NotificationDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public NotificationDeleteServlet() {
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
		
		new NotificationMessageModel().delete(new NotificationMessageModel().find(id));
		
		 response.sendRedirect("notification.jsp");
	}

}
