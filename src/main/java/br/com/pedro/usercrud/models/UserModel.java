package br.com.pedro.usercrud.models;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import br.com.pedro.usercrud.entities.User;


public class UserModel extends ManagerFactory {
	
	EntityManager em = getEmf();
	
	public boolean create(User user) {
		boolean result = false;
		
		try {
			em.getTransaction().begin();
			em.persist(user);
			em.getTransaction().commit();
			return result = true;
		}catch (Exception e) {
			em.getTransaction().rollback();
			return result;
		}finally {
			em.close();
		}
	}
	
	public List<User> findAll() {
		List<User> users = null;
		
		try {
			em.getTransaction().begin();
			TypedQuery<User> query = em.createQuery("from User user", User.class);
			users = query.getResultList();
			em.getTransaction().commit();
		}catch (Exception e) {
			em.getTransaction().rollback();
		} finally {
			em.close();
		}
		
		return users;
	}

	public boolean delete(User user) {
		boolean result = false;
	
		try {
			em.getTransaction().begin();
			user = em.find(user.getClass(), user.getId());
			em.remove(user);
			em.getTransaction().commit();
			result = true;
			
			return result;
		} catch (Exception e) {
			em.getTransaction().rollback();
			
			return result;
		} finally {
			em.close();
		}
	}

	public boolean edit(User user) {
		boolean result = false;
		
		try {
			em.getTransaction().begin();
			em.merge(user);
			em.getTransaction().commit();
		} catch (Exception e) {
			em.getTransaction().rollback();
		} finally {
			em.close();
		}
		
		return result;
	}
	
}
