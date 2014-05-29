package it.uniroma3.model;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

@Stateless(name="administratorFacade")
public class AdministratorFacade {
	
    @PersistenceContext(unitName = "siw-project")
    private EntityManager em;
    
	public Administrator createAdministrator(String nickname, String password) {
		Administrator administrator = new Administrator(nickname, password);
		em.persist(administrator);
		return administrator;
	}
	
	public Administrator getAdministratorByNickname(String nickname) {
		Query q = em.createQuery("SELECT a FROM Administrator a WHERE a.nickname = :nickname");
		q.setParameter("nickname", nickname);
		Administrator administrator = (Administrator) q.getSingleResult();
		return administrator;
	}
	
	public void updateAdministrator(Administrator administrator) {
        em.merge(administrator);
	}
	
    private void deleteAdministrator(Administrator administrator) {
        em.remove(administrator);
    }

	public void deleteAdministrator(Long id) {
        Administrator administrator = em.find(Administrator.class, id);
        deleteAdministrator(administrator);
	}
}