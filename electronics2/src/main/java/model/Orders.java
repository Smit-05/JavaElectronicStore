package model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Orders {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(length = 10)
	private int oId;
	@ManyToOne
	@JoinColumn(name = "uId")
	private User user;
	@Column(length=10)
	private String oDate;
	@Column(length=100)
	private String shippingAddress;
	@OneToMany(mappedBy = "order")
	private List<OrderedItems> orderItems = new ArrayList<>();
	
	public Orders() {}

	public Orders(int oId, User user, String oDate, String shippingAddress, List<OrderedItems> orderItems) {
		this.oId = oId;
		this.user = user;
		this.oDate = oDate;
		this.shippingAddress = shippingAddress;
		this.orderItems = orderItems;
	}

	public int getoId() {
		return oId;
	}

	public void setoId(int oId) {
		this.oId = oId;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getoDate() {
		return oDate;
	}

	public void setoDate(String oDate) {
		this.oDate = oDate;
	}

	public String getShippingAddress() {
		return shippingAddress;
	}

	public void setShippingAddress(String shippingAddress) {
		this.shippingAddress = shippingAddress;
	}

	public List<OrderedItems> getOrderItems() {
		return orderItems;
	}

	public void setOrderItems(List<OrderedItems> orderItems) {
		this.orderItems = orderItems;
	}	
	
}