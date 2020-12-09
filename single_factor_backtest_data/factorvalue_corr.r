# environment variables
folderpaths = c('PER_low', 'PBR_high', 'PBR_low', 'PCR_high', 'GPA_high', 'NCAV_low', 'ROA_high', 'ROA_low', 'NCAV_high', 'PER_high', 'ROE_high', 'GPA_low', 'PSR_low', 'PSR_high', 'ROE_low', 'PCR_low')

# Load the package 
library("rjson")
library("corrgram")
library("scatterplot3d")
library("stringr")

values <- fromJSON(file = paste("./",'PER_low',"/values.json", sep=""))


# Load the data
Growth <- data.frame(length(values) - 1)
namesets <- c("dates")

par(mfrow=c(4, 4), mar=c(0,0,0,0))
count = 0

for(folderpath in folderpaths){
  values <- fromJSON(file = paste("./",folderpath,"/values.json", sep=""))
  factors <- fromJSON(file = paste("./",folderpath,"/factor.json", sep=""))
  print(length(values))
  
  # monthly growth
  monthly_growth <- c()
  monthly_factors <- c()
  for(i in 1:length(values)-1){
    if (F) { # T: 계속보유수익률
      monthly_growth <- append(monthly_growth, values[i])
      monthly_factors <- append(monthly_factors, factors[i])
    } else {
      monthly_growth <- append(monthly_growth, ((values[i+1]/values[i])-1)*100)
      monthly_factors <- append(monthly_factors, ((factors[i+1]/factors[i]))*100)
    }
  }
  test = cor.test(monthly_factors, monthly_growth, method="pearson")
  
  
  if (test$p.value > 0.05){
    plot(monthly_factors, monthly_growth, xlab='', ylab='', xaxt='n', yaxt='n', col='light blue')
  } else if (test$p.value > 0.01) {
    plot(monthly_factors, monthly_growth, xlab='', ylab='', xaxt='n', yaxt='n', col="blue")
  } else {
    plot(monthly_factors, monthly_growth, xlab='', ylab='', xaxt='n', yaxt='n', col="black")
  }
  
  
  
  
  if (T) {
    title_text=sub("high","H",sub("low","L",str_remove(sub("week","w",sub("day","d",sub("month","m",sub("month","m",str_remove(folderpath, "_change"))))),"change_")))
    print(title_text)
    title_text=paste(title_text, "cor:", sep="\n")
    title_text=paste(title_text, round(test$estimate, 5), sep=" ")
    title_text=paste(title_text, "p:", sep="\n")
    title_text=paste(title_text, test$p.value, sep=" ")
    title(title_text, line=-3, cex.main=1.1, col.main='red')
    #Growth<-cbind(Growth, monthly_growth)
    #namesets <-append(namesets, folderpath)
  }
  Growth<-cbind(Growth, monthly_growth)
  namesets <-append(namesets, folderpath)
  # print(count)
  
}

