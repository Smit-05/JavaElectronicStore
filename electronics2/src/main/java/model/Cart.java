package model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

@Entity
public class Cart {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(length = 10)
	private int cartId;
	@Column(length = 10)
	private int quantity;
	@Column(length = 100)
	private int cartPrice;
	@ManyToOne
	@JoinColumn(name = "pId")
	private Product product;
	@ManyToOne
	@JoinColumn(name = "uId")
	private User user;
	
	public Cart() {
		super();
	}

	public Cart(int cartId, int quantity, int cartPrice, Product product, User user) {
		super();
		this.cartId = cartId;
		this.quantity = quantity;
		this.cartPrice = cartPrice;
		this.product = product;
		this.user = user;
	}

	public int getCartId() {
		return cartId;
	}

	public void setCartId(int cartId) {
		this.cartId = cartId;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getCartPrice() {
		return cartPrice;
	}

	public void setCartPrice(int cartPrice) {
		this.cartPrice = cartPrice;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
}
