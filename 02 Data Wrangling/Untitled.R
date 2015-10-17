require(tidyr)
require(dplyr)
require(ggplot2)
# Change the USER and PASS below to be your UTEid
djdf <- data.frame(fromJSON(getURL(URLencode('129.152.144.84:5001/rest/native/?query="select data_mar.species as "Species", (AVG(data_mar.X0_003906) / AVG(data_tex.TEXTURE1)) as "Test" from data_mar inner join data_tex on data_mar.species = data_tex.species
where data_tex.TEXTURE1 != 0
                                             group by data_mar.species"'),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521/PDBF15DV.usuniversi01134.oraclecloud.internal', USER='cs329e_gmg954', PASS='orcl_gmg954', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE), ))
View(djdf)








#This data shows the cycilical nature of the Dow Jones price score fluctuations in the month of June over a number of years.
djdf %>% ggplot(aes(x = Species, y = Test)) + geom_point(aes(color=Species))




