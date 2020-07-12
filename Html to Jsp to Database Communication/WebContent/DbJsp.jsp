 <%@page import="java.sql.*"%>
    
 <%! 
  Connection con=null;
 PreparedStatement ps1,ps2;
 ResultSet rs;
   public void jspInit(){
	   
	   try{
	   // acess servlet config object
	   ServletConfig cg=getServletConfig();
	   String s1=cg.getInitParameter("driver");
	   String s2=cg.getInitParameter("url");
	   String s3=cg.getInitParameter("user");
	   String s4=cg.getInitParameter("pwd");
	   
	   // register the jdbc driver 
	   Class.forName(s1);
	   con=DriverManager.getConnection(s2,s3,s4);
	   ps1=con.prepareStatement("insert into student values(?,?,?,?)");
	   ps2=con.prepareStatement("select * from student");
   
   }
	   catch(SQLException se){
		   se.printStackTrace();
	   }
	   catch(ClassNotFoundException cnf){
		   cnf.printStackTrace();
	   }
	   catch(Exception e){
		   e.printStackTrace();
	   }
 
   }//JspInt
 
 %> 
 
 
 <%
 
 // read the s1 param value 
 String pval=request.getParameter("s1");
 if(pval.equals("Register")){
	 // read from the data 
	 
	 int no=Integer.parseInt(request.getParameter("tsno"));
	 String name=request.getParameter("tsname");
	 String addrs=request.getParameter("tsadd");
	 Float avg=Float.parseFloat(request.getParameter("tsavg"));
	 
	 // set from data as the values to query param
	 ps1.setInt(1,no);
	 ps1.setString(2,name);
	 ps1.setString(3,addrs);
    ps1.setFloat(4,avg);
     
     int result=ps1.executeUpdate();
     if(result==0){%>
     <b>registration failed </b>
    <% }
     else {%>
     
    	<b>Registration done</b> 
   <%  } 
 }
 else{
	 //execute the query
	 rs=ps2.executeQuery();
   // get result set meta data
   ResultSetMetaData rsmd=rs.getMetaData();
   %> 
   <b> Student Table </b>
   <table border="1">
   <tr>
   <%for(int i=1;i<=rsmd.getColumnCount();++i){ %>
   <td><%=rsmd.getColumnLabel(i) %></td>
   <%} %>  
   </tr>
   <%
   while(rs.next()){%>
   <tr>
   <%for(int i=1;i<=rsmd.getColumnCount();++i){ %>
   <td><%=rs.getString(i) %></td>
   <%} %>
   </tr>
   <%}//while %>
 
</table>    

<%}//else %>

<a href="input.html">  Back </a>

<%!
public void jspDestroy(){
	try {
		if(con!=null)
		con.close();
	     }
		catch(SQLException se) {
		se.printStackTrace();
                              }
   try {
	   if(ps1!=null)
		   ps1.close();
   }
   catch(SQLException se) {
	   se.printStackTrace();
   }
   
   try{
   if(ps2!=null)
	   ps2.close();	
      }
   catch(SQLException se){
	   se.printStackTrace();
   }
   
   try {
		if(rs!=null)
		rs.close();
	     }
		catch(SQLException se) {
		se.printStackTrace();
          }

}
%>

 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 