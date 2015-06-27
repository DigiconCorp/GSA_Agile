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
	
<div class="container">	
	<a class="btn btn-primary" id="Ptop" href="javascript:void(0);"  onclick="CloseDetailView()" role="button">Back</a>
<br><br>
<cftry>
	<cfinvoke component="labels" method="SearchDetailLabel" returnvariable="resultset">
	<cfinvokeargument name="strf" value="#url.id#">

	</cfinvoke>

<cfoutput>	
<div class="panel panel-default">
  <div class="panel-heading">#resultset.BRAND_NAME# Details</div>
  <div class="panel-body">

  <div >
  
 
	<cfset counter=1>	
	<cfloop list="#listsort(resultset.columnlist,"text")#"  index="C">
		
	<cfset data=evaluate("resultset.#c#")>
	<cfset data=trim(data)>
  	<cfif len(data) gt 0>
  		<cfoutput>
			<cfif counter eq 1><div class="row"></cfif>
		 	<div class="col-sm-6">
		 			<h4>#replace(c,"_"," ","all")# </h4>
		 		 
		 		<div class="col callout callout-info" style="height:150px; overflow: auto">#data#</div>
		 	
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
	</div>
  </div>
</div>
</cfoutput>	
	
		

<cfcatch type="Any" ><cfoutput>#cfcatch.detail#</cfoutput></cfcatch>
</cftry>
</div>

<!---
LAST_UPDATED,SKIP,LIMIT,TOTAL,DESCRIPTION,SET_ID,INDICATIONS_AND_USAGE,KEEP_OUT_OF_REACH_OF_CHILDREN,DOSAGE_AND_ADMINISTRATION,PURPOSE,VERSION,ID,PREGNANCY_OR_BREAST_FEEDING,PACKAGE_LABEL_PRINCIPAL_DISPLAY_PANEL,ACTIVE_INGREDIENT,INACTIVE_INGREDIENT,EFFECTIVE_TIME,SPL_PRODUCT_DATA_ELEMENTS,WARNINGS,SPL_ID,PRODUCT_NDC,IS_ORIGINAL_PACKAGER,ROUTE,SUBSTANCE_NAME,RXCUI,SPL_SET_ID,PACKAGE_NDC,PRODUCT_TYPE,GENERIC_NAME,MANUFACTURER_NAME,BRAND_NAME,APPLICATION_NUMBER 
--->