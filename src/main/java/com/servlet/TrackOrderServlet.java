package com.servlet;

import java.io.IOException;
import java.time.LocalDateTime;


import com.entities.DeliveredOrder;
import com.entities.OrderDetail;
import com.entities.TrackOrder;
import com.model.AcceptOrderModel;
import com.model.DeliveredOrderModel;
import com.model.OrderDetailModel;
import com.model.TrackOrderModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class TrackOrderServlet
 */
public class TrackOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public TrackOrderServlet() {
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String acceptid=request.getParameter("acceptid");
			String trackid=request.getParameter("trackid");
			String id=request.getParameter("orderid");
			 String tab=request.getParameter("tab");
				LocalDateTime date=LocalDateTime.now();
			 OrderDetail order=new OrderDetailModel().find(id);
			TrackOrder track= new TrackOrderModel().find(trackid);
			
		          if(track!=null) {
					 if(track.getAccept()!=null && track.getPickup()==null) {
						 track.setPickup("Pickup");
						 track.setPickupdate(date);
						 
						 new TrackOrderModel().update(track);
					 }else if(track.getPickup()!=null && track.getProcess()==null) {
						track.setProcess("Processing"); 
						track.setProcessdate(date);
						new TrackOrderModel().update(track); 
					 }else if(track.getProcess()!=null && track.getOutdelivery()==null) {
							track.setOutdelivery("Out for Delivery"); 
							track.setOutdeliverydate(date);
							new TrackOrderModel().update(track); 
						 }else if(track.getOutdelivery()!=null && track.getDelivered()==null) {
							track.setDelivered("Delivered"); 
							track.setDelivereddate(date);
							new TrackOrderModel().update(track); 
							order.setStatus("delivered");
							new OrderDetailModel().update(order);
							new AcceptOrderModel().delete(new AcceptOrderModel().find(acceptid));
							new DeliveredOrderModel().create(new DeliveredOrder(order));
							
						 }
		          }
			
					 response.sendRedirect("masterpage.jsp?tab="+tab);
		} catch (Exception e) {
			// TODO: handle exception
		}
		 
	}

}
