<cfif not isDefined("application.messages")>
	<cfset application.messages = arrayNew(1)>
</cfif>

<cfset arrayAppend(application.messages,{handle=handle, message=message})>