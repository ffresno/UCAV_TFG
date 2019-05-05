package tfg.ucav.model.solicitudes;
// Generated 05-may-2019 18:06:09 by Hibernate Tools 4.3.1


import tfg.ucav.model.configuracion.provincias.Provincias;
import java.util.HashSet;
import java.util.Set;
import tfg.ucav.model.usuarios.Users;

/**
 * Solicitudes generated by hbm2java
 */
public class Solicitudes  implements java.io.Serializable {


     private Integer idSolicitud;
     private Provincias provincias;
     private SolicitudEstados solicitudEstados;
     private Users users;
     private String nombre;
     private String apellidos;
     private String dni;
     private boolean sexohombre;
     private String direccion;
     private String nacionalidad;
     private String ciudad;
     private String codigoPostal;
     private String pais;
     private String telefono1;
     private String telefono2;
     private Set solicitudDetalles = new HashSet(0);
     private Set solicitudDocumentoses = new HashSet(0);

    public Solicitudes() {
    }

	
    public Solicitudes(Provincias provincias, SolicitudEstados solicitudEstados, Users users, String nombre, String apellidos, String dni, boolean sexohombre, String direccion, String nacionalidad, String ciudad, String codigoPostal, String pais, String telefono1) {
        this.provincias = provincias;
        this.solicitudEstados = solicitudEstados;
        this.users = users;
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.dni = dni;
        this.sexohombre = sexohombre;
        this.direccion = direccion;
        this.nacionalidad = nacionalidad;
        this.ciudad = ciudad;
        this.codigoPostal = codigoPostal;
        this.pais = pais;
        this.telefono1 = telefono1;
    }
    public Solicitudes(Provincias provincias, SolicitudEstados solicitudEstados, Users users, String nombre, String apellidos, String dni, boolean sexohombre, String direccion, String nacionalidad, String ciudad, String codigoPostal, String pais, String telefono1, String telefono2, Set solicitudDetalles, Set solicitudDocumentoses) {
       this.provincias = provincias;
       this.solicitudEstados = solicitudEstados;
       this.users = users;
       this.nombre = nombre;
       this.apellidos = apellidos;
       this.dni = dni;
       this.sexohombre = sexohombre;
       this.direccion = direccion;
       this.nacionalidad = nacionalidad;
       this.ciudad = ciudad;
       this.codigoPostal = codigoPostal;
       this.pais = pais;
       this.telefono1 = telefono1;
       this.telefono2 = telefono2;
       this.solicitudDetalles = solicitudDetalles;
       this.solicitudDocumentoses = solicitudDocumentoses;
    }
   
    public Integer getIdSolicitud() {
        return this.idSolicitud;
    }
    
    public void setIdSolicitud(Integer idSolicitud) {
        this.idSolicitud = idSolicitud;
    }
    public Provincias getProvincias() {
        return this.provincias;
    }
    
    public void setProvincias(Provincias provincias) {
        this.provincias = provincias;
    }
    public SolicitudEstados getSolicitudEstados() {
        return this.solicitudEstados;
    }
    
    public void setSolicitudEstados(SolicitudEstados solicitudEstados) {
        this.solicitudEstados = solicitudEstados;
    }
    public Users getUsers() {
        return this.users;
    }
    
    public void setUsers(Users users) {
        this.users = users;
    }
    public String getNombre() {
        return this.nombre;
    }
    
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public String getApellidos() {
        return this.apellidos;
    }
    
    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }
    public String getDni() {
        return this.dni;
    }
    
    public void setDni(String dni) {
        this.dni = dni;
    }
    public boolean isSexohombre() {
        return this.sexohombre;
    }
    
    public void setSexohombre(boolean sexohombre) {
        this.sexohombre = sexohombre;
    }
    public String getDireccion() {
        return this.direccion;
    }
    
    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }
    public String getNacionalidad() {
        return this.nacionalidad;
    }
    
    public void setNacionalidad(String nacionalidad) {
        this.nacionalidad = nacionalidad;
    }
    public String getCiudad() {
        return this.ciudad;
    }
    
    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }
    public String getCodigoPostal() {
        return this.codigoPostal;
    }
    
    public void setCodigoPostal(String codigoPostal) {
        this.codigoPostal = codigoPostal;
    }
    public String getPais() {
        return this.pais;
    }
    
    public void setPais(String pais) {
        this.pais = pais;
    }
    public String getTelefono1() {
        return this.telefono1;
    }
    
    public void setTelefono1(String telefono1) {
        this.telefono1 = telefono1;
    }
    public String getTelefono2() {
        return this.telefono2;
    }
    
    public void setTelefono2(String telefono2) {
        this.telefono2 = telefono2;
    }
    public Set getSolicitudDetalles() {
        return this.solicitudDetalles;
    }
    
    public void setSolicitudDetalles(Set solicitudDetalles) {
        this.solicitudDetalles = solicitudDetalles;
    }
    public Set getSolicitudDocumentoses() {
        return this.solicitudDocumentoses;
    }
    
    public void setSolicitudDocumentoses(Set solicitudDocumentoses) {
        this.solicitudDocumentoses = solicitudDocumentoses;
    }




}


