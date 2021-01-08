<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	   <link href="C:/Users/Admin/Desktop/screendevlopment/WebContent/jsp/buttonsize.css" rel="stylesheet"/>
	  <link href="../css/employee_new_2.css" rel="stylesheet" />
	  <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
	  <link rel="stylesheet" href="../assets/css/magnific-popup.css" media="screen" />
	
	  <meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

    <link href="../assets/css/bootstrap.css" rel="stylesheet" />

	<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">

	<script src="../assets/js/jquery-1.10.2.js" type="text/javascript"></script>
	<script src="../assets/js/bootstrap.js" type="text/javascript"></script>

	</head>
	<body>
	
		<!--Progress track Page-->
	<br><br>
	<div class="card card-nav-tabs">
				<!--<h4 class="card-header card-header-primary text-left">Batch Name</h4>-->
				<h3 class="card-header card-header-primary text-center">Progress Tracking</h3>
					<br><br>
	<div class="card-body">
			<div class="row"  style="height:100%">
		<div class="col-md-6">	
		<div class="card" style="margin-top:-20px;">
			
			<div class="card-body-primary">
				<table>
					<tr>
						<td>
							<label for="totaltopics">Total Topics :</label>
							<input type="text" style="width:200%" class="form-control" id="total_topics">
						<br>
						</td>
					</tr>
					<tr>
						<td>
							<label for="totalcourseduration">Total Course Duration :</label>
							<input type="text" style="width:200%" class="form-control" id="total_course_duration">
						<br>
						</td>
					</tr>
					<tr>
						<td>
							<label for="totallectures">Total Lectures :</label>
							<input type="text" style="width:200%" class="form-control" id="total_lecs">
						<br>
						</td>
					</tr>
					<tr>
						<td>
							<label for="topicscovered">Number of Topics Covered :</label>
							<input type="text" style="width:200%" class="form-control" id="total_topics_covered">
						<br>
						</td>
					</tr>
					<tr>
						<td>
							<label for="elapsedduration">Elapsed Duration:</label>
							<input type="text" style="width:200%" class="form-control" id="elapsed_duration" >
						<br>
						</td>
					</tr>
					<tr>
						<td>
							<label for="remaininglectures">Remaining Lectures:</label>
							<input type="text" style="width:200%" class="form-control" id="remaining_lecs">
						<br>
						</td>
					</tr>
				</table>
			</div>
		</div>
		</div>
		
		<div class="col-md-6" style="height:100%">	 
		<div class="card" style="margin-top:-20px;">
			
			<div class="card-body-primary">
				<div class="table-responsive" id="table-batch-add-student">
					
				</div>
			
			</div>
			
		</div>
		
		<div class="card" >
			<div class="card-body-primary">
				<table>
					<tr>
						<td>
							<label for="syllabus" style="margin-left:200px">Syllabus</label>
						</td>
					</tr>
				</table>
			</div>
			</div>
		</div> 
		</div><!--row div end-->
		
		
		<!--End Progress track Page-->
	
	<script>

		//alert('${batchObject.mappingLecture}');
		var remaininglec='${totalLectures}'-'${batchObject.currentLectureNumber}';
		document.getElementById('total_topics').value='${totalTopics}';
		document.getElementById('total_course_duration').value='${totalCourseDuration}';
		document.getElementById('total_lecs').value='${totalLectures}';
		document.getElementById('total_topics_covered').value='${totalTopicsCovered}';
		document.getElementById('elapsed_duration').value='${elapsedDuration}'; 
		document.getElementById('remaining_lecs').value=remaininglec; 

		var elem = document.getElementById('details-batch');
		if(elem!=null){
			elem.parentNode.removeChild(elem);
		}
		
		var table = document.createElement('table');
		table.className="table table-hover";
		table.id="details-batch";
		var thead = document.createElement('thead');

		var th1 = document.createElement('th');
		th1.textContent = "Topic Name";
		var th2 = document.createElement('th');
		th2.textContent = "Duration (in hrs)";

		thead.appendChild(th1);
		thead.appendChild(th2);
		table.appendChild(thead);
		
		var tbody = document.createElement('tbody');
		<c:forEach items='${batchObject.mappingLecture}' var="lec">

			//var tr = document.createElement('tr');
			<c:forEach items='${lec.mappingTopicsCovered}' var="topic">
				
				var tr = document.createElement('tr');
				tbody.appendChild(tr);
				var td1 = document.createElement('td');
				td1.textContent = '${topic.topicName}';
				var td2 = document.createElement('td');
				td2.textContent = '${topic.topicDuration}';
				tr.appendChild(td1);
				tr.appendChild(td2);
				//alert('${topic.topicName}');
			</c:forEach>  
			//alert('${lec.mappingTopicsCovered}');
			
		</c:forEach>   
		table.appendChild(tbody);
		
		document.getElementById('table-batch-add-student').appendChild(table);
			/* var addStudentList=[
			{
				topicname:"c++",
				registered:"",
				time:"",
				duration:"true"
				
			},
			{
				topicname:"java",
				registered:"",
				time:"",
				duration:"true"
			},
			{
				topicname:"xyz",
				registered:"",
				time:"",
				duration:"true"
			},
			{
				topicname:"aaa",
				registered:"",
				time:"",
				duration:"true"
				
			}
			]
			 */
			/* var elem = document.getElementById('details-batch');
			if(elem!=null){
				elem.parentNode.removeChild(elem);
			}
			
			var table = document.createElement('table');
			table.className="table table-hover";
			table.id="details-batch";
			var thead = document.createElement('thead');
			
			var th1 = document.createElement('th');
			th1.textContent = "Topic Name";
			var th2 = document.createElement('th');
			th2.textContent = "";
			var th3 = document.createElement('th');
			th3.textContent = "";
			var th4 = document.createElement('th');
			th4.textContent = "Duration";
					
			thead.appendChild(th1);
			thead.appendChild(th2);
			thead.appendChild(th3);
			thead.appendChild(th4);
			
			table.appendChild(thead);
			
			var tbody = document.createElement('tbody');
			
			for(var i=0;i<addStudentList.length;i++){
				
				var tr = document.createElement('tr');
				var td1 = document.createElement('td');
				td1.textContent = addStudentList[i].topicname;
				var td2 = document.createElement('td');
				td2.textContent = addStudentList[i].registered;
				var td3 = document.createElement('td');
				td3.textContent = addStudentList[i].time;
				var td4 = document.createElement('td');
				td4.textContent = addStudentList[i].duration;
				
				tr.appendChild(td1);
				tr.appendChild(td2);
				
				tr.appendChild(td3);
				tr.appendChild(td4);
				
				tbody.appendChild(tr);
			}
			table.appendChild(tbody);
			
			document.getElementById('table-batch-add-student').appendChild(table); */
		</script>
		
	</body>
</html>	