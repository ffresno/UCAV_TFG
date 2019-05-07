/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tfg.ucav.dao.configuracion.estadossolicitud;

import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import tfg.ucav.model.configuracion.provincias.Provincias;
import tfg.ucav.model.solicitudes.SolicitudEstados;

/**
 *
 * @author fernandofresno
 */
public class EstadosSolicitudDAO {
    
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
    
    public List<SolicitudEstados> getEstados() throws Exception {
        List list = null;
        Transaction tx = null; 
        Session session = myConnectionHibernate();
        
        try{
            tx = session.beginTransaction();
            String query = "FROM SolicitudEstados ORDER BY NOMBRE";
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
    
    public int updateEstado(SolicitudEstados p){
        
      Session session = myConnectionHibernate();
      Transaction tx = null;
      
      try {
         tx = session.beginTransaction();
         SolicitudEstados estado = (SolicitudEstados)session.get(SolicitudEstados.class, p.getIdEstado()); 
         estado.setNombre( p.getNombre() );
         session.update(estado); 
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



        