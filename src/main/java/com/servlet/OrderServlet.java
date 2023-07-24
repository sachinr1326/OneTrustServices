package com.servlet;

import java.io.IOException;

import com.entities.OrderDetail;
import com.model.OrderDetailModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class OrderServlet
 */
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public OrderServlet() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		

		String razorpay_payment_id=request.getParameter("razorpay_payment_id");
		String razorpay_order_id=request.getParameter("razorpay_order_id");
		String razorpay_signature=request.getParameter("razorpay_signature");
		String orderid=request.getParameter("orderid");
		String categorys=request.getParameter("category");
		
		OrderDetail orderDetail=new OrderDetailModel().find(Integer.parseInt(orderid));
		orderDetail.setRazorpay_order_id(razorpay_order_id);
		orderDetail.setRazorpay_payment_id(razorpay_payment_id);
		orderDetail.setRazorpay_signature(razorpay_signature);
		orderDetail.setPaid(true);
		new OrderDetailModel().update(orderDetail);
		response.sendRedirect("orderconfirm.jsp?category="+categorys);
		
		
	}

	

}
