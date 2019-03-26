# Top Baby Names of 2017

library(XML)
library(RCurl)
xpathSApply(htmlParse(getURL("https://www.ssa.gov/cgi-bin/popularnames.cgi")),
            "//*/div[@class='title_wrapper']/h1", xmlValue)
pop_names <- xpathSApply(htmlParse("/home/nmcguck/Desktop/Popular Baby Names.html"),"//*/tr[@align=\"right\"]/td", xmlValue)

# Boy names
boy_names <- pop_names[seq(2,length(pop_names),by=5)]
boy_names

# Girl names
girl_names <- pop_names[seq(4,length(pop_names),by=5)]
girl_names