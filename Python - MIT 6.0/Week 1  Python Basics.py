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


x = 23
epsilon = 0.01
step = 0.1
guess = 0.0

while abs(guess**2-x) >= epsilon:
    if guess <= x:
        guess += step
    else:
        break

if abs(guess**2 - x) >= epsilon:
    print('failed')
else:
    print('succeeded: ' + str(guess))
    
    
    
#----------------------------------------------------------------------------
    
pi = 3.14159
radius = 2.2
# area of circle equation <- this is a comment
area = pi*(radius**2)
print(area)

# change values of radius <- another comment
# use comments to help others understand what you are doing in code
radius = radius + 1
print(area)     # area doesn't change
area = pi*(radius**2)
print(area)


#############################
#### COMMENTING LINES #######
#############################
# to comment MANY lines at a time, highlight all of them then CTRL+1
# do CTRL+1 again to uncomment them
# try it on the next few lines below!

#area = pi*(radius**2)
#print(area)
#radius = radius + 1
#area = pi*(radius**2)
#print(area)

#############################
#### AUTOCOMPLETE #######
#############################
# Spyder can autocomplete names for you
# start typing a variable name defined in your program and hit tab 
# before you finish typing -- try it below

# define a variable
a_very_long_variable_name_dont_name_them_this_long_pls = 0

# below, start typing a_ve then hit tab... cool, right!
# use autocomplete to change the value of that variable to 1

# use autocomplete to write a line that prints the value of that long variable
# notice that Spyder also automatically adds the closed parentheses for you!


###################
## EXAMPLE: strings 
###################
hi = "hello there"
name = "ana"
greet = hi + name  
print(greet)
greeting = hi + " " + name
print(greeting)
silly = hi + (" " + name)*3
print(silly)

####################
## EXAMPLE: output 
####################
x = 1
print(x)
x_str = str(x)
print("my fav number is", x, ".", "x=", x)
print("my fav number is", x_str + "." + "x=" + x_str)
print("my fav number is" + x_str + "." + "x=" + x_str)


####################
## EXAMPLE: input
####################
text = input("Type anything... ")
print(5*text)
num = int(input("Type a number... "))
print(5*num)


####################
## EXAMPLE: conditionals/branching 
####################
x = float(input("Enter a number for x: "))
y = float(input("Enter a number for y: "))
if x == y:
    print("x and y are equal")
    if y != 0:
        print("therefore, x / y is", x/y)
elif x < y:
    print("x is smaller")
elif x > y:
    print("y is smaller")
print("thanks!")



####################
## EXAMPLE: remainder 
####################
num = int(input("Enter a number: "))
if num % 2 == 0:
    print("number is even")
else:
    print("number is odd")


####################
## EXAMPLE: while loops 
## Try expanding this code to show a sad face if you go right
## twice and flip the table any more times than that. 
## Hint: use a counter
####################
n = input("You are in the Lost Forest\n****************\n****************\n :)\n****************\n****************\nGo left or right? ")
while n == "right" or n == "Right":
    n = input("You are in the Lost Forest\n****************\n******       ***\n  (╯°□°）╯︵ ┻━┻\n****************\n****************\nGo left or right? ")
print("\nYou got out of the Lost Forest!\n\o/")



n = 0
while n < 5:
    print(n)
    n = n+1


####################
## EXAMPLE: for loops
####################
for n in range(5):
    print(n)

mysum = 0
for i in range(10):
    mysum += i
print(mysum)

mysum = 0
for i in range(7, 10):
    mysum += i
print(mysum)

mysum = 0
for i in range(5, 11, 2):
    mysum += i
    if mysum == 5:
        break
        mysum += 1
print(mysum)



####################
## EXAMPLE: perfect squares
####################
ans = 0
neg_flag = False
x = int(input("Enter an integer: "))
if x < 0:
    neg_flag = True
while ans**2 < x:
    ans = ans + 1
if ans**2 == x:
    print("Square root of", x, "is", ans)
else:
    print(x, "is not a perfect square")
    if neg_flag:
        print("Just checking... did you mean", -x, "?")

