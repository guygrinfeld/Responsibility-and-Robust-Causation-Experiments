setwd("C://Users//...")
library(stargazer)
library(lme4)
library(car)
library(dplyr)
library(rcompanion)

data = read.csv("Exp-1_raw.csv")
data$score=data$sumScoreOfDice
data$ID=factor(data$ID)
data=data[data$score>=6,]
#data=mutate(data, parity=case_when(ring%%2==0 ~ 'even',ring%%2!=0 ~ 'odd'))

data1=data[data$condition==2,] #2-responsibility
data2=data[data$condition==1,] #1-cause


sum_before=group_by(data,dice, ring , score)%>%summarise(mean_rating=mean(rating))


model1=lmer(rating ~ dice + score + ring+ (1|ID), data=data1)
an1=anova(model1)

model2=lmer(rating ~ dice + score + ring + (1|ID), data=data2)
an2=anova(model2)

require(pbkrtest)
coefs1=data.frame(coef(summary(model1)))
df1.KR <- get_ddf_Lb(model1, fixef(model1))
coefs1$p.KR <- 2 * (1 - pt(abs(coefs1$t.value), df1.KR))

coefs2=data.frame(coef(summary(model2)))
df2.KR <- get_ddf_Lb(model2, fixef(model2))
coefs2$p.KR <- 2 * (1 - pt(abs(coefs2$t.value), df2.KR))


stargazer(coefs1, type='text', summary = F, title='',digits=3)
stargazer(coefs2, type='text', summary = F, title='',digits=3)

data1$prediction=predict(model1, data1)
data2$prediction=predict(model2, data2)

suma_after1=group_by(data1, ring, dice, score)%>%summarise(rating=mean(rating), prediction=mean(prediction))
suma_after1$rating=round(suma_after$rating,digits =2)
suma_after1$prediction=round(suma_after1$prediction,digits =2)

suma_after2=group_by(data2, ring, dice, score)%>%summarise(rating=mean(rating), prediction=mean(prediction))
suma_after2$rating=round(suma_after$rating,digits =2)
suma_after2$prediction=round(suma_after2$prediction,digits =2)

stargazer(suma_after1, type='text', summary =  F, digits=1, digits.extra=1)
stargazer(suma_after2, type='text', summary =  F, digits=1, digits.extra=1)

