<cfsilent>

</cfsilent>

<cfif thisTag.executionMode EQ "start">
	
	<h2>Upload New Document</h2>
	
	<cfoutput>
		
		<form action="doDocumentUpload.cfm" method="post" enctype="multipart/form-data">
			
			<p>
				Document Description<br>
				<input type="text" name="description" size="95" maxlength="255">
			</p>
			
			
			<p>
				Choose File<br>
				<input type="file" name="selectedFile" size="85" accept="application/pdf" />
			</p>
			
			<input type="submit" name="submit" value="Upload" />
		
		</form>
		
	</cfoutput>
	
</cfif>