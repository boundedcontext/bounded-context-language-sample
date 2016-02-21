
# Environments

Environments are their own universe. They contain all of the current schemas for your domains. They also keep a log of all commands issued to the environment, and a log of as all resulting events from those commands.

They are where schemas for domains are created, imported, reshaped, and tested. They may be a particular release of your application. They may be a clone of an existing environment when developing, testing and staging new releases. Or, they may just be a sandbox for playing around with a set of domain schemas when in development.

### Creating an environment

To create a new environment, simply run the following statement:

	create environment 'release-0.8.12';

### Cloning an environment

Sometimes, you might want to make changes to your domain schemas, but preserve the ones existing in your current environment. For this, you can clone a new environment from an existing one. You can do this by running the following statement:

	clone environment 'release-0.8.13' from 'release-0.8.12';

If you would like to clone an environment with all of the command and event log data, you can run the following statement:

	clone environment 'release-0.8.13' from 'release-0.8.12' with logs;

### Renaming an environment

If you're unhappy with the name of the current environment, you can rename it at any time with the following statement:

	rename environment 'release-0.8.12' to 'release-0.8.13';

### Resetting an environment

Sometimes you want to reset all of the command and event log data for an environment without affecting the current schema. This is particularly useful when running unit and acceptance test cases on your environment. You can do this by running the following statement:

	reset environment 'release-0.8.13';

### Reverting an environment

Sometimes you find a bug in your domain, and want to modify the schema so you can retest the case. It can take a few attempts to fix the bug. Reverting allows you to go back to the point of the last command you are satisfied has worked. You can do this by running the following statement:

	revert environment 'release-0.8.13' to command 'b7b928f8-a86a-403d-9a54-e006352453e9';

### Dumping an environment

At any time, the domain schemas for an environment can be dumped back over your connection to the server. You can do this by running the following statement:

	dump environment 'release-0.8.13';

You can optionally include all of the command and event log data by specifying the _with logs_ modifier. You can do this with the following statement:

	dump environment 'release-0.8.13' with logs;

If working on a local server, the contents of the environment can be dumped directly into a DQL file by specifying a file path.

	dump environment 'release-0.8.13' to file '/tmp/release-0.8.13.dql';

### Deleting an environment

If you no longer need an environment, you can delete it from your server. Keep in mind, that this **will render all domain schemas, command and event logs irretrievable**. This can be done with the following statement:

	delete environment 'release-0.8.13';

### Using an environment

You will be working mostly within a single environment at a time. To save time writing statements, you can include the _use_ statement at the beginning of a session so that it doesn't need to be included in any following statements. You can do this by running the following statement:

	use environment 'release-0.8.13';

# Domains

A domain is some set of processes that your business has decided to group together. It could be the core problem your business solves. It could be a domain that supports your business activities. It might be a department that is relevant to every business such sales, accounts, support, or marketing.

It could be domains that support your product such as analytics, management, or a-b testing features. It could be domains that support the development process such as error/exception tracking, agile management, devops analytics or quality assurance.

### Creating a domain

To create a new domain, simply run the following statement:

	create domain 'online-learning' using environment 'release-0.8.13';

Remember that you can run the _use_ statement at the beginning, or at any point in a DQL file. You can do that as follows:

	use environment 'release-0.8.13';

	.
	.
	.

	create domain 'online-learning';

From this point forward, we'll assume you know how the **_use_ environment** statement works.

### Renaming a domain

If you're unhappy with the name of a domain, you can rename it at any time with the following statement:

	rename domain 'online-learning' to 'online-training';

### Deleting a domain

If you no longer need a domain, you can delete it from an environment. Keep in mind, that this **will delete all contexts in the domain**, and archive any commands and events within it. You will no longer have access to any events for projections, or events/commands for workflows. This can be done with the following statement:

	delete domain 'online-training';

### Using a domain

You will most likely want to define many things in a domain at a time. To save time writing statements, you can include the _for_ statement at the beginning, or at any point in a DQL file, so that it doesn't need to be included in any following statements. You can do this by running the following statement:

	for domain 'online-training';

# Contexts

Is it a Booking, a Purchase, or an Order?

Is a Person a Driver when they're (in the context of) driving? They're both right? When they're driving, we might not care about the colour of their hair and care about their full name, height and eye colour for their License. Maybe we also care about a Passenger, and want to ensure a Passenger and a Driver can never be the same Person. Are they in a Vehicle? It all depends on the context.

A context is that linguistic boundary within a domain.

### Create a new context

To create a new context, simply run the following statement:

	create context 'driving' for domain 'automotive' using environment 'release-0.8.13';

Remember that you can run the _for_ statement at the beginning, or at any point in a DQL file. You can do that as follows:

	for domain 'automotive';

	.
	.
	.

	create context 'driving';


### Rename an existing context

If you're unhappy with the name of a context, you can rename it at any time with the following statement:

	rename context 'driving' to 'cruising';


### Delete an existing context

If you no longer need a context, you can delete it from a domain. Keep in mind, that this **will delete all aggregates, invariants and projections in that context**, and archive any commands and events within it. You will no longer have access to any events for projections, or events/commands for workflows. This can be done with the following statement:

	delete context 'cruising';

### Using a context

You will most likely want to define many things in a context at a time. To save time writing statements, you can include the _in_ statement at the beginning, or at any point in a DQL file, so that it doesn't need to be included in any following statements. You can do this by running the following statement:

	in context 'driving';


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






