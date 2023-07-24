package com.entities;

import java.io.Serializable;

import java.time.LocalDateTime;

import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;

@Entity
public class OrderDetail implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	
	public OrderDetail() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public Address getAddress() {
		return address;
	}
	public void setAddress(Address address) {
		this.address = address;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getOrderid() {
		return Orderid;
	}
	public void setOrderid(String orderid) {
		Orderid = orderid;
	}
	public boolean isPaid() {
		return paid;
	}
	public void setPaid(boolean paid) {
		this.paid = paid;
	}
	public String getTotalprices() {
		return totalprices;
	}
	public void setTotalprices(String totalprices) {
		this.totalprices = totalprices;
	}
	public LocalDateTime getDate() {
		return date;
	}
	public void setDate(LocalDateTime date) {
		this.date = date;
	}
	
	@ManyToOne
	private Address address;
	@ManyToOne
	private User user;
	private String status;
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}

	@ManyToMany
	private List<QuantityService> quantity;
	

	public List<QuantityService> getQuantity() {
		return quantity;
	}
	public void setQuantity(List<QuantityService> quantity) {
		this.quantity = quantity;
	}

	private String Orderid;
	private boolean paid;
	private String totalprices;
	private LocalDateTime date;
	String razorpay_payment_id;
	String razorpay_order_id;
	String razorpay_signature;
	
	public String getRazorpay_payment_id() {
		return razorpay_payment_id;
	}
	public void setRazorpay_payment_id(String razorpay_payment_id) {
		this.razorpay_payment_id = razorpay_payment_id;
	}
	public String getRazorpay_order_id() {
		return razorpay_order_id;
	}
	public void setRazorpay_order_id(String razorpay_order_id) {
		this.razorpay_order_id = razorpay_order_id;
	}
	public String getRazorpay_signature() {
		return razorpay_signature;
	}
	public void setRazorpay_signature(String razorpay_signature) {
		this.razorpay_signature = razorpay_signature;
	}
	public OrderDetail( Address address, User user, String orderid, boolean paid,
			String totalprices, LocalDateTime date,List<QuantityService> quantity,String status) {
		super();
		
		this.address = address;
		this.user = user;
		this.Orderid = orderid;
		this.paid = paid;
		this.totalprices = totalprices;
		this.date = date;
		this.quantity = quantity;
		this.status = status;
	}
	

}
