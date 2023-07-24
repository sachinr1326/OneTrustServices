package com.entities;

import java.io.Serializable;



import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Lob;
import jakarta.persistence.Table;


@Entity
@Table(name="laundryservices")
public class Laundryservices implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	public Laundryservices() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Laundryservices( String service, String price, String item1, String item2, String item3
			,byte[] image ,String category,String per) {
		super();
	
		this.service = service;
		this.price = price;
		this.item1 = item1;
		this.item2 = item2;
		this.item3 = item3;
		this.image = image;
		this.category= category;
		this.per = per;
	
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getService() {
		return service;
	}
	public void setService(String service) {
		this.service = service;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getItem1() {
		return item1;
	}
	public void setItem1(String item1) {
		this.item1 = item1;
	}
	public String getItem2() {
		return item2;
	}
	public void setItem2(String item2) {
		this.item2 = item2;
	}
	public String getItem3() {
		return item3;
	}
	public void setItem3(String item3) {
		this.item3 = item3;
	}
	public byte[] getImage() {
		return image;
	}
	public void setImage(byte[] image) {
		this.image = image;
	}
	
	
	private String service;
	private String price;
	private String item1;
	private String item2;
	private String item3;
	private String category;
	private String per;


	public String getPer() {
		return per;
	}
	public void setPer(String per) {
		this.per = per;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}


	@Lob
	@Column(columnDefinition="LONGBLOB")
	private byte[] image;
	
	
}
