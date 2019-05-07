/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tfg.ucav.dao.solicitudes;


import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.commons.io.FileUtils;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import static tfg.ucav.dao.configuracion.provincias.ProvinciasDAO.myConnectionHibernate;
import tfg.ucav.model.configuracion.provincias.Provincias;
import tfg.ucav.model.solicitudes.Documentos;
import tfg.ucav.model.solicitudes.SolicitudDetalle;
import tfg.ucav.model.solicitudes.SolicitudDocumentos;
import tfg.ucav.model.solicitudes.Solicitudes;

/**
 *
 * @author fernandofresno
 */
public class SolicitudesDAO {
    
    private static SessionFactory factory; 
    
    private String saveDirectory;
    
    public String getSaveDirectory() {
        return this.saveDirectory;
    }
    public void setSaveDirectory(String saveDir) {
        this.saveDirectory = saveDir;
    }
    
    
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
            Query query = session.createQuery("FROM Solicitudes WHERE id_user = ?");
            query.setInteger(0, userId);
            listSolicitudes = query.list();
            //listSolicitudes.size();
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
   
   public Solicitudes getSolicitudById(int id) throws Exception {
        Solicitudes solicitud = null;
        Transaction tx = null; 
        Session session = myConnectionHibernate();
        
        try{
            tx = session.beginTransaction();
            //String query = "FROM Solicitudes WHERE iduser = ?";
            Query query = session.createQuery("FROM Solicitudes WHERE id = ?");
            query.setInteger(0, id);
            solicitud = (Solicitudes) query.uniqueResult();
            //listSolicitudes.size();
            tx.commit();
          } catch (HibernateException e) {
             if (tx!=null) tx.rollback();
             e.printStackTrace(); 
          } finally {
             session.close(); 
          }
        return solicitud;
        
    }
   
   public List<Documentos> getDocumentos() throws Exception {
        List listDocumentos = null;
        Transaction tx = null; 
        Session session = myConnectionHibernate();
        
        try{
            tx = session.beginTransaction();
            String query = "FROM Documentos ORDER BY NOMBRE";
            listDocumentos = session.createQuery(query).list(); 
            tx.commit();
          } catch (HibernateException e) {
             if (tx!=null) tx.rollback();
             e.printStackTrace(); 
          } finally {
             session.close(); 
          }
        return listDocumentos;
        
    }
   
   /**
    * Sube los documentos al servidor y los adjunta a la solicitud
    */
   public int uploadDocumentos(int idSolicitud, File[] filesToUpload, 
                                String[] fileUploadFileName, String[] fileUploadContentType) throws Exception {
       
       //obtenemos la solicitud
        Solicitudes solicitud;
        Set setDocumentosSolicitud = new HashSet(0);
        solicitud = this.getSolicitudById(idSolicitud);
        List<Documentos> listDocumentos = this.getDocumentos();
        
        
        
       // copy the uploaded files into pre-configured location
        for (int i = 0; i < filesToUpload.length; i++) {
            
            File uploadedFile = filesToUpload[i];
            String fileName = fileUploadFileName[i];
            String rutaFichero = this.getSaveDirectory() + File.separator + fileName;
            File destFile = new File(rutaFichero);
            try {
                FileUtils.copyFile(uploadedFile, destFile);
                SolicitudDocumentos solDoc = new SolicitudDocumentos();
                //Create a new soliciutdDocumento
                solDoc.setSolicitudes(solicitud);
                solDoc.setRutaDocumento(rutaFichero);
                solDoc.setDocumentos(listDocumentos.get(i));
                setDocumentosSolicitud.add(solDoc);
            } catch (IOException ex) {
                System.out.println("Could not copy file " + fileName);
                ex.printStackTrace();
                return 0;
            }
        }
        //Set documentos to solicitud
        solicitud.setSolicitudDocumentoses(setDocumentosSolicitud);
        this.updateSolicitud(solicitud);
        
        return 1;
   }
   
   public int updateSolicitud(Solicitudes sol){
        
      Session session = myConnectionHibernate();
      Transaction tx = null;
      
      try {
         tx = session.beginTransaction();
         session.update(sol); 
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



        