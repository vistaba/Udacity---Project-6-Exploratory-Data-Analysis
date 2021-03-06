Analysis of Loan Data by John Mendez
========================================================
  
  
  ```{r echo=FALSE, message=FALSE, warning=FALSE, packages}


library(ggplot2)
library(graphics)
library(dplyr)
library(grid)
library(gridExtra)

```


```{r echo=FALSE, message=FALSE, warning=FALSE, Load_the_Data}
# Load the Data
df <- read.csv("C:/Users/john.mendez/Desktop/Project Folder/prosperLoanData.csv", header=TRUE)
df1 <- na.omit(df)

```


# Univariate Plots Section
```{r echo=FALSE, message=FALSE, warning=FALSE, univariate_summary}

summary(df1)

```
In this analysis I will be focusing on only a few values from the dataset, considering the size.Through an analysis of the Loan dataset I am looking to better understand 
the borrower and lenders. To get an idea of the lender I wanted to evaluate the Estimated Effective Yield, Estimated Return and Estimated Loss. Using the descriptive
statistics above we can see that the average Estimated Effective Yield was around 17%, the average Estimated Loss was around 8% and the average Estimated Return was 
around 10%

Based on what we see here, we can tell that the loan officers are estimating greater returns than losses.An Effective Yield tells us what will be returned to the 
lender based on repayment of the principal and interest payments. Considering that the average Effective Yield was around 17%, this show us that the lenders were 
anticipating to fair profit. This is nothing too extraordinary though.

To assess the borrower, I will be focusing on Loan Status, Credit Score Range Upper, Credit Score Range Lower, Stated Monthly Income and Debt to Income Ratio. Starting with the Loan Status, we can see that the majority of loans are Current and that there is a relatively low number of defaults, this is a non-quantitative information so I
Will be disregarding the descriptive statistics.The Credit Score Range Lower field had an average score of 686. This a good credit score for a borrower, so just by looking 
at this you know that these borrower take their credit seriously. The Credit Score Range Upper was good with an average of 705.

Lastly, in my preliminary evaluation of the borrower, I would like to evaluate the borrowers debt to income ratio and state monthly income.In my opinion, these are even 
more critical than the Credit Score Ranges. The average debt to income ratio is around 28%. This is a little bit to high for my taste, but it does tell me that the borrowers
have taken money before, and they know how to manage and handle debt. The state income is averaged at around 5608. This feel a little low, but when we quickly double check the income ranges, it states that most of the borrowers make less than $50,000, in a sense, this explains itself.

```{r echo=FALSE, message=FALSE, warning=FALSE, Quick_Plots_1}
qplot(data = df1, x = DebtToIncomeRatio) +
  xlim(-0.1, 1.5)
```

This plot tells us that the majority of borrowers have a debt-to-income ratio of roughly
30%.Hardly anyone has a debt-to-income ratio of 0% and very few people have a debt to 
income ratio over 50%.

```{r echo=FALSE, message=FALSE, warning=FALSE, Quick_Plots_2}
qplot(data = df1, x = MonthlyLoanPayment) +
  xlim(0, 650)
```

This plot tells us that the majority of borrowers made a monthly loan payment somewhere
between $0 and $400. 

```{r echo=FALSE, message=FALSE, warning=FALSE, Quick_Plots_3}
qplot(data = df1, x = StatedMonthlyIncome) +
  xlim(0, 11000)
```

This plot tells us that the majority of borrowers declared their monthly income as being 
between $1500 and $6000.

```{r echo=FALSE, message=FALSE, warning=FALSE, Quick_Plots_6}
qplot(data = df1, x = LenderYield)
```

This plot tells us that the Lenders Yield varied between 10% and 32%. This plot is less
clear.

```{r echo=FALSE, message=FALSE, warning=FALSE, Quick_Plots_7}
qplot(data = df1, x = EstimatedEffectiveYield) +
  xlim(0, 0.3)
```

