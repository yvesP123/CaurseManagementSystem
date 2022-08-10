<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<!doctype html>
<html class="no-js" lang="en">
<head>
    
    <title>CourseManagement System</title>
    

    <link rel="apple-touch-icon" href="apple-icon.png">
   


    <link rel="stylesheet" href="vendors/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="vendors/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="vendors/themify-icons/css/themify-icons.css">
    <link rel="stylesheet" href="vendors/flag-icon-css/css/flag-icon.min.css">
    <link rel="stylesheet" href="vendors/selectFX/css/cs-skin-elastic.css">

    <link rel="stylesheet" href="assets/css/style.css">

    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>



</head>

<body class="bg-dark" style=" background-image: url('images/home-banner.jpg');">


    <div class="sufee-login d-flex align-content-center flex-wrap" >
        <div class="container">
            <div class="login-content">
                <div class="login-logo">
                    <h3 style="color:black">Course Management System </h3>
                    <hr  color="red"/>
                </div>
                <div class="login-form">
                    <form name="" method="post" action="student-process1.jsp">
                                
                            <div class="card-body card-block">
 
                                <div class="form-group"><label for="company" class=" form-control-label">Student Names</label><input type="text" name="name" value="" class="form-control" id="tname" required="true"></div>
                                                                          
                                        <div class="form-group"><label for="street" class=" form-control-label">student Email ID</label><input type="text" name="email" value="" id="email" class="form-control" required="true"></div>
                                           
                                        
                                                    
                                                    </div>
                                                    
                                                <div class="col-12">
                                                    <div class="form-group"><label for="city" class=" form-control-label"> Mobile Number</label><input type="text" name="phone" id="mobilenumber" value="" class="form-control" required="true" maxlength="10" pattern="[0-9]+"></div>
                                                    
                                                   
                                                    
                                                    </div>
                                                    <div class="row form-group">
                                              
                                                                  
                                                   
                                                <div class="col-12">
                                                    <div class="form-group"><label for="city" class=" form-control-label">Student RegNo</label><input type="text" name="regno" id="combination" value="" class="form-control" required="true"></div>
                                                    </div>
                                                     <div class="col-12">
                                                    <div class="form-group"><label for="city" class=" form-control-label">Student Password</label><input type="text" name="password" id="combination" value="" class="form-control" required="true"></div>
                                                    </div>
                                                <div class="col-12">
                                                    <div class="form-group"><label for="city" class=" form-control-label">Student Adress(separated by camma)</label><input type="text" name="address" id="qualifications" value="" placeholder="Eg:Rwanda,kigali,Nyarugenge,Rwezamenyo"class="form-control" required="true"></div>
                                                    </div>
                                                    
                                                   
                                                  
                                                    </div>
                                                     <p style="text-align: center;"><button type="submit" class="btn btn-primary btn-sm" name="submit" id="submit">
                                                            SignUp
                                                        </button></p>
                                                    
                                                </div>
                                                </form>

                </div>
            </div>
        </div>
    </div>


    <script src="vendors/jquery/dist/jquery.min.js"></script>
    <script src="vendors/popper.js/dist/umd/popper.min.js"></script>
    <script src="vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="assets/js/main.js"></script>


</body>

</html>