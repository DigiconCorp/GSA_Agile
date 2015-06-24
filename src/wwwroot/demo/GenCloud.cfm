	<cfset divid="demo" & createuuid()>

<div class="jumbotron"><h3 align="center">
	<div id="<cfoutput>#divid#</cfoutput>" style="height:400px; width:100%;">
		
	</div>
</div>

<script>
var words = [
<cfloop query="thequery"  endrow=50>
 <cfoutput> {text: "#term#", weight: #count# ,handlers:{ click: function() {UpdateSearch('#term#',' ');}}},</cfoutput>

 </cfloop>
];

$('#<cfoutput>#divid#</cfoutput>').jQCloud(words,{ autoResize: true,steps:5});

</script>
