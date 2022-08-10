<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<aside id="left-panel" class="left-panel">
        <nav class="navbar navbar-expand-sm navbar-default">
<
            <div class="navbar-header">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#main-menu" aria-controls="main-menu" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="fa fa-bars"></i>
                </button> 
                <a class="navbar-brand" href="dashboard.php">Course ADMIN | </a>
                
            </div>

            <div id="main-menu" class="main-menu collapse navbar-collapse">
                <ul class="nav navbar-nav">
                    <li class="active">
                        <a href="#"> <i class="menu-icon fa fa-dashboard"></i>Dashboard </a>
                    </li>
                     <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-tasks"></i>Student</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="menu-icon fa fa-file-o"></i><a href="add-student.jsp">Add Student</a></li>
                            <li><i class="menu-icon fa fa-file-o"></i><a href="manage-student.jsp">View Student</a></li>
                        </ul>
                    </li>
<li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-tasks"></i>Subjects</a>
                         <ul class="sub-menu children dropdown-menu">
                            <li><i class="menu-icon fa fa-file-o"></i><a href="add-subjects.jsp">Add Subjects</a></li>
                            <li><i class="menu-icon fa fa-file-o"></i><a href="manage-subjects.jsp">Manage Subjects</a></li>
                        </ul>
                    </li>



                     
                   

                </ul>
            </div><!-- /.navbar-collapse -->
        </nav>
    </aside>