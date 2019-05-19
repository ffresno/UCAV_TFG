/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tfg.ucav.dao.solicitudes;


import java.io.File;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.apache.commons.io.FileUtils;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import tfg.ucav.model.solicitudes.Documentos;
import tfg.ucav.model.solicitudes.SolicitudDocumentos;
import tfg.ucav.model.solicitudes.SolicitudDocumentosId;
import tfg.ucav.model.solicitudes.Solicitudes;
import org.apache.struts2.interceptor.SessionAware;
import static tfg.ucav.dao.configuracion.cursos.CursosDAO.myconnection;
import tfg.ucav.dao.configuracion.estadossolicitud.EstadosSolicitudDAO;
import static tfg.ucav.dao.configuracion.provincias.ProvinciasDAO.myConnectionHibernate;
import tfg.ucav.model.configuracion.provincias.Provincias;
import tfg.ucav.model.solicitudes.SolicitudEstados;
import tfg.ucav.model.usuarios.Users;
import tfg.ucav.util.Mailer;

/**
 *
 * @author fernandofresno
 */
public class SolicitudesDAO implements SessionAware {
    
    private static SessionFactory factory; 
    
    private String saveDirectory;
    private Map<String, Object> session;
    
    /**
     *
     * @param session
     */
    @Override
    public void setSession(Map<String, Object> session) {
        this.session = session;
    }
    
    
    /**
     *
     * @return
     */
    public String getSaveDirectory() {
        return this.saveDirectory;
    }

    /**
     *
     * @param saveDir
     */
    public void setSaveDirectory(String saveDir) {
        this.saveDirectory = saveDir;
    }
    
    /**
     *
     * @return
     */
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
    
    /**
     *
     * @param solicitud
     * @return
     */
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
    
    /**
     * Obtiene las solicitudes de un usuario
     * @param userId
     * @return
     * @throws Exception
     */
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
   
    /**
     *
     * @param id
     * @return
     * @throws Exception
     */
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
    /**
     * Obtiene todas las solicitudes ordenadas por fecha inversa
     * @return List
     * @throws Exception
     */
    public List<Solicitudes> getSolicitudes() throws Exception {
        List listSolicitudes = null;
        Transaction tx = null; 
        Session session = myConnectionHibernate();
        
        try{
            tx = session.beginTransaction();
            Query query = session.createQuery("FROM Solicitudes ORDER BY idSolicitud");
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
   
    /**
     *
     * @return
     * @throws Exception
     */
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
     * @param idSolicitud
     * @param filesToUpload
     * @param fileUploadFileName
     * @param fileUploadContentType
     * @return 
     * @throws java.lang.Exception 
    */
   public int uploadDocumentos( String filePath, int idSolicitud, File[] filesToUpload, 
                                String[] fileUploadFileName, String[] fileUploadContentType) throws Exception {
       
       //obtenemos la solicitud
        Set setDocumentosSolicitud = new HashSet(0);
        Solicitudes solicitud = this.getSolicitudById(idSolicitud);
        //Listado de documentos necesarios
        List<Documentos> listDocumentos = this.getDocumentos();
        String pathUsuario = solicitud.getUsers().getEmail();
        File dir = new File(filePath + pathUsuario);
            if (!dir.exists())
                dir.mkdirs();
       // copy the uploaded files into pre-configured location
        for (int i = 0; i < filesToUpload.length; i++) {
            
            File uploadedFile = filesToUpload[i];
            String fileName = fileUploadFileName[i];
            //Default directory/email/filename 
            String rutaFichero = filePath + pathUsuario + File.separator + fileName;
            String rutaUrlFichero = pathUsuario + File.separator + fileName;;
            File destFile = new File(rutaFichero);
            try {
                FileUtils.copyFile(uploadedFile, destFile);
                SolicitudDocumentos solDoc = new SolicitudDocumentos();
                //Create a new soliciutdDocumento
                SolicitudDocumentosId solDocId = new SolicitudDocumentosId();
                solDocId.setIdDocumento(listDocumentos.get(i).getIdDocumento());
                solDocId.setIdSolicitud(solicitud.getIdSolicitud());
                solDoc.setId(solDocId);
                solDoc.setSolicitudes(solicitud);
                solDoc.setRutaDocumento(rutaUrlFichero);
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
        return this.updateSolicitud(solicitud);
   }
   
    /**
     * Actualiza la solicitud
     * @param sol
     * @return int
     */
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
    
    /**
     * Borrar solicitud
     * @param id
     * @return int
     */
    public int deleteSolicitud(int id){
        
      Session session = myConnectionHibernate();
      Transaction tx = null;
      
      try {
         tx = session.beginTransaction();
         Solicitudes solicitud = (Solicitudes) session.get(Solicitudes.class, id);
         session.delete(solicitud); 
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
     * Borrar solicitud
     * @param id
     * @return int
     */
    public int acceptSolicitud(int id) throws Exception{
        
      Session session = myConnectionHibernate();
      Transaction tx = null;
      int ESTADO_SOLICITUD_ACEPTADA = 3;
      
      try {
         tx = session.beginTransaction();
         Solicitudes solicitud = (Solicitudes) session.get(Solicitudes.class, id);
         EstadosSolicitudDAO estadosSolicitudDAO = new EstadosSolicitudDAO();
         SolicitudEstados estadoACEPTADA = estadosSolicitudDAO.getEstadoById(ESTADO_SOLICITUD_ACEPTADA);
         solicitud.setSolicitudEstados(estadoACEPTADA);
         session.update(solicitud); 
         tx.commit();
         this.sendAcceptEmail(solicitud.getUsers());
         return 1;
      } catch (HibernateException e) {
         if (tx!=null) tx.rollback();
         e.printStackTrace(); 
         return 0;
      } finally {
         session.close(); 
      }
   }
    
    public void sendAcceptEmail (Users usuario) {
        //send email
        //to,subject,message  
        String msg = "Estimado " + usuario.getNombre() + " tu solicitud ha sido aceptada.\n "
                + " Puedes consultar su estado y adjuntar los documentos"
                + " que se necesitan adjuntar para poder formalizar la matricula.\n"
                + "\nUn saludo\n";
        
        
        Mailer.send(usuario.getEmail() ,"Solicitud aceptada " , msg);
    }
    
    public void sendRejectEmail (Users usuario, String motivo) {
        //send email
        //to,subject,message  
        String msg = "Estimado " + usuario.getNombre() + " tu solicitud ha sido rechazada.\n "
                + " Tu solicitud ha sido rechazada por el siguiente motivo:\n"
                + motivo
                + "\nUn saludo\n";
        
        
        Mailer.send(usuario.getEmail() ,"Solicitud rechazada" , msg);
    }
    
}



        