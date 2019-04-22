/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tfg.ucav.dao.configuracion.usuarios;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import static tfg.ucav.dao.configuracion.cursos.CursosDAO.myconnection;
import tfg.ucav.model.usuarios.User;

/**
 *
 * @author fernandofresno
 */
public class UsuariosDAO {
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
    
    public int newUsuario (User user) throws SQLException, Exception {
        
        int i = 0; //return value
        
        try {
            String sql =    "INSERT INTO USERS "
                            + "(NOMBRE,APELLIDOS,EMAIL,PASSWORD, CREATE_TIME,ID_ROLE)"
                            + " VALUES (?,?,?,?,?,?)";
            PreparedStatement ps = myconnection().prepareStatement(sql);
            ps.setString(1, user.getNombre());
            ps.setString(2, user.getApellidos());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getPassword());
            ps.setTimestamp(5, new java.sql.Timestamp(System.currentTimeMillis()));
            ps.setInt(6, user.getRole().getIdRole());
            //print query
            System.out.println(ps);
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
    } //end newUsuario
    
    public int deleteUsuario (int id) throws Exception, SQLException {
        
        int i = 0;
        
        try {
            String sql = "DELETE FROM USERS WHERE ID_USER = ?";
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
    * Método que actualiza un nuevo elemento de la tabla en BD
    * @param id id del elemento a actualizar
    * @param nombre Parámetro del elemento a actualizar
    * @return SUCCESS
    */
    public int updateUsuario(User user)
			throws SQLException, Exception {
        int i = 0;
        try {
            String sql = "UPDATE USERS SET NOMBRE=?, APELLIDOS=?, EMAIL=?, PASSWORD=? WHERE ID_USER=?";
            PreparedStatement ps = myconnection().prepareStatement(sql);
            ps.setString(1, user.getNombre());
            ps.setString(2, user.getApellidos());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getPassword());
            ps.setInt(5, user.getIdUser());
            System.out.println(ps);
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

