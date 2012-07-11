<cfcomponent displayname="User">
	
	<cfset variables.instance = structNew() />
	<cfset variables.instance.username = "" />
	<cfset variables.instance.firstName = "" />
	<cfset variables.instance.email = "" />
	
	
	<cffunction name="getuserName" access="public" output="false" returntype="string">
    	<cfreturn variables.instance.userName />
    </cffunction>
    
    <cffunction name="setuserName" access="public" output="false" returntype="void">
    	<cfargument name="userName" type="string" required="true" />
    	<cfset variables.instance.userName = arguments.userName />
    </cffunction>
	
	<cffunction name="getfirstName" access="public" output="false" returntype="string">
    	<cfreturn variables.instance.firstName />
    </cffunction>
    
    <cffunction name="setfirstName" access="public" output="false" returntype="void">
    	<cfargument name="firstName" type="string" required="true" />
    	<cfset variables.instance.firstName = arguments.firstName />
    </cffunction>
	
	<cffunction name="getemail" access="public" output="false" returntype="string">
    	<cfreturn variables.instance.email />
    </cffunction>
    
    <cffunction name="setemail" access="public" output="false" returntype="void">
    	<cfargument name="email" type="string" required="true" />
    	<cfset variables.instance.email = arguments.email />
    </cffunction>
	
	
</cfcomponent>