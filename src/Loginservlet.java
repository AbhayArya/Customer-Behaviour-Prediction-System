

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.*;
import javax.servlet.ServletException;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.ResultSet;

/**

 */
@WebServlet("/Loginservlet")
public class Loginservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public Loginservlet() {
        // TODO Auto-generated constructor stub
    }
    @Override
    public  void init() throws ServletException{
    	super.init();
    
    	
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 String connectionURL = "jdbc:mysql://localhost:3306/project";
		  Connection connection=null;
		  response.setContentType("jsp");
		  PrintWriter out=response.getWriter();
		  //get the variables entered in the form
		  String semail= request.getParameter("email");
		  String spassword= request.getParameter("password");
		 
	
		  try {
		  // Load the database driver
		  Class.forName("com.mysql.jdbc.Driver");
		  // Get a Connection to the database
		  connection = DriverManager.getConnection
		  (connectionURL, "root", ""); 
		  //Add the data into the database
		  String sql = 
		  "select email,password from register where email=? and password=?";
		  PreparedStatement pst = connection.prepareStatement(sql);
		  pst.setString(1, semail);
		  pst.setString(2, spassword);
		  
		  ResultSet rs=(ResultSet) pst.executeQuery();
		  while(rs.next()) {
			  
			  System.out.print("welcome to the world of shopping");
			  MysqlCon.main(null);
			  apriori1.main(null);
			  response.sendRedirect("/firstproject/shopping.com/index.jsp");
			  return;
		  }
			 System.out.print("error");
		  pst.close();
		  }
		  catch(Exception e){
			  System.out.println(e);
		  }
		  finally {
		  // Always close the database connection.
		  try {
		  if (connection != null) connection.close();
		  }
		  catch (SQLException e) {
			  System.out.println(e);
		  }
		  }
	}
		}


