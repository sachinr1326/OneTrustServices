package com.servlet;

import java.io.IOException;

import java.time.LocalDateTime;

import com.entities.ImageMessage;
import com.entities.NotificationMessage;
import com.entities.User;
import com.model.ImageMessageModel;
import com.model.NotificationMessageModel;
import com.model.UserModel;

import jakarta.servlet.ServletException;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class SendMessageServlet
 */

public class SendMessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public SendMessageServlet() {
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		LocalDateTime date=LocalDateTime.now();
		String userid=request.getParameter("userid");
		String tab=request.getParameter("tab");
		String topic=request.getParameter("topic");
	     String comment=request.getParameter("comment");
	     String imageid=request.getParameter("imageid");
           ImageMessage image=new ImageMessageModel().find(imageid);
	     
	     User user = new UserModel().find(userid);
	     NotificationMessage message=new NotificationMessage(date, topic, comment, user, image.getImage());
	     new NotificationMessageModel().create(message);
	     response.sendRedirect("masterpage.jsp?tab="+tab);
		
	}

}
