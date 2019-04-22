/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tfg.ucav.actions.configuracion.usuarios;

import com.opensymphony.xwork2.ActionSupport;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import tfg.ucav.actions.registro.RegistroAction;
import tfg.ucav.dao.configuracion.cursos.CursosDAO;
import tfg.ucav.dao.configuracion.usuarios.UsuariosDAO;
import tfg.ucav.model.usuarios.Role;
import tfg.ucav.model.usuarios.User;
import tfg.ucav.util.Mailer;

/**
 *
 * @author fernandofresno
 */
public class UsuariosAction extends ActionSupport {
    
    UsuariosDAO usuarioDAO;
    int intReturnValue;
    private String msg;
    int idUsuario;
    private String nombre;
    private String apellidos;
    private String email;
    private String password;
    private int role;
    ArrayList<User> listUsuarios = new ArrayList<User>(); 
    
    /**
     * Obtiene el valor de idUsuario
     * @param val
     */
    public void setIdUsuario(int val) {
        this.idUsuario = val;
    }

    /**
     * Obtiene el valor de idUsuario
     * @return int 
     */
    public int getIdUsuario() {
        return idUsuario;
    }

    /**
     * Obtiene el valor de msg
     * @return String
     */
    public String getMsg() {
        return msg;
    }

    /**
     * Establece el valor del mensaje a mostrar
     * @param msg
     */
    public void setMsg(String msg) {
        this.msg = msg;
    }

    /**
     * Obtiene el valor de intReturnValue
     * @return int
     */
    public int getIntReturnValue() {
        return intReturnValue;
    }

    /**
     * Establece el valor del codigo de retorno a mostrar
     * @param val
     */
    public void setIntReturnValue(int val) {
        this.intReturnValue = val;
    }
    
    /**
     * Obtiene el valor de listUsuarios
     * @return ArrayList
     */
    public ArrayList<User> getListUsuarios() {
        return listUsuarios;
    }

    /**
     * Establece la lista de usuarios a mostrar
     * @param list
     */
    public void setListUsuarios(ArrayList<User> list) {
        this.listUsuarios = list;
    }
    
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public void setEmail(String val) {
        this.email = val;
    }
     public void setRole(int val) {
        this.role = val;
    }

    public void setPassword(String pass1) {
        this.password = pass1;
    }

    public String getNombre() {
        return nombre;
    }

    public String getApellidos() {
        return apellidos;
    }

    public String getEmail() {
        return email;
    }
    
    public String getPassword() {
        return password;
    }
    public int getRole() {
        return role;
    }
    
    
    // all struts logic here

    /**
     * Lanza el método execute y Sirve para obtener todos los usuarios
     * @return
     * @throws Exception
     */
    @Override
    public String execute() throws Exception {
 
        //open context
        Context ctx = new InitialContext();
        if ( ctx == null ) throw new Exception("Error al cargar el contexto");
        //DataSource y connection
        DataSource pool;
        pool = (DataSource)ctx.lookup("java:/comp/env/jdbc/ConexionMySQL");
        Connection conn = pool.getConnection();
        
        this.setListUsuarios(fetchData(conn));
        
        conn.close();
        //return success
        return "SUCCESS";
        
    }
    
    /**
     * Obtiene todos los registros de la tabla usuarios
     * @param conn
     * @return ArrayList
     * @throws Exception
     */
    public ArrayList<User> fetchData ( Connection conn ) throws Exception {
    //Statements and execute query
        Statement stmt = conn.createStatement();
        String query = "SELECT * FROM USERS";
        
        ResultSet rs = stmt.executeQuery(query);
        
        while (rs.next()) {
            User usuario = new User();
            usuario.setIdUser(rs.getInt("ID_USER"));
            usuario.setNombre(rs.getString("NOMBRE"));
            usuario.setApellidos(rs.getString("APELLIDOS"));
            usuario.setEmail(rs.getString("EMAIL"));
            usuario.setPassword(rs.getString("PASSWORD"));
            usuario.setCreateTime(rs.getDate("CREATE_TIME"));
            Role role = new Role();
            role.setIdRole(rs.getInt("ID_ROLE"));
            usuario.setRoles(role);
            listUsuarios.add(usuario);
        } 
        
        //Close 
        rs.close();
        stmt.close();
        
        return listUsuarios;
    }
    
   
    /**
     * inserta el usuario con los datos indicados
     * @return Success
     */
    public String nuevoUsuario() {
        
        User user = new User();
        user.setNombre(this.getNombre());
        user.setApellidos(this.getApellidos());
        user.setEmail(this.getEmail());
        user.setPassword(this.getPassword());
        user.setCreateTime(new Date());
        Role role = new Role();
        role.setIdRole(this.getRole());
        user.setRoles(role);
        usuarioDAO = new UsuariosDAO();
        
        try {
            //insert record
            this.setIntReturnValue(usuarioDAO.newUsuario(user));
            if ( this.getIntReturnValue() > 0 ) {
               this.setMsg("Usuario registrado creado correctamente");
            
                //Send welcome email 
                if (!this.getEmail().trim().equals("")) {
                    this.sendNewUserEmail(this.getEmail(), this.getPassword());
                } 
            } else {
               this.setMsg("Error creando el Usuario");
               return "INPUT";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "SUCCESS";
    }
    
     /**
     * Borra el usuario con el id indicado
     * @return Success
     */
    public String borrarUsuario () {
        usuarioDAO = new UsuariosDAO();
    
        try {
            //get and set the return value
            this.setIntReturnValue(usuarioDAO.deleteUsuario(this.getIdUsuario()));
            if ( this.getIntReturnValue() > 0 ) {
               this.setMsg("Elemento borrado correctamente");
            } else {
               this.setMsg("Error borrando el elemento. Vuelva a intentarlo");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } 
        return "SUCCESS";
    }
    
    public void sendNewUserEmail (String email, String pwd) {
        //send email
        //to,subject,message  
        String msg = "Bienvenido al Sistema de Control de documentación, "
                + "ya puedes acceder al sistema utilizano estos datos:\n\n"
                + "\tEmail: " + email + "\n"
                + "\nContraseña: " + pwd + "\n";
        
        
        Mailer.send(email,"Bienvenido, " + this.getNombre(), msg);
    }
    
    public String actualizarUsuario() throws Exception {
        User user = new User();
        user.setIdUser(this.getIdUsuario());
        user.setNombre(this.getNombre());
        user.setApellidos(this.getApellidos());
        user.setEmail(this.getEmail());
        user.setPassword(this.getPassword());
        usuarioDAO = new UsuariosDAO();
        
        try {
            //get and set the return value
            this.setIntReturnValue(usuarioDAO.updateUsuario(user));
            if ( this.getIntReturnValue() > 0 ) {
               this.setMsg("Usuario actualizado correctamente");
            } else {
               this.setMsg("Error actualizando el Usuario");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "SUCCESS";
    }
    
}
