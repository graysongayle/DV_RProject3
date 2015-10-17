require(tidyr)
require(dplyr)
require(ggplot2)
# Change the USER and PASS below to be your UTEid
# Change the USER and PASS below to be your UTEid

df <- data.frame(fromJSON(getURL(URLencode(gsub("\n", " ", '129.152.144.84:5001/rest/native/?query=
                                                "select * 
                                                from emp e left join dept d
                                                on e.deptno = d.deptno"
                                                ')),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521/PDBF15DV.usuniversi01134.oraclecloud.internal', USER='cs329e_UTEid', PASS='orcl_UTEid', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE))); tbl_df(df)


sha <- data.frame(fromJSON(getURL(URLencode('129.152.144.84:5001/rest/native/?query="select * from data_sha"'),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521/PDBF15DV.usuniversi01134.oraclecloud.internal', USER='cs329e_gmg954', PASS='orcl_gmg954', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE), ))


tex <- data.frame(fromJSON(getURL(URLencode('129.152.144.84:5001/rest/native/?query="select * from data_tex"'),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521/PDBF15DV.usuniversi01134.oraclecloud.internal', USER='cs329e_gmg954', PASS='orcl_gmg954', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE), ))


df <- data.frame(fromJSON(getURL(URLencode(gsub("\n", " ", '129.152.144.84:5001/rest/native/?query="select * from(select e.species, AVG(d.TEXTURE1)/(AVG(e.SHAPE1)) as y from data_sha e join data_tex d on e.species = d.species
                                                where d.TEXTURE1 != 0
                                                group by e.species order by y)
                                                where y < 3"')),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521/PDBF15DV.usuniversi01134.oraclecloud.internal', USER='cs329e_gmg954', PASS='orcl_gmg954', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE))); tbl_df(df)



df %>% ggplot(aes(x = SPECIES, y = Y)) + geom_point(aes(color=SPECIES)) 



