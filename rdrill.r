library(RODBC)

# initialize the connection
ch <- odbcConnect("drill64")

# run the query
df = sqlQuery(ch, paste("SELECT columns[2] as state, COUNT(*) as ",
                        "countbystate from `dfs`.`root`.`customers.all.csv` ",
                        " GROUP BY columns[2] ORDER BY countbystate DESC"))
df$perctotal <- df$countbystate / sum(df$countbystate) * 100

print(paste0("Total: ", sum(df$countbystate)))
print(head(df, 10))

# close the connection so we don't get a warning at the end
odbcClose(ch)
