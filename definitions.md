
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

### Creating a context

To create a new context, simply run the following statement:

	create context 'driving' for domain 'automotive' using environment 'release-0.8.13';

Remember that you can run the _for_ statement at the beginning, or at any point in a DQL file. You can do that as follows:

	for domain 'automotive';

	.
	.
	.

	create context 'driving';


### Renaming a context

If you're unhappy with the name of a context, you can rename it at any time with the following statement:

	rename context 'driving' to 'cruising';


### Deleting a context

If you no longer need a context, you can delete it from a domain. Keep in mind, that this **will delete all aggregates, invariants and projections in that context**, and archive any commands and events within it. You will no longer have access to any events for projections, or events/commands for workflows. This can be done with the following statement:

	delete context 'cruising';

### Using a context

You will most likely want to define many things in a context at a time. To save time writing statements, you can include the _in_ statement at the beginning, or at any point in a DQL file, so that it doesn't need to be included in any following statements. You can do this by running the following statement:

	in context 'driving';

# Values

### Creating a value

### Renaming a value

### Upgrading a value

### Deleting a value

### Validators

#### Creating validators

#### Adding validators to values

#### Removing validators from values

#### Deleting validators

# Entities

### Creating entities

### Renaming entities

### Deleting entities

# Aggregates

### Creating aggregates

To create a new aggregate, simply run the following statement:

	create aggregate 'cart' (id, shopper_id, items)
		as (core\value\identifier, core\value\identifier, core\value\index) 
		defaults (null, null, empty)
		in context 'shopping' 
		for domain 'e-commerce' 
		using environment 'release-0.8.13'
	;

Remember that you can run the _in_ statement at the beginning, or at any point in a DQL file. You can do that as follows:

	in context 'shopping';

	.
	.
	.

	create aggregate 'cart' (id, shopper_id, items) 
		as (core\value\identifier, core\value\identifier, core\value\index) 
		defaults (null, null, empty)
	;

### Renaming aggregates

If you're unhappy with the name of an aggregate, you can rename it at any time with the following statement:

	rename aggregate 'cart' to 'basket';

### Deleting aggregates

If you no longer need an aggregate, you can delete it from a context. Keep in mind, that this **will archive any commands and events within** it. You will no longer have access to the aggregate events for projections, or events/commands for workflows. This can be done with the following statement:

	delete context 'cruising';

### Aggregate invariants

### Aggregate commands

Create Command (for Aggregate) (in Context) (for Domain) (using Environment)
Rename Command (for Aggregate) (in Context) (for Domain) (using Environment)
Upgrade Command (for Aggregate) (in Context) (for Domain) (using Environment)
Delete Command (for Aggregate) (in Context) (for Domain) (using Environment)

Create Command Handler (for Aggregate) (in Context) (for Domain) (using Environment)
Redefine Command Handler (for Aggregate) (in Context) (for Domain) (using Environment)
Delete Command Handler (for Aggregate) (in Context) (for Domain) (using Environment)

### Aggregate events

Create Event (for Aggregate) (in Context) (for Domain) (using Environment)
Rename Event (for Aggregate) (in Context) (for Domain) (using Environment)
Upgrade Event (for Aggregate) (in Context) (for Domain) (using Environment)
Delete Event (for Aggregate) (in Context) (for Domain) (using Environment)

Create Event Handler (for Aggregate) (in Context) (for Domain) (using Environment)
Redefine Event Handler (for Aggregate) (in Context) (for Domain) (using Environment)
Delete Event Handler (for Aggregate) (in Context) (for Domain) (using Environment)

# Projections

### Creating projections

### Renaming projections

### Deleting projections

### Handling events and changing tables

# Invariants

### Creating invariants

### Renaming invariants

### Redefining an invariant

### Deleting invariants

# Workflows

A workflow is a mechanism for handling communication between aggregates, contexts and domains. As an example, when a user/created event is generated in an accounts domain, we may also want to create that user as a shopper in the e-commerce domain. Workflows provide that layer of integration.

##### Three kinds of workflow

There are three kinds of workflows: _contextual_, _domain_, and _environmental_.

A _contextual_ workflow handles communication between aggregates in a given context. When creating a contextual workflow, it is important to note that it will only accept events **from within that context**.

A _domain_ workflow handles communication between contexts in a given domain. When creating a domain workflow, it is imporatant to note that it will only accept events **from within that domain**.

An _environmental_ workflow handles communication between domains. **Any event can be used** in this kind of workflow.

### Creating workflows

To create a new workflow (in this case, a contextual workflow), simply run the following statement:

	create workflow 'special-offers' in context 'shopping' for domain 'e-commerce' using environment 'release-0.8.13';

Remember that you can run the _in_ statement at the beginning, or at any point in a DQL file. You can do that as follows:

	in context 'shopping';

	.
	.
	.

	create workflow 'special-offers';

### Renaming workflows

If you're unhappy with the name of a workflow, you can rename it at any time with the following statement:

	rename workflow 'special-offers' to 'apply-special-offers-to-carts';

### Deleting workflows

If you no longer need a workflow, you can delete it. There are no side-effects to deleting a workflow.

	delete workflow 'apply-special-offers-to-carts';

### Handling events and issuing commands in workflows


