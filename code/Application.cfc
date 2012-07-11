<cfcomponent displayname="Application Component" output="false">

	<cfset this.name = "AdvancedWorkflows">
	<cfset this.sessionmanagement = true>
	<cfset this.clientmanagement = true>
	<cfset this.setclientcookies = true>
	<cfset this.applicationtimeout = createtimespan(1,0,0,0)>
	<cfset this.sessiontimeout = createtimespan(0,60,0,0)>
	<cfset this.scriptProtect = "all">

	<cffunction name="onApplicationStart" returnType="boolean" output="false">
		
		<cfset var csProps = structNew() />
		
		<cfset Application.serviceFactory = createObject("component","coldspring.beans.DefaultXmlBeanFactory").init( defaultProperties = csProps ) />
		<cfset Application.serviceFactory.loadBeansFromXmlFile("/config/ColdSpring.xml") />
		
		<cfreturn true>
	</cffunction>
	
	<cffunction name="onApplicationEnd">	
		<cfargument name="ApplicationScope" required=true/>
	</cffunction>

	<cffunction name="onRequest" returnType="void">
		<cfargument name="targetTemplate" type="string" required="true">
		<cfinclude template="#arguments.targetTemplate#">
	</cffunction>
	
	<cffunction name="onRequestStart" returnType="boolean">
		<cfargument name="thePage" type="string" required="true">
		
		<cfif structKeyExists( URL, "init" ) AND URL.init IS TRUE>
			<cfset onApplicationStart() />
		</cfif>
		
		<cfif structKeyExists( session, "user" ) IS FALSE OR isObject( session.user ) IS FALSE >
			<cfif arguments.thePage NEQ "/login.cfm">
				<cfinclude template="/login.cfm"><cfabort>
			</cfif>
		</cfif>
		
		<cfreturn true>
	</cffunction>	
	
	<cffunction name="onRequestEnd" returnType="void">
		<cfargument type="String" name="targetPage" required=true/>
		
	</cffunction>
	
	<cffunction name="onSessionStart" returntype="void">
	</cffunction>
	
	<cffunction name="onSessionEnd" returnType="void">
		<cfargument name="sessionScope" type="struct" required="true">
		<cfargument name="appScope" type="struct" required="false">
	</cffunction>
	
</cfcomponent>