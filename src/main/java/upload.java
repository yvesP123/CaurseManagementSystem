/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import static java.lang.System.out;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author IPRC Karongi
 */
@MultipartConfig(maxFileSize=16177215)
public class upload extends HttpServlet {
private String url="jdbc:mysql://localhost:3306/course";
private String user="root";
private String pass="";
private String drivename="com.mysql.jdbc.Driver";
   

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("image/jpeg");
  int id = Integer.parseInt(request.getParameter("id"));
  Connection conn1 = null ;
    try {
        DriverManager.registerDriver(new com.mysql.jdbc.Driver());
    } catch (SQLException ex) {
        Logger.getLogger(upload.class.getName()).log(Level.SEVERE, null, ex);
    }
    try {
        conn1= (Connection) DriverManager.getConnection(url,user,pass);
    } catch (SQLException ex) {
        Logger.getLogger(upload.class.getName()).log(Level.SEVERE, null, ex);
    }
  String sql = "SELECT * FROM sub WHERE id ='"+id+"'";
  PreparedStatement ps;
  try {
  ps=conn1.prepareStatement(sql);
   ResultSet rs = ps.executeQuery();
   if(rs.next()){
    byte [] imageData = rs.getBytes("file"); // extract byte data from the resultset..
    OutputStream os = response.getOutputStream(); // output with the help of outputStream 
             os.write(imageData);
             os.flush();
             os.close();
   }
  } catch (SQLException e) {
   // TODO Auto-generated catch block
   e.printStackTrace();
   response.getOutputStream().flush();
   response.getOutputStream().close();
  }
  
 }
    

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
//      String useridd=request.getParameter("id");
 
      InputStream inputstream=null;
      Part filePart=request.getPart("file");
      if(filePart!=null)
      {
          System.out.println(filePart.getName());
          System.out.println(filePart.getSize());
          System.out.println(filePart.getContentType());
          inputstream=filePart.getInputStream();
          
      }
      Connection conn=null;
      String message=null;
    try {
        DriverManager.registerDriver(new com.mysql.jdbc.Driver());
        conn=(Connection) DriverManager.getConnection(url,user,pass);
        String Sql="INSERT INTO sub(file)values(?)";
        PreparedStatement ps;
        ps=conn.prepareStatement(Sql);
  
       
        if(inputstream!=null)
        {
            ps.setBlob(1,inputstream);
        } 
        int row =ps.executeUpdate();
        if(row>0)
        {
            out.println("<script>alert('File is uploades well')</script>");
            
        }
        
        
    } catch (SQLException ex) {
        Logger.getLogger(upload.class.getName()).log(Level.SEVERE, null, ex);
    }
      
    }


}