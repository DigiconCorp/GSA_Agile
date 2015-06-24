<cfif len(string) gt 100>
	<cfset divid="demo" & createuuid()>
<cfset maxwords=100>


<div class="jumbotron"><h3 align="center"><!---Most Use Words</h3> <p align="center">(click on words to refine search)</p>--->
	<div id="<cfoutput>#divid#</cfoutput>" style="height:350px; width:100%;">
		
	</div>
</div>
<cfset string=REReplaceNoCase(string,"<[^>]*>","","ALL")>
 <cfset words = reMatch("[[:word:]]+", string)>
 <cfset wordCount = structNew()>
<cfset stoplist = "1,2,3,4,5,6,7,8,9,0,nbsp,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,bull,br,and,this,the,a,it,as,was,to,don't,has,you, you're,you've,with,why,which,when,were,we've,we're, then,than,i,i'll,i'm,i've,i'd,it's,for,of,is,if,in,that,but,my,not,can,are,',done, off,their,isn't,yes,what's,them,they,'',be,being,all, only,does,here,an,by,would,like,at,do,want,or,could, out,our,while,what,had,each,into,where,That's,will,else, let's,about,got,using,before,over,actually,going,some,well">
 <cfloop index="word" array="#words#">
	<cfif listfindnocase(stoplist,word) eq 0>
		 <cfif structKeyExists(wordCount, word)>
		 <cfset wordCount[word]++>
		 <cfelse>
		 <cfset wordCount[word] = 1>
		 </cfif>
	</cfif>
 </cfloop>
<cfset sorted = structSort(wordCount, "numeric", "desc")>

<cfset cnt=0>
<script>
var words = [
<cfloop index="word" array="#sorted#">
 <cfoutput> {text: "#word#", weight: #wordCount[word]# ,handlers:{ click: function() {UpdateSearch('#word#','#CBK#');}}},</cfoutput>
<cfset cnt=cnt+1>
<cfif cnt gte maxwords><cfbreak></cfif>
 </cfloop>
];

$('#<cfoutput>#divid#</cfoutput>').jQCloud(words,{ autoResize: true,steps:10});

</script>
</cfif>