This plot tell sus the the Lenders estimated their yield to be somewhere between 10% and 30%.

```{r echo=FALSE, message=FALSE, warning=FALSE, Quick_Plots_8}
qplot(data = df1, x = EstimatedReturn) +
  xlim(0, 0.2)
```

This plot tells us that the Lenders estimated a return between 8% and 16%.

```{r echo=FALSE, message=FALSE, warning=FALSE, Quick_Plots_9}
qplot(data = df1, x = EstimatedLoss) +
  xlim(0, 0.2)
```

This plot is more difficult to read and understand, but what we can tell using the big spike
in the middle and the surrounding spikes, the estimated loss was somewhere between 5% and 15%.

```{r echo=FALSE, message=FALSE, warning=FALSE, univariate_plots_6}
credit_lower <- ggplot(data = df1,aes(x = CreditScoreRangeLower)) +
  geom_bar(fill = "darkorchid1") +
  xlab("Credit Score Range Lower") +
  ylab("Total Count")
credit_lower
```

This represents the lower range of the borrowers credit score. AS with the upper range,
their credit scores were between 600 and 800.

```{r echo=FALSE, message=FALSE, warning=FALSE, univariate_plots_12}
credit_upper <- ggplot(data = df1,aes(x = CreditScoreRangeUpper)) +
  geom_bar(fill = "darkorchid4") +
  xlab("Credit Score Range Upper") +
  ylab("Total Count")
credit_upper
```

This represents that upper range of the borrowers credit score. Generally, we can see that most individuals had an upper credit score between 600 and 800.

```{r echo=FALSE, message=FALSE, warning=FALSE, univariate_plots_11}
brate <- ggplot(data = df1, mapping = aes(x = BorrowerRate, y = seq(1))) +
  xlim(0, 0.35) +
  xlab("Borrower Rate") +
  ylab("Total Count") +
  geom_bar(stat = "identity",
           alpha = 0.08,
           color = "red")
brate

```

This plot is a little harder to read, but we can tell that the majority of borrowers
had a rate between 18% and 31%.

```{r echo=FALSE, message=FALSE, warning=FALSE, univariate_plots_7}
bapr <- ggplot(data = df1, aes(x=BorrowerAPR, y = seq(1))) + 
  xlim(0, 0.35) +
  xlab("Borrower APR") +
  ylab("Total Count") +
  geom_bar(stat = "identity",
           alpha = 0.08,
           color = "dark red")
bapr

```

The borroweers APR varied more as most borrowers had an APR between 20% and 39%.

# Univariate Analysis


### What is the structure of your dataset?

The data set is a list of over 10000 loans that were given. These loans were given to individuals, likely for consumer purposes.

### What is/are the main feature(s) of interest in your dataset?

What I intend to focus on in the analysis of this dataset is to analyze the borrowers financial status.

### What other features in the dataset do you think will help support your \investigation into your feature(s) of interest?

Considering that there was alot of other data in the dataset, I decided on these variables because they would allow me to get the best understanding of what the people who were getting loans were like. To complement these variables I chose to evaluate the state to determine where the loans holders resided in the United States and the Occupations they held.

### Did you create any new variables from existing variables in the dataset?

No new data was data was added to the existing data frame. Everything was taken from the original dataframe.

### Of the features you investigated, were there any unusual distributions? 

When I was building the plot of the debt to income ratio, I wanted to make sure that I drew attention only to the majority of loans, so I removed loan holders that had a debt to income ratio greater than 80% and a monthly income greater than 5000.

# Bivariate Plots Section
```{r echo=FALSE, message=FALSE, warning=FALSE, univariate_plots_1}

debtin <- ggplot(data = df1, mapping = aes(x=DebtToIncomeRatio, y=StatedMonthlyIncome)) +
  xlim(0.0, 0.7) +
  ylim(0, 10000) +
  xlab("Debt-to-Income Ratio") +
  ylab("Stated Monthly Income in USD") +
  geom_point(alpha=0.50,
             color="lightblue")
debtin

```

