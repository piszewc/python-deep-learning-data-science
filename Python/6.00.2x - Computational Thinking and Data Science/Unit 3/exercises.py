# -*- coding: utf-8 -*-
"""
Created on Fri Apr 24 20:18:42 2020

@author: piotr
"""

def stdDevOfLengths(L):
    """
    L: a list of strings

    returns: float, the standard deviation of the lengths of the strings,
      or NaN if L is empty.
    """
    try:
        X = []
        
        for l in L:
            X.append(len(l))
        
        mean = sum(X)/float(len(X))
        tot = 0.0
        for x in X:
            tot += (x- mean)**2
        std = (tot/len(X)) ** 0.5
    
    except:
        return float('NaN')
    
    return std
    