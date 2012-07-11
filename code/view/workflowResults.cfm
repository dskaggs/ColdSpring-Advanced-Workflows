<cfsilent>

	<cfparam name="attributes.results" default="#arrayNew(1)#" />

</cfsilent>

<cfif thisTag.executionMode EQ "start">
	
	<cfoutput>
		
		<h2>Process results log</h2>
				
		<cfif arrayLen( attributes.results ) EQ 0>
			<p>No actions taken</p>
		<cfelse>
			<ul>
				<cfloop from="1" to="#arrayLen( attributes.results )#" index="ii">
					<li>#attributes.results[ii]#</li>
				</cfloop>
			</ul>
		</cfif>
		
	</cfoutput>
</cfif>