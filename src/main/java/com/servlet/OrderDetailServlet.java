package com.servlet;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;

import java.util.List;

import org.json.JSONObject;

import com.entities.Address;
import com.entities.Laundryservices;
import com.entities.OrderDetail;
import com.entities.QuantityService;
import com.entities.User;
import com.model.AddressModel;
import com.model.LaundryModel;
import com.model.OrderDetailModel;
import com.model.QuantityServceModel;
import com.model.UserModel;
import com.razorpay.Order;
import com.razorpay.RazorpayClient;
import com.razorpay.RazorpayException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class OrderDetailServlet
 */
public class OrderDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public OrderDetailServlet() {
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String serviceStr = request.getParameter("serviceids");
		String addressStr = request.getParameter("addressid");
		String orderidStr = request.getParameter("orderid");
		String paymenttype = request.getParameter("paymenttype");
		String category=request.getParameter("category");
		Double totalprice=0.0;
		
		List<QuantityService> quantities= new ArrayList<QuantityService>();
		for(String str:serviceStr.split(",")) {
			Laundryservices service=new LaundryModel().find(Integer.parseInt(str));
			String item = request.getParameter("multipleprice_"+service.getId());
			System.out.println("quantity====="+item);
			System.out.println("quantity==idd==="+service.getId());
			 QuantityService quantity=new QuantityService(service,Integer.parseInt(item));
			 new QuantityServceModel().create(quantity); 

			quantities.add(quantity);
		   totalprice = totalprice + (Double.parseDouble(service.getPrice())*Double.parseDouble(item));
		}
		
		Address address= new AddressModel().find(Integer.parseInt(addressStr));
		
		LocalDateTime date=LocalDateTime.now();
		
		 Cookie[] cookies=request.getCookies();
			int userid = 0;
			if(cookies!=null){
				for(Cookie cookie:cookies){
					if(cookie.getName().equals("user")) userid = Integer.parseInt(cookie.getValue());
				}
			}
		          
		                      
		          User user= new UserModel().find(userid);                 

		
		OrderDetail order=new OrderDetail( address, user, orderidStr, false, ""+totalprice, date,quantities,null);
		
		if(paymenttype.equals("cod")) {
			new OrderDetailModel().create(order);
			response.sendRedirect("orderconfirm.jsp?category="+category);
			
		}else {
			try {
				RazorpayClient client=new RazorpayClient("rzp_test_cIhFizY3gcK77Z", "96TeU7ZwzvLiZQBDA1vUS3HI");
				  JSONObject orderRequest = new JSONObject();
				  orderRequest.put("amount", Double.parseDouble(order.getTotalprices())*100); // amount in the smallest currency unit
				  orderRequest.put("currency", "INR");

				  Order orderc = client.orders.create(orderRequest);
				
				  order.setRazorpay_order_id(orderc.get("id").toString());
				} catch (RazorpayException e) {
				  // Handle Exception
				  System.out.println(e.getMessage());
				}
			  new OrderDetailModel().create(order);
			response.sendRedirect("payment.jsp?orderid="+order.getId()+"&category="+category);
		}
		
	}

}
