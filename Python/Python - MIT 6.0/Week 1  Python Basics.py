# -*- coding: utf-8 -*-
"""
Created on Sun Oct 28 14:10:00 2018

@author: piotr
"""

happy = 3

if happy >2:
    print('hello world')
    

#----------

varA = 1
varB = 2

if isinstance(varA,str) and isinstance(varB,str):
    print("string involved")
else:
    if varA > varB:
        print("bigger")
    if varA== varB:
        print("equal")
    if varA<varB:
        print("smaller")

x = 2

while x <= 10:
    print(x)
    x+=2
print("Goodbye!")

x = 10
print("Hello!")
while x >= 2:
    print(x)
    x-=2
    

i=1
result= 0
end = 6
while i <= end:
    result = result+i
    i=i+1
    print(i)
print(result)


i = 2

print("Hello!")
for i in range(10, 0, -2):
    print(i)
   
result=0
end = 6
for i in range(0,end+1):
    result = result+i
print(result)