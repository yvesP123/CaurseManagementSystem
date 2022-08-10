<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!doctype html>
<html class="no-js" lang="en">

<head>
   
    <title>Course Add Students</title>
  

    <link rel="apple-touch-icon" href="apple-icon.png">


    <link rel="stylesheet" href="vendors/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="vendors/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="vendors/themify-icons/css/themify-icons.css">
    <link rel="stylesheet" href="vendors/flag-icon-css/css/flag-icon.min.css">
    <link rel="stylesheet" href="vendors/selectFX/css/cs-skin-elastic.css">

    <link rel="stylesheet" href="assets/css/style.css">

    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>



</head>

<body>
<% 
                                        response.setHeader("Cache-control", "no-cache,no-store,must-revalidate");
                                        String user=(String)session.getAttribute("username");
                                        if(user==null){
                                        	
                                        	response.sendRedirect("index.jsp");
                                        }
                                        else {
                                       %>
    <!-- Left Panel -->
  <%@ include file="sidebar.jsp" %>
    
    <div id="right-panel" class="right-panel">

        <!-- Header-->
        <%@ include file="header.jsp" %>
       
        <div class="breadcrumbs">
            <div class="col-sm-4">
                <div class="page-header float-left">
                    <div class="page-title">
                        <h1>Student Details</h1>
                    </div>
                </div>
            </div>
            <div class="col-sm-8">
                <div class="page-header float-right">
                    <div class="page-title">
                        <ol class="breadcrumb text-right">
                            <li><a href="dashboard.php">Dashboard</a></li>
                            <li><a href="add-teacher.php">Students Details</a></li>
                            <li class="active">Add</li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>

        <div class="content mt-3">
            <div class="animated fadeIn">


                <div class="row">
                    <div class="col-lg-6">
                       <!-- .card -->

                    </div>
                    <!--/.col-->

                    <div class="col-lg-12">
                        <div class="card">
                           
                            <div class="card-header"><strong>Student </strong><small> Details</small></div>
                            <%@ include file="config.jsp" %>
                            <%
                            Statement st=null;
                            String id=request.getParameter("id");
                            String sql="select * from student where id="+id;
                            st=conn.createStatement();
                            ResultSet rs;
                            
                           rs=st.executeQuery(sql);
                           rs.next();
                            %>
                            <form name="" method="post" action="update-process.jsp">
                                
                            <div class="card-body card-block">
  <div class="form-group"><input type="hidden" name="id"  class="form-control" value="<%=rs.getString("id") %>" required="true"></div>
                               
                                <div class="form-group"><label for="company" class=" form-control-label">Student Names</label><input type="text" name="name" value="<%=rs.getString("name") %>"  class="form-control" id="tname" required="true"></div>
                                                                          
                                        <div class="form-group"><label for="street" class=" form-control-label">student Email ID</label><input type="text" name="email" value="<%=rs.getString("email") %>"  id="email" class="form-control" required="true"></div>
                                           
                                        
                                                    
                                                    </div>
                                                    
                                                <div class="col-12">
                                                    <div class="form-group"><label for="city" class=" form-control-label"> Mobile Number</label><input type="text" name="phone" id="mobilenumber" value="<%=rs.getString("phone") %>"  class="form-control" required="true" maxlength="10" pattern="[0-9]+"></div>
                                                    
                                                   
                                                    
                                                    </div>
                                                    <div class="row form-group">
                                              
                                                                  
                                                   
                                                <div class="col-12">
                                                    <div class="form-group"><label for="city" class=" form-control-label">Student RegNo</label><input type="text" name="regno" id="combination" value="<%=rs.getString("regno") %>"  class="form-control" required="true"></div>
                                                    </div>
                                                    
                                                <div class="col-12">
                                                    <div class="form-group"><label for="city" class=" form-control-label">Student Adress(separated by camma)</label><input type="text" name="address" id="qualifications" value="<%=rs.getString("address") %>"  placeholder="Eg:Rwanda,kigali,Nyarugenge,Rwezamenyo"class="form-control" required="true"></div>
                                                    </div>
                                                    
                                                   
                                                  
                                                    </div>
                                                     <p style="text-align: center;"><button type="submit" class="btn btn-primary btn-sm" name="submit" id="submit">
                                                            <i class="fa fa-dot-circle-o"></i> Update
                                                        </button></p>
                                                    
                                                </div>
                                                </form>
                                            </div>



                                           
                                            </div>
                                        </div><!-- .animated -->
                                    </div><!-- .content -->
                                </div><!-- /#right-panel -->
                                <!-- Right Panel -->


                            <script src="vendors/jquery/dist/jquery.min.js"></script>
                            <script src="vendors/popper.js/dist/umd/popper.min.js"></script>

                            <script src="vendors/jquery-validation/dist/jquery.validate.min.js"></script>
                            <script src="vendors/jquery-validation-unobtrusive/dist/jquery.validate.unobtrusive.min.js"></script>

                            <script src="vendors/bootstrap/dist/js/bootstrap.min.js"></script>
                            <script src="assets/js/main.js"></script>
</body>
<%} %>
</html>
