<cfcomponent>
	
	<cfset variables.instance = structNew() />
	
	<cffunction name="init" output="false" access="public" returntype="model.UserManager" hint="">
    	
    	<cfset initializeUsers() />
    	
    	<cfreturn this />
    	
    </cffunction>
	
	<cffunction name="getUser" output="false" access="public" returntype="model.User" hint="">
    	<cfargument name="userName" type="string" required="true" />
		
		<cfset var User = createObject("component","model.User") />

		<cfif structKeyExists( variables.instance, "users" ) IS FALSE>
			<cfset initializeUsers() />
		</cfif>

		<cfif structKeyExists( variables.instance.users, arguments.userName ) >
			<cfset User.setUserName( arguments.userName ) />
			<cfset User.setFirstName( variables.instance.users[ arguments.userName ][ "firstName" ] ) />
			<cfset User.setEmail( variables.instance.users[ arguments.userName ][ "email" ] ) />
		</cfif>
		
		<cfreturn User />
    	
    </cffunction>
	
	
	<cffunction name="initializeUsers" output="false" access="private" returntype="void" hint="">
    	
    	<cfscript>
    		variables.instance.users = structNew();
			variables.instance.users.dans = structNew();
			variables.instance.users.dans.firstName = "Dan";
			variables.instance.users.dans.email = "redneck@rampage.com";
			
			variables.instance.users.bettyb = structNew();
			variables.instance.users.bettyb.firstName = "Betty";
			variables.instance.users.bettyb.email = "betty@boop.org";
			
			variables.instance.users.fredf = structNew();
			variables.instance.users.fredf.firstName = "Fred";
			variables.instance.users.fredf.email = "rubblerouser@slaterock.com";
    	
    	</cfscript>
    	
    </cffunction>


</cfcomponent>