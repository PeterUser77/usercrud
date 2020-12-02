package br.com.pedro.usercrud.models;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class ManagerFactory {
	
	private static EntityManagerFactory emf = null;
	
	public EntityManager getEmf() {
		if(emf == null) {
			emf = Persistence.createEntityManagerFactory("usercrud");
		}
		return emf.createEntityManager();
	}

}
