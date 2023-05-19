<%-- 
    Document   : save
    Created on : 18 May, 2023, 10:09:57 PM
    Author     : HP
--%>

<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<%
   if(request.getParameter("name")!=null && request.getParameter("mobile")!=null && request.getParameter("email")!=null && request.getParameter("code")!=null){
          String name = request.getParameter("name");
          String email = request.getParameter("email");
          int mobile = Integer.parseInt(request.getParameter("mobile"));
          String code = request.getParameter("code");
          try{
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection cn =DriverManager.getConnection("jdbc:mysql://localhost:3306/ecb","root","");
                    PreparedStatement st = cn.prepareStatement("update  details set name=?,mobile=?,email=? where code=?");
                    
                    st.setString(1,name);
                    st.setInt(2,mobile);
                    st.setString(3,email);
                    st.setString(4,code);
                    if(st.executeUpdate()>0){
                           out.print("success");
                    }
          }
          catch(Exception er){
              out.print(er.getMessage());   
          }
   }    
       
       
       
%>       
