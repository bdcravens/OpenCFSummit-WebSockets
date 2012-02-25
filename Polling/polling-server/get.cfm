<cfsetting ENABLECFOUTPUTONLY="yes">
<cfcontent type = "application/json"> 
<cfscript>
//returnStruct = {dt=now(),messages=application.messages};
returnStruct = structNew();
returnStruct.dt = now();
messages = arrayNew(1);
for (i=1; i<=arrayLen(application.messages); i++) {
	if (application.messages[i].dt > lastPost) {
		arrayAppend(messages,application.messages[i]);
	}
}
returnStruct.messages = messages;
writeOutput(serializeJson(returnStruct));
</cfscript>