require(tidyr)
require(dplyr)
require(ggplot2)
# Change the USER and PASS below to be your UTEid
# Change the USER and PASS below to be your UTEid


mar <- data.frame(fromJSON(getURL(URLencode('129.152.144.84:5001/rest/native/?query="select * from data_mar"'),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521/PDBF15DV.usuniversi01134.oraclecloud.internal', USER='cs329e_gmg954', PASS='orcl_gmg954', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE), ))

tex <- data.frame(fromJSON(getURL(URLencode('129.152.144.84:5001/rest/native/?query="select * from data_tex"'),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521/PDBF15DV.usuniversi01134.oraclecloud.internal', USER='cs329e_gmg954', PASS='orcl_gmg954', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE), ))



df <- data.frame(fromJSON(getURL(URLencode(gsub("\n", " ", '129.152.144.84:5001/rest/native/?query="select * from(select e.species, (AVG(e.X0_003906) / AVG(d.TEXTURE1)) as y from data_mar e join data_tex d on e.species = d.species
                                                where d.TEXTURE1 != 0 
group by e.species order by y) where y>10"')),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521/PDBF15DV.usuniversi01134.oraclecloud.internal', USER='cs329e_gmg954', PASS='orcl_gmg954', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE))); tbl_df(df)



df %>% ggplot(aes(x = SPECIES, y = Y)) + geom_point(aes(color=SPECIES)) 



