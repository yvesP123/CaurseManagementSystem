

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Download
 */
@WebServlet("/Download")
public class Download extends HttpServlet {
	public static int BUFFER_SIZE=1024*100;
	public static final String UPLOAD_DIR="resources";
	public static String filename=null;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	filename=request.getParameter("filename");
	if(filename==null || filename.equals(""))
			{
		
		response.setContentType("text/html");
		response.getWriter().println("file" +filename+" is no presenting");
			}
	else 
	{
		String applicationpath=getServletContext().getRealPath("");
		String downloadpath=applicationpath + File.separator + UPLOAD_DIR;
		String filepath= downloadpath+ File.separator +filename;
		File file=new File(filepath);
		OutputStream outputstream=null;
		FileInputStream inputstream=null;
		if(file.exists()) 
		{
			String nimType="application/octet-stream";
			response.setContentType(nimType);
			String headkey="Content-Disposition";
			String headervalue=String.format("attachment;filename=\"%s\"",file.getName());
			response.setHeader(headkey, headervalue);
			outputstream=response.getOutputStream();
			inputstream=new FileInputStream(file);
			byte[] buffer=new byte[BUFFER_SIZE];
			int byteRead=-1;
			while((byteRead=inputstream.read(buffer))!=-1) 
			{
				outputstream.write(buffer, 0, byteRead);
			}
			
		}
		
	}
	}

}
