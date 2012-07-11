ColdSpring-Advanced-Workflows
=============================

Building Advanced Workflows with ColdSpring
This is a presentation I gave to cf.Objective() in Minneapolis, MN in April 2010. 

Description from the session abstract:

ColdSpring is best known as a dependency injection framework for ColdFusion applications. Many people fail to realize that it can also be used as a powerful and highly-flexible configuration management tool that enables developers to easily build and maintain complicated workflows. Managing workflow actions with ColdSpring gives application developers a system for quickly implementing and easily updating complex, multi-step action chains without the need to update core application code. 

This session will demonstrate a practical example of this little-used side of ColdSpring by exploring a document creation and approval workflow that includes activity logging, multiple participants, and  varying cost structures. Attendees will see one approach to using ColdSpring to easily add or remove workflow steps to action chains to quickly respond to changing business requirements.


User logins:
Usernames, passwords and email addresses are hard coded in the /model/UserManager.cfc 
initializeUsers() method. 

Reset to default state:
Simply delete all documents from the /documents folder and delete the /data/documents.wddx
file and the application will revert to its original state.