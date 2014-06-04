package it.uniroma3.model;

import java.util.List;

import javax.persistence.*;

@Entity
@NamedQuery(name = "findAllProviders", query = "SELECT pr FROM Provider pr")
public class Provider {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	@Column(unique = true)
	private String name;
	
	@Column
	private String phoneNumber;
	
	@Column
	private String email;
	
	@Column
	private String vatin;
	
	@ManyToMany(mappedBy = "providers")
	private List<Product> products;
	
	@OneToOne
	private Address address;

	public Provider(){
	}
	
	public Provider(String name, String phonenumber, String email, String vatin, Address address){
		this.name = name;
		this.phoneNumber = phonenumber;
		this.email = email;
		this.vatin = vatin;
		this.address = address;
	}
	
	public void addProduct(Product product) {
		this.products.add(product);
	}
	
//  Getters & Setters   
	
	
	public Long getId() {
	        return id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phonenumber) {
		this.phoneNumber = phonenumber;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getVatin() {
		return vatin;
	}

	public void setVatin(String vatin) {
		this.vatin = vatin;
	}
	
	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}
	
	public List<Product> getProducts() {
		return products;
	}

	public void setProducts(List<Product> products) {
		this.products = products;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Provider other = (Provider) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Provider [id=" + id + ", name=" + name + ", phonenumber="
				+ phoneNumber + ", email=" + email + ", vatin=" + vatin + "]";
	}
}
