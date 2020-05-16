# -*- coding: utf-8 -*-
"""
Created on Sat May 16 14:14:23 2020

@author: piotr
"""

def solveit(test):
    """ test, a function that takes an int parameter and returns a Boolean
        Assumes there exists an int, x, such that test(x) is True
        Returns an int, x, with the smallest absolute value such that test(x) is True 
        In case of ties, return any one of them. 
    """
    
    status = False
    x = 0
    
    while status == False:
        status = test(x)
        if status == True:
            return x
        
        if x == 1000:
            x = x*-1
        
        x+=1


#### This test case prints 49 ####
def f(x):
    return (x+15)**0.5 + x**0.5 == 15
print(solveit(f))

#### This test case prints 0 ####
def f(x):
    return x == 0
print(solveit(f))

#### This test case prints 0 ####
def f(x):
    return x**2 + x + 0 == 0
print(solveit(f))

def f(x):
    return x**2 == 9
print(solveit(f))
