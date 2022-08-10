<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>
<html class="no-js" lang="en">
<head>
    
    <title>Course||||Manage Course</title>
    
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
                        <h1>Manage Course</h1>
                    </div>
                </div>
            </div>
            <div class="col-sm-8">
                <div class="page-header float-right">
                    <div class="page-title">
                        <ol class="breadcrumb text-right">
                            <li><a href="dashboard.php">Dashboard</a></li>
                            <li><a href="manage-teacher.php">Manage Student</a></li>
                            <li class="active">Manage Students</li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>

        <div class="content mt-3">
            <div class="animated fadeIn">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-header">
                                <strong class="card-title">Manage Course</strong>
                            </div>
                            <div class="card-body">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <tr>
                  <th>NO</th>
            
                  <th>Name of Course</th>
                  <th>File</th>
                      
                   <th>Action</th>
                </tr>
                                        </tr>
                                        </thead>
                                  
            <%@ include file="config.jsp" %>  
            <%
            Statement st=null;
            ResultSet rs=null;
            String sql="select * from subject";
            st=conn.createStatement();
            rs=st.executeQuery(sql);
            while(rs.next()){
            %>
            
                <tr>
                  <td><%=rs.getString("id") %></td>
            <td><%=rs.getString("name") %></td>
                  <td><%=rs.getString("filename") %></td>
                
                   <td >
												<div class="visible-md visible-lg hidden-sm hidden-xs">
	<a href="delete1.jsp?id=<%=rs.getString("id") %>" onClick="return confirm('Are you sure you want to delete?')"class="btn btn-transparent btn-xs tooltips"data-toggle="tooltip" data-original-title="Delete"><i class="fa fa-times fa fa-white"></i></a>
										
										
												</div>
												</td> </tr>
              

                     <%} %>           </table>
                            </div>
                        </div>
                    </div>



                </div>
            </div><!-- .animated -->
        </div><!-- .content -->


    </div><!-- /#right-panel -->

    <!-- Right Panel -->


    <script src="vendors/jquery/dist/jquery.min.js"></script>
    <script src="vendors/popper.js/dist/umd/popper.min.js"></script>
    <script src="vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="assets/js/main.js"></script>


</body>
<%} %>
</html>
    