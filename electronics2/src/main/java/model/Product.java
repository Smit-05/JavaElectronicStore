package model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.DynamicUpdate;

@Entity
public class Product {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(length = 10)
	private int pId;
	@Column(length = 50,unique = true)
	private String pName;
	@Column(length = 1000)
	private String pDesc;
	@Column(length = 10)
	private int pPrice;
	@Column(length = 10)
	private int pDiscount;
	private String pPic;
	@Column(length = 20)
	private int pQuantity;
	@ManyToOne
	@JoinColumn(name = "category_i")
	private Category category;
	
	
	public Product() {
		super();
	}
	
	public Product(String pName, String pDesc, int pPrice, int pDiscount, String pPic, int pQuantity,
			Category category) {
		super();
		this.pName = pName;
		this.pDesc = pDesc;
		this.pPrice = pPrice;
		this.pDiscount = pDiscount;
		this.pPic = pPic;
		this.pQuantity = pQuantity;
		this.category = category;
	}
	public int getpId() {
		return pId;
	}
	public void setpId(int pId) {
		this.pId = pId;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public String getpDesc() {
		return pDesc;
	}
	public void setpDesc(String desc) {
		pDesc = desc;
	}
	public int getpPrice() {
		return pPrice;
	}
	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}
	public int getpDiscount() {
		return pDiscount;
	}
	public void setpDiscount(int pDiscount) {
		this.pDiscount = pDiscount;
	}
	public String getpPic() {
		return pPic;
	}
	public void setpPic(String pPic) {
		this.pPic = pPic;
	}
	public int getpQuantity() {
		return pQuantity;
	}
	public void setpQuantity(int pQuantity) {
		this.pQuantity = pQuantity;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}

	@Override
	public String toString() {
		return "Product [pId=" + pId + ", pName=" + pName + ", pDesc=" + pDesc + ", pPrice=" + pPrice + ", pDiscount="
				+ pDiscount + ", pPic=" + pPic + ", pQuantity=" + pQuantity + ", category=" + category + "]";
	}


	
	
}
