<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="">
		<meta name="author" content="">
		<link rel="icon" href="favicon.ico">
		<title>GSA Agile Prototype</title>
		<!-- Bootstrap core CSS -->
		<link href="css/bootstrap.min.css" rel="stylesheet">
		<link href="js/bootstraptable/bootstrap-table.css" rel="stylesheet"> </link>	
		<!-- Custom styles for this template -->
		<link href="css/bootstrap-template.css" rel="stylesheet">
		<link href="css/sticky-footer.css" rel="stylesheet">
		<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
			<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->
	</head>
  	<body>
	    <nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="javascript:void(0)" onclick="loadcontent('homecontent.cfm');">Home</a>
			</div>
			<div id="navbar" class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li><a href="javascript:void(0)" onclick="loadcontent('about.cfm');">About</a></li>
					<li><a href="javascript:void(0)" onclick="loadcontent('contact.cfm');">Contact</a></li>
				</ul>
			</div><!--/.nav-collapse -->
	      </div>
	    </nav>
		<div class="container">
			<div id="maincontent">
			</div>
		</div><!-- /.container -->
		<footer class="footer">
			<div class="container" id="footerContent">
			</div>
		</footer>
		<!-- Bootstrap core JavaScript
		================================================== -->
		<!-- Placed at the end of the document so the pages load faster -->
		<link rel="stylesheet" href="js/jqcloud/dist/jqcloud.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
		<script src="js/jqcloud/dist/jqcloud.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
		<script src="js/ie10-viewport-bug-workaround.js"></script>
			<script type="text/javascript" src="js/bootstraptable/bootstrap-table.js"></script>
	</body>
</html>
<script>
    /* Disable caching of AJAX responses   */
	$.ajaxSetup ({cache: false}); 
	
	loadcontent = function (theurl)
	{
		$(".navbar-collapse.in").collapse('hide');
		$("#maincontent").load(theurl);	
		$("#footerContent").load('footer.cfm');	
	}
	
	/* force bootstap menu to collapse after click*/
	$(document).on('click','.navbar-collapse.in',function(e) {
	    if( $(e.target).is('a') ) 
	    	{
	       		$(this).collapse('hide');
	   		}
	   	});
	
	/* // Shorthand for $( document ).ready() */
	$(function() {
		loadcontent('homecontent.cfm');
	});
</script>