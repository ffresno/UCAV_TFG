/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tfg.ucav.dao.solicitudes;


import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import static tfg.ucav.dao.configuracion.provincias.ProvinciasDAO.myConnectionHibernate;
import tfg.ucav.model.configuracion.provincias.Provincias;
import tfg.ucav.model.solicitudes.SolicitudDetalle;
import tfg.ucav.model.solicitudes.Solicitudes;

/**
 *
 * @author fernandofresno
 */
public class SolicitudesDAO {
    
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
    
    public int newSolicitud(Solicitudes solicitud){
        
      Session session = myConnectionHibernate();
      Transaction tx = null;
      
      try {
         tx = session.beginTransaction();
         session.save(solicitud); 
         
        /*for(Object solDetalle : solicitud.getSolicitudDetalles()){
            session.save((SolicitudDetalle)solDetalle);
         }*/
         
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
    
    
   public List<Solicitudes> getSolicitudesByUser(int userId) throws Exception {
        List listSolicitudes = null;
        Transaction tx = null; 
        Session session = myConnectionHibernate();
        
        try{
            tx = session.beginTransaction();
            //String query = "FROM Solicitudes WHERE iduser = ?";
            Query query = session.createQuery("FROM Solicitudes WHERE idUser = ?");
            query.setInteger(0, userId);
            
            listSolicitudes = query.list();
            
            tx.commit();
            System.out.println(listSolicitudes.size());
          } catch (HibernateException e) {
             if (tx!=null) tx.rollback();
             e.printStackTrace(); 
          } finally {
             session.close(); 
          }
        return listSolicitudes;
        
    }
}



        