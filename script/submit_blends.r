library(tidyverse)
# import
a <- read_csv("submit/best_para_Feature_9902018-08-24.csv")
b <- read_csv("submit/best_para_Feature_1002018-08-24.csv")
c <- read_csv("submit/best_para_Feature_2002018-08-26.csv")
d <- read_csv("submit/best_para_Feature_2502018-08-27.csv")
e <- read_csv("submit/best_para_Feature_3002018-08-27.csv")
f <- read_csv("submit/best_para_Feature_3502018-08-28.csv")
g <- read_csv("submit/best_para_Feature_4002018-08-29.csv")
h <- read_csv("submit/best_para_Feature_5002018-08-28.csv")
i <- read_csv("submit/present.csv")
k <- read_delim("data/memo.tsv",delim=",")

a$TARGET %>% hist()
b$TARGET %>% hist()
c$TARGET %>% hist()
d$TARGET %>% hist()
e$TARGET %>% hist()
f$TARGET %>% hist()
g$TARGET %>% hist()
h$TARGET %>% hist()
i$TARGET %>% hist()
k$TARGET %>% hist()


blend <- 0.2*a + 0.1*b + 0.1*c + 0.2*d + 0.2*e + 0.2*f
blend <- data.frame(SK_ID_CURR = e$SK_ID_CURR %>% as.integer(),
                    TARGET = 0.15*e$TARGET + 0.15*h$TARGET+ 0.7*i$TARGET)
blend$TARGET %>% hist()

write_csv(blend,"submit/blend_300_present_3.csv")
