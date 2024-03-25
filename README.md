##################################################################################################
# DevOps Technical Assessment #

Goal:

  Ability	 to	 demonstrate, architecting and implementing high availability, fault tolerance	 and	 production	 ready	infrastructure	using	kubernetes	as	the	container	orchestration	platform.

Use Case:

  A company called	‘Max	Weather’	wants	to	build	a	platform	that	forecasts	the	weather. They	decided	to build that	application	on	AWS	cloud	infrastructure,	and	they	also	want	to	leverage	the	below capabilities.

Key Requirements.

   1. Application should be running	24/7 with high availability.
   2. There	will be	high traffic	 to	 the	application	during	 the	day,	especially	in the morning	where people tend	to	check	the	weather	forecast,	so	that	application	should	be	scalable based	on the	traffic.
   3. They	want	to	expose	weather	forecast	functionalities	as	APIs,	so	that	their	frontend developers can build	the	frontend	applications.
   4. They	recommend	using	the	OAuth2	authorization	protocol	to	protect	the	APIs.
   5. They	 are	 also	 interested	 in	 implementing	 CI/CD	 pipeline	 process,	 to	 deploy	 the	 application incredemetally	into	the	production	environment	after	successfully	tested	in	the	staging	environment
   6. For	 better	 troubleshooting	 purposes,	 they	 would	 like	 to	 send	 application	 logs into the AWS cloudwatch	logs.
   7. All	the	infrastructure setup	should	be	created	using	terraform	scripts,	so	that application	can	be	set	up	in	another	cloud	environment	with	minimal	effort.

Implementation Assumptions:

   1. It	is	not	required	to	implement	the	back-end	of	the	application.	The	source	code	of	the	backend	will be	provided	as	part	of	this	assessment.
   2. For	the	API	authorization,	you	can	use	custom	lambda	authorizer
   3. It	is	not	required	to	create	API	resources	in	the	AWS	API	gateway,	proxy	implementation	is	sufficient.
   4. It	 is	 not	 necessary	 to	 create	 API	 gateway	 using	 the	 terraform	 scripts,	 you	 can	 also	 create	 APIs manually	using	the	AWS	console.
   5. You	 can	 consider	 the	API	authorization	 part	 is	 optional	 for	 this assignment,	 but	 it	 is	a	 nice	 to	 have feature.

Deliverables:

   1. Infrastructure	 architecture	 diagram	 which	 shows	 all	 the	 infrastructure	 components	required to deploy	this	application	with	logical	connections	between	components.
   2. Terraform	scripts	to	create	the	infrastructure	components.
   3. The	below	kubernetes	artifacts	that	are	required	to	deploy	the	application:
     a. Deployment	yaml
     b. Service	yaml
     c. Nginx	Ingress	Controller
     d. Nginx	ingress.
   4. Jenkins	pipeline	script	to	deploy	application(s)	into	the	kubernetes	cluster
   5. Application	API	deployed	into	AWS	API	gateway
   6. Working	postman	script	to	demonstrate	the	API	with	proper	authentication.
   
#############################################################################################
