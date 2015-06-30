<cfcomponent DISPLAYNAME="Application" OUTPUT="true" HINT="Handle the application.">
	<!--- Set up the application. --->
	<cfscript>
		this.Name = "mainapp";
		this.clientManagement = true;
		// We are using local database to save time. Ideally you would point this to a real database server like MySql or other.
		this.datasources["main"] = {class='org.h2.Driver', connectionString='jdbc:h2:/data/sample;MODE=MySQL', blob=true, clob=true, timezone='EST', storage=true, username="sa"};
		this.clientStorage = "main";
	</cfscript>
	
	<cffunction NAME="OnRequest" ACCESS="public" RETURNTYPE="void" OUTPUT="true" HINT="Fires after pre page processing is complete.">
		<!--- Define arguments. --->
		<cfargument NAME="TargetPage" TYPE="string" REQUIRED="true"/>
	
		<cfscript>
			application.openFDAKey = "D459BvLbpi9zAgGZNUh1uX6oSgAGSC7LffQKetlg";
		</cfscript>
		
		<!--- Include the requested page. --->
		<cfinclude TEMPLATE="#ARGUMENTS.TargetPage#"/>
		<!--- Return out. --->
		<cfreturn/>
	</cffunction>
	
</cfcomponent>