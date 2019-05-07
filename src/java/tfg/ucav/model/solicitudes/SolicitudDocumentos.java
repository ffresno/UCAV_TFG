package tfg.ucav.model.solicitudes;
// Generated 05-may-2019 18:06:09 by Hibernate Tools 4.3.1



/**
 * SolicitudDocumentos generated by hbm2java
 */
public class SolicitudDocumentos  implements java.io.Serializable {


     private SolicitudDocumentosId id;
     private Documentos documentos;
     private Solicitudes solicitudes;
     private String rutaDocumento;

    public SolicitudDocumentos() {
    }

    public SolicitudDocumentos(SolicitudDocumentosId id, Documentos documentos, Solicitudes solicitudes, String rutaDocumento) {
       this.id = id;
       this.documentos = documentos;
       this.solicitudes = solicitudes;
       this.rutaDocumento = rutaDocumento;
    }
   
    public SolicitudDocumentosId getId() {
        return this.id;
    }
    
    public void setId(SolicitudDocumentosId id) {
        this.id = id;
    }
    public Documentos getDocumentos() {
        return this.documentos;
    }
    
    public void setDocumentos(Documentos documentos) {
        this.documentos = documentos;
    }
    public Solicitudes getSolicitudes() {
        return this.solicitudes;
    }
    
    public void setSolicitudes(Solicitudes solicitudes) {
        this.solicitudes = solicitudes;
    }
    public String getRutaDocumento() {
        return this.rutaDocumento;
    }
    
    public void setRutaDocumento(String rutaDocumento) {
        this.rutaDocumento = rutaDocumento;
    }




}

