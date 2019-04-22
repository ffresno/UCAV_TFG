/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tfg.ucav.actions.configuracion.cursos;

import com.opensymphony.xwork2.ActionSupport;
import tfg.ucav.dao.configuracion.cursos.CursosDAO;

/**
 *
 * @author fernandofresno
 */
public class CursosDeleteAction extends ActionSupport {
    
    // getters and setters...
    private int idCurso;
    private String msg = "";
    private int intReturnValue = 0;
    CursosDAO cursoDAO = null;
    
    public int getIntReturnValue() {
        return intReturnValue;
    }

    public void setIntReturnValue(int val) {
        this.intReturnValue = val;
    }
    
    
    public void setIdCurso(int val) {
        this.idCurso = val;
    }

    public int getIdCurso() {
        return idCurso;
    }
    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
    @Override
    public String execute() throws Exception {
        cursoDAO = new CursosDAO();
        try {
            //get and set the return value
            this.setIntReturnValue(cursoDAO.deleteCurso(this.getIdCurso()));
            if ( this.getIntReturnValue() > 0 ) {
               this.setMsg("Curso borrado correctamente");
            } else {
               this.setMsg("Error borrando el curso");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "SUCCESS";
    }
    
    

    

  
    
}
