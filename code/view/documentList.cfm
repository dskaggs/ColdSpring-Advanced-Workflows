<cfsilent>

	<cfparam name="attributes.documentList" default="" />
	<cfparam name="attributes.title" default="Active Documents" />

</cfsilent>

<cfif thisTag.executionMode EQ "start">
	<cfoutput>
		<h2>#attributes.title#</h2>
	
		
		<cfif isQuery( attributes.documentList ) AND attributes.documentList.recordCount GT 0 >
			
			<table width="100%">
				
				<thead>
					<tr>
						<th>Description</th>
						<th>Created By</th>
						<th>Status</th>
						<th>&nbsp;</th>
					</tr>
				</thead>
				
				<tbody>
					<cfloop query="attributes.documentList">
						<tr>
							<td>#attributes.documentList.description#</td>
							<td>#attributes.documentList.createdBy#</td>
							<td>#attributes.documentList.status#</td>
							<td align="right">
								<a href="/reviewDocument.cfm?documentID=#attributes.documentList.id#">Review</a>
								<cfif attributes.documentList.status EQ "Archived">
									 | <a href="/doRestoreDocument.cfm?documentID=#attributes.documentList.id#">Restore</a>
								<cfelse>
									 | <a href="/doArchiveDocument.cfm?documentID=#attributes.documentList.id#">Archive</a>
								</cfif> 
							</td>
						</tr>
					</cfloop>
				</tbody>
				
			</table>
			
			
		<cfelse>
			<p>There are no documents of this type currently in the system</p>
		</cfif>
		
	</cfoutput>
</cfif>