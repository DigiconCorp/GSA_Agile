
<strong>Prototype URL:<a href="http://gsa-agile.digicon.com/demo/" target="new">http://gsa-agile.digicon.com/</a></strong>

<div class=WordSection1>

<p class=MsoNormal style='text-align:justify'>In response to the GSA RFQ, <span
class=SpellE>Digicon</span> Corporation quickly brought together our team to
evaluate the GSA Agile Challenge. <a href="https://github.com/DigiconCorp/GSA_Agile/blob/master/docs/evidence2b.docx">The Product Manager</a>
assigned roles for the effort, which included the Front-End/Back-End Developers,
Technical Architect, DevOps Engineer, an Interaction Designer/User Researcher/Usability
Tester, Agile Coach, and Business Analyst. The Agile Coach then scheduled daily
stand-up meetings to ensure progress and identify potential barriers; she coached
the team to perform effectively. <span style='color:red'><o:p></o:p></span></p>

<p class=MsoNormal style='text-align:justify'>For this effort, we used the
guidelines of the GSA RFQ to frame the initiative and assumed that our future
constituents would be the general public accessing the free and open prototype,
based on the use of the <span class=SpellE>openFDA</span> Application
Programming Interface (API) to search and display data to the client web
browser. </p>

<p class=MsoNormal style='text-align:justify'>The Product Vision or goal was
for the team to develop a solution to provide users with a cross-reference of search
results and the associated list of medical side effects using a word cloud
representation, where the larger probability is represented by a larger word. A
user will be able to enter search terms, and a search against the <span
class=SpellE>openFDA</span> datasets will be performed with the results
returned to the user via their web browser. The search results will be
formatted in an easy-to-read format that is compatible across both mobile and
desktop devices. </p>

<p class=MsoNormal style='text-align:justify'>Our Agile Coach facilitated a
Sprint 0 for discovery purposes to front load just enough planning and design
to ensure successful subsequent Sprints.<span style='mso-spacerun:yes'>  
</span>The <span style='mso-spacerun:yes'> </span>team identified physical and
technical environments, identified target users, created an initial product
backlog and use cases, grouped <span style='mso-spacerun:yes'> </span>the
initial feature set into chunks of requirements that supported Potentially Shippable
Products by the end of each Sprint, estimate and define high level
architecture, and design Sprint/Release Criteria. <span
style='mso-spacerun:yes'> </span>Major risks and dependencies were also
discussed.<span style='mso-spacerun:yes'>  </span></p>

<p class=MsoNormal style='text-align:justify'>The team created story boards and
obtained end-user input from brown bag sessions, surveys, and user validation
sessions throughout the process to ensure that the solution was valid and
incorporated a human-centered design. Our business analyst collected the
requirements and ensured that the agreed-upon requirements would be within the
customer’s budget and required timeline for the initial release. Once
preliminary wireframes were created, the development and test environments were
launched and development initiated.</p>

<p class=MsoNormal style='text-align:justify'>For each sprint, our usability
tester validated the unit tests for the code, that user story acceptance
criteria <span class=GramE>were</span> met, ensured that the results from the
survey of users and user interviews were incorporated into the solution, and
validated them with the requestor. These findings and results were demonstrated
via the sprint demonstrations.<span style='mso-spacerun:yes'>  </span>One of
the recommended user feedback items was added to the product backlog for
further discovery; however, the original requesting user changed their mind and
it was ultimately groomed off the product backlog. Developers using a
predefined style guide also <a
href="https://github.com/DigiconCorp/GSA_Agile/blob/master/docs/UnitTest.txt"><span
style='mso-bidi-font-family:Arial'>provided</span></a><span style='mso-bidi-font-family:
Arial'> specific UI click and expected response criteria for confirmation of
properly working functionalities. </span></p>

<p class=MsoNormal style='text-align:justify'>The DevOps engineer, technical
architect, and front-end/back-end web developer ensured the technology met the
requirements, as well as ensured efficiency of the application. The application
is on the <a href="http://http://gsa-agile.digicon.com/demo/"><span class=SpellE>Digicon</span> Cloud</a>.
The team reported on their progress, findings and impediments at each daily
stand-up call. </p>

<div style='mso-element:para-border-div;border:none;border-bottom:solid #EEEEEE 1.0pt;
mso-border-bottom-alt:solid #EEEEEE .75pt;padding:0in 0in 4.0pt 0in'>

<h2 style='margin-top:12.0pt;margin-right:0in;margin-bottom:12.0pt;margin-left:
0in;text-align:justify;border:none;mso-border-bottom-alt:solid #EEEEEE .75pt;
padding:0in;mso-padding-alt:0in 0in 4.0pt 0in'><span style='font-size:14.0pt;
mso-bidi-font-size:21.0pt;font-family:"Helvetica",sans-serif;mso-bidi-font-family:
"Times New Roman";color:#333333'>Technical Details<o:p></o:p></span></h2>

</div>

