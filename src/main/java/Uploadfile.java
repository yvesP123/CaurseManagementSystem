

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.RequestContext;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;




/**
 * Servlet implementation class Uploadfile
 */
@WebServlet("/Uploadfile")
@MultipartConfig(fileSizeThreshold=1024*1024*10, // 2MB
maxFileSize=1024*1024*1000,      // 10MB
maxRequestSize=1024*1024*1000)   // 50MB
public class Uploadfile extends HttpServlet {
	
	PrintWriter out=null;
	Connection conn=null;
	PreparedStatement ps=null;
	HttpSession session=null;
	private static final String foldername="files";
	private static final int THRESHOLD=1024*1024*10;
	private static final int MAX_FILE_SIZE=1024*1024*10000;
	private static final int MAX_REQUEST_SIZE=1024*1024*10000;
	
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	response.setContentType("text/plain;charset=UTF-8");
		out =response.getWriter();
		session =request.getSession(false);
		if(!ServletFileUpload.isMultipartContent(request)) 
		{
			PrintWriter writer=response.getWriter();
			writer.println("Request doest not contain upload data");
			writer.flush();
			return;
		}
		DiskFileItemFactory factory=new DiskFileItemFactory();
		factory.setSizeThreshold(THRESHOLD);
		factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
		ServletFileUpload upload=new ServletFileUpload(factory);
		upload.setFileSizeMax(MAX_FILE_SIZE);
		upload.setFileSizeMax(MAX_REQUEST_SIZE);
		
		
		//String uploadpath=request.getServletContext().getRealPath("") + File.separator + foldername; for netbean
		String uploadpath=request.getServletContext().getRealPath(" ") +File.separator+ foldername;//for eclipse
		File dir=new File(uploadpath);
		if(!dir.exists()) 
		{
			dir.mkdir();
		}
		Part filepart=request.getPart("file");
		String name=request.getParameter("name");
		String code=request.getParameter("code");
		String description=request.getParameter("description");
		String filename=filepart.getSubmittedFileName();
		String path=foldername + File.separator + filename;
		System.out.println("Filename"+filename);
		System.out.println("Path"+uploadpath);
//		InputStream is=filepart.getInputStream();
//Files.copy(is,Paths.get(uploadpath + File.separator + filename),StandardCopyOption.REPLACE_EXISTING);
//		
		try {
			List formitem=upload.parseRequest((RequestContext) request);
			Iterator iter=formitem.iterator();
			while(iter.hasNext()) 
			{
				FileItem item=(FileItem) iter.next();
				if(!item.isFormField()) 
				{
					File storefile=new File(path);
					item.write(storefile);
				}
			}
			Class.forName("com.mysql.jdbc.Driver");
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/course","root","password");
			String sql="insert into subject(name,code,filename,path)values(?,?,?,?)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, code);
			ps.setString(3, filename);
			ps.setString(4, path);
			int i=ps.executeUpdate();
			if(i>0) 
			{
				out.print("file has been inseted");
				session.setAttribute("filename",filename);
			}
			else 
			{
				out.print("file has not inseted");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	
	}

}
