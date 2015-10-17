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


mar <- data.frame(fromJSON(getURL(URLencode('129.152.144.84:5001/rest/native/?query="select * from data_mar"'),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521/PDBF15DV.usuniversi01134.oraclecloud.internal', USER='cs329e_gmg954', PASS='orcl_gmg954', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE), ))

df <- data.frame(fromJSON(getURL(URLencode(gsub("\n", " ", '129.152.144.84:5001/rest/native/?query="select e.species, STDDEV(e.X0_003906)/(STDDEV(d.SHAPE1)) as y from data_mar e join data_sha d on e.species = d.species
                                                where d.SHAPE1 != 0
                                                group by e.species order by y"')),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521/PDBF15DV.usuniversi01134.oraclecloud.internal', USER='cs329e_gmg954', PASS='orcl_gmg954', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE))); tbl_df(df)



df %>% ggplot(aes(reorder(SPECIES, Y), y = Y)) + geom_point(aes(color=SPECIES)) + theme(axis.text.x=element_blank())



