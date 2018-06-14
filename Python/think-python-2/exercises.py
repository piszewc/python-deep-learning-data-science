#Thinkpython2

#Exercises and Answers

#Exercise 1.1. It is a good idea to read this book in front of a computer so you can try out the examples as you go.
#Whenever you are experimenting with a new feature, you should try to make mistakes. For example, in the “Hello, world!” program, what happens if you leave out one of the quotation marks? What if you leave out both? What if you spell print wrong?
#This kind of experiment helps you remember what you read; it also helps when you are programming, because you get to know what the error messages mean. It is better to make mistakes now and on purpose than later and accidentally.
#

#1. In a print statement, what happens if you leave out one of the parentheses, or both?
#
print("Hello World"
#2. If you are trying to print a string, what happens if you leave out one of the quotation marks, or both?
#
print("Hello World)
#3. You can use a minus sign to make a negative number like -2. What happens if you put a plus sign before a number? What about 2++2?
#
2++2
#4. In math notation, leading zeros are ok, as in 02. What happens if you try this in Python?
#
02
#5. What happens if you have two values with no operator between them?
#
2 2

#Exercise 1.2. Start the Python interpreter and use it as a calculator.
#1. How many seconds are there in 42 minutes 42 seconds?
#
minutes = 42
seconds = 42
minutes_to_seconds = minutes * 60
total = minutes_to_seconds + seconds
print(total)
#2. How many miles are there in 10 kilometers? Hint: there are 1.61 kilometers in a mile.
#
kilometers = 10
mile = 1.61
km_to_mile = kilometers/mile
print(km_to_mile)

#3. If you run a 10 kilometer race in 42 minutes 42 seconds, what is your average pace (time per mile in minutes and seconds)? What is your average speed in miles per hour?

minutes = 42
seconds = 42

#minutes_to_sec = minutes* 60
seconds_to_minutes = seconds/60

run_time = minutes_to_sec+seconds

run_time_minutes = run_time/60
run_time_minutes_hour = run_time_minutes/60

kilometers = 10
mile = 1.61
km_to_mile = kilometers/mile

average_pace = run_time_minutes/km_to_mile

average_miles_per_hour = km_to_mile/run_time_minutes_hour

print("total run time: "+str(run_time))
print("km to miles: "+str(round(km_to_mile,2)))
print("avg time per mile: "+str(round(average_pace,2)))
print(str(round(average_miles_per_hour,2))+" mph")