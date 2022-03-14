package model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Category {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(length = 10)
	private int cId;
	@Column(length = 50)
	private String cName;
	@OneToMany(mappedBy = "category")
	private List<Product> products=new ArrayList<>();
	
	
	public Category() {
		super();
	}
	public Category(String cName, List<Product> products) {
		super();
		this.cName = cName;
		this.products = products;
	}
	public int getcId() {
		return cId;
	}
	public void setcId(int cId) {
		this.cId = cId;
	}
	public String getcName() {
		return cName;
	}
	public void setcName(String cName) {
		this.cName = cName;
	}
	public List<Product> getProducts() {
		return products;
	}
	public void setProducts(List<Product> products) {
		this.products = products;
	}
	@Override
	public String toString() {
		return "Category [cId=" + cId + ", cName=" + cName + "]";
	}
	
}
