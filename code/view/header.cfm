<cfif thisTag.executionMode EQ "start">
	
	<cfsilent>
		<cfset users = structNew() />
		<cfset users.dans = "Dan" />
		<cfset users.bettyb = "Betty" />
		<cfset users.fredf = "Fred" />
	
	</cfsilent>
	
	<div id="top">
		<h2><a href="/index.cfm" title="Back to main page">Doc-O-Matic</a></h2>
		<div id="menu">
			<cfif structKeyExists( session, "user" ) AND isObject( session.user ) IS TRUE>
					<cfoutput>Welcome #session.user.getFirstName()#!<br> <a href="/logout.cfm" class="logout">Log out</a></cfoutput>
			</cfif>
		</div>
	</div>

</cfif>