<div class="container">
	<h1>openFDA API</h1>
	<p>Below is a an example of using the openFDA Api to retreive infromation about information on drug labels.</p>
	<div id="resultsdiv" class="container container-responsive"></div>
</div>
<script>
	hideItem = function (e)
		{
			$(e).addClass('hidden');
		}
	
	showItem = function (e)
		{
			$(e).removeClass('hidden');
		} 
	$("#resultsdiv").load('searchresults.cfm');		
</script>