<cfcomponent displayname="DocumentManager">
	
	<cffunction name="init" output="false" access="public" returntype="any" hint="model.DocumentManager">
    	
    	<cfreturn this />
    	
    </cffunction>
	
	<cffunction name="listDocuments" output="false" access="public" returntype="query" hint="">
    	<cfargument name="includeDeleted" type="boolean" required="false" default="false" />
		<cfargument name="includeActive" type="boolean" required="false" default="true" />
    	
    	<cfset var qData = "" />
		<cfset var wdxData = "" />
		<cfset var activeDocuments = "" />
    	
    	<cfset verifyDataFile() />
		
		<cffile action="read" file="#expandPath('/data/documents.wddx')#" variable="wdxData" />
		
		<cfwddx action="wddx2cfml" input="#wdxData#" output="qData" />
		
		<cfquery dbtype="query" name="activeDocuments">
			Select *
			from qData
			Where 1=1
			<cfif arguments.includeDeleted IS FALSE>
				AND status <> 'Archived'
			</cfif>
			<cfif arguments.includeActive IS FALSE>
				AND status = 'Archived'
			</cfif>
		</cfquery>
		
		<cfreturn activeDocuments />
    	
    </cffunction>
	
	<cffunction name="loadDocument" output="false" access="public" returntype="model.Document" hint="">
    	<cfargument name="documentID" type="string" required="true" />
		
		<cfset var qData = "" />
		<cfset var wdxData = "" />
		<cfset var docRecord = "" />
		<cfset var Document = createObject("component","model.Document") />
		
		<cffile action="read" file="#expandPath('/data/documents.wddx')#" variable="wdxData" />
		
		<cfwddx action="wddx2cfml" input="#wdxData#" output="qData" />
		
		<cfquery dbtype="query" name="docRecord">
			Select *
			from qData
			Where id = '#arguments.documentID#'
		</cfquery>
		
		<cfif docRecord.recordcount EQ 1>
			<cfset Document.setCreated( docRecord.created ) />
			<cfset Document.setCreatedBy( docRecord.createdBy ) />
			<cfset Document.setDescription( docRecord.description ) />
			<cfset Document.setFileName( docRecord.fileName ) />
			<cfset Document.setID( docRecord.ID ) />
			<cfset Document.setStatus( docRecord.status ) />
		</cfif>
		
		<cfreturn Document />				
		
    </cffunction>
	
	
	<cffunction name="renameFile" output="false" access="public" returntype="string" hint="">
    	<cfargument name="Document" type="model.Document" required="true" />
    	
		<cfset var documentLocation = expandPath("/documents") />
		<cfset var extension = listLast( arguments.Document.getFileName(), "." ) />
		<cfset var result = "" />
				
		<cffile action="rename" source="#documentLocation#/#arguments.Document.getFileName()#" destination="#documentLocation#/#arguments.Document.getID()#.#extension#" />
    	
		<cfset result = "Document ID #arguments.Document.getID()# successfully renamed from '#arguments.Document.getFileName()#' to '#arguments.Document.getID()#.#extension#'" />

		<cfset arguments.Document.setFileName( "#arguments.Document.getID()#.#extension#" ) />
		
		<cfreturn result />
    </cffunction>
	
	
	<cffunction name="save" output="false" access="public" returntype="string" hint="">
    	<cfargument name="Document" type="model.Document" required="true" />
    	
		<cfset var result = "" />
		<cfset var originalList = listDocuments( includeDeleted=TRUE ) />
		<cfset var documentList = "" />
		<cfset var wdxData = "" />
		
		<cfquery dbtype="query" name="documentList">
			Select *
			from originalList
			where ID <> '#arguments.Document.getID()#'
		</cfquery>
		
		<cfscript>
			queryAddRow( documentList );
			querySetCell( documentList, "id", arguments.Document.getID() );
			querySetCell( documentList, "description", arguments.Document.getDescription() );
			querySetCell( documentList, "fileName", arguments.Document.getFileName() );
			querySetCell( documentList, "status", arguments.Document.getStatus() );
			querySetCell( documentList, "created", arguments.Document.getCreated() );
			querySetCell( documentList, "createdBy", arguments.Document.getCreatedBy() );
		</cfscript>
		
		<cfwddx action="cfml2wddx" input="#documentList#" output="wdxData" />
		<cffile action="write" file="#expandPath('/data/documents.wddx')#" output="#wdxData#" />
		
		<cfset result = "Document ID #Document.getID()# successfully saved." />
		
		<cfreturn result />
    	
    </cffunction>
	
	<cffunction name="ApproveDocument" output="false" access="public" returntype="string" hint="">
    	<cfargument name="Document" type="model.Document" required="true" />
		
		<cfset var result = "" />
		
		<cfset arguments.Document.setStatus("Approved") />
		
		<cfset result = "Changed status of document ID #arguments.Document.getID()# to 'Approved'" />
		
		<cfreturn result />
		
    </cffunction>
	
	<cffunction name="RejectDocument" output="false" access="public" returntype="string" hint="">
    	<cfargument name="Document" type="model.Document" required="true" />
		
		<cfset var result = "" />
		
		<cfset arguments.Document.setStatus("Rejected") />
		
		<cfset result = "Changed status of document ID #arguments.Document.getID()# to 'Rejected'" />
		
		<cfreturn result />
		
    </cffunction>
	
	<cffunction name="ArchiveDocument" output="false" access="public" returntype="any" hint="">
    	<cfargument name="Document" type="model.Document" required="true" />
    	
    	<cfset var result = "" />
		
		<cfset arguments.Document.setStatus("Archived") />
		
		<cfset result = "Archived document ID #arguments.Document.getID()#" />
    	
    	<cfreturn result />
    </cffunction>
	
	<cffunction name="RestoreDocument" output="false" access="public" returntype="any" hint="">
    	<cfargument name="Document" type="model.Document" required="true" />
    	
    	<cfset var result = "" />
		
		<cfset arguments.Document.setStatus("Approved") />
		
		<cfset result = "Restored document ID #arguments.Document.getID()# from the archive" />
    	
    	<cfreturn result />
    </cffunction>
	
	
	
	<!--- Private methods --->
	<cffunction name="verifyDataFile" output="false" access="private" returntype="void" hint="">
    	
    	<!--- This entire method would be unnecessary if we were using a real database instead of a fake one with WDDX --->
    	<cfif fileExists( expandPath('/data/documents.wddx') ) IS FALSE>
    		<cflog text="fileExists( expandPath('/data/documents.wddx') ) :: #fileExists( expandPath('/data/documents.wddx') )#" />
    		<cfset local.qData = queryNew("id,description,fileName,status,created,createdBy") />
			<cfwddx action="cfml2wddx" input="#local.qData#" output="local.wdxData" />
			<cffile action="write" file="#expandPath('/data/documents.wddx')#" output="#local.wdxData#" />
		</cfif> 
    	
    </cffunction>
	
</cfcomponent>