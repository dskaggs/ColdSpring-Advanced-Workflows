<cfsilent>
	<cfimport prefix="views" taglib="/view" />
	<cfset Document = Application.ServiceFactory.getBean("DocumentManager").loadDocument( documentID = URL.documentID ) />
</cfsilent>


<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
	<head>
		<title>Doc-O-Matic</title>
		<link rel="stylesheet" type="text/css" href="style.css" media="screen" />
	</head>
	<cfoutput>
		<body>
			<div id="wrap">
			
				<views:header></views:header>
				
				<div id="content">
					
					<h2>Review Document</h2>
					
					<p>#Document.getDescription()#</p>
					
					<iframe width="100%" height="400" src="/documents/#Document.getFileName()#"></iframe>
					
					<div align="center">
						<p>&nbsp;</p>
						<form action="/doDocumentReview.cfm" method="post">
							<input type="hidden" name="documentID" value="#Document.getID()#">
							<input type="submit" name="submit" value="Reject"> &nbsp; <input type="submit" name="submit" value="Approve">
						</form>
					</div>
					
				</div>
				
				<views:footer></views:footer>
			</div>
		</body>
	</cfoutput>
</html>