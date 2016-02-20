
--------------------
Environments
--------------------

An environment is its own universe.

It may be for a particular release, or just a sandbox environment for playing around with one or more domains. It keeps log data for what has happened (events and commands) to its domains.

Create a new environment

	create environment 'release-0.8.12';

Rename an existing environment

	rename environment 'release-0.8.12' to 'release-0.8.13';

Reset an existing environment

	reset environment 'release-0.8.13';

Use an environment

	use environment 'release-0.8.13';

Delete an existing environment

	delete environment 'release-0.8.13';


--------------------
Domains
--------------------

A domain organises contexts.


Create a new domain

	create domain 'e-learning' using environment 'release-0.8.13';

	|or|

	use environment 'release-0.8.13';

	create domain 'e-learning';


Rename an existing domain

	rename domain 'e-learning' to 'e-commerce' using environment 'release-0.8.13';

	|or|

	use environment 'release-0.8.13';

	rename domain 'e-learning' to 'e-commerce';


Delete an existing domain

	delete domain 'learning' using environment 'release-0.8.13';

	|or|

	use environment 'release-0.8.13';

	delete domain 'learning';


--------------------
Contexts
--------------------

Create a new context

	create context 'training' for domain 'e-learning' using environment 'release-0.8.13';

	|or|

	use environment 'release-0.8.13';

	for domain 'e-learning';

	create context 'training';


Rename an existing context

	rename context 'training' to 'learning' for domain 'e-learning' using environment 'release-0.8.13';

	|or|

	use environment 'release-0.8.13';

	for domain 'e-learning';

	rename context 'training' to 'learning';


Delete an existing context

	delete context 'training' for domain 'e-learning' using environment 'release-0.8.13';

	|or|

	use environment 'release-0.8.13';

	for domain 'e-learning';

	delete context 'training';


Create Workflow (in Context) (for Domain) (using Environment)
Rename Workflow (in Context) (for Domain) (using Environment)
Add Event Handler [to Workflow] (in Context) (for Domain) (using Environment)
Remove Event Handler [from Workflow] (in Context) (for Domain) (using Environment)
Reset Workflow (in Context) (for Domain) (using Environment)
Play Workflow (in Context) (for Domain) (using Environment)
Delete Workflow (in Context) (for Domain) (using Environment)

Create Projection (in Context) (for Domain) (using Environment)
Rename Projection (in Context) (for Domain) (using Environment)
Add Event Handler [to Projection] (in Context) (for Domain) (using Environment)
Remove Event Handler [from Projection] (in Context) (for Domain) (using Environment)
Reset Projection (in Context) (for Domain) (using Environment)
Play Projection (in Context) (for Domain) (using Environment)
Delete Projection (in Context) (for Domain) (using Environment)

Create Value (in Context) (for Domain) (using Environment)
Rename Value (in Context) (for Domain) (using Environment)
Delete Value (in Context) (for Domain) (using Environment)

Create Validator (in Context) (for Domain) (using Environment)
Rename Validator (in Context) (for Domain) (using Environment)
Add Validator (to Value) (in Context) (for Domain) (using Environment)
Remove Validator (from Value) (in Context) (for Domain) (using Environment)
Delete Validator (in Context) (for Domain) (using Environment)

Create Entity (in Context) (for Domain) (using Environment)
Rename Entity (in Context) (for Domain) (using Environment)
Delete Entity (in Context) (for Domain) (using Environment)


Create Aggregate (in Context) (for Domain) (using Environment)
Rename Aggregate (in Context) (for Domain) (using Environment)
Delete Aggregate (in Context) (for Domain) (using Environment)

Create Command (for Aggregate) (in Context) (for Domain) (using Environment)
Rename Command (for Aggregate) (in Context) (for Domain) (using Environment)
Upgrade Command (for Aggregate) (in Context) (for Domain) (using Environment)
Delete Command (for Aggregate) (in Context) (for Domain) (using Environment)

Create Event (for Aggregate) (in Context) (for Domain) (using Environment)
Rename Event (for Aggregate) (in Context) (for Domain) (using Environment)
Upgrade Event (for Aggregate) (in Context) (for Domain) (using Environment)
Delete Event (for Aggregate) (in Context) (for Domain) (using Environment)

Create Command Handler (for Aggregate) (in Context) (for Domain) (using Environment)
Redefine Command Handler (for Aggregate) (in Context) (for Domain) (using Environment)
Delete Command Handler (for Aggregate) (in Context) (for Domain) (using Environment)

Create Event Handler (for Aggregate) (in Context) (for Domain) (using Environment)
Redefine Event Handler (for Aggregate) (in Context) (for Domain) (using Environment)
Delete Event Handler (for Aggregate) (in Context) (for Domain) (using Environment)

Create Invariant (for Aggregate) (in Context) (for Domain) (using Environment)
Rename Invariant (for Aggregate) (in Context) (for Domain) (using Environment)
Redefine Invariant (for Aggregate) (in Context) (for Domain) (using Environment)
Delete Invariant (for Aggregate) (in Context) (for Domain) (using Environment)






