<%@ page import="java.sql.*" %>

<html>
  <head>
   <title>Authentication </title>  
  <style>
   
   *{font-size: 50px;}
    a{text-decoration:none;}
  body{background-color:azure;}
  form{width:40%;
    border:black solid 5px;
    border-radius:10px;
    background-color:grey;   
    
}
  
 form input{
    width:60%;
    height:35px;
    font-size:30px;
    margin:20px;
    padding:1px;
    border-radius:10px;
    
}
  
</style>
  </head>
   <body>
     <center>
    <h1>Admin Login</h1>
     <form method="POST">
       <input type="text" name="un" placeholder="enter your username" required/> <br/> 
       <input type="password" name="pswd" placeholder="enter your password" required/><br>
        <input type="submit" name="btn" value="Login" style="height:40px; width:15%; font-weight:bold;"/> <br/> 
       <a href="signup.jsp">Click for registation</a>
       
      </form>
       
        <%  if(request.getParameter("btn")!=null)
         {
             String un=request.getParameter("un");
             String pswd=request.getParameter("pswd");
           
          try{
 
              DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
              String url="jdbc:mysql://localhost:3306/EMS_PROJECT";
              Connection con=DriverManager.getConnection(url,"root","abc456");
              String sql="select * from users where username=? and password=?";
              PreparedStatement pst=con.prepareStatement(sql);
              pst.setString(1,un);
              pst.setString(2,pswd);
              ResultSet rs=pst.executeQuery();
             
             if(rs.next())
            {   request.getSession().setAttribute("user",un);
                response.sendRedirect("home.jsp");
                
          } else   {out.println("invalid login");}
             
         }catch(SQLException er )
          {
            out.println("isuue" + er);
         }
            

          }
         
        %> 
    
     
       
    </center>
   </body>

</html>