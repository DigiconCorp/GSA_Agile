<div style=" text-align: center" ><img src="images/ajax-loader.gif" class="pull_center"></img></div>

<cfabort>
<cfif skip lte 0><cfset skip=0></cfif>
<cfif len(str) gte 2>
<cfset str=replace(str,' ','+','all')>
<cfset theurl="https://api.fda.gov/drug/label.json?api_key=#application.openFDAKey#&search=#STR#&limit=#limit#&skip=#skip#">
<cfhttp method="get" url="#theurl#" resolveurl="true">
<cftry>
	<cfset getResults=deserializeJSON(cfhttp.FileContent)>
	<cfset totalfound=getResults.meta.results.total>
	<cfset CurrentSkip=getResults.meta.results.skip>
	<cfset CurrentLimit=getResults.meta.results.limit>
	<div>
		<cfoutput><b>Disclaimer:</b>#getResults.meta.disclaimer#<br>
			<b>License:</b>#getResults.meta.license#
		</cfoutput>
	</div>
	<nav>
		<ul class="pagination">
			<li>
			<cfoutput>	<a href="javascript:void(0);" aria-label="Previous"   onclick="prevPage(#limit#)"><span aria-hidden="true">&laquo;</span></a></cfoutput>
			</li>
			<li>
				<span><cfoutput>Page #(CurrentSkip/CurrentLimit)+1# of #int(totalfound/CurrentLimit)+1#</cfoutput></span>
			</li>
			<li>
				<cfoutput><a href="javascript:void(0);" aria-label="Next" onclick="nextPage(#limit#)"><span aria-hidden="true">&raquo;</span></a></cfoutput>
			</li>
			<li>
				<span><cfoutput>#totalfound# records found.</cfoutput></span>
			</li>
		</ul>	
	</nav>
	<cfif isdefined("getResults.results")>
	
			
			<cfloop from="1" to="#arraylen(getResults.results)#" index="I">	
				<cfset sid=I>
				<cfset adv="No adverse reactions listed">
				<cfset indications_and_usage="No data found">
				<cfset drug_interactions="No drug interactions listed">
				<cfset description="">
				<cfset substance_name="">
				<cfset purpose="">
				<cfset brand_name="">
				<cfset generic_name="">
				<cfset warnings="">
				<cfset active_ingredient="">
				<cftry><cfset adv=getResults.results[I].adverse_reactions_table> <cfcatch type="Any" ></cfcatch></cftry>
				<cftry><cfset indications_and_usage=getResults.results[I].indications_and_usage[1]><cfcatch type="Any" ></cfcatch></cftry>
				<cftry><cfset drug_interactions=getResults.results[I].drug_interactions[1]><cfcatch type="Any" ></cfcatch></cftry>
				<cftry><cfset description=getResults.results[I].description[1]><cfcatch type="Any" ></cfcatch></cftry>
				<cftry><cfset substance_name=getResults.results[I].openfda.substance_name[1]><cfcatch type="Any" ></cfcatch></cftry>
				<cftry><cfset brand_name=getResults.results[I].openfda.brand_name[1]><cfcatch type="Any" ></cfcatch></cftry>
				<cftry><cfset generic_name=getResults.results[I].openfda.generic_name[1]><cfcatch type="Any" ></cfcatch></cftry>
				<cftry><cfset purpose=getResults.results[I].purpose[1]><cfcatch type="Any" ></cfcatch></cftry>
				<cftry><cfset warnings=getResults.results[I].warnings[1]><cfcatch type="Any" ></cfcatch></cftry>
				<cftry><cfset active_ingredient=getResults.results[I].active_ingredient[1]><cfcatch type="Any" ></cfcatch></cftry>
				<cfset reactionsearch="patient.drug.openfda.substance_name:""#substance_name#""&count=patient.reaction.reactionmeddrapt.exact">
				
				<cfinvoke component="counts" method="GetCounts" returnvariable="sides">
					<cfinvokeargument name="STR" value="#reactionsearch#">
				</cfinvoke>
				
				
				
				<cfoutput>
				<table class="table-responsive" >
					<tr><th colspan="2" valign="top"><h3>#substance_name#</h3> #brand_name# #generic_name#</th></tr>
					<tr><Th>Purpose:</Th><td valign="top">#purpose#<br>#replacenocase(description,"Description","")#</td></tr>
					<cfif len(active_ingredient) gt 2><tr><Th valign="top">Active ingredients:</Th><td>#active_ingredient#</td></tr></cfif>
				
					
					<cfif len(warnings) gt 2><tr><Th valign="top">Warnings:</Th><td>#replace(warnings,"Warnings:","")#</td></tr></cfif>
					<cfif sides.recordcount gt 0>
						<tr>
							<Th colspan="2" valign="top">Reported Adverse Side effects:</Th>
						</tr>
						<tr>
							<td colspan="2">
								<div class="row">
									<div class="col-sm-6">	
										<ul><cfloop query="sides" endrow=25><li>#term# #count#</li></cfloop></ul>
									</div>
									<div class="col-sm-6">	
										<cfset thequery=sides><cfinclude template="GenCloud.cfm">
									</div>
								</div>
							</td>
						</tr>
					</cfif>		
				</table>	
				</cfoutput>
			</cfloop>
			<cfelse>No results found
		</cfif>
<cfcatch type="Any" ><cfdump var="#cfcatch#" format="text"></cfcatch>
</cftry>
<cfelse>No results found
</cfif>
<script>
	ViewDetails = function(sid)
	{
		var dItem=$("#detail"+sid);
		var pItem=$("#preview"+sid);
	 	showItem(dItem);
	 	/*hideItem(pItem);*/
	}
	HideDetails = function(sid)
	{
		var dItem=$("#detail"+sid);
		var pItem=$("#preview"+sid);
	 	hideItem(dItem);
	 	/*showItem(pItem);*/
	}
</script>
