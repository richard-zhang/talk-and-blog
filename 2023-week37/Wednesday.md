## #finance Modern Yield Curve Stripping

### Risk free rate
- Tools for central bank to manage economy
  - interest rate
  - quantitative easing
  - long term financing a.k.a helicopter money
    - #example lend money with negative interest rate
- #motivation the market needs to understand the fair price of lending/borrowing
- #motivation the regulator wanted a risk free rate without any credit risk
- #solution Risk Free Rate, a pure interest rate (overnight rate - shortest maturity possible)
  - RFR is calculated using real market trades 
  - #example €STR (Euro short term rate)
- secure over-night rate (SOFR)
  - based on the repo (borrowing with collateral) market
  - Repo market is nearly risk-free due to collateral (us goverment bond or german government bond)
- #math interest accurred for the floating leg  during a period
$$
\prod_{i=1}^{n}(1 + RFR_i * \frac{NbDays_i}{Day Count})
$$
- #example interest acurred from 13/12/2022 to 28/12/2022  months ![[Pasted image 20230913224454.png]]
- RFR Swaps
  - A fixed leg
  - A floating leg
### Bond and Swap
- #problem What's the relationship between bond and swap?
  - swap can transform a fixed rate bond to floating rate bond
  - swap is a tool to manage interest rate risk
- swap has a present value
- #example image this product
  - at today, pay 1M
  - in 3 month, received 1M + accured interest rate from risk free rate
- #problem how to transform a swap to a bond?
  - #solution defined a twisted swap
    - at time zero, give 100%
      - fixed leg, received 4%
      - floating leg
- a swap is exactly fixed rate bond
  - #TLDR if pv of float leg is zero and the pv of swap is zero then pv of fix leg is zero.
- risk free rate
  - ester is risk free rate

### Basic Stripping: Magic Matrix
- compute the discount factor using bond market quotes
- input: a list of swaps with different tenors
  - each swap has a coupon frequency of 1 years
  - swap has tenors from 1 to 10 years
- #TLDR cash flow of swaps at different tenors becomes the basis in the matrix space of vector
  - any cashflow can be expressed as a a linear combination of those basis
    - this particular linear combination can be calculated using inverse of basis matrix
- 
