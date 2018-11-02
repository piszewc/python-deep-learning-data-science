# -*- coding: utf-8 -*-
"""
Created on Thu Nov  1 12:06:13 2018

@author: piotr
"""

iteration = 0
while iteration < 5:
    count = 0
    for letter in "hello, world":
        count += 1
        if iteration % 2 == 0:
            break
    print("Iteration " + str(iteration) + "; count is: " + str(count))
    iteration += 1 
    
    
    
#guess my number
    
secret_number = 36

numGuesses = 0
epsilon = 1
low = 0
high = 100
ans = int((high+low)/2)

print("Please think of a number between 0 and 100!")
print("Is your secret number: " +str(ans))
text = input("Enter 'h' to indicate the guess is too high. Enter 'l' to indicate the guess is too low. Enter 'c' to indicate I guessed correctly. ")
while text != "c":
    
    if text == "h":
        high = ans
    elif text == "l":
        low = ans
    ans = int((high + low)/2)
    
    print("Is your secret number: " +str(ans))
    text = input("Enter 'h' to indicate the guess is too high. Enter 'l' to indicate the guess is too low. Enter 'c' to indicate I guessed correctly. ")
    numGuesses += 1

print("Game over. Your secret number was: " +str(ans))