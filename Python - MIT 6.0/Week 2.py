# -*- coding: utf-8 -*-
"""
Created on Thu Nov  1 12:06:13 2018

@author: piotr2
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

def evalQuadratic(a, b, c, x):
    
    return a*(x*x)+b*x+c

x = evalQuadratic(1,2,3,4)
print(x)

#Functions

def printname(firstName,lastName, reverse = False):
    if reverse:
        print(lastName+", "+firstName)
    else:
        print(firstName, lastName)
        
printname("Piotr","Szewc", True)

def multi(a,b):
    if b==1:
        return a
    else:
        return a+multi(a,b-1)
multi(2,8)

#Tower of Hanoi

def printMove(fr,to):
    print("move from "+ str(fr)+ " to "+str(to))

def Towers(n, fr, to, spare):
    if n == 1:
        printMove(fr,to)
    else:
        Towers(n-1, fr, spare, to)
        Towers(1, fr, to, spare)
        Towers(n-1, spare, to, fr)
        
print(Towers(4,"P1","p2","p3"))