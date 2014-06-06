package it.uniroma3.model;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless(name="orderLineFacade")
public class OrderLineFacade {
	
    @PersistenceContext(unitName = "siw-project")
    private EntityManager em;
    
	public OrderLine createOrderLine(float unitPrice, int quantity, Product product) {
		OrderLine orderLine = new OrderLine(unitPrice, quantity, product);
		em.persist(orderLine);
		return orderLine;
	}
	
	public OrderLine getOrderLine(Long id) {
	    OrderLine orderLine = em.find(OrderLine.class, id);
		return orderLine;
	}

	public void updateOrderLine(OrderLine orderLine) {
        em.merge(orderLine);
	}
	
    private void deleteOrderLine(OrderLine orderLine) {
        em.remove(orderLine);
    }

	public void deleteProduct(Long id) {
        OrderLine orderLine = em.find(OrderLine.class, id);
        deleteOrderLine(orderLine);
	}
}