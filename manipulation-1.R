


library(dplyr)



select() : degisken secimi
filter() : gozlem secimi
mutate() : degisken olusturma
summarise() : ozet istatistikler
group_by() : gruplama
left_join() : birlestirme islemleri


library(tidyverse)
library(nycflights13)

df <- flights


str(df)

select(df, dep_delay, month, day, dep_time)
select(df, 1:4)


#contains() değişkenlerin isimlerini belirli patterne göre seçme

select(df, contains("time"))

#filter() filtreleme komutu 

filter(df, dep_time>1 & day == 1)

a <- filter(df, dep_delay>mean(df$dep_delay, na.rm = TRUE))

b <- select(a, carrier, dep_delay)

arrange(b, desc(dep_delay))

sample_n(df, 100)
head(df, 10) 

#yeni değişken oluşturma
#burada kazanc, hiz ve yeni isimli 3 degisken olusturdum.
#bunlar onceki degiskenleri kullanıyorç
  
mutate(df,
  kazanc = arr_delay / dep_delay,
  hiz = distance/arr_time*60,
  yeni = kazanc/hiz
)

#time dep_time'i 550'den buyuk olanları ve icinde time gecen degiskenleri cagir

df %>% 
  select(contains("time")) %>%
  filter(dep_time > 550)


#veri setini carrier degiskenine gore grupla.
#hangi havayolu sirketinden kacar tane oldugunu goster ve 
#kalkislarda ortlama kac sefer geciktigini goster.


df %>%
  group_by(carrier) %>%
  summarise(n = n(),
            mean(dep_delay, na.rm = TRUE),
            median(dep_delay, na.rm = TRUE),
            sd(dep_delay, na.rm = TRUE)
            )


  
#Tidy Data Veriyi duzenli hale getirmek
##gathering ve spreading
##gathering degisken isimlerinin olmasi gerektigi yerde degisken degerlerinin olmasi

library(tidyverse)

table4a %>%
  gather("1999","2000", key = "year", value = "cases")

##spreading 

table2 %>%
  spread(key = "type", value = "count")

#seperate gozlemleri ayırma

table3 %>%
  separate(rate, into = c("var1","var2"))

#unite degiskenleri bir araya getirme

table5 %>%
  unite(new, century, year, sep = "")






























