This plot represents the debt to imcome ratio compared to the Stated Monthly Income. What we
can gather from this plot is that the majority of borrowers generally have debt less
than 50% debt and a declared income of less than $6000 per month.

```{r echo=FALSE, message=FALSE, warning=FALSE, univariate_plots_4}
monthpay <- ggplot(data = df1, mapping = aes(x = MonthlyLoanPayment, y = StatedMonthlyIncome)) +
  xlim(0, 2000) +
  ylim(0, 10000) +
  xlab("Monthly Loan Payment in USD") +
  ylab("Stated Monthly Income in USD") +
  geom_point(alpha = 0.50,
             color = "orange")
monthpay

```

From this plot we can see that the same logic applies the majority of people make less than $6000
per month. This plot tells us that the majority generally makes a monthly payment of less than $500.

```{r echo=FALSE, message=FALSE, warning=FALSE, univariate_plots_8}
eyield <- ggplot(data = df1, aes(x = LenderYield, y = EstimatedEffectiveYield)) +
  xlim(0.1, 0.14) +
  ylim(0.1, 0.3) +
  geom_jitter(stat = "identity",
              color = "darkorchid1")
eyield

```

This plot does not indicate any patterns in Lender Yield, as the points are varied.
however, we can tell that the Lender generally estimated and effective yield between 
10% and 15%.

```{r echo=FALSE, message=FALSE, warning=FALSE, univariate_plots_9}
eloss <- ggplot(data = df1, aes(x=EstimatedLoss, y = EstimatedEffectiveYield)) +
  xlim(0, 0.14) +
  ylim(0.1, 0.3) +
  geom_jitter(stat = "identity",
              color = "dodgerblue3")
eloss
```

This plot tells us that the lender generally estimated a loss between 2% and 12%.
It is alsO worth noting that when estimated yield increases, the loss also tends to increase.

```{r echo=FALSE, message=FALSE, warning=FALSE, univariate_plots_10}

ereturn <- ggplot(data = df1, aes(x=EstimatedReturn, y = EstimatedEffectiveYield)) +
  xlim(0, 0.16) +
  ylim(0.1, 0.3) +
  geom_jitter(stat = "identity",
              color = "gold3")
ereturn
```

This plot tell us that generally, returns are estimated between 7% and 16%. As with 
estimated loss, we can see that higher estimated returns are usually caused by higher
estimated yields.

# Bivariate Analysis

### Talk about some of the relationships you observed in this part of the \analysis?

The first plot from the bivariate section compares the debt to income ratio. Most people have less than 50% debt and 
declared make less than $5000. This is an interesting relationship to observe because it tells us that 
the borrowers are fairly well off, and they have an established debt history.

After evaluating the estimated Loss and Return we can see that generally speaking, the lender estimated higher returns
to losses.

### Did you observe any interesting relationships between the other features \in this analysis?

I found the relationship between Estimated Return and Loss to be most interesting. In a sense
this is to be expected, considering lenders generally wouldn't lend to borrowers unless
they would make a return.

### What was the strongest relationship you found?

The strongest relationship that I can conclude here is with relation to the borrower and the stated monthly income. We can see that 
the borrowers here are relatively responsible with debt.


# Multivariate Plots Section

```{r echo=FALSE, message=FALSE, warning=FALSE, Multivariate_Plots_1}
multivar1 <- ggplot(aes(x = LenderYield, y = EstimatedReturn, color=(CreditScoreRangeUpper)), data=df1) +
ylim(0, 0.3) +
geom_jitter()

multivar2 <- ggplot(aes(x = LenderYield, y = EstimatedLoss, color=(CreditScoreRangeUpper)), data=df1) +
ylim(0, 0.3) +
geom_jitter()

plt1 <- grid.arrange(multivar1, multivar2, ncol=2)
plt1
```

