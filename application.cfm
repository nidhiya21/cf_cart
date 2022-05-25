<cfsilent>

<cfapplication name="MySite"
clientmanagement="no"
clientstorage="Cookie"
sessionmanagement="Yes"
setclientcookies="Yes"
sessiontimeout="#CreateTimeSpan(0,0,20,0)#">

</cfsilent>