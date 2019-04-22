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
public class CursosUpdateAction extends ActionSupport {
    
    private int idCurso;
    private String nombre;
    private String msg = "";
    private int intReturnValue = 0;
    CursosDAO cursoDAO = null;

    public void setIdCurso(int idCurso) {
        this.idCurso = idCurso;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public void setIntReturnValue(int intReturnValue) {
        this.intReturnValue = intReturnValue;
    }

    public int getIdCurso() {
        return idCurso;
    }

    public String getNombre() {
        return nombre;
    }

    public String getMsg() {
        return msg;
    }

    public int getIntReturnValue() {
        return intReturnValue;
    }
    
    @Override
    public String execute() throws Exception {
        cursoDAO = new CursosDAO();
        try {
            //get and set the return value
            this.setIntReturnValue(cursoDAO.updateCurso(this.getIdCurso() , this.getNombre()));
            if ( this.getIntReturnValue() > 0 ) {
               this.setMsg("Curso actualizado correctamente");
            } else {
               this.setMsg("Error actualizando el curso");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "SUCCESS";
    }
    
}
