package tfg.ucav.model.configuracion.provincias;
// Generated 17-may-2019 10:27:49 by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Provincias generated by hbm2java
 */
public class Provincias  implements java.io.Serializable {


     private Integer idProvincia;
     private String nombre;
     private Set solicitudeses = new HashSet(0);

    public Provincias() {
    }

	
    public Provincias(String nombre) {
        this.nombre = nombre;
    }
    public Provincias(String nombre, Set solicitudeses) {
       this.nombre = nombre;
       this.solicitudeses = solicitudeses;
    }
   
    public Integer getIdProvincia() {
        return this.idProvincia;
    }
    
    public void setIdProvincia(Integer idProvincia) {
        this.idProvincia = idProvincia;
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


