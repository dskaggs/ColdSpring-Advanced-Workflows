<cfsilent>
	<cfimport prefix="views" taglib="/view" />
	<cfset archivedDocuments = Application.ServiceFactory.getBean("DocumentManager").listDocuments( includeDeleted=TRUE, includeActive=FALSE ) />
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
				
				<views:documentList documentList="#archivedDocuments#" title="Archived Documents"></views:documentList>
				
				<p><br><br><a href="/index.cfm">Return Home</a></p>
				
			</div>
			
			<views:footer></views:footer>
		</div>
	</body>

</html>