package it.uniroma3.model;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.CriteriaQuery;
import java.util.List;

@Stateless
public class OrderLineFacade {
	
    @PersistenceContext(unitName = "siw-project")
    private EntityManager em;
    
	public OrderLine createOrderLine(float unitPrice, int quantity, Product product) {
		OrderLine orderLine = new OrderLine(unitPrice, quantity, product);
		em.persist(orderLine);
		return orderLine;
	}
	
	public OrderLine getProduct(Long id) {
	    OrderLine product = em.find(OrderLine.class, id);
		return product;
	}
	
	public List<OrderLine> getAllProducts() {
        CriteriaQuery<OrderLine> cq = em.getCriteriaBuilder().createQuery(OrderLine.class);
        cq.select(cq.from(OrderLine.class));
        List<OrderLine> products = em.createQuery(cq).getResultList();
		return products;
	}

	public void updateProduct(OrderLine product) {
        em.merge(product);
	}
	
    private void deleteProduct(OrderLine product) {
        em.remove(product);
    }

	public void deleteProduct(Long id) {
        OrderLine product = em.find(OrderLine.class, id);
        deleteProduct(product);
	}
}