<cfsilent>
	
	<!--- Upload the document to the file system --->
	<cfset Document = Application.ServiceFactory.getBean("DocumentManager").loadDocument( documentID = form.documentID ) />
		
	<!--- Create the workflow params structure --->
	<cfset params = structNew() />
	<cfset params.Document = Document />
	<cfset params.Reviewer = session.User />
	
	
	<!--- Execute the workflow --->
	<cfset wp = Application.serviceFactory.getBean("WorkflowProcessor") />
	
	<cfif form.submit EQ "Reject">
		<cfset workflowResults = wp.process( "RejectDocument", params ) />
	<cfelseif form.submit EQ "Approve">
		<cfset workflowResults = wp.process( "ApproveDocument", params ) />
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