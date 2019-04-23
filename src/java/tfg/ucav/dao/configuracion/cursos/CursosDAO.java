/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tfg.ucav.dao.configuracion.cursos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import tfg.ucav.model.configuracion.cursos.Curso;
/**
 *
 * @author fernandofresno
 */
public class CursosDAO {
        
    // method for creating connection
    public static Connection myconnection() throws Exception {
        try {
            //open context
            Context ctx = new InitialContext();
            if ( ctx == null ) throw new Exception("Error al cargar el contexto");
            //DataSource y connection
            DataSource pool;
            pool = (DataSource)ctx.lookup("java:/comp/env/jdbc/ConexionMySQL");
            Connection conn = pool.getConnection();
            return conn;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    
    // method for creating connection
    public static Connection myconnection2() throws Exception {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            return DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/TFG_UCAV", "root", "");
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    
    /** 
    * Método que inserta un elemento de la tabla en BD
    * @param name Nombre del elemento
    * @return int
    */
    public int newCurso (String name) throws SQLException, Exception {
        //return value
        int i = 0;
        try {
            String sql = "INSERT INTO CURSO (NOMBRE) VALUES (?)";
            PreparedStatement ps = myconnection().prepareStatement(sql);
            ps.setString(1, name);
            i = ps.executeUpdate();
            return i;
        } catch (Exception e) {
            e.printStackTrace();
            return i;
        } finally {
            if (myconnection() != null) {
                myconnection().close();
            }
        }
    }
    
    
    /** 
    * Método que borra un nuevo elemento de la tabla en BD
    * @param id id del elemento a borrar
    * @return SUCCESS
    */
    public int deleteCurso(int id) throws SQLException, Exception {
        //return value
        int i = 0;
        try {
            String sql = "DELETE FROM CURSO WHERE ID_CURSO=?";
            PreparedStatement ps = myconnection().prepareStatement(sql);
            ps.setInt(1, id);
            i = ps.executeUpdate();
            return i;
        } catch (Exception e) {
            e.printStackTrace();
            return i;
        } finally {
            if (myconnection() != null) {
                myconnection().close();
            }
        }
    }
    /** 
    * Método que LISTA TODOS LOS elementos de la tabla 
    * @return DEvuelve el listado de todos los cursos
    */
    public ResultSet listCursos() throws SQLException, Exception {
        ResultSet rs = null;
        try {
            String sql = "SELECT ID_CURSO, NOMBRE FROM CURSO";
            PreparedStatement ps = myconnection().prepareStatement(sql);
            rs = ps.executeQuery(sql);
            return rs;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            if (myconnection() != null) {
                myconnection().close();
                rs.close();
            }
        }
    }
    
    public ArrayList<Curso> getCursos () throws Exception {
         ArrayList<Curso> listCursos=new ArrayList<Curso>(); 
         ResultSet rs = null;
        try {
            String sql = "SELECT * FROM CURSO";
            PreparedStatement ps = myconnection().prepareStatement(sql);
            rs = ps.executeQuery(sql);
            while (rs.next()) {
                Curso curso = new Curso();
                curso.setIdCurso(rs.getInt("ID_CURSO"));
                curso.setNombre(rs.getString("NOMBRE"));
                listCursos.add(curso);
            } 
            return listCursos;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            if (myconnection() != null) {
                myconnection().close();
                rs.close();
            }
        }
    }
    
    
    /** 
    * Método que actualiza un nuevo elemento de la tabla en BD
    * @param id id del elemento a actualizar
    * @param nombre Parámetro del elemento a actualizar
    * @return SUCCESS
    */
    public int updateCurso(int id, String nombre)
			throws SQLException, Exception {
        int i = 0;
        try {
            String sql = "UPDATE CURSO SET NOMBRE=? WHERE ID_CURSO=?";
            PreparedStatement ps = myconnection().prepareStatement(sql);
            ps.setString(1, nombre);
            ps.setInt(2, id);
            i = ps.executeUpdate();
            return i;
        } catch (Exception e) {
            e.printStackTrace();
            return i;
        } finally {
            if (myconnection() != null) {
                myconnection().close();
            }
        }
    }
    
    
}
