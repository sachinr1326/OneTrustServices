package com.servlet;


import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;

import com.entities.ImageMessage;
import com.entities.NotificationMessage;
import com.entities.OrderDetail;
import com.entities.RejectOrder;
import com.entities.User;
import com.model.ImageMessageModel;
import com.model.NotificationMessageModel;
import com.model.OrderDetailModel;
import com.model.RejectOrderModel;
import com.model.UserModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class RejectOrderServlet
 */
public class RejectOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	

    /**
     * Default constructor. 
     */
    public RejectOrderServlet() {
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			 String id =   request.getParameter("orderid");
			 String tab=request.getParameter("tab");
				LocalDateTime date=LocalDateTime.now();
			 String userid =   request.getParameter("userid");
		
			 User user = new UserModel().find(userid);
			 String comment="This message is sent by the ots for regarding cancel your order request due to undelivereable address";
			 String topic="sorry your order is failed";
			
			 OrderDetail order = new OrderDetailModel().find(id);
				order.setStatus("reject");
				new  OrderDetailModel().update(order);
				new RejectOrderModel().create(new RejectOrder(order)); 
				List<ImageMessage> imagelist=new ImageMessageModel().findImagebyName("reject");
				if(!imagelist.isEmpty()) {
				for(ImageMessage image:imagelist) {
				 new NotificationMessageModel().create(new NotificationMessage(date, topic, comment, user, image.getImage()));
				}
				}
				
				   response.sendRedirect("masterpage.jsp?tab="+tab);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		
	}

}
