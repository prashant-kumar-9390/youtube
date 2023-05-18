<%@page contentType="text/html" import="java.sql.*,java.util.*" pageEncoding="UTF-8"%>
   <html>
	<head>
		
	   <title>Bootstrap Example</title>
	   <meta charset="utf-8">
	   <meta name="viewport" content="width=device-width, initial-scale=1">
	   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	  
	   <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
	   <script src="jquery-3.6.0.min.js"></script>
	   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	</head>  
        <script>
            
               $(document).ready(function(){
                      $(".btn.btn-primary").click(function(){
                           var name  = $("#name").val();
                           var mobile = $("#mobile").val();
                           var email = $("#email").val();
                       
                           if(name.length>4 && mobile.length<11){
                                  if ($.isNumeric(mobile)) {
                                          var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                                          if(emailRegex.test(email)){
                                                 alert("success");
                                                 $.post("insert.jsp",{name:name,mobile:mobile,email:email},function(data){
                                                        data = data.trim();
                                                        $("#table").append(data);
                                                 });
                                          }
                                          else{
                                                 $("#alert").html("<br><h5 class='alert-danger'>Invalid Email Id</h5>");
                                          }
                                  }
                                  else{
                                         $("#alert").html("<br><h5 class='alert-danger'>Enter correct mobile number</h5>");
                                           
                                  }
                           }
                           else{
                                    $("#alert").html("<br><h5 class='alert-danger'>Mininum character of name should be 5 and maximum digits for mobile number are 10</h5>");
                                          
                           }
                           
                      });
               });
               $(document).on("click",".btn.btn-light",function(){
                     var mobile = $(this).attr("id");
                     $.post("delete.jsp",{code:code},function(data){
                           data =  data.trim();    
                           if(data==="success"){
                                  locataion.reload();
                           }
                           else{
                                  $("#alert").html("Try Again");
                           }
                     });
               });
               $(document).on("click",".btn.btn-info",function(){
                     var code = $(this).attr("id");
                     $.post("edit.jsp",{code:code},function(data){
                           data =  data.trim();    
                           $("#main").html(data);
                     });
               });
               $(document).on("click",".btn.btn-dark",function(){
                    var name = $("#name").val();
                    var mobile =  $("#mobile").val();
                    var email = $("#email").val();
                    var code= $(this).attr("id");
                    $("save.jsp",{name:name,mobile:mobile,email:email,code:code},function(data){
                         data = data.trim();
                         if(data==="success"){
                                location.reload();
                         }
                    });
               });
        </script>
        <div class="container">
               
               <div class="row">
                     
                      <div class="col-sm-12" id="alert">
                             
                      </div>
               </div>
               <div class="row">
                      <div class="col-sm-12" id="main">
                          
                                   <h1>Web Form</h1>
                                   <h6 class="label label-default">Name</h6>
                                   <input type="text" class="form-control" id="name" required a>
                                   <br>
                                   <h6 class="label label-default">Mobile</h6>
                                   <input type="text" class="form-control" id="mobile"  required>
                                   <br>
                                   <h6 class="label label-default">Email</h6>
                                   <input type="email" class="form-control" id="email" required>
                                   <br>
                                   <button class="btn btn-primary" >Submit</button>

                             </div>
                      </div>  
               <div class="row" >
                      <div class="col-sm-12">
                             <br>
                             <br>
                             <h3>List</h3>
                             <table class="table table-striped" style="width: 100%" id="table">
                                    <tr><td>Name</td><td>Mobile</td><td>Email</td><td>Edit</td><td>Delete</td></tr>
                                    <%
                                      try{
                                               Class.forName("com.mysql.jdbc.Driver");
                                               Connection cn =DriverManager.getConnection("jdbc:mysql://localhost:3306/ecb","root","");
                                               PreparedStatement st = cn.prepareStatement("select * from details");
                                               ResultSet rs = st.executeQuery();
                                               while(rs.next()){
                                                      %>
                                                      <tr><td><%=rs.getString("name")%></td><td><%=rs.getString("mobile")%></td><td><%=rs.getString("email")%></td><td><button class="btn btn-info" id="<%=rs.getString("code")%>">Edit</button></td><td><button class="btn btn-light" id="<%=rs.getString("code")%>">Delete</button></td></tr>      
                                                       <%      
                                               }
                                      }
                                      catch(Exception er){
                                          out.print(er.getMessage());   
                                      }
                                               
                                           
                                           
                                           %>
                                    
                             </table>
                      </div>
               </div>
               </div>        
    
        <body>
               
        </body>
   </html> 