	<CFSET COLLIST="SET_ID,VERSION,EFFECTIVE_TIME,DRUG_ABUSE_AND_DEPENDENCE,CONTROLLED_SUBSTANCE,ABUSE,DEPENDENCE,OVERDOSAGE,ADVERSE_REACTIONS,DRUG_INTERACTIONS,DRUG_AND_OR_LABORATORY_TEST_INTERACTIONS,CLINICAL_PHARMACOLOGY,MECHANISM_OF_ACTION,PHARMACODYNAMICS,PHARMACOKINETICS,INDICATIONS_AND_USAGE,CONTRAINDICATIONS,DOSAGE_AND_ADMINISTRATION,DOSAGE_FORMS_AND_STRENGTHS,PURPOSE,DESCRIPTION,ACTIVE_INGREDIENT,INACTIVE_INGREDIENT,SPL_PRODUCT_DATA_ELEMENTS,SPL_PATIENT_PACKAGE_INSERT,INFORMATION_FOR_PATIENTS,INFORMATION_FOR_OWNERS_OR_CAREGIVERS,INSTRUCTIONS_FOR_USE,ASK_DOCTOR,ASK_DOCTOR_OR_PHARMACIST,DO_NOT_USE,KEEP_OUT_OF_REACH_OF_CHILDREN,OTHER_SAFETY_INFORMATION,QUESTIONS,STOP_USE,WHEN_USING,PATIENT_MEDICATION_INFORMATION,SPL_MEDGUIDE,USE_IN_SPECIFIC_POPULATIONS,PREGNANCY,TERATOGENIC_EFFECTS,NONTERATOGENIC_EFFECTS,LABOR_AND_DELIVERY,NURSING_MOTHERS,PREGNANCY_OR_BREAST_FEEDING,PEDIATRIC_USE,GERIATRIC_USE,NONCLINICAL_TOXICOLOGY,CARCINOGENESIS_AND_MUTAGENESIS_AND_IMPAIRMENT_OF_FERTILITY,ANIMAL_PHARMACOLOGY_AND_OR_TOXICOLOGY,CLINICAL_STUDIES,REFERENCES,HOW_SUPPLIED,STORAGE_AND_HANDLING,SAFE_HANDLING_WARNING,BOXED_WARNING,WARNINGS_AND_PRECAUTIONS,USER_SAFETY_WARNINGS,PRECAUTIONS,WARNINGS,GENERAL_PRECAUTIONS,LABORATORY_TESTS,RECENT_MAJOR_CHANGES,MICROBIOLOGY,PACKAGE_LABEL_PRINCIPAL_DISPLAY_PANEL,SPL_UNCLASSIFIED_SECTION">
	<CFSET FDACOLLIST="SPL_ID,PRODUCT_NDC,IS_ORIGINAL_PACKAGER,ROUTE,SUBSTANCE_NAME,RXCUI,SPL_SET_ID,PACKAGE_NDC,PRODUCT_TYPE,GENERIC_NAME,MANUFACTURER_NAME,BRAND_NAME,APPLICATION_NUMBER,PHARM_CLASS_EPC">
	<CFSET MasterCls="#COLLIST#,#FDACOLLIST#">
	<cfset MasterCls=listsort(MasterCls,"TextNoCase", "ASC")>
	<cfset enablelst="ID,SUBSTANCE_NAME,GENERIC_NAME,BRAND_NAME">
	<cfif cgi.HTTP_USER_AGENT contains "mobile"><cfset enablelst="ID,SUBSTANCE_NAME"></cfif>
	<div id="mainSearchDiv">
		<div class="well hidden" id="HelpDiv"><a href="javascript:void(0);" class="btn btn-info btn-xs pull-right"  id="srchHelpCloseLink" onclick="HideHelp()">Hide Help</a>
			<b>Overview</b><br>
			The default mode for the search finds all records that contain the exact string across all fields in the record. 
			<br>For example if you enter "Persistant Headache" all records containing that exact phrase will be returned.
			<br>To search for "Persistant" and "Headache" you would enter "+Persistant +Headache" to search all records that contain both words individually.
			<br><b>Additional Examples</b>
				<ul>
					<li>Example 1: enter "Cymbalta" with "SEARCH ALL FIELDS" selected will find all records that have "Cymbalta" in any field. </li> <br>
					<li>Example 2: Enter "caffeine" and select the field "ACTIVE INGREDIENT" to find all records with the word "caffeine" in the in the "ACTIVE INGREDIENT" field.
				</li>
			</ul>
			<p>Clicking on any cell in a row will open a detail screen with all fields that have data for that drug label record.</p>
		</div><a href="javascript:void(0);"  class="btn btn-info btn-xs"  id="srchHelpLink" onclick="ShowHelp()">Search Help</a>
		<div id="toolbar2" >
			<select class="form-control" id="FieldSearch"  style=" width:160px" name="FieldSearch"  onchange="$('#SearchResultsGrid').bootstrapTable('refresh');">
				<option value="All">SEARCH ALL FIELDS</option>
			     <cfloop list="#MasterCls#" index="cc">
					<cfoutput><option value="#lcase(cc)#">#replace(cc,"_"," ","all")#</option></cfoutput>
				</cfloop>
			</select>
		</div>
		<table 
			id="SearchResultsGrid"  
			data-url="labels.cfc?method=SearchLabels" 
			data-page-list="[5, 10, 20, 50]"
			data-search="true"			
			data-pagination="true"
			data-side-pagination="server" 
			data-show-toggle="true"
			data-show-columns="true"
			data-method="get"
			data-query-params="postQueryParams"
			data-toolbar="#toolbar2"
			data-classes="table table-hover table-condensed"
			data-toolbar-align="right"
			data-search-align="left"
			data-page-size="10"
			data-sortable="false"
		data-card-view="false"
			data-striped="true">
		    <thead>
				<tr>
				<cfloop list="ID,#MasterCls#" index="cc">
					<cfoutput><th data-field="#cc#" data-visible="#listfind(enablelst,cc)#"  data-sortable="false" data-width="150">#replace(cc,"_"," ","all")#</th></cfoutput>
				</cfloop>
				</tr>
		    </thead>
		</table>
	</div>
	<div id="detailDiv" class="hidden"></div>		
	<script>
		$('#SearchResultsGrid').bootstrapTable({}).on('click-row.bs.table', function (e, DATA, args) { OpenDetailView(DATA.ID,DATA.SEARCH); });       
		function Formatter_default(value, row, index)
			{
				return'<span  class="edit" title="Edit"> '+value+' </span>'
			};
		function postQueryParams(params)
			{
				params.Dummy = 1; 
				params.Search=$("#Search").val();
				params.FieldSearch=$("#FieldSearch").val();
				return params;
			}
		
		OpenDetailView = function(ID,SEARCH)
			{
				
				
				showItem( $("#detailDiv"));
					hideItem( $("#mainSearchDiv"));
				var detailUrl="detailview.cfm?id="+ID+'&search='+encodeURI(SEARCH);
				$("#detailDiv").load(detailUrl,function(){
					
				});
			}	
		
		CloseDetailView = function()
			{
				hideItem( $("#detailDiv"));
				showItem( $("#mainSearchDiv"));
			}
		ShowHelp = function ()
		{
				showItem($("#HelpDiv"));
				hideItem($("#srchHelpLink"));
		}	
		
		HideHelp = function ()
		{
				hideItem($("#HelpDiv"));
				showItem($("#srchHelpLink"));
		}	
	</script>