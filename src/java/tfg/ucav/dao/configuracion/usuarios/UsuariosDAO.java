/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tfg.ucav.dao.configuracion.usuarios;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import tfg.ucav.model.usuarios.Users;

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
    /**
     * MÉTODO QUE REGISTRA UN USUARIO
     * @param user
     * @return
     * @throws SQLException
     * @throws Exception 
     */
    public int newUsuario (Users user) throws SQLException, Exception {
        
        int i = 0; //return value
        
        try {
            String sql =    "INSERT INTO users "
                            + "(nombre,apellidos,email,password,create_time,id_role)"
                            + " values (?,?,?,?,?,?)";
            PreparedStatement ps = myconnection().prepareStatement(sql);
            ps.setString(1, user.getNombre());
            ps.setString(2, user.getApellidos());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getPassword());
            ps.setTimestamp(5, new java.sql.Timestamp(System.currentTimeMillis()));
            ps.setInt(6, user.getRoles().getIdRole());
            //System.out.println(ps);
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
    public int updateUsuario(Users user)
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

