*$TITLE formulation for a portfolio management model

* define runtime control parameters
$OFFSYMXREF
$OFFSYMLIST
OPTION LIMCOL=0;
OPTION LIMROW=0;
OPTION SOLPRINT=OFF;

OPTION OptCA = 0.0;
OPTION OptCR = 0.0;

* select optimization solver
$offlisting;
OPTION ITERLIM=100000;
OPTION RESLIM=100000;
OPTION LP=CPLEX;

* define the set of asset classes

*********************Define *sets**********************

SET class the investment asset classes / S1*S15 /;

SET n / n1*n192 /;

*********************Define Tables, parameters, scalars**********************

$INCLUDE returns.txt


parameter Prob(n)        Scenario probabilities;
loop(n,
Prob(n)=1/192);

Scalars
         a  critical percentile for var and cvar /0.95/
         m expected portfolio's return target /0.01543/;

*********************Define variables**********************

Variables
         cvar            objective function value
         z               Value-at-Risk
         f_return(n)     portolio return under scenario n
         tot_return      expected return of the portfolio
         y(n)            loss shortfall beyond VaR
         hold(class)     units of asset i purchased under scenario;

Positive Variables
         y, hold;

*********************Define equations**********************

Equations
             OdjDefCVaR     Objective function definition for CVaR maximization
             Tar_Return     Equation defining a minimun target over the expected return
             FinalReturn    Equation defining the final portfolio return under scenario n
             EXP_Return     Equation defining the portfolio expected return constraint
             init_balance   Asset balance constraint
             VaRCon         Equation defining the Var Deviation constraint;

OdjDefCVaR..        cvar =E= z - sum(n, Prob(n)*y(n))/(1-a);

FinalReturn(n)..    f_return(n) =E= sum(class, hold(class)*Ret(n,class));

EXP_Return..        tot_return =E= sum(n, f_return(n)*Prob(n));

init_balance..      sum(class, hold(class)) =E= 1.0;

Tar_Return..        tot_return =G= m;

VaRCon(n)..         y(n) =G= z-f_return(n);

Model portfolio /all/;

File resultCVaR, weightscvar;
resultCVaR.ap=1; weightscvar.ap=1;

Solve portfolio using lp maximizing cvar;

Put resultCVaR;
resultCVaR.nd=5
Put 'CvaR =', cvar.l, ',  Var =', z.l, ',  expected return=', tot_return.l;

put weightscvar;
weightscvar.pw=32767;
weightscvar.nd=4;
loop(class, put hold.l(class));
put /;

