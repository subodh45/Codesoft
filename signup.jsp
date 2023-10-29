<%@ page import="java.sql.*" %>

<html>
  <head>
   <title>Authentication </title>  
  <style>
   body{background-color:azure}
   *{font-size: 50px;}
    a{text-decoration:none;}

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
    <h1>Login Page</h1>
     <form method="POST">
       <input type="text" name="un" placeholder="enter your username" required/> <br/> 
       <input type="password" name="pswd" placeholder="enter your password" required/> <br/> 
        <input type="password" name="pswd2" placeholder=" confirm password" required/> <br/>
        <input type="submit" name="btn" value="Sign In" style="height:40px; width:20%; font-weight:bold;"/> <br/> 
       <a href="index.jsp">Login page</a>
       </form>
       
        <%  if(request.getParameter("btn")!=null)
         {
             String un=request.getParameter("un");
             String pswd=request.getParameter("pswd");
             String pswd2=request.getParameter("pswd2");
           
          if(!pswd.equals(pswd2))
            {out.println("password didn not match ");
              return;     }

           if(pswd.length()<8)
            {out.println("min 8 character plzz ");
              return;}
           
          try{
 
              DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
              String url="jdbc:mysql://localhost:3306/EMS_PROJECT";
              Connection con=DriverManager.getConnection(url,"root","abc456");
              String sql="insert into users values(?,?)";
              PreparedStatement pst=con.prepareStatement(sql);
              pst.setString(1,un);
              pst.setString(2,pswd);
              pst.executeUpdate();
              con.close();
              response.sendRedirect("index.jsp");
         }catch(SQLException er )
          {
            out.println("isuue" + er);
         }
            

          }
         
        %> 
    
    </center>
   </body>

</html>