library(RODBC)

# initialize the connection
ch <- odbcConnect("drill64")

# run the query
df = sqlQuery(ch, paste("SELECT columns[4] as state, COUNT(*) as ",
    "countbystate from `dfs`.`root`.`air.csv` ",
    " GROUP BY columns[4] ORDER BY countbystate DESC"))
df$perctotal <- df$countbystate / sum(df$countbystate) * 100

df

# close the connection so we don't get a warning at the end
odbcClose(ch)
