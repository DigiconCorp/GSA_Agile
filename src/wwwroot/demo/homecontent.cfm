<div class="container">
	<div>
		<h1>Drug Label Search</h1>
		<h3>GSA Agile BPA RFQ:RFQ993471 Prototype</h3>
		<b>Disclaimer: openFDA is a beta research project and not for clinical use. While we make every effort to ensure that data is accurate, you should assume all results are unvalidated.</b>

		<p>Search for words or phrases in the openFDA API Drug label records. 
	</div>	
	<div id="resultsdiv"></div>
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
	$("#resultsdiv").load('search.cfm');		
</script>
