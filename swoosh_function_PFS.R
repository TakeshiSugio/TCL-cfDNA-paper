swoosh.output.PFS <- function(file,outputFile,time,min,max) {

  dataset <- read.table(file,header=TRUE)
  
  # set up time intervals for output
  times <- time
  tn<-1
  CI<-F
  cols <-"blue"
  
  # generate survival data
  survivalData <- Surv(dataset$PFS,dataset$PFScensor)
  # generate cox fit for univariate
  fit <- coxph(survivalData ~ x,data = dataset)
  # generate baseline hazard function
  sfit <- survfit(fit,newData=survivalData)
  
  # set up scores
  scores <- dataset$x
  # set up baseline position
  baselineX <- mean(scores)
  
  for (yr in times) {
    # generate the list of points to consider
    minScore = min
    maxScore = max
    zz = seq(minScore,maxScore,length=200)
    nz = length(zz)
    sur=sur1=sur2=rep(NA,nz)
    
    for(i in 1:nz){
      # make the survival curve for your value of interest
      survAtRisk = survfit(fit,newdata=data.frame(x=zz[i]))
      sinterp=spline(survAtRisk$time, survAtRisk$surv,xout=yr)$y
      sinterp.lo=spline(survAtRisk$time, survAtRisk$low,xout=yr)$y
      sinterp.up=spline(survAtRisk$time, survAtRisk$up,xout=yr)$y
      
      sur[i]=sinterp
      sur1[i]= sinterp.lo
      sur2[i]= sinterp.up
    }
    if (tn==1) {
      plot(zz,1-sur,ylim=c(0,1),type="l",lty=1,lwd=3,col=cols[tn],xlab="Score",ylab="Probability of event" )
      rug(scores)
      grid()
    } else {
      points(zz,1-sur,ylim=c(0,1),pch=tn,col=cols[tn] )
    }
    if (CI) {
      lines(zz,1-sur1,lty=2,col=cols[tn])
      lines(zz,1-sur2,lty=2,col=cols[tn])
    }
    tn=tn+1
  }
  dataOut = data.frame(zz,sur,sur1,sur2)
  colnames(dataOut) = c("Values","pSur","LB","UB")
  write.table(dataOut,outputFile,sep="\t",row.names=FALSE)
  
  

}
  
  