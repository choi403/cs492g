MDD = c(67.33591, 32.49395, 50.4908, 41.43901, 41.06391, 86.97811, 40.38215, 49.32981, 44.02828, 68.92817, 47.47282, 83.80299, 78.90124, 54.73346, 73.10517, 58.94821)
CAGR = c(-1.140291, 2.661236, 5.665209, 2.119321, 7.206949, -8.242282, 6.307863, 2.9737, 7.603784, -0.5825986, 6.435875, -5.166342, -5.814086, 2.141132, -4.076315, 1.736591)
names = c('GPA_high', 'GPA_low', 'NCAV_high', 'NCAV_low', 'PBR_high', 'PBR_low', 'PCR_high', 'PCR_low', 'PER_high', 'PER_low', 'PSR_high', 'PSR_low', 'ROA_high', 'ROA_low', 'ROE_high', 'ROE_low')
MDD_momentum = c(55.0414, 67.82843, 61.56924, 68.1634, 64.42444, 55.21326, 53.72856, 62.51464, 70.81285, 68.78908, 55.36668, 79.6367)
CAGR_momentum = c(0.9416821, -3.206969, 0.3603726, -3.097071, -2.599774, 0.3360008, -1.786416, 3.088647, -6.117532, 3.693868, -1.220907, 1.021968)
names_momentum = c('change1day_high', 'change1day_low', 'change1week_high', 'change1week_low', 'change1month_high', 'change1month_low', 'change3month_high', 'change3month_low', 'change6month_high', 'change6month_low', 'change12month_high', 'change12month_low')

MDD_total = c(MDD, MDD_momentum)
CAGR_total = c(CAGR, CAGR_momentum)

# import library
library(ggpubr)


length(MDD)
length(names)

# 정규분포인지 검사
ggqqplot(MDD)
shapiro.test(MDD)

ggqqplot(CAGR)
shapiro.test(CAGR)

# momentum 전까지 plot
par(mfrow=c(1, 2), mar=c(7,3,3,3))


barplot(MDD, names=names, las=2, cex.names=1.2)
abline(h=mean(MDD_total))
title("MDD")
barplot(CAGR, names=names, las=2, cex.names=1.2)
abline(h=mean(CAGR_total))
title("CAGR")



#  plot
par(mfrow=c(1, 2), mar=c(12,3,3,3))


barplot(MDD_momentum, names=names_momentum, las=2, cex.names=1.2)
abline(h=mean(MDD_total))
title("MDD_momentum")
barplot(CAGR_momentum, names=names_momentum, las=2, cex.names=1.2)
abline(h=mean(CAGR_total))
title("CAGR_momentum")




