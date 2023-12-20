<%@ page import ="com.taskmanagement .model.*"%>
<%@ page import="com.taskmanagement.utility.*"%>
<%@ page import="com.taskmanagement.dao.*"%>
<%@ page import ="org.springframework.context.ApplicationContext"%>
<%@ page import ="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@ page import ="java.sql.*"%>
<%@ page import ="java.util.*"%>


<%

String userType=(String)session.getAttribute("user-login");
Admin admin = null;
Assigner assigner = null;
Assignee assignee = null;
if(userType != null && userType.equals("admin")){
	 admin = (Admin) session.getAttribute("active-user");
}

else if(userType != null && userType.equals("assigner")){
	assigner= (Assigner)session.getAttribute("active-user");
}

else if(userType != null && userType.equals("assignee")){
	assignee= (Assignee)session.getAttribute("active-user");
}

ApplicationContext context =  WebApplicationContextUtils.getWebApplicationContext(getServletContext());
AdminDao adminDao = context.getBean(AdminDao.class);
AssignerDao assignerDao = context.getBean(AssignerDao.class);
AssigneeDao assigneeDao = context.getBean(AssigneeDao.class);
TaskDao taskDao = context.getBean(TaskDao.class);
      
%>

<nav class="navbar navbar-expand-lg navbar-dark custom-bg">

<div class="container-fluid">
  <a class="navbar-brand" href="/"><h3 class="text-color"><i>Task Management</i></h3></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
    
    
    <%
        	 if(userType != null && userType.equals("admin"))
        	 {
    %>
                 <li class="nav-item active">
                    <a class="nav-link" href="adminpage"><b class="text-color">Admin Page</b> <span class="sr-only">(current)</span></a>
                 </li>
    <%
        	 }
    
        	 else if(userType != null && userType.equals("assigner"))
        	 {
    %>
      <li class="nav-item active">
                    <a class="nav-link" href="myassigned"><b class="text-color">ASSIGN & ASSIGNED</b> <span class="sr-only">(current)</span></a>
                   </li>
                   <li class="nav-item active">
                    <a class="nav-link" href="notificationAssigner"><b class="text-color">Notification</b> <span class="sr-only">(current)</span></a>
                 </li>
    <%
        	 } else if(userType != null && userType.equals("assignee")) {
    
    %>  <li class="nav-item active">
                    <a class="nav-link" href="mytask"><b class="text-color">My Task</b> <span class="sr-only">(current)</span></a>
                 </li>
                 <%
        	 }
                 %>
     
      
      <li class="nav-item active text-color ml-2" data-toggle="modal" data-target=".aboutusmodal">
          <div class="nav-link" ><b class="text-color">About us</b></div>
      </li>
      
      <li class="nav-item active text-color ml-2" data-toggle="modal" data-target=".contactusmodal">
          <div class="nav-link" ><b class="text-color">Contact us</b></div>
      </li>
     
    </ul>
    
    
        <%
           if(userType != null) {
        %>
          <ul class="navbar-nav ml-auto">
              
              <%
                  if(userType.equals("assigner"))
                  {	  
              %>
                  
                    
              <%
                  }
              
                  else if(userType.equals("assignee")) 
                  {
             %> 
             
             <%
                  }
                  
                  else if(userType.equals("admin")) 
                  {
             %> 
             
             <li class="nav-item active text-color">
                        <a class="nav-link" href="assignerregister"><b class="text-color">Register Assigner</b></a>
                     </li>
                     
                      <li class="nav-item active text-color">
                        <a class="nav-link" href="assigneeregister"><b class="text-color">Register Assignee</b></a>
                     </li>
                     
             
             
             <%
                  }
             
             %>
             <li class="nav-item active text-color" data-toggle="modal" data-target=".logout-modal">
               <a class="nav-link" href="#" ><b>Logout</b></a>
               </li> 
              </ul>   
              <%
             
           }     
              
                    
        else
        {
    %>
      <ul class="navbar-nav ml-auto text-color">
    
    <li class="nav-item active text-color">
        <a class="nav-link" href="adminlogin"><b class="text-color">Admin Login</b></a>
      </li> 
    
      <li class="nav-item active text-color">
        <a class="nav-link" href="assigneelogin"><b class="text-color">Assignee Login</b></a>
      </li>  
      
      <li class="nav-item text-color active">
        <a class="nav-link" href="assignerlogin"><b class="text-color">Assigner Login</b></a>
      </li>    
    </ul>
    
    <%
        }
    %>     
    
  </div>
  </div>
</nav>

<!-- Logout modal -->

<div class="modal fade logout-modal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
    <div class="modal-header custom-bg text-white text-center">
        <h5 class="modal-title" id="exampleModalLongTitle" >Log Out</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
    </div>
    <div class="modal-body text-center">
            <h5>Do you want to logout?</h5>
          
          <div class="text-center">
            <a href="logout"><button type="button" class="btn custom-bg text-white">Yes</button></a>
            <button type="button" class="btn btn-secondary ml-5" data-dismiss="modal">No</button>
          </div> 
     </div>     
    </div>
  </div>
</div>

<!-- *********** -->

<!-- About us modal -->

<div class="modal fade aboutusmodal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
       <div class="modal-header custom-bg text-white text-center">
        <h5 class="modal-title" id="exampleModalLongTitle" >About Us</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div> 
      <div class="modal-body">
        <div class="container">
        <p style="font-size:20px;">
          <b>
              Symbiosis Centre for Distance Learning (SCDL) has, since its inception in 2001, made rapid strides in providing quality education to many students - making it one of the few large and most sought after distance learning institutes of India.

Symbiosis Centre for Distance Learning (SCDL) offers Post Graduate Diploma, Diploma and Certificate programs across industry sectors including Business Management, International Business, Information Technology, Banking and Finance, Supply Chain Management, Customer Relationship Management, Insurance Management, Education Management, Business and Corporate Law and Entrepreneurship Development.
          </b>
        </p>
        </div>
      </div>
      <div class="modal-footer">
       <div class="text-center">
        <button type="button" class="btn custom-bg text-white" data-dismiss="modal">Close</button>
       </div>
      </div>
    </div>
  </div>
</div>
<!-- ********** -->

<!-- Contact us modal -->

<div class="modal fade contactusmodal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
       <div class="modal-header custom-bg text-white text-center">
        <h5 class="modal-title" id="exampleModalLongTitle" >Contact Us</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div> 
      <div class="modal-body">
        <div class="container text-center">
        <p style="font-size:23px;">
            <b>
                <img src="resources/images/phonee.png" style="width:27px;" alt="img">+91 XXXXXXXXX / +91 XXXXXXXX<br>
                <img src="resources/images/emaill.png" style="width:29px;" alt="img">xxxxxxx@gmail.com
            </b>
        </p>
        </div>
      </div>
      <div class="modal-footer">
       <div class="text-center">
        <button type="button" class="btn custom-bg text-white" data-dismiss="modal">Close</button>
       </div>
      </div>
    </div>
  </div>
</div>
<!-- ********** -->