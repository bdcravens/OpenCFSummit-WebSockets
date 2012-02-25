<cfsetting ENABLECFOUTPUTONLY="yes" requestTimeout="15">
<cfcontent type = "application/json"> 
<cfscript>
//returnStruct = {dt=now(),messages=application.messages};
//returnStruct = structNew();
//returnStruct.dt = now();
if (!isDefined('application.messages')) {
	application.messages=arrayNew(1);
}
while (arrayIsEmpty(application.messages)) {
	// do nothing
}
writeOutput(serializeJson(application.messages));
arrayclear(application.messages);
</cfscript>