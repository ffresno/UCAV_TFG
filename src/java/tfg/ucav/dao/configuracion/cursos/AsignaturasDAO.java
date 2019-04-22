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
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

/**
 * Clase que tiene los métodos para realizar el CRUD sobre 
 * la clase ASIGNATURAS
 * @author fernandofresno
 */
public class AsignaturasDAO {
        
    // method for creating connection

    /**
     * Se obtiene la conexión del pool de conexiones
     * @return Connection
     * @see Connection
     */
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
    
    
    /**
     * Método que inserta un elemento de la tabla en BD
     * @param name Nombre de la Asignatura
     * @param id   Id de la de la Asignatura
     * @return int
     */
    public int newAsignatura (String name, int id) throws SQLException, Exception {
        //return value
        int i = 0;
        try {
            String sql = "INSERT INTO ASIGNATURA (DESCRIPCION, ID_CURSO) VALUES (?, ?)";
            PreparedStatement ps = myconnection().prepareStatement(sql);
            ps.setString(1, name);
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
    /** 
    * Método que borra un nuevo elemento de la tabla en BD
    * @param id id del elemento a borrar
    * @return SUCCESS
    */
    public int deleteAsignatura(int id) throws SQLException, Exception {
        //return value
        int i = 0;
        try {
            String sql = "DELETE FROM ASIGNATURA WHERE ID_ASIGNATURA=?";
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
    public ResultSet listAsignaturas() throws SQLException, Exception {
        ResultSet rs = null;
        try {
            String sql = "SELECT ID_ASIGNATURA, DESCRIPCION, ID_CURSO FROM CURSO";
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
    
    /** 
    * Método que actualiza un nuevo elemento de la tabla en BD
    * @param id id del elemento a actualizar
    * @param nombre Parámetro del elemento a actualizar
    * @return SUCCESS
    */
    public String updateCurso( String nombre, int id)
			throws SQLException, Exception {
        try {
            String sql = "UPDATE ASIGNATURA SET DESCRIPCION=? WHERE ID_CURSO=?";
            PreparedStatement ps = myconnection().prepareStatement(sql);
            ps.setString(1, nombre);
            ps.setInt(2, id);
            ps.executeUpdate();
            return "SUCCESS";
        } catch (Exception e) {
            e.printStackTrace();
            return e.getMessage();
        } finally {
            if (myconnection() != null) {
                myconnection().close();
            }
        }
    }
    
    
}
