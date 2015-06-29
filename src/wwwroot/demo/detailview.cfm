
<cftry>
	<Style>
	.callout-info {
	    border-left-color: #1b809e;
	}
	.callout {
	   padding: 20px;
	    margin: 20px 0;
	    border: 1px solid #1b809e;
	    border-left-width: 1px;
	    border-radius: 3px;
	}
	
	</Style>
	<cfset noshowlist="ID,LICENSE,DISCLAIMER,BRAND_NAME,PACKAGE_LABEL_PRINCIPAL_DISPLAY_PANEL,CLINICAL_STUDIES,LIMIT,ROUTE,SKIP,TOTAL,VERSION,APPLICATION_NUMBER,EFFECTIVE_TIME,LAST_UPDATED,PACKAGE_NDC,PRODUCT_NDC,RXCUI">
	<div class="container">	
	<a class="btn btn-primary" id="Ptop" href="javascript:void(0);"  onclick="CloseDetailView()" role="button">Back</a>
	<br><br>
	
		<cfinvoke component="labels" method="SearchDetailLabel" returnvariable="resultset">
			<cfinvokeargument name="strf" value="#url.id#">
		</cfinvoke>
			
	    	<cfinvoke component="counts" method="GetCounts" returnvariable="thequery">
				<cfinvokeargument name="str" value="substance_name:#resultset.SUBSTANCE_NAME#">
			</cfinvoke>   
		
	
	
	
		<cfset divid="demo" & createuuid()>
	
	
	
	
	<cfoutput>
			
	<h3>#resultset.BRAND_NAME#</h3>
	<b>ID:</b> #resultset.ID#<BR>
	<b>Application Number:</b><i>#resultset.APPLICATION_NUMBER#</i> <BR>
	<B>Last Updated:</B>(#resultset.LAST_UPDATED#)
	<br><i><strong>License:#resultset.LICENSE#</strong></i>
	<div class="row">
		<div class="col-sm-6"><h3>Disclaimer</h3>
			#resultset.disclaimer#
	
		</div>
		<cfif thequery.recordcount gt 0>
		<div class="col-sm-6" id="wordcloud"><span id="test" width="100%"></span>
			<h3 align="center">Top Reported Advers Effects</h3>
			<div id="<cfoutput>#divid#</cfoutput>" class="callout callout-info" style="height:250px; width:100%;"></div>
		</div>
		</cfif>
	</div>
	
		<cfset counter=1>	
		<cfloop list="#listsort(resultset.columnlist,"text")#"  index="C">
			
		<cfset data=evaluate("resultset.#c#")>
		<cfset data=trim(data)>
	  	<cfif len(data) gt 0 and not listfindnocase(noshowlist,c)>
	  		<cfoutput>
				<cfif counter eq 1><div class="row"></cfif>
			 	<div class="col-sm-6">
			 			<h4>#replace(c,"_"," ","all")# </h4>
			 		 
			 		<div class="col callout callout-info" >#data#</div>
			 	
			 	</div>
				
				<cfif counter gte 2></div><cfset counter = 0>	<a class="btn btn-info btn-xs" id="Ptop" href="javascript:void(0);"  onclick="$('html,body').scrollTop(0);" role="button">Back to Top</a>
			 	</cfif>
				<cfset counter=counter+1>
			</cfoutput>
			<!---<cfelseif len(data) gt 0>
				 <cfoutput>
				<cfif counter eq 1><div class="row"></cfif>
			 	<div class="col-sm-12 well"><h4>#replace(c,"_"," ","all")#</h4>
			 		<div style="height:100px; overflow: auto">#data#</div>
			 		</div>
				
				<cfif counter gte 1></div><cfset counter = 0></cfif>
				<cfset counter=counter+1>
			</cfoutput>--->
			</cfif>  	
		</cfloop>
	<!---	</div>
	  </div>
	</div>--->
	</cfoutput>	
		
			
	
	
	</div>

	<cftry>
		<script>
		var words = [<cfloop query="thequery"  endrow=10><cfoutput> {text: "#term#", weight: #count# ,handlers:{ click: function() {}}},</cfoutput></cfloop>];
		var timers="";
		explode = function()
					{	
						$('#<cfoutput>#divid#</cfoutput>').jQCloud(words,{ autoResize: true,steps:5});
						 clearInterval(timers);
					}
		
			$(function() {
				
				var timers=setTimeout(explode,150);
				
			});
			
		</script>
		
	<cfcatch type="Any" ><cfdump var="#cfcatch#">
	</cfcatch>
	</cftry>
	
<cfcatch type="Any" >
</cfcatch>
</cftry>
