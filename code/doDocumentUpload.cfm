<cfsilent>
	
	<!--- Upload the document to the file system --->
	<cffile action="upload" destination="#expandPath('/documents')#" filefield="selectedFile" nameconflict="makeunique" />
	
	<cfif cffile.FileWasSaved IS TRUE>
	
		<cfset Document = createObject("component", "model.Document") />
		<cfset Document.setID( createUUID() ) />
		<cfset Document.setDescription( form.description ) />
		<cfset Document.setFileName( cffile.serverFile ) />
		<cfset Document.setStatus( "New" ) />
		<cfset Document.setCreatedBy( session.User.getUsername() ) />
		<cfset Document.setCreated( now() ) />
		
		
		<!--- Create the workflow params structure --->
		<cfset params = structNew() />
		<cfset params.Document = Document />
		
		
		<!--- Execute the workflow --->
		<cfset wp = Application.serviceFactory.getBean("WorkflowProcessor") />
		<cfset workflowResults = wp.process( "CreateDocument", params ) />
		
	</cfif>	
	
	
	<cfimport prefix="views" taglib="/view" />
		
</cfsilent>


<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
	<head>
		<title>Doc-O-Matic</title>
		<link rel="stylesheet" type="text/css" href="style.css" media="screen" />
	</head>

	<body>
		<div id="wrap">
		
			<views:header></views:header>
			
			<div id="content">
				
				<views:workflowResults results="#workflowResults#"></views:workflowResults>
				
				<p><br><br><a href="/index.cfm">Return Home</a></p>
			</div>
			
			<views:footer></views:footer>
		</div>
	</body>

</html>