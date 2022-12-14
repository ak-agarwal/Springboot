<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html lang="en">

	<head>
	  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" type="text/css">
	  <title>Employee Dashboard</title>
	  <!-- Required meta tags -->
	  <meta charset="utf-8">
	  <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport" />
	  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	  <!--     Fonts and icons     -->
	  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
	  <link rel="stylesheet" href="../assets/css/fontawesome.min.css">
	  <!-- Material Kit CSS -->
	  <link href="../assets/css/material-dashboard.css?v=2.1.1" rel="stylesheet"/>
	  <!-- own CSS -->
	  <link href="../css/employee_new_2.css" rel="stylesheet" />
	  <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
	  <script src="https://code.jquery.com/jquery-1.12.3.min.js"></script>
	  <link rel="stylesheet" href="../assets/css/magnific-popup.css" media="screen" />

	  <meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	
    <link href="../assets/css/bootstrap.css" rel="stylesheet" />

	<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">

	<script src="../assets/js/jquery-1.10.2.js" type="text/javascript"></script>
	<script src="../assets/js/bootstrap.js" type="text/javascript"></script>
	
	</head>
	<body>
		
		
		<!--Signup form Page-->
	
		<div class="card card-nav-tabs"><br>
				<h4 class="card-header card-header-primary">Sign Up Form</h4>
				<br>
				 
				  <form:form method="post" action="saveForm"  id="enqForm" modelAttribute="enquiryDetails">
			<div class="card card-nav-tabs">
					<h4 class="card-header card-header-primary">Personal Details</h4>
				<div class="card-body">
					<div class="form-row">
						<div class="col">
						<!-- <label for="firstname">First Name :</label> -->
						<form:input type="text" class="form-control" path="firstName" id="firstName" placeholder="First name" required="true"/>
						</div>
					</div>
					<div class="form-row">
						<div class="col">
						<!-- <label for="lastname">Last Name :</label> -->
						<form:input type="text" class="form-control" path="lastName" id="lastName" placeholder="Last name" required="true"/>
						</div>
					</div>
					<div class="form-row">
						<div class="col">
						<!-- <label for="mobnum">Mobile Number :</label> -->
						<form:input type="text" class="form-control" path="MobileNo" id="mobNo" placeholder="Mobile Number" required="true"/>
						</div>
					</div>
					<div class="form-row">
						<div class="col">
						<!-- <label for="email">Email Id:</label> -->
						<form:input type="email" class="form-control" path="emailId" id="email" placeholder="Email Id" required="true"/>
						</div>
					</div>
					
				<%--  <form:form id="passwordForm" method="post" action="saveForm" modelAttribute="userProfile">	
				 <div class="form-row">
						<div class="col">
							
						 <form:input type="password" class="form-control" path="password" id="password" placeholder="Password" required="true"/>
							
						 </div>
				</div>
				</form:form>    --%>
					
					
					
					  <div class="form-row">
						<div class="col">
						<div class="form-group">
						 <label class="label-control">Date Of Birth</label>
						<%--  <form:input type="date" path="birthDate" class="form-control" required="true"/> --%>
						<%--  <form:input type="text"  path="birthDate" min="97-01-01" max="30-12-31" onfocus="this.type='date'" placeholder="yy-mm-dd" onblur="if(this.value==='')this.type='text'" class="form-control" required="true"/> --%>
						  <form:input type="text"  path="birthDateString" placeholder="yyyy-mm-dd"  class="form-control" required="true" id="bdayId"/>
						 </div>
						 </div>
					</div>  
					<div class="form-row">
					<div class="col">
						 <label class="label-control">Gender</label><br> 
						 <div class="form-check form-check-radio">
							<label class="form-check-label">
						 <form:radiobutton class="form-check-input" path="gender" value="Male" checked="true"/> 
						
							Male
								<span class="circle">
								<span class="check"></span>
								</span>
							</label>
						</div>
						<div class="form-check form-check-radio">
							<label class="form-check-label">
							
						 <form:radiobutton class="form-check-input" path="gender" value="Female"/> 
							Female
								<span class="circle">
								<span class="check"></span>
								</span>
							</label>
						</div> 
						
						
						</div>
					</div>
				</div>
			</div>
			<div class="card card-nav-tabs">
					<h4 class="card-header card-header-primary">Educational Details</h4>
				<div class="card-body">
					<div class="form-row">
						<div class="col">
						<!--  <label class="label-control">College</label> -->
						 <form:input type="text" class="form-control inputFileVisible" path="college" id="college" required="true" placeholder="Enter College Name"/>
						</div>
					</div>
					
					 <div class="form-row">
					 
						<div class="col">
						
							
						
						  <label for="degree">Degree</label> 
						  	
							 <form:select class="form-control selectpicker" path = "degree"  id="degree" required="true">
				                     <%-- <form:option value = "NONE" label = "Select"/> --%>
				                     <form:options items = "${degreeList}" />
				             </form:select>  
						 </div>
					</div> 
					<div class="form-row">
						<div class="col">
						 <!-- <label class="label-control">Branch</label> -->
						 <form:input type="text" class="form-control inputFileVisible" required="true" id="branch" path="branch" placeholder="Enter Branch"/>
						 </div>
					</div>
				</div>
			</div>
			<div class="card card-nav-tabs">
					<h4 class="card-header card-header-primary">Professional and Experience Details</h4>
				<div class="card-body">
					<div class="form-row">
						<div class="col">
						<!--  <label class="label-control">Occupation</label> -->
						 <form:input type="text" class="form-control inputFileVisible" path="occupation" placeholder="Enter Occupation"/>
						 </div>
					</div>
					<div class="form-row">
						<div class="col">
						 <!-- <label class="label-control">Designation</label> -->
						 <form:input type="text" class="form-control inputFileVisible" path="designation" placeholder="Enter Designation"/>
						 </div>
					</div>
					<div class="form-row">
						<div class="col">
						<!--  <label class="label-control">Domain</label> -->
						 <form:input type="text" class="form-control inputFileVisible" path="domain" placeholder="Enter Domain"/>
						 </div>
					</div>
					<div class="form-row">
						<div class="col">
						<!--  <label class="label-control">Year of Graduation</label> -->
						 <form:input type="text" class="form-control inputFileVisible" required="true" id="yearOfGraduation" path="yearOfGraduation" placeholder="Enter year of graduation"/>
						 </div>
					</div>
					<div class="form-row">
						<div class="col">
						<!--  <label class="label-control">Role</label> -->
						 <form:input type="text" class="form-control inputFileVisible" path="role" placeholder="Enter Role"/>
						 </div>
					</div>
					
					<div class="form-row">
						<div class="col">
						
						 <form:input type="text" class="form-control inputFileVisible" path="experience" id="experience" placeholder="Experience (in months)" required="true"/>
						 </div>
					</div>
					
					
				</div>
			</div>
			
			<div class="card card-nav-tabs">
					<h4 class="card-header card-header-primary">Enquiry Details</h4>
				<div class="card-body">
				
					 <div class="form-row">
						<div class="col">
						  <label for="Courses_Interested_in">Courses Interested in</label> 
							 <%-- <form:select class="form-control selectpicker" path = "mappingCourseInterestedIn" id="course_interested" multiple="true" required="true">
				                     <form:option value = "NONE" label = "Select"/>
				                     <form:options items = "${courseInterestedInList}" />
				             </form:select>   --%>
				             
				             <form:select  class="form-control selectpicker" path = "mappingCourseInterestedIn" id="course_interested" multiple="true">
								<c:forEach items="${courseInterestedInList}" var="course">
   									 <option name="course" value="${course.courseId}">${course.courseName}</option>
								</c:forEach>
						</form:select>
						 </div>
					</div> 
					
					<div class="form-row">
						<div class="col">
							 <label class="label-control">Eligibility</label>
							 <div class="form-check form-check-radio">
								<label class="form-check-label">
							 <form:radiobutton class="form-check-input" path="eligibility" value="Eligible"  checked="true"/> 
							
								Eligible
									<span class="circle">
									<span class="check"></span>
									</span>
								</label>
							</div>
						</div>
					</div>
					
					<div class="form-row">
						<div class="col">
						  <label for="Courses_Already_done">Courses Already Done</label> 
							<%--  <form:select class="form-control selectpicker" path = "mappingCoursesAlreadyDone" multiple="true" >
				                     <form:option value = "NONE" label = "Select"/>
				                     <form:options items = "${courseAlreadyDone}" />
				             </form:select>   --%>
				             
				             <form:select  class="form-control selectpicker" path = "mappingCoursesAlreadyDone"  multiple="true">
								<c:forEach items="${courseAlreadyDone}" var="course">
   									 <option name="course" value="${course.courseId}">${course.courseName}</option>
								</c:forEach>
						</form:select>
						 </div>
					</div>
				
				<%--  <form:form id="timeSlotsForm" method="post" action="saveForm" modelAttribute="timeSlots">	
				 <div class="form-row">
						<div class="col">
							
						  <label for="avail_time">Available Time</label> 
						   <form:select name="availableTime" class="form-control selectpicker" path = "timeSlotsId" id="avail_time" required="true">
								<c:forEach items="${availableTimeList}" var="availableTime">
   									 <option name="availableTime" value="${availableTime.timeSlotsId}">${availableTime.timeSlotsDescription}</option>
								</c:forEach>
						</form:select>
							
						 </div>
				</div>
				</form:form>   --%>
				
				 <div class="form-row">
						<div class="col">
							
						  <label for="avail_time">Available Time</label> 
						   <form:select name="availableTime" class="form-control selectpicker" path = "mappingTimeSlots" id="avail_time" required="true">
								<c:forEach items="${availableTimeList}" var="availableTime">
   									 <option name="availableTime" value="${availableTime.timeSlotsId}">${availableTime.timeSlotsDescription}</option>
								</c:forEach>
						</form:select>
							
						 </div>
				</div>
					
					<div class="form-row">
						<div class="col">
						
						 <form:input type="text" class="form-control inputFileVisible" path="reference" placeholder="Reference"/>
						 </div>
					</div>
					
					  <div class="form-row">
						<div class="col">
						<div class="form-group">
						 <label class="label-control">Date Of Enquiry</label>
						 <form:input type="text" path="dateOfEnquiryString" placeholder="yyyy-mm-dd" id="date_enquiry" required="true" class="form-control"/>
						 </div>
						 </div>
					</div>  
					
					<div class="form-row">
						<div class="col">
						
						 <form:input type="text" class="form-control inputFileVisible" path="recommendation" placeholder="Recommendation"/>
						 </div>
					</div>
					
					  <div class="form-row">
						<div class="col">
						<div class="form-group">
						 <label class="label-control">Start Date</label>
						 <form:input type="text" path="startDateString" placeholder="yyyy-mm-dd" id="date_start" required="true" class="form-control"/>
						 </div>
						 </div>
					</div>  
						
					<%--  <form:form id="segmentForm" method="post" action="saveForm" modelAttribute="segmentType">	
					   <div class="form-row">
						<div class="col">
						  <label for="segment_type">Segment Type</label> 
						  <form:select name="segmentType" class="form-control selectpicker" id="seg_type" path = "segmentTypeId" required="true">
								<c:forEach items="${segmentTypeList}" var="segmentType">
   									 <option name="segmentType" value="${segmentType.segmentTypeId}">${segmentType.segmentTypeName}</option>
								</c:forEach>
						</form:select>	
						 </div>
					</div>   
					</form:form>	 --%>
					
					<div class="form-row">
						<div class="col">
						  <label for="segment_type">Segment Type</label> 
						  <form:select name="segmentType" class="form-control selectpicker" id="seg_type" path = "mappingSegmentType" required="true">
								<c:forEach items="${segmentTypeList}" var="segmentType">
   									 <option name="segmentType" value="${segmentType.segmentTypeId}">${segmentType.segmentTypeName}</option>
								</c:forEach>
						</form:select>	
						 </div>
					</div>   
					
					<div class="form-row">
						<div class="col">
						
						 <form:input type="text" class="form-control inputFileVisible" path="suggestion" placeholder="Suggestions"/>
						 </div>
					</div>
					
					 <div class="form-row">
						<div class="col">
							 <label class="label-control">Active Status</label>
							 <div class="form-check form-check-radio">
								<label class="form-check-label">
							 <form:radiobutton class="form-check-input" path="activeStatus" value="1" checked="true"/> 
							
								Active
									<span class="circle">
									<span class="check"></span>
									</span>
								</label>
							</div>
						</div>
					</div> 
					
					<%--  <form:form id="passwordForm" method="post" action="saveForm" modelAttribute="userProfile">	
				 <div class="form-row">
						<div class="col">
							
						 <form:input type="password" class="form-control" path="password" id="password" placeholder="Enter Password" required="true"/>
							
						 </div>
				</div>
				</form:form> --%>
					
					
					
				</div>
			</div>
 			<input type="button" class="btn btn-primary" style="margin-left:40%;width:15%;" value="Submit" onclick="submitForm()"/>
 		    <!-- <input type="submit"  class="btn btn-primary" style="margin-left:45%" value="Submit"/>-->
 			<!--<div id="sliderRegular" class="slider"></div>-->
				</form:form>

			</div>
		
		
	<!--End Signup formPage-->
	<script type="text/javascript">

	var location_next='${location}'
	//alert(location_next);
	
	var flag=0;
	function submitForm(){
		//var birthdate = document.getElementById("bdayId");
		//alert("DATE - "+birthdate.value);
		//alert("here");
		
		//timeSlotsId=document.getElementById("avail_time").value;
		//segmentTypeId=document.getElementById("seg_type").value;
		//password=document.getElementById("password").value;
		

		validation();
		if(flag==1){
			var myData = {
					//timeSlotsid: timeSlotsId,
					//segmentTypeid:segmentTypeId,
					//Password: password,
					location:location_next		
				};
				
				$.ajax({
					type: 'POST',
					
					url: "/LocationNext",
				
					data: jQuery.param(myData),
					//dataType: 'json',
					
					contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
					traditional: true,
					success: function () {

					}

				});
				 $('#enqForm').submit();
		}
		//	alert("Back here");
		  
		   
		   //$('#timeSlotsForm').submit();
		   //$('#segmentForm').submit();
		
	}

	function validation(){
		var fname = document.getElementById('firstName').value;
		var lname = document.getElementById('lastName').value;
		var mobNo = document.getElementById('mobNo').value;
		var email = document.getElementById('email').value;
		//var password= document.getElementById('password').value;
		var bday = document.getElementById('bdayId').value;

		var college = document.getElementById('college').value;
		var degree = document.getElementById('degree').value;
		var branch = document.getElementById('branch').value;

		var yearGrad = document.getElementById('yearOfGraduation').value;
		var experience = document.getElementById('experience').value;

		var courses_interested = document.getElementById('course_interested').value;
		var time = document.getElementById('avail_time').value;
		var date_enq = document.getElementById('date_enquiry').value;
		var start_date = document.getElementById('date_start').value;
		var seg_type = document.getElementById('seg_type').value;
		
		 if (fname == "") {
		      alert("Enter the First Name");
		      
		 }
		 else if(lname==""){
		      alert("Enter the Last Name");
		 }
		 else if(mobNo==""){
		      alert("Enter the Mobile Number");
		 }
		 else if(email==""){
		      alert("Enter the Email Id");
		 }
		 /* else if(password==""){
		      alert("Enter password");
		 }  */
		 else if(bday==""){
		      alert("Enter the Date of Birth");
		 }

		 else if(college==""){
		      alert("Enter college");
		 }
		 else if(degree==""){
		      alert("Enter degree");
		 }
		 else if(branch==""){
		      alert("Enter branch");
		 }

		 else if(yearGrad==""){
		      alert("Enter year of graduation");
		 }
		 else if(experience==""){
		      alert("Enter the experience");
		 }

		 else if(courses_interested==""){
		      alert("Enter courses interested in");
		 } 
		 else if(time==""){
		      alert("Enter the available time");
		 }
		 else if(date_enq==""){
		      alert("Enter the Date of enquiry");
		 }
		 else if(start_date==""){
		      alert("Enter the start date");
		 }
		 else if(seg_type==""){
		      alert("Enter the Segment Type");
		 }
		 
		 else{
			flag=1;
		}
	}
	
	</script>
	
	</body>
</html>	