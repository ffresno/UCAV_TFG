/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tfg.ucav.actions.configuracion.documentos;

import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.List;
import tfg.ucav.dao.configuracion.documentos.DocumentosDAO;
import tfg.ucav.dao.configuracion.estadossolicitud.EstadosSolicitudDAO;
import tfg.ucav.model.solicitudes.Documentos;
import tfg.ucav.model.solicitudes.SolicitudEstados;

/**
 *
 * @author fernandofresno
 */
public class DocumentosAction extends ActionSupport {

    List<Documentos> listDocumentos = new ArrayList<>();
    DocumentosDAO documentosDAO;
    
    int idDocumento;
    String nombre;
    String descripcion;
    int intReturnValue;
    String msg;

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

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

    public int getIdDocumento() {
        return idDocumento;
    }

    public void setIdDocumento(int val) {
        this.idDocumento = val;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    

    public List<Documentos> getListDocumentos() {
        return listDocumentos;
    }

    public void setListDocumentos(List<Documentos> list) {
        this.listDocumentos = list;
    }
    
    @Override
    public String execute() throws Exception {
        documentosDAO = new DocumentosDAO();
        this.setListDocumentos(documentosDAO.getDocumentos());
        return "SUCCESS";
        
    }
    
    public String actualizarDocumento() {
        
        documentosDAO = new DocumentosDAO();
        
        Documentos doc = new Documentos();
        doc.setIdDocumento(this.getIdDocumento());
        doc.setNombre(this.getNombre());
        doc.setDescripcion(this.getDescripcion());
        
        try {
            //insert record
            this.setIntReturnValue(documentosDAO.updateDocumento(doc));
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
    
    public String insertarDocumento() {
        
        documentosDAO = new DocumentosDAO();
        
        Documentos doc = new Documentos();
        doc.setIdDocumento(this.getIdDocumento());
        doc.setNombre(this.getNombre());
        doc.setDescripcion(this.getDescripcion());
        try {
            //insert record
            this.setIntReturnValue(documentosDAO.insertDocumento(doc));
            if ( this.getIntReturnValue() > 0 ) {
               this.setMsg("Elemento insertado correctamente");
            } else {
               this.setMsg("Error actualizado el elemento");
               return "INPUT";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "SUCCESS";
        
    }
    
    public String borrarDocumento() {
        
        documentosDAO = new DocumentosDAO();

        try {
            this.setIntReturnValue(documentosDAO.deleteDocumento(this.getIdDocumento()));
            if ( this.getIntReturnValue() > 0 ) {
               this.setMsg("Elemento borrado correctamente");
            } else {
               this.setMsg("Error borrando el elemento");
               return "INPUT";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "SUCCESS";
        
    }
    
}

