package com.entities;

import java.io.Serializable;
import java.time.LocalDateTime;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

import jakarta.persistence.OneToOne;


@Entity
public class TrackOrder implements Serializable {
	
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;	
	
	private String accept;
	private String pickup;
	private String process;
	private String outdelivery;
	private String delivered;
	public String getPickup() {
		return pickup;
	}
	public void setPickup(String pickup) {
		this.pickup = pickup;
	}
	public String getProcess() {
		return process;
	}
	public void setProcess(String process) {
		this.process = process;
	}
	public String getOutdelivery() {
		return outdelivery;
	}
	public void setOutdelivery(String outdelivery) {
		this.outdelivery = outdelivery;
	}
	public String getDelivered() {
		return delivered;
	}
	public void setDelivered(String delivered) {
		this.delivered = delivered;
	}
	private LocalDateTime acceptdate;
	private LocalDateTime pickupdate;
	private LocalDateTime processdate;
	private LocalDateTime outdeliverydate;
	private LocalDateTime delivereddate;
	@OneToOne
	private OrderDetail orderdetail;
	public OrderDetail getOrderdetail() {
		return orderdetail;
	}
	public void setOrderdetail(OrderDetail orderdetail) {
		this.orderdetail = orderdetail;
	}
	public TrackOrder() {
		super();
		// TODO Auto-generated constructor stub
	}
	public TrackOrder(String accept, LocalDateTime acceptdate,OrderDetail orderdetail) {
		super();
		this.accept = accept;
		this.acceptdate = acceptdate;
		this.orderdetail = orderdetail;
		
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getAccept() {
		return accept;
	}
	public void setAccept(String accept) {
		this.accept = accept;
	}
	public LocalDateTime getAcceptdate() {
		return acceptdate;
	}
	public void setAcceptdate(LocalDateTime acceptdate) {
		this.acceptdate = acceptdate;
	}
	public LocalDateTime getPickupdate() {
		return pickupdate;
	}
	public void setPickupdate(LocalDateTime pickupdate) {
		this.pickupdate = pickupdate;
	}
	public LocalDateTime getProcessdate() {
		return processdate;
	}
	public void setProcessdate(LocalDateTime processdate) {
		this.processdate = processdate;
	}
	public LocalDateTime getOutdeliverydate() {
		return outdeliverydate;
	}
	public void setOutdeliverydate(LocalDateTime outdeliverydate) {
		this.outdeliverydate = outdeliverydate;
	}
	public LocalDateTime getDelivereddate() {
		return delivereddate;
	}
	public void setDelivereddate(LocalDateTime delivereddate) {
		this.delivereddate = delivereddate;
	}
	
}
