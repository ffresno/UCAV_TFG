/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tfg.ucav.actions.configuracion.provincias;

import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.List;
import tfg.ucav.dao.configuracion.provincias.ProvinciasDAO;
import tfg.ucav.model.configuracion.cursos.Curso;
import tfg.ucav.model.configuracion.provincias.Provincias;

/**
 *
 * @author fernandofresno
 */
public class ProvinciasAction extends ActionSupport {
    
    
    List<Provincias> listProvincias = new ArrayList<>();
    ProvinciasDAO provinciasDAO;
    int idProvincia;
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

    public int getIdProvincia() {
        return idProvincia;
    }

    public void setIdProvincia(int idProvincia) {
        this.idProvincia = idProvincia;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    

    public List<Provincias> getListProvincias() {
        return listProvincias;
    }

    public void setListProvincias(List<Provincias> list) {
        this.listProvincias = list;
    }
    
    @Override
    public String execute() throws Exception {
        provinciasDAO = new ProvinciasDAO();
        this.setListProvincias(provinciasDAO.getProvincias());
        return "SUCCESS";
        
    }
    
    public String actualizarProvincia() {
        
        ProvinciasDAO provinciasDAO = new ProvinciasDAO();
        
        Provincias prov = new Provincias();
        prov.setIdProvincia(this.getIdProvincia());
        prov.setNombre(this.getNombre());
        
        try {
            //insert record
            this.setIntReturnValue(provinciasDAO.updateProvincia(prov));
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
