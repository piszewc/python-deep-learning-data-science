'''
Each month, a credit card statement will come with the option for you to pay a minimum amount of your charge, usually 2% of the balance due. However, the credit card company earns money by charging interest on the balance that you don't pay. So even if you pay credit card payments on time, interest is still accruing on the outstanding balance.

Say you've made a $5,000 purchase on a credit card with an 18% annual interest rate and a 2% minimum monthly payment rate. If you only pay the minimum monthly amount for a year, how much is the remaining balance?
'''

'''
PROBLEM 1 - Paying Debt off in a Year

Write a program to calculate the credit card balance after one year if a person only pays the minimum monthly payment required by the credit card company each month.

'''

monthly_interest_rate = annualInterestRate/12 

prev_balance = balance

for i in range(12):
    
    minimum_monthly_payment = monthlyPaymentRate * prev_balance
    monthly_unpaid_balance = prev_balance - minimum_monthly_payment
    updated_balance_each_month = monthly_unpaid_balance + (monthly_interest_rate*monthly_unpaid_balance)
    prev_balance = updated_balance_each_month

print("Remaining balance: %.2f" % prev_balance)

'''
PROBLEM 2 - Paying Debt Off in a Year

Now write a program that calculates the minimum fixed monthly payment needed in order pay off a credit card balance within 12 months. By a fixed monthly payment, we mean a single number which does not change each month, but instead is a constant amount that will be paid each month.

'''

start_balance = balance
previus_balance = 0

month = 1
multiplayer = 1
base_dolar = 10

min_lowest_payment =  multiplayer*base_dolar

def reset_balance(balance, start_balance):
    balance = start_balance
    return balance

def increase_multi(multiplayer):
    return multiplayer+1

def reset_month(month):
    month = 1
    return month

while month <= 13:
    if balance > 0:
        if month > 12:
            multiplayer = increase_multi(multiplayer)
            month = reset_month(month)
            balance = reset_balance(balance, start_balance)
            min_lowest_payment =  multiplayer*base_dolar

        else:
            previus_balance = balance
            
            monthly_interest_rate = annualInterestRate/12.0
            monthly_unpaid_balance = previus_balance - min_lowest_payment
            updated_balance_each_month = monthly_unpaid_balance+(monthly_interest_rate*monthly_unpaid_balance)
            balance = updated_balance_each_month
            
            month = month+1

    else:
        print("Lowest Payment: "+ format(min_lowest_payment, '.2f'))
        break

'''
Problem 3 - Using Bisection Search to Make the Program Faster
You'll notice that in Problem 2, your monthly payment had to be a multiple of $10. Why did we make it that way? You can try running your code locally so that the payment can be any dollar and cent amount (in other words, the monthly payment is a multiple of $0.01). Does your code still work? It should, but you may notice that your code runs more slowly, especially in cases with very large balances and interest rates. (Note: when your code is running on our servers, there are limits on the amount of computing time each submission is allowed, so your observations from running this experiment on the grading system might be limited to an error message complaining about too much time taken.)

'''
def minimumPayment(balance, annualInterestRate):
  
  monthlyInterestRate = annualInterestRate / 12.0
  
  low = balance/12.0
  high = balance
  
  while True:
    newbalance = balance
    minimumMonthlyPayment = (low + high)/2
    
    for count in range(0, 12):
      newbalance = (newbalance - minimumMonthlyPayment) * (1 + monthlyInterestRate)
      count += 1
    
    if newbalance < 0.01 and newbalance > -0.01:
      print("Lowest Payment: " + str(round(minimumMonthlyPayment, 2)))
      break
    elif newbalance > 0:
      low = minimumMonthlyPayment
    elif newbalance < 0:
      high = minimumMonthlyPayment

minimumPayment(balance, annualInterestRate)