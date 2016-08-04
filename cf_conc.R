# this R script plots cfDNA and PSA barplo and line plots.

cfDNA = read.table("cfDNA_conc.txt",head=T)

library(ggplot2)

b1=ggplot(cfDNA.reg, aes(factor(stage), cfDNA)) + 
  geom_boxplot(aes(fill = factor(stage))) + theme_bw() +#+ geom_jitter()
  ggtitle("cfDNA concentration between stages")+  
  guides(fill=guide_legend(title="Time Point")) + ylab("blood cfDNA concentration")+
  xlab("time points")
b1

ggsave(b1,filename = "cfDNA_conc_boxplot.pdf",width=5,height=4)

# line plot
liine1 = ggplot(cfDNA.reg, aes(x=factor(stage), y=cfDNA, group = patient, color = factor(patient) )) + 
  geom_line() + theme_bw()+geom_point(size=3, shape=17) + ggtitle("cfDNA concentration between stages")+  
  guides(group=guide_legend(title="patients")) + ylab("cfDNA conc")+
  xlab("time points")
liine1
ggsave(liine1,filename = "cfDNA_conc_lineplot.pdf",width=5,height=4)


################ PSA plot


b2=ggplot(cfDNA.reg, aes(factor(stage), (PSA) )) + 
  geom_boxplot(aes(fill = factor(stage))) + theme_bw() +#+ geom_jitter()
  ggtitle("PSA  between stages")+  
  guides(fill=guide_legend(title="Time Point")) + ylab("blood PSA")+
  xlab("time points")
b2
ggsave(b2,filename = "PSA_conc_boxplot.pdf",width=5,height=4)

# line plot

liine2 = ggplot(cfDNA.reg, aes(x=factor(stage), y=(PSA), group = patient, color = factor(patient) )) + 
  geom_line() + theme_bw()+geom_point(size=3, shape=17) + ggtitle("PSA level between stages")+  
  guides(group=guide_legend(title="patients")) + ylab("PSA level")+
  xlab("time points")
liine2
ggsave(liine2,filename = "PSA_conc_lineplot.pdf",width=5,height=4)



# remove patient 4

cfDNA.reg = cfDNA[-7,]
plot(cfDNA.reg$cfDNA,cfDNA.reg$PSA)

p <- ggplot(cfDNA.reg, aes(PSA, cfDNA))+ geom_point() + theme_bw()
p 

