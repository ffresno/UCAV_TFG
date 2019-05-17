/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tfg.ucav.dao.configuracion.provincias;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import tfg.ucav.model.configuracion.provincias.Provincias;
import tfg.ucav.model.usuarios.Users;

/**
 *
 * @author fernandofresno
 */
public class ProvinciasDAO {
    
    private static SessionFactory factory; 
    
    
    public static Session myConnectionHibernate() {
    
        
        try {
            factory = new Configuration().configure().buildSessionFactory();
        } catch (Throwable ex) { 
            System.err.println("Failed to create sessionFactory object." + ex);
            throw new ExceptionInInitializerError(ex); 
        }
        Session session = factory.openSession();
            
            return session;
    
    }
    
    public List<Provincias> getProvincias() throws Exception {
        List listProvincias = null;
        Transaction tx = null; 
        Session session = myConnectionHibernate();
        
        try{
            tx = session.beginTransaction();
            String query = "FROM Provincias ORDER BY NOMBRE";
            listProvincias = session.createQuery(query).list(); 
            tx.commit();
          } catch (HibernateException e) {
             if (tx!=null) tx.rollback();
             e.printStackTrace(); 
          } finally {
             session.close(); 
          }
        return listProvincias;
        
    }
    
    
    public int updateProvincia(Provincias prov){
        
      Session session = myConnectionHibernate();
      Transaction tx = null;
      
      try {
         tx = session.beginTransaction();
         Provincias provincia = (Provincias)session.get(Provincias.class, prov.getIdProvincia()); 
         provincia.setNombre( prov.getNombre() );
         session.update(provincia); 
         tx.commit();
         return 1;
      } catch (HibernateException e) {
         if (tx!=null) tx.rollback();
         e.printStackTrace(); 
         return 0;
      } finally {
         session.close(); 
      }
   }
    
    public int deleteProvincia(int id){
        
      Session session = myConnectionHibernate();
      Transaction tx = null;
      
      try {
         tx = session.beginTransaction();
         Provincias provincia = (Provincias) session.get(Provincias.class, id);
         session.delete(provincia); 
         tx.commit();
         return 1;
      } catch (HibernateException e) {
         if (tx!=null) tx.rollback();
         e.printStackTrace(); 
         return 0;
      } finally {
         session.close(); 
      }
   }
    
    /**
     *
     * @param id
     * @return
     * @throws Exception
     */
    public Provincias getProvinciasById(int id) throws Exception {
        Provincias provincia = null;
        Transaction tx = null; 
        Session session = myConnectionHibernate();
        
        try{
            tx = session.beginTransaction();
            //String query = "FROM Solicitudes WHERE iduser = ?";
            Query query = session.createQuery("FROM Provincias WHERE id = ?");
            query.setInteger(0, id);
            provincia = (Provincias) query.uniqueResult();
            //listSolicitudes.size();
            tx.commit();
          } catch (HibernateException e) {
             if (tx!=null) tx.rollback();
             e.printStackTrace(); 
          } finally {
             session.close(); 
          }
        return provincia;
        
    }
    
}



        