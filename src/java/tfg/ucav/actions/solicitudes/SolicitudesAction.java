/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tfg.ucav.actions.solicitudes;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import tfg.ucav.actions.configuracion.cursos.CursosAction;
import tfg.ucav.dao.configuracion.cursos.CursosDAO;
import tfg.ucav.dao.configuracion.provincias.ProvinciasDAO;
import tfg.ucav.model.configuracion.cursos.Curso;
import tfg.ucav.model.configuracion.provincias.Provincias;

/**
 *
 * @author fernandofresno
 */
public class SolicitudesAction {
    
    List<Provincias> listProvincias = new ArrayList<>();
    List<Curso> cursosDisponibles = new ArrayList<>();
    ArrayList<Curso> listCursos = new ArrayList<>(); 
    
    ProvinciasDAO provinciasDAO;
    CursosDAO cursosDAO;
    
     

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
    
    public static Connection myConnection() throws Exception {
    //open context
        Context ctx = new InitialContext();
        if ( ctx == null ) throw new Exception("Error al cargar el contexto");
        //DataSource y connection
        DataSource pool;
        pool = (DataSource)ctx.lookup("java:/comp/env/jdbc/ConexionMySQL");
        Connection conn = pool.getConnection();
        return conn;
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
    
}
