package com.entities;

import java.io.Serializable;


import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;

@Entity
public class QuantityService implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
     @ManyToOne
     private Laundryservices services;
	
	public Laundryservices getServices() {
		return services;
	}
	public void setServices(Laundryservices services) {
		this.services = services;
	}
	public QuantityService(Laundryservices services, int quantity) {
		super();
		
		this.services = services;
		this.quantity = quantity;
	}
	public QuantityService() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	
	public int getquantity() {
		return quantity;
	}
	public void setquantity(int quantity) {
		this.quantity = quantity;
	}
	private int quantity;

}
