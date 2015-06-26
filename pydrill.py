
import pyodbc
from pandas import *

# initialize the connection
conn = pyodbc.connect("DSN=drill64", autocommit=True)
cursor = conn.cursor()

# setup the query and run it
s = "SELECT c.columns[1] as fullname, SUM(o.order_total) as ordertotal " \
    "FROM hive.orders o INNER JOIN " \
    "dfs.`root`.`customers.all.csv` c " \
    "ON CAST(o.cust_id as BIGINT) = CAST(c.columns[0] as BIGINT)" \
    "GROUP BY c.columns[1] ORDER BY ordertotal desc"

# fetch and display filtered output
cursor.execute(s)
b = Series(dict(cursor.fetchall()))
print b[b > 3000]
