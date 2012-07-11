<cfcomponent output="false">

	<cfset variables.instance = structNew() />

	<cffunction name="init" access="public" returntype="WorkflowProcessor">
		<cfargument name="Registry" type="struct" required="true"/>
		
		<cfset variables.instance.registry = arguments.registry />
		
		<cfreturn this />
	</cffunction>
	
	<cffunction name="process" output="false" access="public" returntype="any" hint="I handle the request for a workflow">
		<cfargument name="workflowID" type="string" required="false" default="" />
		<cfargument name="workflowParams" type="struct" required="false" default="#structNew()#" />
		
		<cfset var workflowSeries = "" />
		<cfset var workflowLog =  "" />
		
		<cfif len( trim( arguments.workflowID ) ) IS 0 OR ( len( trim( arguments.workflowID ) ) GT 0 AND structKeyExists( variables.instance.registry, arguments.workflowID ) IS false )>
			<cfreturn arrayNew(1) />
		</cfif>
		
		<cfset workflowSeries = variables.instance.registry[ arguments.workflowID ] />
		
		<cfset workflowLog = begin( workflowSeries ) />		
		<cfset workflowLog = runSteps( workflowSeries, arguments.workflowParams, workflowLog  ) />
		<cfset workflowLog = end( workflowSeries, workflowLog ) />
		
		<cfreturn workflowLog />	
		
	</cffunction>
	
	<cffunction name="begin" output="false" access="private" returntype="array" hint="I begin the processing">
		<cfargument name="workflow" type="Workflow" required="true"/>
		<cfset var rtn = arrayNew(1) />
		
		<cfset arrayAppend( rtn, "Beginning Workflow: #arguments.workflow.getWorkflowConfig().Name# at #dateFormat( now(), 'mm/dd/yyyy')# #timeFormat( now(), 'long')#" ) />
		
		<cfreturn rtn />
	</cffunction>

	<cffunction name="end" output="false" access="private" returntype="array" hint="I end the processing">
		<cfargument name="workflow" type="Workflow" required="true"/>
		<cfargument name="workflowLog" type="array" required="true"/>
		
		<cfset arrayAppend( workflowLog, "Ending Workflow: #arguments.workflow.getWorkflowConfig().Name# at #dateFormat( now(), 'mm/dd/yyyy')# #timeFormat( now(), 'long')#" ) />
		
		<cfreturn workflowLog />
	</cffunction>
	
	<cffunction name="runSteps" output="false" access="private" returntype="array" hint="I run the steps">
		<cfargument name="workflow" type="Workflow" required="true"/>
		<cfargument name="workflowParams" type="struct" required="true" />
		<cfargument name="workflowLog" type="array" required="true"/>
		
		<cfset var stepsArray = arguments.workflow.getSteps() />
		<cfset var thisStep = "" />
		<cfset var stepResult = "" />
		
		<cfif arrayLen( stepsArray ) GT 0>
			<cfloop array="#stepsArray#" index="thisStep">
				
				<cfinvoke component="#thisStep.delegate#" method="#thisStep.action#" returnvariable="stepResult" argumentcollection="#arguments.workflowParams#" />
				
				<cfset arrayAppend( arguments.WorkflowLog, stepResult) />
			</cfloop>
		</cfif>
		
		<cfreturn workflowLog />
	</cffunction>

	<!---<cffunction name="addHistory" output="false" access="private" returntype="any" hint="I add a history item">
		<cfargument name="modifier" type="string" required="true"/>
		<cfreturn "A history record has been added to the document audit trail" />
	</cffunction>
	
	<cffunction name="changeQueue" output="false" access="private" returntype="any" hint="I change the queue of the document">
		<cfargument name="modifier" type="string" required="true"/>
		<cfreturn "The queue of the document has been changed to the #spaceCap( arguments.modifier )#" />
	</cffunction>
	
	<cffunction name="endTime" output="false" access="private" returntype="any" hint="I end the time clock">
		<cfargument name="modifier" type="string" required="true"/>
		<cfreturn "The time clock for the #spaceCap( arguments.modifier )# has been stopped" />
	</cffunction>
	
	<cffunction name="markSaved" output="false" access="private" returntype="any" hint="I mark the current document version as the saved version">
		<cfargument name="modifier" type="string" required="true"/>
		<cfreturn "I mark the current document version as the saved version" />
	</cffunction>
	
	<cffunction name="newDocument" output="false" access="private" returntype="any" hint="I end the time clock">
		<cfargument name="modifier" type="string" required="true"/>
		<cfreturn "A new document has been created and a new audit trail has been started" />
	</cffunction>
	
	<cffunction name="sendEmail" output="false" access="private" returntype="any" hint="I send an email">
		<cfargument name="modifier" type="string" required="true"/>
		<cfreturn "An email to the #spaceCap( arguments.modifier )# has been sent" />
	</cffunction>
	
	<cffunction name="startTime" output="false" access="private" returntype="any" hint="I start the time clock">
		<cfargument name="modifier" type="string" required="true"/>
		<cfreturn "The time clock for the #spaceCap( arguments.modifier )# has been started" />
	</cffunction>
	
	<cffunction name="spaceCap" output="false" access="private" returntype="string" hint="I return a string with a space before each capital letter: author Mark W. Breneman (Mark@vividmedia.com) ">
		<cfargument name="x" type="string" required="true"/>
		<cfreturn REReplace(x, "([.^[:upper:]])", " \1","all") />
	</cffunction>--->
	
	<cffunction name="getMemento" output="false" access="public" returntype="struct" hint="">
    	<cfreturn variables.instance />
    </cffunction>
	
</cfcomponent>