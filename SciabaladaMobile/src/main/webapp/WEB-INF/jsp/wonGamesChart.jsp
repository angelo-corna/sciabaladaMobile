    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  


<html>
<head>
		<title>Sciabalada Mobile - Statistiche</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css" type="text/css">
		<link rel="icon" type="image/png" href="../images/sciabalada.ico">
		
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript">
	
	var a = document.createElement('a');
	a.href = window.location.href;
	document.writeln('<title>Partite Vinte ' + a.pathname.split('/')[3] + '</title>');


// Load the Visualization API and the piechart package.
    google.load('visualization', '1.0', {
        'packages' : [ 'corechart' ]
    });
    // Set a callback to run when the Google Visualization API is loaded.
    google.setOnLoadCallback(drawChart);
    // Callback that creates and populates a data table,
    // instantiates the pie chart, passes in the data and
    // draws it.
    function drawChart() {
        // Create the data table.
        var data = google.visualization.arrayToDataTable([

                                                              <c:forEach items="${won}" var="entry">
                                                                  [${entry}],
                                                              </c:forEach>
                                                        ]);
        // Set chart options
        var options = {
            tooltip :  {showColorCode: true},
            width : 950,
            height : 500,
        	hAxis: {
    	        textStyle: {
      	          color: '#FFFFFF'
      	        },
      	        gridlines: {
      	          color: '#FFFFFF'
      	        },
      	        baselineColor: '#FFFFFF'
      	    },
        	vAxis: {
    	        textStyle: {
      	          color: '#FFFFFF'
      	        },
      	        gridlines: {
      	          color: '#FFFFFF'
      	        },
      	        baselineColor: '#FFFFFF'
      	    },
     	    legend : { 
     	    	position: 'right', 
     	    	textStyle: {
     	        	color: 'white'
     	    	}
      	    },
    	    connectSteps : false,
    	    colors : ['green','orange'],
    	    backgroundColor : '#323228',
    	    isStacked : true,
        };
        // Instantiate and draw our chart, passing in some options.
        var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));
        chart.draw(data, options);
    }
</script>
</head>
	<body>
		<table style="width:100%" bgcolor="#000000">
			<tr>
		  		<td align="right"><img src="../images/chart.png"></td>
		  		<td align="left"><H3W>&nbsp&nbsp&nbspStatistiche</H3W></td>
		  		<td align="right"><a href="../index.jsp"><img src="../images/home.png"></a></td>
		  		<td align="right">&nbsp&nbsp&nbsp&nbsp&nbsp</td>
			</tr>
		</table>
		<script type="text/javascript">
		document.writeln('<br><br><center><H4W>Partite Vinte ' + a.pathname.split('/')[3] + "</H4W></center>");
	
		</script>	
	    <div style="width: 600px;">
	        <div id="chart_div"></div>
	    </div>
	</body>
</html>
