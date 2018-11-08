
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

easyquery("select m.nameFirst,m.nameLast from Master m join CollegePlaying c on m.playerID = c.playerID where c.schoolID = 'Purdue';")

#2
 easyquery("SELECT m.nameFirst, m.nameLast,
                  b.playerID, b.yearID, b.SO
                  FROM Master m JOIN Pitching b
                  ON m.playerID = b.playerID
                  WHERE b.SO >= 300;")
 
 Lady    Baldwin baldwla01   1886 323
 2       Mark    Baldwin baldwma01   1889 368
 3       Vida       Blue  bluevi01   1971 301
 
 #3
 myDF <- easyquery("SELECT m.nameFirst, m.nameLast,b.yearID
                   FROM Master m JOIN Pitching b
                   ON m.playerID = b.playerID
                   GROUP BY b.playerID, b.yearID
                   HAVING SUM(b.SO) >= 300 AND SUM(b.W) >= 20
                   ORDER BY b.yearID;")
 Tim Keefe 1883
 Old Hoss Radbourn 1883
 Jim Whitney 1883
 
 #3b
unique(myDF$yearID)
1883 1884 1885 1886 1887 1888 1889 1890 1891 1892 1903 1904 1910 1912 1946 1963 1965 1966
[19] 1970 1971 1972 1973 1974 1999 2001 2002
 