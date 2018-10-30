# -*- coding: utf-8 -*-
"""
Created on Fri Oct 26 21:48:36 2018

@author: piotr
"""
#Problem 1

s = "allabamaeya"
vowels = ['a', 'e', 'i', 'o', 'u']

list_s = list(s)

vowels_counter = 0 

for i in list_s:
    for v in vowels:
        if i == v:
            vowels_counter= vowels_counter+1

print("Number of vowels: "+str(vowels_counter))


#---------------------

#Problem 2

s = 'azcbobobegghakl'

special_code = "bob"


lower_letter = 0 
max_letter = 3


word_len = len(s)
bobs_counter = 0

while max_letter <= word_len:
    looking_for_bob = s[lower_letter:max_letter]

    if looking_for_bob == special_code:
        lower_letter = lower_letter+1
        max_letter = max_letter+1
        bobs_counter = bobs_counter+1
    else:
        lower_letter = lower_letter+1
        max_letter = max_letter+1
    
print("Number of times bob occurs is: "+str(bobs_counter))


#---------------------

#Problem 3

s = 'azcbobobegghakl'

first_letter_number = 0
last_letter_number = 1
word_len = len(s)

longest_substring_counter = 0
longest_substring = ""

current_substring_counter = 0
current_substring = ""



while last_letter_number <= word_len:
    current_string = s[first_letter_number:last_letter_number]

    if current_string == ''.join(sorted(current_string)):
        last_letter_number = last_letter_number+1
        current_substring_counter = current_substring_counter+1
        current_substring = current_string
        if current_substring_counter > longest_substring_counter:
            longest_substring_counter = current_substring_counter
            longest_substring = current_substring
    else:
        print("Finished abc time to move")
        first_letter_number = first_letter_number+1
        last_letter_number = first_letter_number+1
        current_substring_counter=0
        current_substring=""
        current_string = s[first_letter_number:last_letter_number]

        
print("Longest substring in alphabetical order is: "+str(longest_substring))
            
#Week 2 - Problem 1

balance = 484
annualInterestRate = 0.2
monthlyPaymentRate = 0.04


month = 1
prev_balance = balance

while month <=12:
    prev_balance = balance
    monthly_interest_rate = annualInterestRate/12.0
    minimum_monthly_payment = monthlyPaymentRate*prev_balance
    monthly_unpaid_balance = prev_balance - minimum_monthly_payment
    updated_balance_each_month = monthly_unpaid_balance+(monthly_interest_rate*monthly_unpaid_balance)
    balance = updated_balance_each_month
    month = month+1
    
print("Remaining balance: "+ format(balance, '.2f'))



#Week 2 - Problem 2

#Now write a program that calculates the minimum fixed monthly payment needed in order pay off a credit card balance within 12 months. By a fixed monthly payment, we mean a single number which does not change each month, but instead is a constant amount that will be paid each month.
#
#In this problem, we will not be dealing with a minimum monthly payment rate.
#
#The following variables contain values as described below:
#
#balance - the outstanding balance on the credit card
#
#annualInterestRate - annual interest rate as a decimal
#
#The program should print out one line: the lowest monthly payment that will pay off all debt in under 1 year, for example:
#
#Lowest Payment: 180 
#Assume that the interest is compounded monthly according to the balance at the end of the month (after the payment for that month is made). The monthly payment must be a multiple of $10 and is the same for all months. Notice that it is possible for the balance to become negative using this payment scheme, which is okay. A summary of the required math is found below:
#
#Monthly interest rate = (Annual interest rate) / 12.0
#Monthly unpaid balance = (Previous balance) - (Minimum fixed monthly payment)
#Updated balance each month = (Monthly unpaid balance) + (Monthly interest rate x Monthly unpaid balance)

balance = 3329
annualInterestRate = 0.2

lowest_payment = 0 
month = 1
prev_balance = balance

while month <=12:
    prev_balance = balance
   
    monthly_interest_rate = annualInterestRate/12.0
    monthly_unpaid_balance = prev_balance - lowest_payment
    updated_balance_each_month = monthly_unpaid_balance+(monthly_interest_rate*monthly_unpaid_balance)
   
    balance = updated_balance_each_month
    month = month+1
    
lowest_payment = balance/12

print("Remaining balance: "+ format(balance, '.2f'))






































