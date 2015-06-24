<div class="container">
<h1>openFDA API</h1>
<p>
Below is a an example of using the openFDA Api to retreive infromation about information on drug labels.</p>
	<div class="pull-center well">
			<form id="SearchForm" class="form-horizontal">
				<input class="form-control"  maxlength="255" required type="text" id="str" name="str" value=""   placeholder="Enter search"  onkeyup="startSearch()">
				<input type="hidden" name="skip" id="skip" value="0">
			</form>
	</div>
	<div id="resultsdiv" class="container container-responsive"></div>
</div>
<script>
	var searchtimer;
	
	startSearch = function()
	{
		$("#skip").val(0);	
		doSearch();
	}
	
	nextPage = function(limit)
	{
		var skipval=$("#skip").val();
		skipval=parseInt(skipval,10) + parseInt(limit,10);
		$("#skip").val(skipval)
		doSearch();
	}
	
	prevPage = function(limit)
	{
		var skipval=$("#skip").val();
		skipval=parseInt(skipval,10) - parseInt(limit,10);
		$("#skip").val(skipval)
		doSearch();
	}
	
	UpdateSearch = function (word,cbk)
	{
		//var cstr = $("#str").val() + '+('+cbk+ ':'+ word +')';
		$("#skip").val(0);	
		//var cstr = cbk+':'+ word;
		var cstr =  $("#str").val() +'+"'+ word+'"';
		$("#str").val(cstr);
		doSearch();
	}
	$("#resultsdiv").load('loading.cfm');	
	doSearch = function()
	{
		$("#resultsdiv").load('loading.cfm');
		
		clearTimeout(searchtimer);
		var theurl='searchresults.cfm';
		var skip=$("#skip").val();
		searchtimer = setTimeout(
		   	function()
			{
		   		$.post(
				theurl,
       	 			{
       	 			 str: $("#str").val(),skip:skip
       	 			},
       			function(data, textStatus)
       			{
       				$("#resultsdiv").html(data);
       			});
		   	}, 500);
	}
		
	$("#SearchForm").bind("keypress", function(event) {
		if(event.which == 13) {
     	event.preventDefault();
     	}
  	 });

	hideItem = function (e)
		{
			$(e).addClass('hidden');
		}
	
	showItem = function (e)
		{
			$(e).removeClass('hidden');
		} 
			
	$(function() 
	{
		doSearch();
	});
</script>
