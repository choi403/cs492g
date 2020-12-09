## Single Factor Backtest Result Data and the Analysis Codes

### December 9, 2020, 최준석

Working directory must be set to this folder ("single_factor_backtest_data") before executing any code. CAGR values were calculated using CAGR.r in the "compound_factor_backtest_data" folder. 

####correlation.r
Used to plot the correlation between the return of each single factor backtest result. When the boolean in the if statement in line 21 is set to FALSE, the correlation between the holding period returns is used. If set to TRUE, then the entire period return is used. dollar, yen, yuan folders contain the data for the foreign currency analysis. 

####factorvalue_corr.r
Plots all the factor-return scatter plots for the factors excluding momentum backtest results and perform pearson test on each of them. if the boolean in line 29 is set to F, the holding period return and the differences of the factor values in that period is used. If set to T, the actual return and the factor values are used. 

####barplot.r
Plots the barplot result of the single factor backtest results (line 29, 32, 42 and 45) and perform a normality test (line 20 and 23). Individual data on top were calculated using the CAGR.r code and then collected. 