#!/usr/bin/perl
use DBI;

$dbh = DBI->connect('dbi:ODBC:DSN=drill64');

# setup the query and run it
my $results = $dbh->prepare(
    "SELECT c.columns[6] as level," .
    "c.columns[3] as gender," .
    "SUM(o.order_total) as ordertotal " .
    "FROM hive.orders o INNER JOIN " .
    "dfs.`root`.`customers.all.csv` c " .
    "ON CAST(o.cust_id as BIGINT) = CAST(c.columns[0] as BIGINT)" .
    "GROUP BY c.columns[6], c.columns[3] ORDER BY ordertotal desc");

$results->execute();

# fetch and display the value
while (my @row = $results->fetchrow_array) {
	print "@row\n";
}
