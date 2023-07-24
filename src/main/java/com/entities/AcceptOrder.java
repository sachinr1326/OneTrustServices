package com.entities;

import java.io.Serializable;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;


@Entity
public class AcceptOrder implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	@ManyToOne
	private OrderDetail orderdetail;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public AcceptOrder() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AcceptOrder(OrderDetail orderdetail) {
		super();
		this.orderdetail = orderdetail;
	}
	public OrderDetail getOrderdetail() {
		return orderdetail;
	}
	public void setOrderdetail(OrderDetail orderdetail) {
		this.orderdetail = orderdetail;
	}
	
	
}
