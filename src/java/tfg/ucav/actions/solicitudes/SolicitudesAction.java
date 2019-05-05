/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tfg.ucav.actions.solicitudes;

import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.apache.struts2.interceptor.SessionAware;
import tfg.ucav.dao.configuracion.cursos.CursosDAO;
import tfg.ucav.dao.configuracion.provincias.ProvinciasDAO;
import tfg.ucav.dao.solicitudes.SolicitudesDAO;
import tfg.ucav.model.configuracion.cursos.Curso;
import tfg.ucav.model.configuracion.provincias.Provincias;
import tfg.ucav.model.solicitudes.SolicitudDetalle;
import tfg.ucav.model.solicitudes.SolicitudEstados;
import tfg.ucav.model.solicitudes.Solicitudes;
import tfg.ucav.model.usuarios.Users;

/**
 *
 * @author fernandofresno
 */
public class SolicitudesAction extends ActionSupport implements SessionAware {
    
    int intReturnValue;
    String msg;
    List<Provincias> listProvincias = new ArrayList<>();
    List<Curso> cursosDisponibles = new ArrayList<>();
    ArrayList<Curso> listCursos = new ArrayList<>();  
    
    List<Solicitudes> listSolicitudes = new ArrayList<>();
    
    SolicitudesDAO solicitudesDAO;
    ProvinciasDAO provinciasDAO;
    CursosDAO cursosDAO;
    
    Solicitudes solicitud;
    SolicitudDetalle solicitudDetalle;
    
    
    //atributos de la solicitud
    private Integer idSolicitud;
     private String nombre;
     private String apellidos;
     private String dni;
     private boolean sexohombre;
     private String direccion;
     private String ciudad;
     private String codigoPostal;
     private String pais;
     private String nacionalidad;
     private String telefono1;
     private String telefono2;
     private int idUser;
     private int idProvincia;
     private int idEstado;
     //aributos del detalle de la solicitud
     private int idCurso;
     private String NExpediente;
     private String estudiosAportados;
     private String centroProcedencia;
     private boolean primeraVez;
     private boolean repiteCurso;
     private boolean trasladoMatricula;
     private boolean exentoSeguro;
     
     private final int ESTADO_SOLICITUD_PENDIENTE = 1;
        
    private Map<String, Object> session;
    
    @Override
    public void setSession(Map<String, Object> session) {
        this.session = session;
    }
     
    public SolicitudDetalle getSolicitudDetalle() {
        return solicitudDetalle;
    }

    public void setSolicitudDetalle(SolicitudDetalle solicitudDetalle) {
        this.solicitudDetalle = solicitudDetalle;
    }

    public int getIdCurso() {
        return idCurso;
    }

    public void setIdCurso(int idCurso) {
        this.idCurso = idCurso;
    }

    public String getNExpediente() {
        return NExpediente;
    }

    public void setNExpediente(String NExpediente) {
        this.NExpediente = NExpediente;
    }

    public String getEstudiosAportados() {
        return estudiosAportados;
    }

    public void setEstudiosAportados(String estudiosAportados) {
        this.estudiosAportados = estudiosAportados;
    }

    public String getCentroProcedencia() {
        return centroProcedencia;
    }

    public void setCentroProcedencia(String centroProcedencia) {
        this.centroProcedencia = centroProcedencia;
    }

    public boolean isPrimeraVez() {
        return primeraVez;
    }

    public void setPrimeraVez(boolean primeraVez) {
        this.primeraVez = primeraVez;
    }

    public boolean getPrimeraVez() {
        return primeraVez;
    }
    
    public boolean getRepiteCurso() {
        return repiteCurso;
    }

    public void setRepiteCurso(boolean repiteCurso) {
        this.repiteCurso = repiteCurso;
    }

    public boolean getTrasladoMatricula() {
        return trasladoMatricula;
    }

    public void setTrasladoMatricula(boolean trasladoMatricula) {
        this.trasladoMatricula = trasladoMatricula;
    }

