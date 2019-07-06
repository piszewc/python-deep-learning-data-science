'''
PROBLEM 1

Assume s is a string of lower case characters.

Write a program that counts up the number of vowels contained in the string s. Valid vowels are: 'a', 'e', 'i', 'o', and 'u'. For example, if s = 'azcbobobegghakl', your program should print:

Number of vowels: 5
'''

vowels = ['a', 'e', 'i', 'o', 'u']

list_s = list(s)

vowels_counter = 0 

for i in list_s:
    for v in vowels:
        if i == v:
            vowels_counter= vowels_counter+1

print("Number of vowels: "+str(vowels_counter))

'''
PROBLEM 2

Assume s is a string of lower case characters.

Write a program that prints the number of times the string 'bob' occurs in s. For example, if s = 'azcbobobegghakl', then your program should print

Number of times bob occurs is: 2
'''

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

'''
PROBLEM 3

Assume s is a string of lower case characters.

Write a program that prints the longest substring of s in which the letters occur in alphabetical order. For example, if s = 'azcbobobegghakl', then your program should print

Longest substring in alphabetical order is: beggh
In the case of ties, print the first substring. For example, if s = 'abcbcd', then your program should print

Longest substring in alphabetical order is: abc
Note: This problem may be challenging. We encourage you to work smart. If you've spent more than a few hours on this problem, we suggest that you move on to a different part of the course. If you have time, come back to this problem after you've had a break and cleared your head.
'''
first_letter_number = 0
last_letter_number = 1
word_len = len(s)

longest_substring_counter = 0
longest_substring = ""

current_substring_counter = 0
current_substring = ""



while last_letter_number <= word_len:
    current_string = s[first_letter_number:last_letter_number]

    if current_string == ''.join(sorted(current_string)):
        last_letter_number = last_letter_number+1
        current_substring_counter = current_substring_counter+1
        current_substring = current_string
        if current_substring_counter > longest_substring_counter:
            longest_substring_counter = current_substring_counter
            longest_substring = current_substring
    else:
        print("Finished abc time to move")
        first_letter_number = first_letter_number+1
        last_letter_number = first_letter_number+1
        current_substring_counter=0
        current_substring=""
        current_string = s[first_letter_number:last_letter_number]

        
print("Longest substring in alphabetical order is: "+str(longest_substring))
            
    