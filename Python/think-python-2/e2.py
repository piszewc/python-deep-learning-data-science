#Exercise 2.1. Repeating my advice from the previous chapter, whenever you learn a new feature,
#you should try it out in interactive mode and make errors on purpose to see what goes wrong.

#• We’ve seen that n = 42 is legal. What about 42 = n?

#• How about x = y = 1?

#• In some languages every statement ends with a semi-colon, ;. What happens if you put a
#semi-colon at the end of a Python statement?

#• What if you put a period at the end of a statement?

#• In math notation you can multiply x and y like this: xy. What happens if you try that in
#Python?


#Exercise 2.2. Practice using the Python interpreter as a calculator:
    
#1. The volume of a sphere with radius r is 4
#. What is the volume of a sphere with radius 5?

#2. Suppose the cover price of a book is $24.95, but bookstores get a 40% discount. Shipping costs
#$3 for the first copy and 75 cents for each additional copy. What is the total wholesale cost for
#60 copies?

book_price = 24.95
discount = 40

shipping_cost_first_book = 3 
shipping_cost_next_books = 0.75
number_of_sold_books = 60
total_shipping_cost = 0

book_price_with_discount = (book_price/100) * (100-discount)

if number_of_sold_books > 1:
    total_shipping_cost = shipping_cost_first_book + ((number_of_sold_books - 1) * shipping_cost_next_books)
    
if number_of_sold_books == 1:
    total_shipping_cost = shipping_cost_first_book

total_books_cost = book_price_with_discount*number_of_sold_books

total_cost = total_books_cost + total_shipping_cost
print(total_cost)

#3. If I leave my house at 6:52 am and run 1 mile at an easy pace (8:15 per mile), then 3 miles at
#tempo (7:12 per mile) and 1 mile at easy pace again, what time do I get home for breakfast?

from datetime import datetime, timedelta

easy_pace_minutes = 8
easy_pace_sec = 15

tempo_pace_minutes = 7 
tempo_pace_sec = 12

sum_easy_pace_sec = easy_pace_sec + easy_pace_minutes * 60 #per mile
sum_tempo_pace_sec = tempo_pace_sec + easy_pace_minutes * 60 #per mile

total_run_time_sec = (sum_easy_pace_sec * 2) +sum_tempo_pace_sec*3

total_run_time = timedelta(seconds=int(total_run_time_sec))

home_hour_leave_time_sec = 21600 + 3120
home_hour_leave_time = timedelta(seconds=int(home_hour_leave_time_sec))


print("If you leave home at " +str(home_hour_leave_time) +" and you will run for "+str(total_run_time) +" you will be back at home at "+ str(home_hour_leave_time+total_run_time))
