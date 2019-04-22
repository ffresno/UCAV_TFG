/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tfg.ucav.util;

import java.util.Properties;    
import javax.mail.*;    
import javax.mail.internet.*; 

/**
 * Clase para el envío de emails
 * @author fernandofresno
 */
public class Mailer {
    /**
     * Método estático de envio de emails con la clase MAIL
     * @param to Correo al que enviamos el mail
     * @param sub Asunto
     * @param msg Mensaje
     * @see javax.mail
     */
    public static void send(String to,String sub,String msg){  
           
     //change from, password and to  
          String from = "sistemacontroldocumental@gmail.com";
          String password="fernandofresno";  
//Get properties object    
          Properties props = new Properties();    
          props.put("mail.smtp.host", "smtp.gmail.com");    
          props.put("mail.smtp.socketFactory.port", "465");    
          props.put("mail.smtp.socketFactory.class",    
                    "javax.net.ssl.SSLSocketFactory");    
          props.put("mail.smtp.auth", "true");    
          props.put("mail.smtp.port", "465");    
          //get Session   
          Session session = Session.getDefaultInstance(props,    
           new javax.mail.Authenticator() {    
           protected PasswordAuthentication getPasswordAuthentication() {    
           return new PasswordAuthentication(from,password);  
           }    
          });    
          //compose message    
          try {    
           MimeMessage message = new MimeMessage(session);    
           message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));    
           message.setSubject(sub);    
           message.setText(msg);    
           //send message  
           Transport.send(message);    
           System.out.println("message sent successfully");    
          } catch (MessagingException e) {throw new RuntimeException(e);}    
             
    }  
}  
