#code by Nam Lethanh namkyodai@gmail.com
############INPUT PART#################
jmax=5  # Range of condition states
z=1  # interval or elapsed time in Markov processs
totalyear=50 # Total number of time (e.g. months,years) used to compute the state probabilities over time.
########################################
dulieu<-read.csv("data/mtp.csv", header=T) # read data file, 
dulieu=data.frame(dulieu)
dulieu=data.matrix(dulieu)
mtp=matrix(double(1),nrow=jmax,ncol=jmax) #define the dimension of matrix
for (i in 1:jmax){
for (j in 1:jmax){
mtp[i,j]=dulieu[i,j]
}
}
csstate<-matrix(double(1),nrow=totalyear,ncol=jmax) #state probability in year
for (t in 1:totalyear){
if (t==1) {
for (i in 1:jmax){
if (i==1) {
csstate[t,i]<-1
} else {
csstate[t,i]<-0
}
}
} else {
csstate[t,]<-csstate[(t-1),]%*%mtp
}
}

#a function to plot the stacked shaded areas over time
plot.new()
stackedPlot <- function(data, time=NULL, col=1:length(data),...) {
  if (is.null(time)) {
    time <- 1:length(data[[1]])
  plot(0,0, xlim = range(time), ylim = c(0,max(rowSums(data))), t="n" , ...)
    for (i in length(data):1) {
    #the summup to the current collumn
    prep.data <- rowSums(data[1:i]);     
    # The polygon must have his first and last point on the zero line
	prep.y <- c(0, prep.data,0)
    prep.x <- c(time[1], time, time[length(time)] )
       polygon(prep.x, prep.y, col=col[i], border = NA);
  }
}
}
#--------------------
#define evolution of conditison states over time into data frame
csstate=csstate*100 #turning probability distribution of condition states to percentage
csstate <- data.frame(csstate)
colors=c("aliceblue","coral1","limegreen","orange","yellow2")
stackedPlot(csstate,col = colors,xlab="",ylab="") #this is used for defaul colour
mtext(expression(paste("Percentage(%)")),side=2,line=2.2, adj = 0.5 )
mtext(expression(paste("Time (years)")),side=1,line=2.2, adj = 0.5 )
legend("topright", inset=0.09, title="CSs",col=colors,lty=2,lwd=13,legend=c(1:jmax),bg="azure2",cex=1.2)
#THE END