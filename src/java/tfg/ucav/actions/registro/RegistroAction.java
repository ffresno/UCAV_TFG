/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tfg.ucav.actions.registro;

import com.opensymphony.xwork2.ActionSupport;
import java.util.Date;
import tfg.ucav.dao.configuracion.usuarios.UsuariosDAO;
import tfg.ucav.model.usuarios.Role;
import tfg.ucav.util.Mailer;
import tfg.ucav.model.usuarios.User;
import tfg.ucav.dao.configuracion.usuarios.UsuariosDAO;
/**
 * Acción que registra un usuario del sistema
 * Se inserta en Base de datos y se le envía un mail con la 
 * confirmación del registro
 * @author fernandofresno
 */
public class RegistroAction extends ActionSupport {
    
    private String nombre;
    private String apellidos;
    private String email;
    private String msg;
    private String pass2;
    private String password;
    
    private int intReturnValue;
    private UsuariosDAO usuarioDAO;

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public void setEmail(String val) {
        this.email = val;
    }

    public void setPassword(String pass1) {
        this.password = pass1;
    }
    public void setPass2(String pass1) {
        this.pass2 = pass1;
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
    
    public String getPass2() {
        return pass2;
    }
    
    public int getIntReturnValue() {
        return intReturnValue;
    }

    public void setIntReturnValue(int val) {
        this.intReturnValue = val;
    }
     public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
    
    @Override
    public String execute () {
        
        User user = new User();
        user.setNombre(this.getNombre());
        user.setApellidos(this.getApellidos());
        user.setEmail(this.getEmail());
        user.setPassword(this.getPassword());
        user.setCreateTime(new Date());
        //Set to student Role
        Role role = new Role();
        role.setIdRole(2);
        user.setRoles(role);
        
        
        usuarioDAO = new UsuariosDAO();
        try {
            //insert record
            this.setIntReturnValue(usuarioDAO.newUsuario(user));
            if ( this.getIntReturnValue() > 0 ) {
               this.setMsg("Usuario registrado creado correctamente");
            
                //Send welcome email 
                if (!this.getEmail().trim().equals("")) {
                    this.sendWelcomeEmail(this.getEmail(), this.getPassword());
                } 
            } else {
               this.setMsg("Error creando el Usuario");
               return "input";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "SUCCESS";
        
    }
    
    @Override
    public void validate() {
        //if (this.getNombre().length() == 0) {
        if (this.getNombre()== null || this.getNombre().isEmpty()) {
            this.addFieldError("nombre", "Por favor completa el campo nombre");

        }
        if (this.getApellidos()== null || this.getApellidos().isEmpty()) {
            this.addFieldError("apellidos", "Por favor completa el campo apellidos");

        }
        if (this.getEmail()== null || this.getEmail().isEmpty()) {
            this.addFieldError("email", "Por favor completa el campo email");

        }
        if (this.getPassword()== null || this.getPassword().isEmpty()) {
            this.addFieldError("password", "Por favor completa el campo password");

        }
        if (this.getPass2()== null || this.getPass2().isEmpty()) {
            this.addFieldError("pass2", "Por favor completa la confirmación del campo password ");
        }
    }
    
    public void sendWelcomeEmail (String email, String pwd) {
        //send email
        //to,subject,message  
        String msg = "Bienvenido al Sistema de Control de documentación, "
                + "ya puedes acceder al sistema utilizano estos datos:\n\n"
                + "\tEmail: " + email + "\n"
                + "\nContraseña: " + pwd + "\n";
        
        
        Mailer.send(email,"Bienvenido, " + this.getNombre(), msg);
    }

    
    
    
    
}
