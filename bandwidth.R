library(ggplot2)
library(gganimate)

datapoints<-data.frame(d=rnorm(50))

normaldist<-data.frame(x=seq(-4,4,0.1))
normaldist$y<-dnorm(normaldist$x)

bws<-data.frame(bw=c(seq(0.05,0.5,0.01),seq(0.55,0.9,0.05),seq(1,2,0.1)))

for (i in 1:length(bws$bw)){
  h<-bws$bw[i]
  mytitle<-paste("Density estimation with bandwidth h=",as.character(h),sep="")
  myfilename<-paste("output/plotframe",as.character(i),'.png',sep="")
  
  p<-ggplot(datapoints,aes(d))+geom_point(aes(y=0))+geom_line(data=normaldist,aes(x,y))+theme_light()+
    stat_density(geom="line",col="steelblue",bw=h)+
    labs(title=mytitle,x="",y="",caption="/u/quaductas")+
    scale_x_continuous(breaks=NULL)+
    scale_y_continuous(breaks=NULL,limits = c(0,0.5))

  ggsave(myfilename,plot=p,width=7,height=5,dpi=600)
}