    public boolean getExentoSeguro() {
        return exentoSeguro;
    }

    
    public void setExentoSeguro(boolean exentoSeguro) {
        this.exentoSeguro = exentoSeguro;
    }
     
     

    public List<Curso> getCursosDisponibles() {
        return cursosDisponibles;
    }

    public void setCursosDisponibles(List<Curso> cursosDisponibles) {
        this.cursosDisponibles = cursosDisponibles;
    }
    
    public List<Solicitudes> getListSolicitudes() {
        return listSolicitudes;
    }

    public void setListSolicitudes(List<Solicitudes> solis) {
        this.listSolicitudes = solis;
    }

    public ProvinciasDAO getProvinciasDAO() {
        return provinciasDAO;
    }

    public void setProvinciasDAO(ProvinciasDAO provinciasDAO) {
        this.provinciasDAO = provinciasDAO;
    }

    public CursosDAO getCursosDAO() {
        return cursosDAO;
    }

    public void setCursosDAO(CursosDAO cursosDAO) {
        this.cursosDAO = cursosDAO;
    }

    public Solicitudes getSolicitud() {
        return solicitud;
    }

    public void setSolicitud(Solicitudes solicitud) {
        this.solicitud = solicitud;
    }

    public Integer getIdSolicitud() {
        return idSolicitud;
    }

    public void setIdSolicitud(Integer idSolicitud) {
        this.idSolicitud = idSolicitud;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public boolean isSexohombre() {
        return sexohombre;
    }

    public void setSexohombre(boolean sexohombre) {
        this.sexohombre = sexohombre;
    }

    public boolean getSexohombre() {
        return this.sexohombre;
    } 
    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getCiudad() {
        return ciudad;
    }

    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }

    public String getCodigoPostal() {
        return codigoPostal;
    }

    public void setCodigoPostal(String codigoPostal) {
        this.codigoPostal = codigoPostal;
    }

    public String getPais() {
        return pais;
    }

    public void setPais(String pais) {
        this.pais = pais;
    }

    public String getNacionalidad() {
        return nacionalidad;
    }

    public void setNacionalidad(String nacionalidad) {
        this.nacionalidad = nacionalidad;
    }

    public String getTelefono1() {
        return telefono1;
    }

    public void setTelefono1(String telefono1) {
        this.telefono1 = telefono1;
    }

    public String getTelefono2() {
        return telefono2;
    }

    public void setTelefono2(String telefono2) {
        this.telefono2 = telefono2;
    }

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    public int getIdProvincia() {
        return idProvincia;
    }

    public void setIdProvincia(int idProvincia) {
        this.idProvincia = idProvincia;
    }

    public int getIdEstado() {
        return idEstado;
    }

    public void setIdEstado(int idEstado) {
        this.idEstado = idEstado;
    }
    
     

    public ArrayList<Curso> getListCursos() {
        return listCursos;
    }

    public void setListCursos(ArrayList<Curso> list) {
        this.listCursos = list;
    }

    public List<Provincias> getListProvincias() {
        return listProvincias;
    }

    public void setListProvincias(List<Provincias> list) {
        this.listProvincias = list;
    }
    
    public int getIntReturnValue() {
        return intReturnValue;
    }

    public void setIntReturnValue(int intReturnValue) {
        this.intReturnValue = intReturnValue;
    }
    
    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
    
    
    /**
     * Devuelve la lista de solicitudes por usuario
     * @return
     * @throws Exception 
     */
    @Override
    public String execute() throws Exception {
        Users usuario = (Users) session.get("appUser"); 
        solicitudesDAO = new SolicitudesDAO();
        this.setListSolicitudes(solicitudesDAO.getSolicitudesByUser(usuario.getIdUser()));
        return "SUCCESS";
        
        //ejecutar el script y volver a generar las clases
        
    }
    
    
    public String nuevaSolicitud () {
        
       try {
           //Obtenemos las provincias
           provinciasDAO = new ProvinciasDAO();
           this.setListProvincias(provinciasDAO.getProvincias());
           //obtenemos los cursos disponibles. 
           cursosDAO = new CursosDAO();
           this.setListCursos(cursosDAO.getCursos());
           
           return "SUCCESS";
       } catch (Exception e) {
           e.printStackTrace();
           return "INPUT";
       }
        
    }
    
