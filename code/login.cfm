<cfsilent>
	<cfimport prefix="views" taglib="/view" />

	<cfif structKeyExists( form, "submit" ) AND form.submit EQ "Login">
		<cfset user = Application.ServiceFactory.getBean("UserManager").getUser( userName = form.userName ) />
		<cfif user.getUserName() NEQ "">
			<cfset session.User = user />
			<cflocation url="/index.cfm" addtoken="false" />
		</cfif>
	</cfif>
	
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
			<div align="center">
				<cfoutput>
	            	
					<h2>Please log in</h2>
					<form action="#cgi.script_name#" method="post">
						<p>
							Username:<br>
							<input type="text" name="username" size="25">
						</p>
						<p>
							Password:<br>
							<input type="password" name="password" size="25" />
						</p>
						<input type="submit" name="submit" value="Login" />
					</form>
					
	            </cfoutput>
			</div>
		</div>
		
		<views:footer></views:footer>
	</div>
</body>

</html>