<cfcomponent displayname="Application" output="true" hint="Handle the application.">
  <!--- Set up the application. --->
	 <cfscript>
		this.Name = "mainapp";
		this.clientManagement=true;
		// We are using local database to save time. Ideally you would point this to a real database server like MySql or other.
		this.datasources["main"] = 
			{
				  class: 'org.h2.Driver'
				, connectionString: 'jdbc:h2:/data/sample;MODE=MySQL'
				, blob:true
				, clob:true 
				, timezone:'EST'
				, storage:true 
				, username:"sa" 
			};
		this.clientStorage= "main";

	</cfscript> 
    <cffunction name="OnRequest" access="public" returntype="void" output="true"hint="Fires after pre page processing is complete.">
        <!--- Define arguments. --->
	    <cfargument name="TargetPage" type="string" required="true" />
       <cfscript>
      	application.govdatakey="sZYzeySBCJ8LNRlgD352cCoxMF58MLYgYxWXQD9x";
		application.openFDAKey="D459BvLbpi9zAgGZNUh1uX6oSgAGSC7LffQKetlg";      	
      </cfscript>
        
        <!--- Include the requested page. --->
    
         <cfinclude template="#ARGUMENTS.TargetPage#" />
        <!--- Return out. --->
        <cfreturn />
    </cffunction>

  
</cfcomponent>

