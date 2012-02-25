<cfif not isDefined("application.messages")>
	<cfset application.messages = arrayNew(1)>
</cfif>

<cfset arrayAppend(application.messages,{dt=now(), handle=handle, message=message})>