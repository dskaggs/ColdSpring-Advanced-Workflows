<cfsilent>
	<cfimport prefix="views" taglib="/view" />
	<cfset activeDocuments = Application.ServiceFactory.getBean("DocumentManager").listDocuments( includeDeleted=FALSE ) />
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
				
				<views:documentForm></views:documentForm>
				
				<br><br>
				
				<views:documentList documentList="#activeDocuments#" title="Active Documents"></views:documentList>
				
				<p><br><br><a href="/archivedDocuments.cfm">View archived documents</a></p>
			</div>
			
			<views:footer></views:footer>
		</div>
	</body>

</html>