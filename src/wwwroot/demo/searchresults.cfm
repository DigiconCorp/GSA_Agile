	<!---<CFSET COLLIST="DESCRIPTION,SET_ID,INDICATIONS_AND_USAGE,KEEP_OUT_OF_REACH_OF_CHILDREN,DOSAGE_AND_ADMINISTRATION,PURPOSE,VERSION,ID,PREGNANCY_OR_BREAST_FEEDING,PACKAGE_LABEL_PRINCIPAL_DISPLAY_PANEL,ACTIVE_INGREDIENT,INACTIVE_INGREDIENT,EFFECTIVE_TIME,SPL_PRODUCT_DATA_ELEMENTS,WARNINGS">
	--->
	<CFSET COLLIST="SET_ID,ID,VERSION,EFFECTIVE_TIME,DRUG_ABUSE_AND_DEPENDENCE,CONTROLLED_SUBSTANCE,ABUSE,DEPENDENCE,OVERDOSAGE,ADVERSE_REACTIONS,DRUG_INTERACTIONS,DRUG_AND_OR_LABORATORY_TEST_INTERACTIONS,CLINICAL_PHARMACOLOGY,MECHANISM_OF_ACTION,PHARMACODYNAMICS,PHARMACOKINETICS,INDICATIONS_AND_USAGE,CONTRAINDICATIONS,DOSAGE_AND_ADMINISTRATION,DOSAGE_FORMS_AND_STRENGTHS,PURPOSE,DESCRIPTION,ACTIVE_INGREDIENT,INACTIVE_INGREDIENT,SPL_PRODUCT_DATA_ELEMENTS,SPL_PATIENT_PACKAGE_INSERT,INFORMATION_FOR_PATIENTS,INFORMATION_FOR_OWNERS_OR_CAREGIVERS,INSTRUCTIONS_FOR_USE,ASK_DOCTOR,ASK_DOCTOR_OR_PHARMACIST,DO_NOT_USE,KEEP_OUT_OF_REACH_OF_CHILDREN,OTHER_SAFETY_INFORMATION,QUESTIONS,STOP_USE,WHEN_USING,PATIENT_MEDICATION_INFORMATION,SPL_MEDGUIDE,USE_IN_SPECIFIC_POPULATIONS,PREGNANCY,TERATOGENIC_EFFECTS,NONTERATOGENIC_EFFECTS,LABOR_AND_DELIVERY,NURSING_MOTHERS,PREGNANCY_OR_BREAST_FEEDING,PEDIATRIC_USE,GERIATRIC_USE,NONCLINICAL_TOXICOLOGY,CARCINOGENESIS_AND_MUTAGENESIS_AND_IMPAIRMENT_OF_FERTILITY,ANIMAL_PHARMACOLOGY_AND_OR_TOXICOLOGY,CLINICAL_STUDIES,REFERENCES,HOW_SUPPLIED,STORAGE_AND_HANDLING,SAFE_HANDLING_WARNING,BOXED_WARNING,WARNINGS_AND_PRECAUTIONS,USER_SAFETY_WARNINGS,PRECAUTIONS,WARNINGS,GENERAL_PRECAUTIONS,LABORATORY_TESTS,RECENT_MAJOR_CHANGES,MICROBIOLOGY,PACKAGE_LABEL_PRINCIPAL_DISPLAY_PANEL,SPL_UNCLASSIFIED_SECTION">
		
	<CFSET FDACOLLIST="SPL_ID,PRODUCT_NDC,IS_ORIGINAL_PACKAGER,ROUTE,SUBSTANCE_NAME,RXCUI,SPL_SET_ID,PACKAGE_NDC,PRODUCT_TYPE,GENERIC_NAME,MANUFACTURER_NAME,BRAND_NAME,APPLICATION_NUMBER">
	<CFSET MasterCls="#COLLIST#,#FDACOLLIST#">
	<cfset MasterCls=listsort(MasterCls,"TextNoCase", "ASC")>
	<cfset enablelst="BRAND_NAME,GENERIC_NAME,MANUFACTURER_NAME">

	
	<div id="mainSearchDiv">
		<div id="toolbar2" >
			<div class="form-inline" role="form">
				<div class="form-group">
					<label class="control-label" for="FieldSearch">Search in:</label>
		    		<select class="form-control" id="FieldSearch"  style=" width:160px" name="FieldSearch"  onchange="$('#SearchResultsGrid').bootstrapTable('refresh');">
		           		<option value="All">ALL FIELDS</option>
			             <cfloop list="#MasterCls#" index="cc">
							<cfoutput><option value="#lcase(cc)#">#replace(cc,"_"," ","all")#</option></cfoutput>
						</cfloop>
					</select>
		        </div>					
			</div>	
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
			data-striped="true">
		    <thead>
				<tr>
				<cfloop list="#MasterCls#" index="cc">
					<cfoutput><th data-field="#cc#" data-visible="#listfind(enablelst,cc)#"  data-sortable="false" data-width="150">#replace(cc,"_"," ","all")#</th></cfoutput>
				</cfloop>
				</tr>
		    </thead>
		</table>
	</div>
	<div id="detailDiv" class="hidden"></div>		
<script>
	
	$('#SearchResultsGrid').bootstrapTable({}).on('click-row.bs.table', function (e, DATA, args) { OpenDetailView(DATA.ID); });       
	
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
	
	OpenDetailView = function(ID)
		{
			var detailUrl="detailview.cfm?id="+ID;
			$("#detailDiv").load(detailUrl,function(){
				showItem( $("#detailDiv"));
				hideItem( $("#mainSearchDiv"));
			});
		}	
	
	CloseDetailView = function()
		{
			hideItem( $("#detailDiv"));
			showItem( $("#mainSearchDiv"));
		}
</script>