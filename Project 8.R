#1

library("RMySQL")
myconnection <- dbConnect(dbDriver("MySQL"),
                          host="mydb.ics.purdue.edu",
                          username="mdw_guest",
                          password="MDW_csp2018",
                          dbname="mdw")

easyquery <- function(x) {
  fetch(dbSendQuery(myconnection, x), n=-1)
}

myDF <- easyquery("SELECT m.nameFirst, m.nameLast,
                   p.playerID, SUM(p.SO)
                   FROM Pitching p JOIN Master m
                   ON m.playerID = p.playerID
                   GROUP BY p.playerID;")

myDF
Sorting total by player ID
tail(myDF[ order(myDF$`SUM(p.SO)`), ],1)

#2


myDF <- easyquery("SELECT p.yearID FROM Pitching p WHERE p.playerID = 'ryanno01';")
myDF

Equaling this to the player ID
