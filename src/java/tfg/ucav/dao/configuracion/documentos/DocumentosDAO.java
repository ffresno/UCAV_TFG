/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tfg.ucav.dao.configuracion.documentos;

import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import tfg.ucav.model.solicitudes.Documentos;
import tfg.ucav.model.solicitudes.SolicitudEstados;

/**
 *
 * @author fernandofresno
 */
public class DocumentosDAO {
    
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
    
    public List<Documentos> getDocumentos() throws Exception {
        List list = null;
        Transaction tx = null; 
        Session session = myConnectionHibernate();
        
        try{
            tx = session.beginTransaction();
            String query = "FROM Documentos";
            list = session.createQuery(query).list(); 
            tx.commit();
          } catch (HibernateException e) {
             if (tx!=null) tx.rollback();
             e.printStackTrace(); 
          } finally {
             session.close(); 
          }
        return list;
        
    }
    
    public int updateDocumento(Documentos p){
        
      Session session = myConnectionHibernate();
      Transaction tx = null;
      
      try {
        tx = session.beginTransaction();
        Documentos doc = (Documentos)session.get(Documentos.class, p.getIdDocumento()); 
        doc.setNombre( p.getNombre() );
        doc.setDescripcion( p.getDescripcion() );
         session.update(doc); 
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
    
    public int insertDocumento(Documentos doc){
        
      Session session = myConnectionHibernate();
      Transaction tx = null;
      
      try {
        tx = session.beginTransaction();
         session.save(doc); 
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
     public int deleteDocumento(int id){
        
      Session session = myConnectionHibernate();
      Transaction tx = null;
      
      try {
         tx = session.beginTransaction();
         Documentos doc = (Documentos) session.get(Documentos.class, id);
         session.delete(doc); 
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
}



        