<cfcomponent displayname="NotificationManager">
	
	<cfset variables.instance = structNew() />
	
	<cffunction name="init" output="false" access="public" returntype="model.NotificationManager" hint="">
    	<cfargument name="UserManager" type="model.UserManager" required="true" />
    	
		<cfset variables.instance.UserManager = arguments.UserManager />
		
    	<cfreturn this />
    	
    </cffunction>
	
	
	<cffunction name="sendApprovalNotification" output="false" access="public" returntype="string" hint="">
    	<cfargument name="Document" type="model.Document" required="true" />
		<cfargument name="Reviewer" type="model.User" required="true" />
    	
		<cfset var Creator = variables.instance.UserManager.getUser( arguments.Document.getCreatedBy() ) />
    	<cfset var result = "" />
		
		<cfmail to="#Creator.getEmail()#" from="system@docomatic.com" subject="Your document has been approved" type="text">
			#Creator.getFirstName()#,
			Your document titled #arguments.Document.getDescription()# has been marked 'Approved' by #arguments.Reviewer.getFirstName()#.		
		</cfmail>
		
		<cfset result = "Successfully sent document approval notification email to #Creator.getEmail()#" />
		
		<cfreturn result />
		
    </cffunction>
	
	
	<cffunction name="sendRejectionNotification" output="false" access="public" returntype="string" hint="">
    	<cfargument name="Document" type="model.Document" required="true" />
		<cfargument name="Reviewer" type="model.User" required="true" />
    	
		<cfset var Creator = variables.instance.UserManager.getUser( arguments.Document.getCreatedBy() ) />
    	<cfset var result = "" />
		
		<cfmail to="#Creator.getEmail()#" from="system@docomatic.com" subject="Your document has been rejected" type="text">
			#Creator.getFirstName()#,
			Your document titled #arguments.Document.getDescription()# has been marked 'Rejected' by #arguments.Reviewer.getFirstName()#.		
		</cfmail>
		
		<cfset result = "Successfully sent document rejection notification email to #Creator.getEmail()#" />
		
		<cfreturn result />
		
    </cffunction>
	
	
	<cffunction name="sendArchivalNotification" output="false" access="public" returntype="string" hint="">
    	<cfargument name="Document" type="model.Document" required="true" />
		<cfargument name="Reviewer" type="model.User" required="true" />
    	
		<cfset var Creator = variables.instance.UserManager.getUser( arguments.Document.getCreatedBy() ) />
    	<cfset var result = "" />
		
		<cfmail to="#Creator.getEmail()#" from="system@docomatic.com" subject="Your document has been archived" type="text">
			#Creator.getFirstName()#,
			Your document titled #arguments.Document.getDescription()# has been archived by #arguments.Reviewer.getFirstName()#.		
		</cfmail>
		
		<cfset result = "Successfully sent document archival notification email to #Creator.getEmail()#" />
		
		<cfreturn result />
		
    </cffunction>
	
	
</cfcomponent>