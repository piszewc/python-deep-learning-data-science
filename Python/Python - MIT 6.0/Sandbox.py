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