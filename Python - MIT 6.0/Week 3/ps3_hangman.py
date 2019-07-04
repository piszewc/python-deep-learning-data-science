# Hangman game
#

# -----------------------------------
# Helper code
# You don't need to understand this helper code,
# but you will have to know how to use the functions
# (so be sure to read the docstrings!)

import random

WORDLIST_FILENAME = "words.txt"

def loadWords():
    """
    Returns a list of valid words. Words are strings of lowercase letters.
    
    Depending on the size of the word list, this function may
    take a while to finish.
    """
    print("Loading word list from file...")
    # inFile: file
    inFile = open(WORDLIST_FILENAME, 'r')
    # line: string
    line = inFile.readline()
    # wordlist: list of strings
    wordlist = line.split()
    print("  ", len(wordlist), "words loaded.")
    return wordlist

def chooseWord(wordlist):
    """
    wordlist (list): list of words (strings)

    Returns a word from wordlist at random
    """
    return random.choice(wordlist)

# end of helper code
# -----------------------------------

# Load the list of words into the variable wordlist
# so that it can be accessed from anywhere in the program
wordlist = loadWords()

def isWordGuessed(secretWord, lettersGuessed):
    '''
    secretWord: string, the word the user is guessing
    lettersGuessed: list, what letters have been guessed so far
    returns: boolean, True if all the letters of secretWord are in lettersGuessed;
      False otherwise
    '''
    lettersFound = []
    for i in secretWord:
        for n in lettersGuessed:
            if n == i:
                lettersFound.append(i)
                break
                
    len(secretWord) == len(lettersFound)
    return len(secretWord) == len(lettersFound)



def getGuessedWord(secretWord, lettersGuessed):
    '''
    secretWord: string, the word the user is guessing
    lettersGuessed: list, what letters have been guessed so far
    returns: string, comprised of letters and underscores that represents
      what letters in secretWord have been guessed so far.
    '''
    lettersFound = []
    
    if lettersGuessed == 0 or lettersGuessed == None:
        bad_payer = str("_ ")*len(str(secretWord))
        return bad_payer
    else:
        for i in secretWord:

            lettersGuessedCounter = 0

            for idx, n in enumerate(lettersGuessed):
                if n == i:
                    lettersFound.append(i)
                    lettersGuessedCounter = 0 
                    break

                if idx == len(lettersGuessed)-1:
                    lettersFound.append("_ ")
        str_final_word = ''.join(lettersFound)
        return str_final_word



def getAvailableLetters(lettersGuessed):
    '''
    lettersGuessed: list, what letters have been guessed so far
    returns: string, comprised of letters that represents what letters have not
      yet been guessed.
    '''
    alphabet = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z']
    
    for n in lettersGuessed:
        for i in alphabet:
            if n==i:
                alphabet.remove(i)
    
    alphabet = ''.join(alphabet)
    return alphabet
    

def hangman(secretWord):
    '''
    secretWord: string, the secret word to guess.

    Starts up an interactive game of Hangman.

    * At the start of the game, let the user know how many 
      letters the secretWord contains.

    * Ask the user to supply one guess (i.e. letter) per round.

    * The user should receive feedback immediately after each guess 
      about whether their guess appears in the computers word.

    * After each round, you should also display to the user the 
      partially guessed word so far, as well as letters that the 
      user has not yet guessed.

    Follows the other limitations detailed in the problem write-up.
    '''
    
    print('Welcome to the game, Hangman!')
    print('I am thinking of a word that is '+str(len(secretWord))+' letters long')
    
    health = 8
    letters_guessed = [] 
    
    win = False
    
    while health > 0 and win == False:
        
        print("-------------")
        print('You have',str(health),'guesses left')
        print('Available Letters:',getAvailableLetters(letters_guessed))
        guess = input('Please guess a letter: ')
        guess = guess.lower()
        
        if guess not in getAvailableLetters(letters_guessed):
            print("Oops! You've already guessed that letter:",getGuessedWord(secretWord, letters_guessed))
            
        elif guess not in secretWord:
            letters_guessed.append(guess)
            print('Oops! That letter is not in my word:',getGuessedWord(secretWord, letters_guessed))
            health -= 1
            
        elif guess in secretWord:
            letters_guessed.append(guess)
            print('Good guess:',getGuessedWord(secretWord, letters_guessed))
            
            if isWordGuessed(secretWord, letters_guessed):
                win = True

    print('-------------')       
    
    if win == True:
        print('Congratulations, you won!')
        
    else:
        print('Sorry, you ran out of guesses. The word was ' + secretWord + '.')




# When you've completed your hangman function, uncomment these two lines
# and run this file to test! (hint: you might want to pick your own
# secretWord while you're testing)

# secretWord = chooseWord(wordlist).lower()
# hangman(secretWord)
