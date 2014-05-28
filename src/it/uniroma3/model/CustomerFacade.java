package it.uniroma3.model;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaQuery;

import java.util.Date;
import java.util.List;

@Stateless
public class CustomerFacade {
	
    @PersistenceContext(unitName = "siw-project")
    private EntityManager em;
    
	public Customer createCustomer(String firstName, String lastName, String password, String email, String phoneNumber, Date dateOfBirth, Address address, Date registrationDate) {
		Customer customer = new Customer(firstName, lastName, password, email, phoneNumber, dateOfBirth, address, registrationDate);
		em.persist(customer);
		return customer;
	}
	
	public Customer getCustomerByEmail(String email) {
		Query q = em.createQuery("SELECT c FROM Customer c WHERE c.email = :email");
		q.setParameter("email", email);
		Customer customer = (Customer) q.getSingleResult();
		return customer;
	}
	
	public List<Customer> getAllCustomers() {
        CriteriaQuery<Customer> cq = em.getCriteriaBuilder().createQuery(Customer.class);
        cq.select(cq.from(Customer.class));
        List<Customer> customers = em.createQuery(cq).getResultList();
		return customers;
	}

	public void updateCustomer(Customer customer) {
        em.merge(customer);
	}
	
    private void deleteCustomer(Customer customer) {
        em.remove(customer);
    }

	public void deleteCustomer(Long id) {
        Customer customer = em.find(Customer.class, id);
        deleteCustomer(customer);
	}
}