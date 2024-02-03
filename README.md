For my undergraduate Thesis, I created four portfolios based on 36 (in total) assets. More specifically, i included:
• 10 Stocks indices
• 5 Bonds
• 10 Commodity indices
• 10 Forex rates
• 1 Real Estate index
Monthly returns of the above-mentioned 36 assets have been used, ranging from
1/1/1990-1/12/2018. Consequently, the dataset includes 348 observations- 24 per
asset.
I thereby constructed four portfolios. Each portfolio included the fifteen
traditional assets. Yet, the three latter portfolios also contained an extra
alternative asset. To fix ideas, the portfolios are:
❖ Portfolio one: Stocks and Bonds.(10 stock indices, 5 bonds)
❖ Portfolio two: Stocks Bonds and Commodities.(10 stock indices, 5 bonds,
10 commodity indices)
❖ Portfolio three: Stocks Bonds and Forex.(10 stock indices, 5 bonds, 10
forex rates)
❖ Portfolio four: Stocks Bonds and Real Estate.(10 stock indices, 5 bonds,
1 real estate index)
In the first part of the empirical application, I compared the efficient
frontier of the traditional portfolio(portfolio one) with each of the other
three portfolios. In the second part, I analyzed the backtesting results.

 Methodology
In this section, we describe the methodology that we followed to plot the
efficient frontiers.
To generate the efficient frontiers, we took the following approach for each
of the four portfolios:
1) We defined the parameters in the GAMS program.
2) We created and included a file containing the 29-year monthly returns
of the portfolio’s assets.
3) We defined the variables that we wanted to compute.
4) We defined the equations.
5) We ran our model. Initially, we maximized the CVaR model, wherein we
“quantified” the right edge of the efficient frontier, with the lowest
risk and return. Afterwards we ran the same model by maximizing the
total return level. We thus calculated the highest return and CVaR
level(i.e., we “quantified” the upper edge of the efficient frontier).
6) An excel formula was created, which created ten equally spaced points
between the highest and the lowest edge of the efficient frontier. As
a result, we created ten expected portfolio return targets which we
incorporated into our code, allowing us to compute ten expected return-
risk combinations. In other words, per those ten points, we calculated
a CVaR and an expected return.
7) We extracted the results in an excel file and plotted the efficient
frontier of each portfolio. Thereby, each efficient frontier is
composed of twelve points(including the highest and lowest efficient
frontier point).

Backtesting
In this part, we carry out dynamic backtesting experiments. With backtesting,
we answer the following question: Assume that we started investing in the
first month of 2014. Had we placed one dollar on each portfolio in the first
month of 2014 and rebalanced our portfolio’s composition on a monthly basis
according to the backtesting model’s suggestions28, which would have been the
portfolio’s realized cumulative returns over time, until the final month of
2018? To accomplish this, we utilized the monthly asset returns(historical
data) that we used to plot the efficient frontiers. To extract the realized
returns of each portfolio, we multiplied the optimal weights  of each
month, by the returns of the next month
