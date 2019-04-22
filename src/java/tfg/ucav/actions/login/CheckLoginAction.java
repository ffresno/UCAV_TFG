/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tfg.ucav.actions.login;

import com.opensymphony.xwork2.ActionSupport;
import java.util.Map;
import org.apache.struts2.interceptor.SessionAware;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import org.apache.struts2.dispatcher.SessionMap;

import tfg.ucav.model.usuarios.User;
import tfg.ucav.util.Mailer;


/**
 * Clase (action) que controla el acceso de usuarios a la aplicación
 * @author fernandofresno
 */
public class CheckLoginAction extends ActionSupport implements SessionAware {
    
    private String email;
    private String password;
    private String msg = "";
    SessionMap<String, Object> appSession; 

    /**
     *
     * @param val
     */
    public void setEmail(String val) {
        this.email = val;
    }

    /**
     *
     * @param password
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     *
     * @return
     */
    public String getEmail() {
        return email;
    }

    /**
     *
     * @return
     */
    public String getPassword() {
        return password;
    }

    /**
     *
     * @param val
     */
    @Override
    public void setSession(Map<String, Object> val) {
          this.appSession = (SessionMap)val;
    }
    
    /**
     *
     * @return
     */
    public SessionMap<String, Object> getSession() {
          return this.appSession;
    }
    
    /**
     *
     * @return
     */
    public String getMsg() {
        return msg;
    }

    /**
     *
     * @param msg
     */
    public void setMsg(String msg) {
        this.msg = msg;
    }
    
    /**
     *
     * @return
     */
    public boolean showMsg() {
        if (this.getMsg() == "") return false;
        return true;
    }
   /*@Override
   public void validate() {
       addFieldError("username", "Error en el usuario o contraseña");
   }*/
     // method for creating connection

    /**
     * Crea una conexión con el pool de conexiones
     * @return
     * @throws Exception
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
    
    
    // all struts logic here

    /**
     * Ejecuta el método execute de la acción.
     * Comprueba en base de datos que exista el usuario:
     * - Si existe se guarda en sesión
     * - Se comprueba si es usuario administrador o estudiante
     * @return
     * @throws Exception
     */
    @Override
    public String execute() throws Exception {
        
        //return value
        int i = 0;
        try {
              //open context
            String sql = "SELECT * FROM USERS WHERE EMAIL = ? AND PASSWORD = ?";
            PreparedStatement ps = myconnection().prepareStatement(sql);
            //PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, this.getEmail());
            ps.setString(2, this.getPassword());
            
            ResultSet rs = ps.executeQuery();

            //user exist
            if ( rs.next()) {
                User usuario = new User();
                usuario.setIdUser(rs.getInt("ID_USER"));
                usuario.setNombre(rs.getString("NOMBRE"));
                usuario.setEmail(rs.getString("EMAIL"));
                int intRole = rs.getInt("ID_ROLE");
                System.out.println(intRole);
                //usuario.setRole(role); 
                //set user to session
                this.setUserToSession(usuario, intRole);
                if (this.isAdmin(intRole)) {
                    //return success
                    return "SUCCESS_ADMIN";
                }
                return "SUCCES_STUDENT";
            } else {
                 this.setMsg("El usuario o clave no son correctos");
                //only when user not exist
                this.setEmail("");
                this.setPassword("");
                return "INPUT";
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            if (myconnection() != null) {
                myconnection().close();
            }
        }
    }
    
    /**
     * Función que devuelve si es un administrador
     * @param intRole
     * @return boolean 
     */
    
    public boolean isAdmin(int intRole) {
        if (intRole == 1) return true;
        return false;
    }
    
    /**
     * Set user to application session
     * @param usuario
     * @param intRole
     */
    public void setUserToSession(User usuario, int intRole) {
        
        // Write to the session
        this.appSession.put("appUser", usuario);
        //set level access
        if (intRole == 1) {
            this.appSession.put("AccessLevel", "admin");
        } else {
            this.appSession.put("AccessLevel", "estudiante");
        }
        // Read from the session
        /*if (! this.appUser.containsKey("username")) {
                division = (Integer) ;
        }*/
    }
    
    /**
     * Logout method
     * @return 
     */
    public String logout(){  
        this.appSession.remove("appUser");
        return "SUCCESS";  
    }  

    
}