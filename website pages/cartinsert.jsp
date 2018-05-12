<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="java.lang.*"%>
<%@page import="java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		//int sh,su,wh,sg,bp,tsr;
		try {
			String sh = null;
			String su = null;
			String wh = null;
			String sg = null;
			String bp = null;
			String tsr = null;
			Class.forName("com.mysql.jdbc.Driver");
			// establishing connection with databases
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root","");
			String s1 = request.getParameter("Shirts");
			if (s1 != null) {
				sh = "1";

			} else {
				sh = "0";
			}
			String s2 = request.getParameter("Trousers");
			if (s2 != null) {
				tsr = "1";

			} else {
				tsr = "0";
			}
			String s3 = request.getParameter("Shoes");
			if (s3 != null) {
				su = "1";

			} else {
				su = "0";
			}
			String s4 = request.getParameter("Watches");
			if (s4 != null) {
				wh = "1";

			} else {
				wh = "0";
			}
			String s5 = request.getParameter("Sunglasses");
			if (s5 != null) {
				sg = "1";

			} else {
				sg = "0";
			}
			String s6 = request.getParameter("Backpacks");
			if (s6 != null) {
				bp = "1";

			} else {
				bp = "0";
			}
		
			Statement stmt = con.createStatement();

			/*String sql = "INSERT INTO transrecord(watch,shoe,shirt,sunglass,backpack,trouser)VALUES ('wh', 'su', 'sh', 'sg', 'bp', 'tsr')"; */
			//stmt.executeUpdate("INSERT INTO transrecord(watch,shoe,shirt,sunglass,backpack,trouser) VALUES (Integer.parseInt(wh),Integer.parseInt(su),Integer.parseInt(sh),Integer.parseInt(sg),Integer.parseInt(bp),Integer.parseInt(tsr))");
			//stmt.executeUpdate("INSERT INTO transrecord(watch,shoe,shirt,sunglass,backpack,trouser) VALUES (wh,su,sh,sg,bp,tsr)");
			//Statement st = con.createStatement();
			String sql = "insert into transrecord(watch,shoes,shirts,sunglasses,Backpacks,Trosures) values (?,?,?,?,?,?)";
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, wh);
			pst.setString(2, su);
			pst.setString(3, sh);
			pst.setString(4, sg);
			pst.setString(5, bp);
			pst.setString(6, tsr);
			int i = pst.executeUpdate();
			if (i > 0){
				try{
					Runtime.getRuntime().exec("C:\\Users\\Abhay\\eclipse-workspace\\firstproject\\deleteimage.bat");
				}catch( Throwable t){
					t.printStackTrace();
				}
				 response.sendRedirect("/firstproject/shopping.com/rediret.jsp");
			}
			pst.close();
		}catch (Exception e) {
			System.err.println(e);
		}
	%>
</body>
</html>
