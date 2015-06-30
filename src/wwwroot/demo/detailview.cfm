	<Style>
		.callout-info {
		    border-left-color: #1b809e;
		}
		.callout {
		   padding: 5px;
		  
		    border: 1px solid #1b809e;
		    border-left-width: 1px;
		    border-radius: 3px;
		}
	</Style>
	<cfset noshowlist="ID,LICENSE,DISCLAIMER,BRAND_NAME,PACKAGE_LABEL_PRINCIPAL_DISPLAY_PANEL,CLINICAL_STUDIES,LIMIT,ROUTE,SKIP,TOTAL,VERSION,APPLICATION_NUMBER,EFFECTIVE_TIME,LAST_UPDATED,PACKAGE_NDC,PRODUCT_NDC,RXCUI">
	<a class="btn btn-primary" id="Ptop" href="javascript:void(0);"  onclick="CloseDetailView()" role="button">Back</a>
	<br><br>
	<cfinvoke component="labels" method="SearchDetailLabel" returnvariable="resultset">
		<cfinvokeargument name="strf" value="#url.id#">
	</cfinvoke>
	<cfset shorlist="">
	<cfset medlist="">
	<cfset medlist2="">
	<cfset medlist3="">
	<cfset longlist="">
	<!--- We are putting the fields with large amounts of text at the end of the dispaly.--->
	<cfloop list="#listsort(resultset.columnlist,"text")#"  index="columnName">
		<cfset data=evaluate("resultset.#columnName#")>
		<cfif len(data) lte 100>
			<cfset shorlist=listappend(shorlist,columnName)>
		<cfelseif len(data) lte 1000>
			<cfset medlist=listappend(medlist,columnName)>
		<cfelseif len(data) lte 2000>
			<cfset medlist2=listappend(medlist2,columnName)>
		<cfelseif len(data) lte 4000>
			<cfset medlist3=listappend(medlist3,columnName)>
		<cfelse>
			<cfset longlist=listappend(longlist,columnName)>
		</cfif>
	</cfloop>
	<cfset medlist="#medlist#,#medlist2#,#medlist3#,#longlist#">
	<cfoutput>
		<div class="row">
			<div class="col-sm-6">
				<h3>#resultset.BRAND_NAME#</h3>
				<b>ID:</b> #resultset.ID#<BR>
				<b>Application Number:</b><i>#resultset.APPLICATION_NUMBER#</i> <BR>
				<B>Last Updated:</B>(#dateformat(resultset.LAST_UPDATED)#)
				<br><i><strong>License:<a href="#resultset.LICENSE#" target="license">#resultset.LICENSE#</a></strong></i>
				<h4>Disclaimer</h4>#resultset.disclaimer#
			</div>
			<div id="TheCloud3"></div>
		</div>
			<cfset counter=1>	
			<cfloop list="#shorlist#"  index="C">
				<cfset data=evaluate("resultset.#c#")>
				<cfset data=trim(data)>
			  	<cfif len(data) gt 0 and not listfindnocase(noshowlist,c)>
			  		<cfoutput>
						<cfif counter eq 1><div class="row"></cfif>
						 	<div class="col-sm-6">
						 		<h4>#replace(c,"_"," ","all")# </h4>
						 		<div  class="callout callout-info">#data#</div>
						 		<br><br>
						 	</div>
						<cfif counter gte 2 or (counter eq listlen(shorlist))>
							</div>
							<cfset counter = 0>
					 	</cfif>
						<cfset counter=counter+1>
					</cfoutput>		
					</cfif>  	
				</cfloop>

		<cfloop list="#medlist#"  index="C">
			<cfset data=evaluate("resultset.#c#")>
			<cfset data=trim(data)>
		  	<cfif len(data) gt 0 and not listfindnocase(noshowlist,c)>
		  		<cfoutput>
					<cfif counter eq 1>
						<div class="row">
							<div class="col-sm-12">
								<br><a class="btn btn-info btn-xs" id="Ptop" href="javascript:void(0);"  onclick="$('html,body').scrollTop(0);" role="button">Back to Top</a>
							</div>
						</div>
						<div class="row"></cfif>
				 	<div class="col-sm-12">
				 		<h4>#replace(c,"_"," ","all")# </h4>
				 		<div class="callout callout-info" >#data#</div>
				 		<br><br>			 	
				 	</div>
					<cfif counter gte 1  or (counter eq listlen(medlist))></div>
						<cfset counter = 0>
						
				 	</cfif>
					<cfset counter=counter+1>
				</cfoutput>		
			</cfif>  	
		</cfloop>	
		<div class="row">
			<div class="col-sm-12">
				<br><a class="btn btn-info btn-xs" id="Ptop" href="javascript:void(0);"  onclick="$('html,body').scrollTop(0);" role="button">Back to Top</a>
			</div>
			
		</div>
	</cfoutput>	
	<script>
		<cfoutput>var Col_val='#urlencodedformat(resultset.pharm_class_epc)#';</cfoutput>
		$(function (){
			cloudAdurl="detailArCloud.cfm?dx=<cfoutput>#createuuid()#</cfoutput>&Col_name=pharm_class_epc&Col_val="+Col_val+"&title=Top%20Reported%20Adverse%20Side%20Effects";
			$("#TheCloud3").load(cloudAdurl);
		});
	</script>


