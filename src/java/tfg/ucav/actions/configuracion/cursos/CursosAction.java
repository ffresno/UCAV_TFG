/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tfg.ucav.actions.configuracion.cursos;

import com.opensymphony.xwork2.ActionSupport;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import tfg.ucav.dao.configuracion.cursos.CursosDAO;
import tfg.ucav.model.configuracion.cursos.Curso;

/**
 *
 * @author fernandofresno
 */
public class CursosAction extends ActionSupport {
    
    ArrayList<Curso> listCursos=new ArrayList<Curso>(); 

    public ArrayList<Curso> getListCursos() {
        return listCursos;
    }

    public void setListCursos(ArrayList<Curso> list) {
        this.listCursos = list;
    }
    
    
    // all struts logic here
    @Override
    public String execute() throws Exception {
 
        //open context
        Context ctx = new InitialContext();
        if ( ctx == null ) throw new Exception("Error al cargar el contexto");
        //DataSource y connection
        DataSource pool;
        pool = (DataSource)ctx.lookup("java:/comp/env/jdbc/ConexionMySQL");
        Connection conn = pool.getConnection();
        
        this.setListCursos(fetchCursos(conn));
        
        conn.close();
        //return success
        return "SUCCESS";
        
    }
    
    public ArrayList<Curso> fetchCursos ( Connection conn ) throws Exception {
    //Statements and execute query
        Statement stmt = conn.createStatement();
        String query = "SELECT * FROM CURSO";
        
        ResultSet rs = stmt.executeQuery(query);
        
        while (rs.next()) {
            Curso curso = new Curso();
            curso.setIdCurso(rs.getInt("ID_CURSO"));
            curso.setNombre(rs.getString("NOMBRE"));
            listCursos.add(curso);
        } 
        
        //Close 
        rs.close();
        stmt.close();
        
        return listCursos;
    }
    
    
    private String nombre;
    private String msg = "";
    private int intReturnValue = 0;
    CursosDAO cursoDAO = null;
    
    public int getIntReturnValue() {
        return intReturnValue;
    }

    public void setIntReturnValue(int val) {
        this.intReturnValue = val;
    }
    
    
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getNombre() {
        return nombre;
    }
    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
    public String newCurso() throws Exception {
        cursoDAO = new CursosDAO();
        try {
            //get and set the return value
            this.setIntReturnValue(cursoDAO.newCurso(this.getNombre()));
            System.out.println("Despues de insertar:" + this.getIntReturnValue());
            if ( this.getIntReturnValue() > 0 ) {
               this.setMsg("Curso creado correctamente");
            } else {
               this.setMsg("Error creando el curso");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "SUCCESS";
    }
    
    
}
