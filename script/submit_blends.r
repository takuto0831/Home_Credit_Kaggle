# import
a <- read_csv("submit/best_para_Feature_9902018-08-24.csv")
# b <- read_csv("submit/best_para_Feature_1002018-08-24.csv")
#c <- read_csv("submit/best_para_Feature_2002018-08-26.csv")
# d <- read_csv("submit/best_para_Feature_2502018-08-27.csv")
e <- read_csv("submit/best_para_Feature_3002018-08-27.csv")
f <- read_csv("submit/best_para_Feature_3502018-08-28.csv")

blend <- 0.2*a + 0.1*b + 0.1*c + 0.2*d + 0.2*e + 0.2*f
blend <- data.frame(SK_ID_CURR = a$SK_ID_CURR %>% as.integer(),
                    TARGET = 0.3*a$TARGET + 0.35*e$TARGET + 0.35*f$TARGET)
write_csv(blend,"submit/all_blend.csv")
