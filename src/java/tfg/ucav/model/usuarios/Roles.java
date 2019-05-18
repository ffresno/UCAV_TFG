package tfg.ucav.model.usuarios;
// Generated 17-may-2019 10:27:49 by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Roles generated by hbm2java
 */
public class Roles  implements java.io.Serializable {


     private Integer idRole;
     private String description;
     private Set userses = new HashSet(0);

    public Roles() {
    }

    public Roles(String description, Set userses) {
       this.description = description;
       this.userses = userses;
    }
   
    public Integer getIdRole() {
        return this.idRole;
    }
    
    public void setIdRole(Integer idRole) {
        this.idRole = idRole;
    }
    public String getDescription() {
        return this.description;
    }
    
    public void setDescription(String description) {
        this.description = description;
    }
    public Set getUserses() {
        return this.userses;
    }
    
    public void setUserses(Set userses) {
        this.userses = userses;
    }




}