    public String incluirDocumentos() {
        try {
           
           return "SUCCESS";
       } catch (Exception e) {
           e.printStackTrace();
           return "INPUT";
       }
    }
    
    public String guardarSolicitud () {
        
       try {
           //Obtenemos las provincias
           //provinciasDAO = new ProvinciasDAO();
           //this.setListProvincias(provinciasDAO.getProvincias());
           //obtenemos los cursos disponibles. 
           //cursosDAO = new CursosDAO();
           //this.setListCursos(cursosDAO.getCursos());
           
           solicitud = new Solicitudes();
           solicitudDetalle = new SolicitudDetalle();
           
           //Recogemos los valores de la solicitud
            solicitud.setIdSolicitud(this.getIdSolicitud());
            solicitud.setNombre(this.getNombre());
            solicitud.setApellidos(this.getApellidos());
            solicitud.setDni(this.getDni());
            solicitud.setSexohombre(this.getSexohombre());
            solicitud.setDireccion(this.getDireccion());
            solicitud.setCiudad(this.getCiudad());
            solicitud.setCodigoPostal(this.getCodigoPostal());
            solicitud.setPais(this.getPais());
            solicitud.setNacionalidad(this.getNacionalidad());
            solicitud.setTelefono1(this.getTelefono1());
            solicitud.setTelefono2(this.getTelefono2());
            //Obtenemos el usuario de la sesion 
            Users usuario = (Users) session.get("appUser");
            solicitud.setUsers(usuario);
            //Datos de la provincia
            Provincias prov = new Provincias();
            prov.setIdProvincia(this.getIdProvincia());
            solicitud.setProvincias(prov);
            
            //set estado a pendiente
            SolicitudEstados SoliciEstado = new SolicitudEstados();
            SoliciEstado.setIdEstado(ESTADO_SOLICITUD_PENDIENTE);
            solicitud.setSolicitudEstados(SoliciEstado);
            
            //Set detalle a la solicitud
            Curso curso = new Curso();
            curso.setIdCurso(this.getIdCurso());
            solicitudDetalle.setCurso(curso);
            
            solicitudDetalle.setEstudiosAportados(this.getEstudiosAportados());
            solicitudDetalle.setCentroProcedencia(this.getCentroProcedencia());
            solicitudDetalle.setPrimeraVez(this.getPrimeraVez());
            solicitudDetalle.setRepiteCurso(this.getRepiteCurso());
            solicitudDetalle.setTrasladoMatricula(this.getTrasladoMatricula());
            solicitudDetalle.setExentoSeguro(this.getExentoSeguro());
            //
            solicitudDetalle.setSolicitudes(solicitud);
            
            Set cjtoDetallesSolicitud = new HashSet();
            cjtoDetallesSolicitud.add(solicitudDetalle);
            solicitud.setSolicitudDetalles(cjtoDetallesSolicitud );
            
            SolicitudesDAO solicitudDAO = new SolicitudesDAO();
            
            
            //insert record
            this.setIntReturnValue(solicitudDAO.newSolicitud(solicitud));
            if ( this.getIntReturnValue() > 0 ) {
               this.setMsg("Solicitud creada correctamente. Puede consultarla en el listado de solicitudes que ha realizado");
            } else {
               this.setMsg("Error actualizado el elemento");
               return "INPUT";
            }
            
            
            
            
            
            
            
            
            
            
       } catch (Exception e) {
           e.printStackTrace();
           return "INPUT";
       }
       return "SUCCESS";
    }
    
}
