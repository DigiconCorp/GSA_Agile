component {

	this.Name = "mainapp";

	this.clientManagement=true;
	
	// We are using local database to save time. Ideally you would point this to a real database server like MySql or other.
	this.datasources["main"] = {
	 	class: 'org.h2.Driver'
		, connectionString: 'jdbc:h2:/data/sample;MODE=MySQL'
		// optional settings
		, blob:true // default: false
		, clob:true // default: false
		, timezone:'EST'
		, storage:true // default: false
		,username:"sa" //
	
	};
	this.clientStorage= "main";
	this.govdatakey="sZYzeySBCJ8LNRlgD352cCoxMF58MLYgYxWXQD9x";
	
}
