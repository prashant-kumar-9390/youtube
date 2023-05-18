<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<%
   if(request.getParameter("code")!=null){
        
          String code = request.getParameter("code");
          try{
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection cn =DriverManager.getConnection("jdbc:mysql://localhost:3306/ecb","root","");
                    PreparedStatement st = cn.prepareStatement("select * from details where code=?");
                    st.setString(1,code);
                    ResultSet rs= st.executeQuery();
                    if(rs.next()){
                           %>
                           
                                   <h1>Web Form</h1>
                                   <h6 class="label label-default">Name</h6>
                                   <input type="text" class="form-control" id="name" value="<%=rs.getString("name")%>" required>
                                   <br>
                                   <h6 class="label label-default">Mobile</h6>
                                   <input type="text" class="form-control" id="mobile" value="<%=rs.getString("mobile")%>"  required>
                                   <br>
                                   <h6 class="label label-default">Email</h6>
                                   <input type="email" class="form-control" id="email" value="<%=rs.getString("email")%>"  required>
                                   <br>
                                   <button class="btn btn-dark" id="<%=code%>">Save</button>

                           
                           <%
                    }
          }
          catch(Exception er){
                 out.print(er.getMessage());
          }
   }    
       
       
       
%>       
