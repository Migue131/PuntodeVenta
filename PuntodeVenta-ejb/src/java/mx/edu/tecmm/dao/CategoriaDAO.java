/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mx.edu.tecmm.dao;

import java.io.Serializable;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import mx.edu.tecmm.modelo.Categorias;

/**
 *
 * @author miguel
 */
public class CategoriaDAO implements Serializable{
    
    private EntityManager em;
    
    public CategoriaDAO(){
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("PuntodeVenta-ejbPU");
        em=emf.createEntityManager();
    }
    
    public boolean crear(Categorias categoria){
        em.getTransaction().begin();
        em.persist(categoria);
        em.getTransaction().commit();
        return true;
    }
    
    public boolean editar(Categorias categoria){
        if (categoria.getId()==null) {
            return false;
        }else{
            System.out.println("Se actualizo");
            em.getTransaction().begin();
            em.merge(categoria);
            em.getTransaction().commit();
            return true;
        }
    }
    
    public boolean eliminar(Categorias categoria){
        em.getTransaction().begin();
        em.remove(em.merge(categoria));
        em.getTransaction().commit();
        return true;
    }
    
}
