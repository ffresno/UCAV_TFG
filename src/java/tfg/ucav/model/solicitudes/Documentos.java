package tfg.ucav.model.solicitudes;
// Generated 05-may-2019 18:06:09 by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Documentos generated by hbm2java
 */
public class Documentos  implements java.io.Serializable {


     private Integer idDocumento;
     private String nombre;
     private String descripcion;
     private Set solicitudDocumentoses = new HashSet(0);

    public Documentos() {
    }

	
    public Documentos(String nombre) {
        this.nombre = nombre;
    }
    public Documentos(String nombre, String descripcion, Set solicitudDocumentoses) {
       this.nombre = nombre;
       this.descripcion = descripcion;
       this.solicitudDocumentoses = solicitudDocumentoses;
    }
   
    public Integer getIdDocumento() {
        return this.idDocumento;
    }
    
    public void setIdDocumento(Integer idDocumento) {
        this.idDocumento = idDocumento;
    }
    public String getNombre() {
        return this.nombre;
    }
    
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public String getDescripcion() {
        return this.descripcion;
    }
    
    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    public Set getSolicitudDocumentoses() {
        return this.solicitudDocumentoses;
    }
    
    public void setSolicitudDocumentoses(Set solicitudDocumentoses) {
        this.solicitudDocumentoses = solicitudDocumentoses;
    }




}