These plots evaluate the Estimated Return and Loss, Lender Yield and the borrowers upper range credit score. 
Starting with the plot on the left that evaluates Estimated Return, we can see that generally people with 
higher credit scores, the lender expected to make less in returns and yield.

When evaluating the plot on the right, we can see that see that the lender estimated less on a loss on people with
higher credit scores. This is rather obvious considering that people with higher credit scores are deemed as 
people who can handle more debt. This yield is also something interesting to note, it appears that the yield was
smaller which tells me that the loans might have been in smaller amounts.

```{r echo=FALSE, message=FALSE, warning=FALSE, Multivariate_Plots_2}
multivar3 <- ggplot(aes(x = DebtToIncomeRatio, y = StatedMonthlyIncome, color=(MonthlyLoanPayment)), data=df1) +
xlim(0, 1) +
ylim(0, 20000) +
geom_jitter()
multivar3
```

This plot evaluates the debt to income ratio, stated monthly income and the payment the borrower made
on the loan. As we have seen from prior plots, most people do not make more than roughly $6000 and have
more than 50% debt. Considering that this makes up much of the majority and as we have seen in 
prior plots, it is only fair to say that most borrowers pay between $0 and $400 per month on a
loan payment.

```{r echo=FALSE, message=FALSE, warning=FALSE, Multivariate_Plots_3}

multivar4 <- ggplot(aes(x = BorrowerRate, y = BorrowerAPR, color=(LenderYield)), data=df1) +
ylim(0, 10) +
geom_bar(stat = "identity", alpha = 0.3)


multivar4
```
This plot evaluates the Borrower Rate and APR along with the Lender Yield. It tells us that 
for the majority of people, with a rate greater than 20%, the lender also produced a yield
greater than 20%.


# Multivariate Analysis

### Talk about some of the relationships you observed in this part of the \ analysis

The strongest relationships that I have observed in this section relate to the borrower. Based on the
multivariate plots and the rest of the report, we can see that the lender was generally careful
when selecting applicants to borrow to.

### Were there any interesting or surprising interactions between features?

I was very happy to weave in an analysis of the Borrower Rate and Borrowers APR. I feel that this was the best point to analyze, as it gives us the most
information about whether borrowers should take out a loan with this lender or not.

------

# Final Plots and Summary

### Plot One

```{r echo=FALSE, message=FALSE, warning=FALSE, Plot_One}
finplot1 <- multivar1 +
ggtitle("Evaluation of Credit Score and Return")
finplot1
```

### Description One
This plot evaluates Estimated Return, we can see that people with 
higher credit scores, the lender expected to make less in returns and yield.

I chose this plot because it emphasizes high risk high reward lending practices.
This is generally a fact of life.

### Plot Two

```{r echo=FALSE, message=FALSE, warning=FALSE, Plot_Two}
finplot2 <- debtin +
ggtitle("Evaluation of Debt to Income and Monthly Income in USD")
finplot2

```

### Description Two
This plot represents the debt to imcome ratio compared to the Stated Monthly Income. What we
can gather from this plot is that the majority of borrowers generally have debt less
than 50% debt and a declared income of less than $6000 per month.

I chose this plot because it provides a clear an accurate presentation of the borrower
and their current status regarding debt and ability to handle a loan.

### Plot Three

```{r echo=FALSE, message=FALSE, warning=FALSE, Plot_Three}
finplot3 <- multivar4 +
ggtitle("Evaluation of Borrower Rate and Lender Yield")
finplot3
```

### Description Three
This plot evaluates the Borrower Rate and APR along with the Lender Yield. It tells us that 
for the majority of people, with a rate greater than 20%, the lender also produced a yield
greater than 20%.

I chose this plot because it demonstrates a very close connection between the Borrower Rate
and the Lender Yield.

------

# Reflection

Reflecting on this analysis, I felt it went relatively smooth. This analysis was geared
more towards evaluating the lender. Perhaps another analysis I could conduct would 
involve a heavier focus on the borrower.



