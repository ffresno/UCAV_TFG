/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tfg.ucav.actions.dashboard;

import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import tfg.ucav.dao.solicitudes.SolicitudesDAO;
import tfg.ucav.model.solicitudes.Solicitudes;
import tfg.ucav.model.usuarios.Users;

/**
 *
 * @author fernandofresno
 */
public class DashboardAction extends ActionSupport {
    int intReturnValue;
    String msg;
    List<Solicitudes> listSolicitudes = new ArrayList<>();

    public int getIntReturnValue() {
        return intReturnValue;
    }

    public void setIntReturnValue(int intReturnValue) {
        this.intReturnValue = intReturnValue;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public List<Solicitudes> getListSolicitudes() {
        return listSolicitudes;
    }

    public void setListSolicitudes(List<Solicitudes> listSolicitudes) {
        this.listSolicitudes = listSolicitudes;
    }
    SolicitudesDAO solicitudesDAO;
    
    
    @Override
    public String execute() {
        solicitudesDAO = new SolicitudesDAO();
        try {
            this.setListSolicitudes(solicitudesDAO.getSolicitudes());
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return "SUCCESS";
    }
    
}
