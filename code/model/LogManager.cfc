<cfcomponent displayname="LogManager">

	<cffunction name="init" output="false" access="public" returntype="model.LogManager" hint="">
    	
    	<cfreturn this />
    	
    </cffunction>
	
	<cffunction name="logDocumentCreated" output="false" access="public" returntype="string" hint="">
    	<cfargument name="Document" type="model.Document" required="true" />
		
		<cfset var message = "Document id #arguments.Document.getID()# was created by #arguments.Document.getCreatedBy()#." />
    	
		<cfset createLogMessage("Information", message) />
		
		<cfreturn "Log message created :: #message#" />
    	
    </cffunction>
	
	
	<cffunction name="logDocumentApproved" output="false" access="public" returntype="string" hint="">
    	<cfargument name="Document" type="model.Document" required="true" />
		<cfargument name="Reviewer" type="model.User" required="true" />
		
    	<cfset var message = "Document id #arguments.Document.getID()# was marked as 'Approved' by #arguments.Reviewer.getUserName()#." />
		
		<cfset createLogMessage("Information", message) />
		
		<cfreturn "Log message created :: #message#" />
    	
    </cffunction>
	
	
	<cffunction name="logDocumentRejected" output="false" access="public" returntype="string" hint="">
    	<cfargument name="Document" type="model.Document" required="true" />
		<cfargument name="Reviewer" type="model.User" required="true" />
		
    	<cfset var message = "Document id #arguments.Document.getID()# was marked as 'Rejected' by #arguments.Reviewer.getUserName()#." />
		
		<cfset createLogMessage("Information", message) />
		
		<cfreturn "Log message created :: #message#" />
    	
    </cffunction>
	
	
	<cffunction name="logDocumentArchived" output="false" access="public" returntype="string" hint="">
    	<cfargument name="Document" type="model.Document" required="true" />
		<cfargument name="Reviewer" type="model.User" required="true" />
		
    	<cfset var message = "Document id #arguments.Document.getID()# was archived by #arguments.Reviewer.getUserName()#." />
		
		<cfset createLogMessage("Information", message) />
		
		<cfreturn "Log message created :: #message#" />
    	
    </cffunction>
	
	
	<cffunction name="logDocumentRestored" output="false" access="public" returntype="string" hint="">
    	<cfargument name="Document" type="model.Document" required="true" />
		<cfargument name="Reviewer" type="model.User" required="true" />
		
    	<cfset var message = "Document id #arguments.Document.getID()# was restored from the archive by #arguments.Reviewer.getUserName()#." />
		
		<cfset createLogMessage("Information", message) />
		
		<cfreturn "Log message created :: #message#" />
    	
    </cffunction>
    
    
    <cffunction name="createLogMessage" output="false" access="private" returntype="void" hint="">
    	<cfargument name="messageType" type="string" required="true" />
		<cfargument name="messageText" type="string" required="true" />
		
		<cfset var message = "#arguments.messageText#" />
		
		<cflog type="#uCase(arguments.messageType)#" text="#message#" />
		
    </cffunction>
	

</cfcomponent>