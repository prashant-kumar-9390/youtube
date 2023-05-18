
<%@page contentType="text/html" import="java.sql.*,java.util.*" pageEncoding="UTF-8"%>
<%
   if(request.getParameter("name")!=null && request.getParameter("mobile")!=null && request.getParameter("email")!=null){
          String name = request.getParameter("name");
          String email = request.getParameter("email");
          int  mobile = Integer.parseInt(request.getParameter("mobile"));
          String code = "";
          LinkedList l = new LinkedList();
              for(int i=1;i<=9;i++){
                     l.add(new Integer(i));
              }
              for(char i='A';i<='Z';i++){
                     l.add(i);
              }
              for(char i='a';i<='z';i++){
                     l.add(i);
              }
              Collections.shuffle(l);
              for(int i=0;i< 6;i++){
                   code = code + l.get(i);
              }
          try{
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection cn =DriverManager.getConnection("jdbc:mysql://localhost:3306/ecb","root","");
                    PreparedStatement st = cn.prepareStatement("select * from details values(?,?,?,?)");
                    st.setString(1,name);
                    st.setInt(2,mobile);
                    st.setString(3,email);
                    st.setString(4,code);
                    if(st.executeUpdate()>0){
                           %>
                            <tr><td><%=name%></td><td><%=mobile%></td><td><%=email%></td><td><button class="btn btn-info" id="<%=code%>">Edit</button></td><td><button class="btn btn-light" id="<%=code%>">Delete</button></td></tr>      
                           <%
                    }
          }
          catch(Exception er){
                 out.print(er.getMessage());
          }
   }    
       
       
       
%>       