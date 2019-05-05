package tfg.ucav.model.solicitudes;
// Generated 05-may-2019 18:06:09 by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * SolicitudEstados generated by hbm2java
 */
public class SolicitudEstados  implements java.io.Serializable {


     private Integer idEstado;
     private String nombre;
     private Set solicitudeses = new HashSet(0);

    public SolicitudEstados() {
    }

    public SolicitudEstados(String nombre, Set solicitudeses) {
       this.nombre = nombre;
       this.solicitudeses = solicitudeses;
    }
   
    public Integer getIdEstado() {
        return this.idEstado;
    }
    
    public void setIdEstado(Integer idEstado) {
        this.idEstado = idEstado;
    }
    public String getNombre() {
        return this.nombre;
    }
    
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public Set getSolicitudeses() {
        return this.solicitudeses;
    }
    
    public void setSolicitudeses(Set solicitudeses) {
        this.solicitudeses = solicitudeses;
    }




}


