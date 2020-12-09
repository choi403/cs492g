## Compound Factor Backtest Result Data and the Analysis Codes

### December 9, 2020, 최준석

Working directory must be set to this folder (compound_factor_backtest_data) before executing any code. 

####CAGR.r
Used to get the CAGR, MDD values from the backtest data. 

####correlation.r
Was not used in the analysis. The code creates a correlation diagram between all 160+ backtest results. Used to plot the correlation between the return of each compound factor. When the boolean in the if statement in line 23 is set to FALSE, the correlation between holding period return is used. If set to TRUE, then the entire period return is used. 

####factorvalue_corr.r
Plots the factor-value general linear regression result of multiple compound factor backtest results. The float value in the if statement in the 50th line is used to determine which compound factors to plot. Again when the boolean in the if statement is set to FALSE then the differences of each values are used, and the final report was written using this method. When set to TRUE it uses the actual values instead of the period differences. Using a large plot window size is required, or it may result in an error. ("figure margins too large")

####pearson.r
Plots the scatterplot of each factor pairs and Pearson correlation test results. The number of plots to create is determined using the float value in the 26th line. 

####twofactor_cagr_mdd_analysis.r
Plots the Q-Q plot of MDD, CAGR data (line 63 and 66), print the Shapiro-Wilk test results (line 64 and line 67), plots the total backtest data box plot by group (line 74 and 75), plots the box plot of the MDD values and the CAGR values resulting from the factor-factor correlation analysis (line 86, line 88), plots the box plot of the MDD values and the CAGR values resulting from the general linear model analysis of factor pair-value relationship (line 93, line 95), performs Shapiro-Wil test on these data (line 98, 102, 106, 110) and perform variance analysis on them (line 100, 104, 108, 112). Individual MDD and CAGR values were computed using CAGR.r and then collected onto the top of the code. 

