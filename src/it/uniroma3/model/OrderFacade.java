package it.uniroma3.model;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.CriteriaQuery;

import java.util.Date;
import java.util.List;

@Stateless(name="orderFacade")
public class OrderFacade {
	
    @PersistenceContext(unitName = "siw-project")
    private EntityManager em;
    
	public Order createOrder(Date creationTime, Customer customer) {
		Order order = new Order(creationTime, customer);
		em.persist(order);
		return order;
	}
	
	public Order getOrder(Long id) {
	    Order order = em.find(Order.class, id);
		return order;
	}
	
	public List<Order> getAllOrder() {
        CriteriaQuery<Order> cq = em.getCriteriaBuilder().createQuery(Order.class);
        cq.select(cq.from(Order.class));
        List<Order> orders = em.createQuery(cq).getResultList();
		return orders;
	}
	
	public void updateOrder(Order order) {
        em.merge(order);
	}
	
    private void deleteOrder(Order order) {
        em.remove(order);
    }

	public void deleteProduct(Long id) {
        Order order = em.find(Order.class, id);
        deleteOrder(order);
	}
}