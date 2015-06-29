<cfset masterlist="">

<cfloop file="fieldmaster.cfm" index="a">

<cfif left(trim(a),20) contains "<dt><code>">
	<cfset a=replace(a,"<dt><code>","")>
		<cfset a=replace(a,"</code></dt>","")>
	<cfset masterlist=listappend(masterlist,trim(a),",")>
	</cfif>

</cfloop>

<cfoutput>#masterlist#</cfoutput>