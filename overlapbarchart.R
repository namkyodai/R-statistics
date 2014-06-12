category =c(1:5)
cate1 <- c(90,70,50,-40,-30)
cate2 <- c(-50,-60,-60,30,60)
data=data.frame(category,cate1,cate2)
length=length(data[,1]) #the number of item within a category
#define the new plot area
plot.new()
par(mar=c(5, 4, 4, 6) + 0.1)
#plot the first graph
barplot(cate1, density=20,axes=FALSE,ylim=c(-100,100),xlab="",ylab="",space=1,border="black",angle =45)

axis(2,c(seq(-100,100,by=10)),c(seq(-100,100,by=10))) #add value to Y-axis
#axis(2, ylim=c(-100,100),col="black",las=1)  ## las=1 makes horizontal labels
mtext(expression(paste("Percentage %",)),side=2,col="black",line=2) #add text to Y-axis

axis(1,c(seq(0,20,by=2)),c(seq(0,10,by=1))) #add values to X-axis, this can be customized further
mtext(expression(paste("Item")),side=1,col="black",line=2.5) #add text to X-axis
grid(10, 10, col = "lightgray", lty = "dotted",lwd = par("lwd"), equilogs = TRUE) #make grid on the plot
box() #draw a box around the plot
legend("topright",inset=.04,legend=c("Category 1","Category 2","Difference"), fill=c("grey","grey","white"),density=c(20,100,100),border=c("black","black","red"),angle=c(45,-45,0),horiz=T,cex=0.6)
#print the other plot on top of the original plot
par(new=TRUE)
barplot(cate2, density=100,axes=FALSE,ylim=c(-100,100),xlab="",ylab="",col="grey",space=1,angle=-45)
#print the other plot on top of the original plot
par(new=TRUE)
par(lwd = 3)
barplot((cate1+cate2), density=0,axes=FALSE,ylim=c(-100,100),xlab="",ylab="",col="white",space=0.8,border="red")
rm(list=ls())
