package it.uniroma3.model;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.CriteriaQuery;

import java.util.List;

@Stateless(name="providerFacade")
public class ProviderFacade {
	
    @PersistenceContext(unitName = "siw-project")
    private EntityManager em;
    
	public Provider createProvider(String name, String phonenumber, String email, String vatin, String street, String city, String state, String zipcode, String country) {
		Address address = new Address(street, city, state, zipcode, country);
		em.persist(address);
		Provider provider = new Provider(name, phonenumber, email, vatin, address);
		em.persist(provider);
		return provider;
	}
	
	public Provider getProvider(String name) {
	    Provider provider = em.find(Provider.class, name);
		return provider;
	}
	
	public List<Provider> getAllProvider() {
        CriteriaQuery<Provider> cq = em.getCriteriaBuilder().createQuery(Provider.class);
        cq.select(cq.from(Provider.class));
        List<Provider> providers = em.createQuery(cq).getResultList();
		return providers;
	}

	public void updateProvider(Provider provider) {
        em.merge(provider);
	}
	
    private void deleteProvider(Provider provider) {
        em.remove(provider);
    }

	public void deleteProduct(Long id) {
        Provider provider = em.find(Provider.class, id);
        deleteProvider(provider);
	}
}