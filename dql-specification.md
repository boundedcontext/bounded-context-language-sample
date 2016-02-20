
# Environments

Environments are their own universe. They contain all of the current domain schemas and keep a log of all commands issued to the environment, and all resulting events from those commands.

This is where domain schemas are created, imported, reshaped, and tested. It may represent a particular release, a new clone of an existing environment, or just a new sandbox for playing around with a domain.

### Creating an environment

To create a new environment, simply run the following statement:

	create environment 'release-0.8.12';

### Cloning an environment

Sometimes, you might want to make changes to your domain schemas, but preserve the ones existing in your current environment. For this, you can clone a new environment from an existing one. You can do this by running the following statement:

	clone environment 'release-0.8.13' from 'release-0.8.12';

If you would like to clone an environment, including all of the command and event log data, you can run the following statement:

	clone environment 'release-0.8.13' from 'release-0.8.12' with logs;

### Renaming an environment

If you're unhappy with the name of the current environment, you can rename it at any time with the following statement:

	rename environment 'release-0.8.12' to 'release-0.8.13';

### Resetting an existing environment

Sometimes you want to reset all of the command and event log data for an environment without affecting the current schema. This is particularly useful when running unit and acceptance test cases on your environment. You can do this by running the following statement:

	reset environment 'release-0.8.13';

### Using an environment

You will be working mostly within a single environment at a time. To save time writing statements, you can include the _use_ statement at the beginning of a session so that it doesn't need to be included in any following statements. You can do this by running the following statement:

	use environment 'release-0.8.13';

### Dumping an environment

At any time, the domain schemas for an environment can be dumped back over your connection to the server. You can do this by running the following statement:

	dump environment 'release-0.8.13';

You can optionally include all of the command and event log data by specifying the _with logs_ modifier. You can do this with the following statement:

	dump environment 'release-0.8.13' with logs;

If working on a local server, the contents of the environment can be dumped directly into a DQL file by specifying a file path.

	dump environment 'release-0.8.13' to file '/tmp/release-0.8.13.dql';

### Delete an existing environment

If you no longer need an environment, you can delete it from your server. Keep in mind, that this **will render all domain schemas, command and event logs irretrievable**. This can be done with the following statement:

	delete environment 'release-0.8.13';






