<cfcomponent>
	<cfparam name="ListDelimiter" default="~">
	<!--- -***********************************************************--->
    <!--- -**********************  SearchLabels   ********************--->
    <!--- -***********************************************************--->	
	<cffunction name="SearchLabels" access="remote" returnformat="plain" returntype="string">
		<cfargument name="skip">
		<cfargument name="SEARCH" default="">
		<cfargument name="limit" default="10">	
		<cfargument name="FieldSearch" default="">
		<cfset skip=offset>
    	<cfif offset eq 0>
    		<cfset page = 1>
    	<cfelse>
    		<cfset page = offset + 1 / limit>
    	</cfif>
    	<cfset str = search>
    	<cfif FieldSearch neq "All">
    		<cfset AppendSTR = "">
    		<cfloop LIST="#str#" INDEX="String" DELIMITERS="+">
    			<cfoutput>
    				<cfset TempStr = "#FieldSearch#:""#trim(String)#""">
    				<cfset AppendSTR = listappend(AppendSTR, TempStr, "~")>
    			</cfoutput>
    		</cfloop>
    		<cfset str = replace(AppendSTR, "~", "+", "all")>
    	<cfelse>
    		<cfset AppendSTR = "">
    		<cfloop LIST="#str#" INDEX="String" DELIMITERS="+">
    			<cfoutput>
    				<cfset TempStr = "(""#trim(String)#"")">
    				<cfset AppendSTR = listappend(AppendSTR, TempStr, "~")>
    			</cfoutput>
    		</cfloop>
    		<cfset str = replace(AppendSTR, "~", "+", "all")>
    	</cfif>			
		<cfif len(search) eq 0>	
			<cfset getResultsFinal=querynew('ID,BRAND_NAME,Total')>
		<cfelse>
			<cfset getResultsFinal=querynew('ID,BRAND_NAME,Total')>
			<cfset theurl="https://api.fda.gov/drug/label.json?api_key=#application.openFDAKey#&search=#STR#&limit=#limit#&skip=#skip#">
			<cfhttp method="get" url="#theurl#" resolveurl="true">
			<cftry>
				<cfset getResults=deserializeJSON(cfhttp.FileContent,true)>
				<cfset getResultsFinal=this.GetResultData(getResults)>
				<cfcatch>
					<cfset getResultsFinal=querynew('ID,BRAND_NAME,Total')>
				</cfcatch>
			</cftry>
		</cfif>
		<cfreturn JSONGrid( getResultsFinal, page, limit,val(getResultsFinal.total) )>
	</cffunction>

	<!--- -***********************************************************--->
    <!--- -*******************  SearchDetailLabel   ******************--->
    <!--- -***********************************************************--->	
	<cffunction name="SearchDetailLabel" access="remote" returntype="Query">
		<cfargument name="strf" default="">
		<cfset theurls="https://api.fda.gov/drug/label.json?api_key=#application.openFDAKey#&search=id:#strf#&limit=1&skip=0">
		<cfhttp method="get" url="#theurls#" resolveurl="true">
			<cftry>
				<cfset getResultss = deserializeJSON(cfhttp.FileContent, true)>
				<cfset getResultssFinal = this.GetResultData(getResultss)>
			<cfcatch>
				<cfset getResultssFinal = querynew('ID,BRAND_NAME,Total')>
				<cfset queryaddrow(getResultssFinal)>
				<cfset querysetcell(getResultssFinal, "id", cfcatch.Message)>
			</cfcatch>
			</cftry>
		<cfreturn getResultssFinal>
	</cffunction>
	
	<!--- -***********************************************************--->
    <!--- -**********************   GetResultData   ******************--->
    <!--- -***********************************************************--->		
	<cffunction  name="GetResultData" returntype= "Query" description="Flattens the openFDA structer into a query result for each ID.">
		<cfargument name="RawJSONData">
		<cfset results=RawJSONData.results>
		<cftry>
			<cfset MetaColls="disclaimer,license,last_updated,skip,limit,total">
			<cfset metaDataQuery=this.GetMetaData(RawJSONData.meta)>
			<cfset collist="description,set_id,indications_and_usage,keep_out_of_reach_of_children,dosage_and_administration,purpose,version,id,pregnancy_or_breast_feeding,package_label_principal_display_panel,active_ingredient,inactive_ingredient,effective_time,spl_product_data_elements,warnings">
			<cfset collist="set_id,id,version,effective_time,drug_abuse_and_dependence,controlled_substance,abuse,dependence,overdosage,adverse_reactions,drug_interactions,drug_and_or_laboratory_test_interactions,clinical_pharmacology,mechanism_of_action,pharmacodynamics,pharmacokinetics,indications_and_usage,contraindications,dosage_and_administration,dosage_forms_and_strengths,purpose,description,active_ingredient,inactive_ingredient,spl_product_data_elements,spl_patient_package_insert,information_for_patients,information_for_owners_or_caregivers,instructions_for_use,ask_doctor,ask_doctor_or_pharmacist,do_not_use,keep_out_of_reach_of_children,other_safety_information,questions,stop_use,when_using,patient_medication_information,spl_medguide,use_in_specific_populations,pregnancy,teratogenic_effects,nonteratogenic_effects,labor_and_delivery,nursing_mothers,pregnancy_or_breast_feeding,pediatric_use,geriatric_use,nonclinical_toxicology,carcinogenesis_and_mutagenesis_and_impairment_of_fertility,animal_pharmacology_and_or_toxicology,clinical_studies,references,how_supplied,storage_and_handling,safe_handling_warning,boxed_warning,warnings_and_precautions,user_safety_warnings,precautions,warnings,general_precautions,laboratory_tests,recent_major_changes,microbiology,package_label_principal_display_panel,spl_unclassified_section">
			<cfset FDAcollist="spl_id,product_ndc,is_original_packager,route,substance_name,rxcui,spl_set_id,package_ndc,product_type,generic_name,manufacturer_name,brand_name,application_number,pharm_class_epc">
			<cfset retunrResultdata=querynew("debug,#MetaColls#,#collist#,#FDAcollist#")>
				<cfloop from="1" to="#arraylen(results)#" index="r">
					<cfset queryaddrow(retunrResultdata)>
						<cfloop list="#collist#" index="col">
							<cftry>
	                        	<cfif isarray(results[r][col])>
									<cfset querySetcell(retunrResultdata,col,arraytolist(results[r][col],'#ListDelimiter#'))>
									<cfelse>
									<cfset querySetcell(retunrResultdata,col,results[r][col])>
								</cfif>		                        
	                        <cfcatch></cfcatch>
	                        </cftry>			
						</cfloop>					
					<cftry>
	            		<cfset openFdaData=this.GetOpenFdaData(results[r].openfda)>
							<cfloop query="openFdaData">
								<cfloop list="#FDAcollist#" index="colfda">
							   <cftry>
									<cfset querySetcell(retunrResultdata,colfda,openFdaData[colfda])>
			                     	<cfcatch></cfcatch>
			                   </cftry>			
								</cfloop>  
							</cfloop>       
	           			 <cfcatch></cfcatch>
            		</cftry>
					<cftry>
            			<cfloop query="metaDataQuery">
        					<cfloop list="#MetaColls#" index="theMetaCol">
        						<cftry>
        							<cfset querySetcell(retunrResultdata,theMetaCol,metaDataQuery[theMetaCol])>
        						<cfcatch></cfcatch>
        						</cftry>
        					</cfloop>
            			</cfloop>
            			<cfcatch></cfcatch>
            		</cftry>				
				</cfloop>				
			<cfcatch><cfset querySetcell(retunrResultdata,"set_id",cfcatch.Detail)></cfcatch>
		</cftry>
	<cfreturn retunrResultdata>
	</cffunction>
	 
	<!--- -***********************************************************--->
    <!--- -**********************   GetMetaData   ********************--->
    <!--- -***********************************************************--->		
	<cffunction  name="GetMetaData" returntype= "Query" description="Flattens the  openFDA meta structer into a simple single row query result.">
		<cfargument name="meta">
		<cftry>
			<cfset retunrMetadata=querynew("disclaimer,license,last_updated,skip,limit,total")>
			<cfset queryaddrow(retunrMetadata)>
			<cfset querySetcell(retunrMetadata,"disclaimer",meta.disclaimer)>
			<cfset querySetcell(retunrMetadata,"license",meta.license)>
			<cfset querySetcell(retunrMetadata,"last_updated",meta.last_updated)>
			<cfset querySetcell(retunrMetadata,"skip",meta.results.skip)>
			<cfset querySetcell(retunrMetadata,"limit",meta.results.limit)>
			<cfset querySetcell(retunrMetadata,"total",meta.results.total)>
			<cfcatch></cfcatch>
		</cftry>
	<cfreturn retunrMetadata>
	</cffunction>	
	
	<!--- -***********************************************************--->
    <!--- -**********************   GetOpenFdaData   *****************--->
    <!--- -***********************************************************--->	
	<cffunction  name="GetOpenFdaData" returntype="any" description="Flattens the  results.openFDA  structer into a simple single row query result.">
		<cfargument name="argopenfda">
		<cftry>
			<cfset collistopenfda="spl_id,product_ndc,is_original_packager,route,substance_name,rxcui,spl_set_id,package_ndc,product_type,generic_name,manufacturer_name,brand_name,application_number,pharm_class_epc">
			<cfset retunrOpenFDAdata=querynew("#collistopenfda#")>
			<cfset queryaddrow(retunrOpenFDAdata)>
			<cfloop list="#collistopenfda#" index="colfdsl">
				<cftry>
                	<cfif isarray(argopenfda[colfdsl])>
						<cfset querySetcell(retunrOpenFDAdata,colfdsl,arraytolist(argopenfda[colfdsl],'#ListDelimiter#'))>
					<cfelse>
						<cfset querySetcell(retunrOpenFDAdata,colfdsl,argopenfda[colfdsl])>
					</cfif>		                        
                <cfcatch></cfcatch>
                </cftry>			
			</cfloop>				
			<cfcatch></cfcatch>
		</cftry>
	<cfreturn retunrOpenFDAdata>
	</cffunction>	
		
	<!--- -***********************************************************--->
    <!--- -**********************   JSONGrid   ***********************--->
    <!--- -***********************************************************--->
	<cfscript>
	function JSONGrid( q, page, pageSize,totalrows ){
		var ret = {};
		var row = {};
		var cols = listToArray( q.columnList );
		var col = "";
		var i = 0;
		var end = arguments.page * arguments.pageSize;
		var start = end - (arguments.pagesize - 1);
		ret[ "total" ] = 0;
		ret[ "page" ] = arguments.page;
		ret[ "records" ] = totalrows;
		if( val(totalrows) ){
			ret[ "total" ] = ceiling( totalrows  );
		}
		ret["rows"] = [];
		for( i=1; i ltE min(arguments.pageSize,q.recordCount); i++ ){
			structClear( row );
			for(col in cols){
				row[ ucase( col )] = q[ col ][ i ];
			}
			arrayAppend( ret[ "rows" ], duplicate( row ) );
		}
		return SerializeJSON(ret);
	}
	</cfscript>
</cfcomponent>