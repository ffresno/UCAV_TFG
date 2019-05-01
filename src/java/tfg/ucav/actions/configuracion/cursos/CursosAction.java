/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tfg.ucav.actions.configuracion.cursos;

import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import tfg.ucav.dao.configuracion.cursos.CursosDAO;
import tfg.ucav.model.configuracion.cursos.Curso;

/**
 *
 * @author fernandofresno
 */
public class CursosAction extends ActionSupport {
    
    ArrayList<Curso> listCursos=new ArrayList<Curso>(); 
    CursosDAO cursoDAO = null;

    public ArrayList<Curso> getListCursos() {
        return listCursos;
    }

    public void setListCursos(ArrayList<Curso> list) {
        this.listCursos = list;
    }
    
    
    // all struts logic here
    @Override
    public String execute() throws Exception {
 
        cursoDAO = new CursosDAO();
        
        this.setListCursos(cursoDAO.getCursos());
        
        
        //return success
        return "SUCCESS";
        
    }
    
    
    
    
    private String nombre;
    private String msg = "";
    private int intReturnValue = -1;
    
    
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
