package it.uniroma3.controller;

import java.util.ArrayList;
import java.util.List;

import it.uniroma3.model.Order;
import it.uniroma3.model.OrderFacade;
import it.uniroma3.model.OrderLine;
import it.uniroma3.model.OrderLineFacade;
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
	private List<Product> products;
	private Provider provider;
	private String providerName;

	private String providerNameDelete;

	@ManagedProperty(value="#{sessionScope['providersProduct']}")
	private List<Provider> providers;

	@ManagedProperty(value="#{sessionScope['currentProduct']}")
	private Product product;
	
	@EJB(beanName="productFacade")
	private ProductFacade productFacade;
	
	@EJB(beanName="providerFacade")
	private ProviderFacade providerFacade;
	
	@EJB(beanName="orderFacade")
	private OrderFacade orderFacade;
	
	@EJB(beanName="orderLineFacade")
	private OrderLineFacade orderLineFacade;
	
	public String createProduct() {
		try{
			this.provider = providerFacade.getProvider(this.providerName);
			this.product = productFacade.createProduct(name, code, price, description, quantity, provider);
			this.provider.addProduct(this.product);
			FacesContext.getCurrentInstance().getExternalContext().getSessionMap().put("currentProduct", this.product);
			return "product";
		}catch(Exception e){
			/*Codice prodotto gia esistente nel DB*/
			this.resetProduct();
			FacesContext.getCurrentInstance().addMessage("newProduct:createProduct", new FacesMessage("Codice Prodotto gia esistente!"));
			return "newProduct";
		}
	}
	
	public String updateProduct() {
		productFacade.updateProduct(this.product);
		return "product";
	}
	
	public String addProvider() {
		this.provider = providerFacade.getProvider(this.providerName);
		this.product.addProvider(this.provider);
		productFacade.updateProduct(this.product);
		providerFacade.updateProvider(this.provider);
		
		updateListProvider();
		return "modifyProduct";
	}
	
	private void resetProduct(){
		this.name = null;
		this.code = null;
		this.price = null;
		this.description = null;
		this.quantity = 0;
		this.provider = null;
	}
	
	public String removeProvider() {
		this.provider = providerFacade.getProvider(this.providerNameDelete);
		this.product.removeProvider(this.provider);
		productFacade.updateProduct(this.product);
		providerFacade.updateProvider(this.provider);
		
		updateListProvider();
		return "modifyProduct";
	}
	
	private void updateListProvider() {
		// aggiornamento lista nuovi provider del prodotto
		List<Provider> providersTot = new ArrayList<Provider>(providerFacade.getAllProvider());
		List<Provider> providerCancel = new ArrayList<Provider>(this.product.getProviders());
		providersTot.removeAll(providerCancel); // vengono visualizzati solo i provider non associati al prodotto
		this.providers = providersTot;
		FacesContext.getCurrentInstance().getExternalContext().getSessionMap().remove("providersProduct");
		FacesContext.getCurrentInstance().getExternalContext().getSessionMap().put("providersProduct", this.providers);
		// ************************************************
	}
	
	public String deleteProduct(){
		/*se il prodotto è associato a qualche riga ordine di qualche ordine, va cancellata la riga d'ordine
		 * altrimenti all'evasione ci sarà un prodotto non piu disponibile*/
		List<Order> allOrders = this.orderFacade.getAllOrder();
		List<OrderLine> righe_ordini = new ArrayList<OrderLine>();
		if(allOrders.size() != 0){
		for(Order ordine: allOrders){
			 righe_ordini.clear();
			 righe_ordini = ordine.getOrderLines();
				if(righe_ordini.size() != 0){
					for(OrderLine rigaordine: righe_ordini){
						if (rigaordine.getProduct().getId().equals(product.getId())){
							this.orderLineFacade.deleteOrderLine(rigaordine.getId());
							ordine.setProdottoCancellato(true);
							this.orderFacade.updateOrder(ordine);
						}
					}
				}
			}
		}
		
		this.productFacade.deleteProduct(product.getId());
		return "administratorPage";
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
		FacesContext.getCurrentInstance().getExternalContext().getSessionMap().put("currentProduct", this.product);
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
	
	public List<Provider> getProviders() {
		return providers;
	}

	public void setProviders(List<Provider> providers) {
		this.providers = providers;
	}
	
	public String getProviderNameDelete() {
		return providerNameDelete;
	}

	public void setProviderNameDelete(String providerNameDelete) {
		this.providerNameDelete = providerNameDelete;
	}
	
	public String getProviderName() {
		return providerName;
	}

	public void setProviderName(String providerName) {
		this.providerName = providerName;
	}
}