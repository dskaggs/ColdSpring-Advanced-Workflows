<cfcomponent displayname="Document">
	
	<cfset variables.instance = structNew() />
	<cfset variables.instance.id = "" />
	<cfset variables.instance.description = "" />
	<cfset variables.instance.fileName = "" />
	<cfset variables.instance.status = "" />
	<cfset variables.instance.created = "" />
	<cfset variables.instance.createdBy = "" />
	
	
	<cffunction name="getID" access="public" output="false" returntype="string">
    	<cfreturn variables.instance.ID />
    </cffunction>
    
    <cffunction name="setID" access="public" output="false" returntype="void">
    	<cfargument name="ID" type="string" required="true" />
    	<cfset variables.instance.ID = arguments.ID />
    </cffunction>
	
	<cffunction name="getDescription" access="public" output="false" returntype="string">
    	<cfreturn variables.instance.description />
    </cffunction>
    
    <cffunction name="setDescription" access="public" output="false" returntype="void">
    	<cfargument name="Description" type="string" required="true" />
    	<cfset variables.instance.description = arguments.description />
    </cffunction>
	
	<cffunction name="getFileName" access="public" output="false" returntype="string">
    	<cfreturn variables.instance.fileName />
    </cffunction>
    
    <cffunction name="setFileName" access="public" output="false" returntype="void">
    	<cfargument name="FileName" type="string" required="true" />
    	<cfset variables.instance.fileName = arguments.fileName />
    </cffunction>
	
	<cffunction name="getStatus" access="public" output="false" returntype="any">
    	<cfreturn variables.instance.status />
    </cffunction>
    
    <cffunction name="setStatus" access="public" output="false" returntype="void">
    	<cfargument name="Status" type="any" required="true" />
    	<cfset variables.instance.status = arguments.status />
    </cffunction>
	
	<cffunction name="getCreatedBy" access="public" output="false" returntype="string">
    	<cfreturn variables.instance.createdBy />
    </cffunction>
    
    <cffunction name="setCreatedBy" access="public" output="false" returntype="void">
    	<cfargument name="CreatedBy" type="string" required="true" />
    	<cfset variables.instance.createdBy = arguments.createdBy />
    </cffunction>
	
	<cffunction name="getCreated" access="public" output="false" returntype="any">
    	<cfreturn variables.instance.created />
    </cffunction>
    
    <cffunction name="setCreated" access="public" output="false" returntype="void">
    	<cfargument name="created" type="date" required="true" />
    	<cfset variables.instance.created = arguments.created />
    </cffunction>
	
	<cffunction name="getMemento" output="false" access="public" returntype="struct" hint="">
    	<cfreturn variables.instance />
    </cffunction>
	
</cfcomponent>