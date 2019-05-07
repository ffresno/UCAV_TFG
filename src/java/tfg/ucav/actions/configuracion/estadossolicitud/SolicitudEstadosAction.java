/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tfg.ucav.actions.configuracion.estadossolicitud;

import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.List;
import tfg.ucav.dao.configuracion.estadossolicitud.EstadosSolicitudDAO;
import tfg.ucav.dao.configuracion.provincias.ProvinciasDAO;
import tfg.ucav.model.configuracion.provincias.Provincias;
import tfg.ucav.model.solicitudes.SolicitudEstados;

/**
 *
 * @author fernandofresno
 */
public class SolicitudEstadosAction extends ActionSupport {
    
    List<SolicitudEstados> listEstados = new ArrayList<>();
    EstadosSolicitudDAO estadosDAO;
    
    int idEstado;
    String nombre;
    int intReturnValue;
    String msg;

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public int getIntReturnValue() {
        return intReturnValue;
    }

    public void setIntReturnValue(int intReturnValue) {
        this.intReturnValue = intReturnValue;
    }

    public int getIdEstado() {
        return idEstado;
    }

    public void setIdEstado(int val) {
        this.idEstado = val;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    

    public List<SolicitudEstados> getListEstados() {
        return listEstados;
    }

    public void setListEstados(List<SolicitudEstados> list) {
        this.listEstados = list;
    }
    
    @Override
    public String execute() throws Exception {
        estadosDAO = new EstadosSolicitudDAO();
        this.setListEstados(estadosDAO.getEstados());
        return "SUCCESS";
        
    }
    
    public String actualizarEstado() {
        
        estadosDAO = new EstadosSolicitudDAO();
        
        SolicitudEstados estado = new SolicitudEstados();
        estado.setIdEstado(this.getIdEstado());
        estado.setNombre(this.getNombre());
        
        try {
            //insert record
            this.setIntReturnValue(estadosDAO.updateEstado(estado));
            if ( this.getIntReturnValue() > 0 ) {
               this.setMsg("Elemento actualizado correctamente");
            } else {
               this.setMsg("Error actualizado el elemento");
               return "INPUT";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "SUCCESS";
    }
    
}

