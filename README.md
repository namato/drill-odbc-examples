## drill-odbc-examples
Three examples to connect Drill to ODBC in three different languages:  Python, R and Perl.

These files contain small boilerplate examples to get connected to the driver and run queries.  Note that some setup of the ODBC drivers (for Drill and as a Data Store Name on the system) is required before running, consult the Apache Drill ODBC configuration page for the steps for various operating systems (Windows, Mac, Linux).

### Steps to get started
Consult the [Drill ODBC](http://example.com/) documentation for instructions on installing the ODBC driver on your machine, as well as Drill-specific configuration.

On Linux machines, edit each of the these three files (samples are included in the Sample/ directory with the driver) to make sure they are correct.  I have included the odbc.ini file I used on an Ubuntu Linux 14.04 machine with unixODBC installed in this repo.
- ~/.odbc.ini
- ~/.odbcinst.ini
- ~/.mapr.drillodbc.ini

Once the driver and connection to Drill are configured, use the examples in each of the files here to create a connection to Drill and run queries... and you're off to the races!





