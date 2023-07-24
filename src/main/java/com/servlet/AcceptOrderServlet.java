package com.servlet;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;

import com.entities.AcceptOrder;
import com.entities.ImageMessage;
import com.entities.NotificationMessage;
import com.entities.OrderDetail;
import com.entities.TrackOrder;
import com.entities.User;
import com.model.AcceptOrderModel;
import com.model.ImageMessageModel;
import com.model.NotificationMessageModel;
import com.model.OrderDetailModel;
import com.model.TrackOrderModel;
import com.model.UserModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class AcceptOrderServlet
 */
public class AcceptOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public AcceptOrderServlet() {
        // TODO Auto-generated constructor stub
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		try {
			LocalDateTime date=LocalDateTime.now();
			 String id =   request.getParameter("orderid");
			 String userid =   request.getParameter("userid");
			 String tab=request.getParameter("tab");
			 User user = new UserModel().find(userid);
			 String comment="Hi "+user.getName()+", Congratulations! we are accepted your order. Thanks, for giving us a chance to prove our skills. we are not going to disappoint you.";
			 String topic="Congratulations on your acceptance";
			
			 
			 OrderDetail order = new OrderDetailModel().find(id);
				order.setStatus("accept");
				new  OrderDetailModel().update(order);
				new AcceptOrderModel().create(new AcceptOrder(order));
				new TrackOrderModel().create(new TrackOrder("Accept", date, order));
				List<ImageMessage> imagelist=new ImageMessageModel().findImagebyName("accept");
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
