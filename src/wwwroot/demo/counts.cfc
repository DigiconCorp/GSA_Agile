<cfcomponent>
	<!--- -***********************************************************--->
    <!--- -**********************  GetCounts   ***********************--->
    <!--- -***********************************************************--->	
	<cffunction name="GetCounts" returntype = "any" access="remote">
		<cfargument name="STR" >
		<cfargument name="countfield" required="false" default="patient.reaction.reactionmeddrapt" >
		<cfset theurl="https://api.fda.gov/drug/event.json?api_key=#application.openFDAKey#&search=#str#&count=#countfield#.exact">
		<cfhttp method="get" url="#theurl#"  result="patient">
		<cfset getResults=deserializeJSON(patient.FileContent)>
		<cfset returndata=querynew("Term,Count")>
		<cftry>
			<cfif arraylen(getResults.results)>
				<cfloop from="1" to="#arraylen(getResults.results)#" index="I">
				<cfset data=getResults.results[I]>
				<cfset queryaddrow(returndata)>
				<cfset querysetcell(returndata,'Term',data.Term)>
				<cfset querysetcell(returndata,'Count',data.Count)>
				</cfloop>
			</cfif>
		<cfcatch></cfcatch>
		</cftry>
		<cfreturn returndata>		
	</cffunction>
</cfcomponent>