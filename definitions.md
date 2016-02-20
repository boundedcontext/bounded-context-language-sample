
# Environments

Environments are their own universe. They contain all of the current domain schemas and keep a log of all commands issued to the environment, including all events that have been created from commands run against the environment.

They are where domain schemas are created, imported, reshaped, and tested. It may represent a particular release, a new branch of an existing environment, or just a sandbox.

### Creating an environment

To create a new environment, simply run the following command:

	create environment 'release-0.8.12';

### Cloning an environment

Sometimes, you might want to make changes to your domain schemas, but preserve the existing ones. For this, we've included the ability to clone a new environment from an existing one. You can do this by running:

	clone environment 'release-0.8.13' from 'release-0.8.12';

If you would like to clone an environment, including all of the command and event log data, you can run:

	clone environment 'release-0.8.13' from 'release-0.8.12' with logs;

### Renaming an environment

If you're unhappy with the name of the current environment, you can rename it at any time with the following command:

	rename environment 'release-0.8.12' to 'release-0.8.13';

### Resetting an existing environment

Sometimes you want to reset all of the log data for an environment without affecting the current schema. This is useful when running unit and acceptance test cases on your environment. You can do this by running the follwing:

	reset environment 'release-0.8.13';

### Using an environment

You will be working mostly within a single environment at a time. To save time writing statements, you can include the _use_ statement at the beginning of a session so that it doesn't need to be included in any following statements.

	use environment 'release-0.8.13';

### Dumping an environment

At any time, the domain schemas for an environment can be dumped back over your connection to the server. You can do this by running the following statement:

	dump environment 'release-0.8.13';

Aswell, you can optionally include all of the command and event log data by specifying the following statement:

	dump environment 'release-0.8.13' with logs;

If working on a local server, the contents of the environment can be dumped directly into a DQL file by specifying a file path.

	dump environment 'release-0.8.13' to file '/tmp/release-0.8.13.dql';

### Delete an existing environment

If you no longer need an environment, you can delete it from your server. Keep in mind, that this will render all domain schemas, command and event logs irretrievable. This can be done with the following statement:

	delete environment 'release-0.8.13';

# Domains

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


Contexts
=

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






