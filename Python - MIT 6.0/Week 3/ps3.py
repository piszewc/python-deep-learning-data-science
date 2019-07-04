# -*- coding: utf-8 -*-
"""
Created on Thu Jul  4 19:30:40 2019

@author: piotr
"""
 

def isWordGuessed(secretWord, lettersGuessed):
    
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
    
    if lettersGuessed == []:
        bad_payer = str("_ ")*len(secretWord)
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
    return alphabets


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
    how_long = len(secretWord)
    
    secretWordinLowecase = secretWord.lower()
    
    print('Welcome to the game, Hangman!')
    print('I am thinking of a word that is '+str(how_long)+' letters long')
    
    mistekesMade = 0
    lettersGuessed = []
    previusAvailableLetters = [(getAvailableLetters(lettersGuessed))]
    
    while mistekesMade < 9:
        print("-----------")
        
        print("You have ", (8-mistekesMade)," guesses left")
        print("Available Letters:",getAvailableLetters(lettersGuessed))
        
        letter = input("Please guess a letter: ")
        letter = letter[0]
        lowerCaseLetter = letter.lower()
        lettersGuessed.append(lowerCaseLetter)
        
        
        if getAvailableLetters(lettersGuessed)==previusAvailableLetters:
            
            mistekesMade+=0
        else:
            mistekesMade+=1
        
        if (isWordGuessed(secretWordinLowecase, lettersGuessed)) == True:
            print("Good guess: "+letter)
            break
            

    if (isWordGuessed(secretWordinLowecase, lettersGuessed)) == True:
        print("-----------")
        print("Congratulations, you won!")
    else:
        print("-----------")
        print("Sorry, you ran out of guesses. The word was "+secretWord+".")
    