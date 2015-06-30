	<cfset searchStr="">
	<cfset divid="demo" & createuuid()>
	<cfloop list="#url.Col_val#" index="In" delimiters="~">
		<cfoutput><cfset searchStr=searchStr & "#Col_name#:""#in#"""></cfoutput>
	</cfloop>
	<cfinvoke component="counts" method="GetCounts" returnvariable="thequery">
		<cfinvokeargument name="str" value="#searchStr#">
	</cfinvoke> 
	<CFIF thequery.recordcount GT 1>
		<div class="col-sm-6" id="wordcloud">	
			<h3 align="center"><cfoutput>#URL.TITLE#</cfoutput></h3>		
			<div class="callout callout-info" id="<cfoutput>#divid#</cfoutput>"  style="height:250px; width:100%;"></div>
		</div>	
		<cfset CountTerms=""> 
		<cfloop query="thequery"  endrow="100"> 
			<cfoutput><cfset CountTerms=listappend(CountTerms,"{text: "" #term# "", weight: #count#}")></cfoutput>
		</cfloop>
		<script>
			var words=[<cfoutput>#CountTerms#</cfoutput>];
			$('#<cfoutput>#divid#</cfoutput>').jQCloud(words,{ autoResize: true,steps:5});
		</script>
	</cfif>		