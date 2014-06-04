package it.uniroma3.controller;

import java.util.List;

import it.uniroma3.model.Product;
import it.uniroma3.model.ProductFacade;
import it.uniroma3.model.Provider;
import it.uniroma3.model.ProviderFacade;

import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.context.FacesContext;

@ManagedBean
public class ProductController {
	
	@ManagedProperty(value="#{param.id}")
	private Long id;
	
	private String name, description, code;
	private Float price;
	private int quantity; //quantità di magazzino
	private Product product;
	private List<Product> products;
	private Provider provider;
	private String productName;
	
	@EJB(beanName="productFacade")
	private ProductFacade productFacade;
	
	@EJB(beanName="providerFacade")
	private ProviderFacade providerFacade;
	
	public String createProduct() {
		this.provider = providerFacade.getProvider(this.productName);
		this.product = productFacade.createProduct(name, code, price, description, quantity, provider);
		this.provider.addProduct(this.product);
		return "product";
	}
	
	public String addProvider() {
		this.product = productFacade.getProduct(id);
		try{
			this.provider = providerFacade.getProvider(this.productName);
			this.product.addProvider(this.provider);
			this.provider.addProduct(this.product);
			return "modifyProduct";
		}catch(Exception e){
			FacesContext.getCurrentInstance().addMessage("addProviderMenu:addProvider", new FacesMessage("Questo fornitore e' gia' associato!"));
			return "modifyProduct";
		}
	}

	public String deleteProduct(){
		this.productFacade.deleteProduct(id);
		return "deletedProduct";
	}
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String listProducts() {
		this.products = productFacade.getAllProducts();
		return "products"; 
	}

	public String findProduct() {
		this.product = productFacade.getProduct(id);
		return "product";
	}
	
	public String findProduct(Long id) {
		this.product = productFacade.getProduct(id);
		return "product";
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Float getPrice() {
		return price;
	}

	public void setPrice(Float price) {
		this.price = price;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}
	
	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public Provider getProvider() {
		return provider;
	}

	public void setProvider(Provider provider) {
		this.provider = provider;
	}

	public List<Product> getProducts() {
		return products;
	}

	public void setProducts(List<Product> products) {
		this.products = products;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}
}