<cfcomponent output="false">
	
	<cfset variables.instance = structNew() />

	<cffunction name="init" access="public" returntype="model.Workflow">
		<cfargument name="WorkflowConfig" type="struct" required="true"/>
		<cfargument name="Steps" type="any" default="#arrayNew(1)#" />
		
		<cfset setWorkflowConfig( arguments.WorkflowConfig ) />
		<cfset setSteps( arguments.Steps ) />
		
		<cfreturn this />
	</cffunction>
	
	<cffunction name="getWorkflowConfig" access="public" output="false" returntype="struct">
    	<cfreturn variables.instance.WorkflowConfig />
    </cffunction>
    
    <cffunction name="setWorkflowConfig" access="public" output="false" returntype="void">
    	<cfargument name="WorkflowConfig" type="struct" required="true" />
    	<cfset variables.instance.WorkflowConfig = arguments.WorkflowConfig />
    </cffunction>
	
	<cffunction name="getSteps" access="public" output="false" returntype="array">
    	<cfreturn variables.instance.Steps />
    </cffunction>
    
    <cffunction name="setSteps" access="public" output="false" returntype="void">
    	<cfargument name="Steps" type="array" required="true" />
    	<cfset variables.instance.Steps = arguments.Steps />
    </cffunction>
	
	
	<cffunction name="getMemento" output="false" access="public" returntype="struct" hint="">
    	<cfreturn variables.instance />
    </cffunction>
</cfcomponent>