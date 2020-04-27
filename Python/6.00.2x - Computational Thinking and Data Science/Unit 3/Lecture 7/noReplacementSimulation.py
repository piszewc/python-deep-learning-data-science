# -*- coding: utf-8 -*-
"""
Created on Sun Apr 26 21:57:16 2020

@author: piotr
"""
import random

def noReplacementSimulation(numTrials):
    '''
    Runs numTrials trials of a Monte Carlo simulation
    of drawing 3 balls out of a bucket containing
    3 red and 3 green balls. Balls are not replaced once
    drawn. Returns the a decimal - the fraction of times 3 
    balls of the same color were drawn.
    '''
    estimates = []
    for t in range(numTrials):
        ballGuess = drawnBalls()
        estimates.append(ballGuess)
        
    results = sum(estimates)/len(estimates)
    return results

def drawnBalls():
    bucked = ["red","red","red","green","green","green"]
    
    for i in range(3):
        bucked.remove(bucked[random.randint(0,len(bucked)-1)])
    
    
    red_count = bucked.count("red")
    green_count = bucked.count("green")
    
    if green_count == 3:
        return 1
    elif red_count == 3:
        return 1
    else: 
        return 0

