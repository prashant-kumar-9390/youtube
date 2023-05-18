<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<%
   if(request.getParameter("code")!=null){
        
          String code = request.getParameter("code");
          try{
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection cn =DriverManager.getConnection("jdbc:mysql://localhost:3306/ecb","root","");
                    PreparedStatement st = cn.prepareStatement("delete from details where code=?");
                    st.setString(1,code);
                   
                    if(st.executeUpdate()>0){
                         out.print("success");
                           
                    }
          }
          catch(Exception er){
                 out.print(er.getMessage());
          }
   }    
       
       
       
%>       