<p class=MsoNormal style='text-align:justify'>The prototype makes use of an
open-source product, <span class=SpellE>Railo</span>, for the application
server engine. This application server is a robust Java-based engine that
leverages Java and several other open-source libraries to provide a feature-rich,
server side technology for interaction with various data sources and other
application functions. The <span class=SpellE>Railo</span> engine uses an
easy-to-learn, tag-based language that creates reusable wrappers around common Java
functions. This greatly simplifies using Java and, in turn, reduces development
time. The user interface is built using bootstrap.js, which is a mobile-first
technology. Using the bootstrap.js library for the prototype allows us to build
one web-based application that will work on most mobile devices and regular
desktop computers at the same time. In addition, we took a design approach that
does not expose our <span class=SpellE>openFDA</span> API key to end-users. We
feel that this is an important distinction, as it is a common practice to
create all the calls to the API using AJAX from the client browser; however,
that approach requires sending the API key to the client in the form of JavaScript.
Our design uses the application server to access the <span class=SpellE>openFDA</span>
API instead of having the client’s or user’s browser make the AJAX call
directly to the <span class=SpellE>openFDA</span> API, thus eliminating the
need for the API key to be downloaded to the client browser via JavaScript.
This allows the middle tier application server to provide additional scrubbing
and validation of data for display and greatly reduces the amount of data that
gets transferred to the client computer. This is especially helpful for smaller
mobile devices that may not have the excess RAM or CPU to process the raw API
data for rendering using the client browser and JavaScript. The application
uses industry-standard technologies such as HTML, JavaScript, AJAX, bootstrap,
Tomcat, and Linux to achieve a functional prototype. Our install scripts assume
that the application is being installed on a Linux server. However, the
prototype can be installed on any server running Apache Tomcat with <span
class=SpellE>Railo</span> installed. Bootstrap is using the “sticky header” and
footer templates. It r<span style='mso-bidi-font-family:Arial'>uns on Ubuntu
Linux Docker </span><a
href="https://github.com/DigiconCorp/GSA_Agile/blob/master/Install.md"><span
style='mso-bidi-font-family:Arial'>containers</span></a><span style='mso-bidi-font-family:
Arial'> or VMs. </span></p>

<p class=MsoNormal style='text-align:justify'><b style='mso-bidi-font-weight:
normal'>Continuous Deployment</b> – The <span class=SpellE>Digicon</span> team
used Docker <a
href="https://github.com/DigiconCorp/GSA_Agile/blob/master/Install.md"><span
style='color:windowtext;text-decoration:none;text-underline:none'>containers</span></a>
along with Jenkins, Chef, and GitHub to create the delivery process with
automated load testing and configuration monitoring. These make up the application
change management tools. Iterations will run in development and be migrated to test
and eventually production after successful testing. Using these tools, the
development, test, and production configurations will be updated, as needed,
based on test results. Configuration changes will be updated in .Office (“Dot
Office”)—a <span class=SpellE>Digicon</span>-proprietary ITSM system for
managing incidents, problems, changes, knowledge, and configuration—along with change
records to document the changes for tracking purposes, using scripts developed
by the team in other projects.</p>

<p class=MsoNormal style='text-align:justify'><b style='mso-bidi-font-weight:
normal'>Continuous Monitoring</b> – The <span class=SpellE>Digicon</span> Cloud
uses Nessus for the infrastructure and platform, with scans running monthly. <span
style='mso-bidi-font-family:Arial'>The team implemented the <span class=SpellE>Acunetix</span>
WVS security scanning tool to regularly run vulnerability scans and generate </span><a
href="https://github.com/DigiconCorp/GSA_Agile/tree/master/docs"><span
style='mso-bidi-font-family:Arial'>reports</span></a><span style='mso-bidi-font-family:
Arial'> for security vulnerability and compliance. In addition, the infrastructure,
platform, and application are monitored using </span><a
href="https://plus.google.com/109501539157548503145"><span class=SpellE><span
style='color:windowtext;text-decoration:none;text-underline:none'>Paessler</span></span></a><span
class=SpellE><span style='mso-bidi-font-family:Arial'>’s</span></span><span
style='mso-bidi-font-family:Arial'> PRTG to provide 24/7 </span><a
href="https://github.com/DigiconCorp/GSA_Agile/tree/master/docs"><span
style='mso-bidi-font-family:Arial'>monitoring</span></a><span style='mso-bidi-font-family:
Arial'> of the system. Some of the items monitored include CPU, memory, disk, network
interface, and HTTP. Additionally, we have a fully staffed 24/7/365 Network
Operations Center. System logs are monitored for the system and application,
both by the staff and through the use of log aggregation and analysis using <span
class=SpellE>logstash</span> and <span class=SpellE>kibana</span>, with urgent
alerts forwarded to PRTG and incident tickets opened automatically in .Office.<o:p></o:p></span></p>

<div style='mso-element:para-border-div;border:none;border-bottom:solid #EEEEEE 1.0pt;
mso-border-bottom-alt:solid #EEEEEE .75pt;padding:0in 0in 4.0pt 0in'>

<h2 style='margin-top:12.0pt;margin-right:0in;margin-bottom:12.0pt;margin-left:
0in;text-align:justify;border:none;mso-border-bottom-alt:solid #EEEEEE .75pt;
padding:0in;mso-padding-alt:0in 0in 4.0pt 0in'><span style='font-size:14.0pt;
mso-bidi-font-size:21.0pt;font-family:"Helvetica",sans-serif;mso-bidi-font-family:
"Times New Roman";color:#333333'>Installation and Documentation <o:p></o:p></span></h2>

</div>

<p class=MsoNormal style='text-align:justify'>Installation instructions and documentation
are available at GitHub using this <a
href="https://github.com/DigiconCorp/GSA_Agile/blob/master/Install.md">link</a>,
or at the following URL: <a
href="https://github.com/DigiconCorp/GSA_Agile/blob/master/Install.md">https://github.com/DigiconCorp/GSA_Agile/blob/master/Install.md</a>.</p>

<p class=MsoNormal style='text-align:justify'><o:p>&nbsp;</o:p></p>

</div>
