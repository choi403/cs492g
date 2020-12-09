# environment variables
folderpaths = c('PER_low', 'PBR_high', 'PBR_low', 'PCR_high', 'GPA_high', 'NCAV_low', 'ROA_high', 'ROA_low', 'NCAV_high', 'PER_high', 'ROE_high', 'GPA_low', 'PSR_low', 'PSR_high', 'ROE_low', 'PCR_low', 'dollar', 'yuan', 'yen')


# Load the package 
library("rjson")
library("corrgram")

# Load the data
Growth <- data.frame(c(1:77))
namesets <- c("dates")

for(folderpath in folderpaths){
  
  values <- fromJSON(file = paste("./",folderpath,"/values.json", sep=""))
  folderpath = sub('low','L',sub('high','H',folderpath))
  
  # monthly growth
  monthly_growth <- c()
  for(i in 1:(length(values)-1)){
    if (F){ #folderpath == "dollar" || folderpath == "yen" || folderpath == "yuan"
      monthly_growth <- append(monthly_growth, values[i])
    } else {
      monthly_growth <- append(monthly_growth, ((values[i+1]/values[i])-1)*100)
    }
  }
  Growth<-cbind(Growth, monthly_growth)
  namesets <-append(namesets, folderpath)
  
}

names(Growth) <- namesets
Growth <- subset(Growth, select = -c(dates))

# Correlation test
corrgram(Growth, order=TRUE, lower.panel=panel.shade,
         upper.panel=panel.cor, text.panel=panel.txt)