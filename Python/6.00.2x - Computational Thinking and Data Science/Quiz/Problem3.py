# -*- coding: utf-8 -*-
"""
Created on Sat May 16 11:52:55 2020

@author: piotr
"""

def song_playlist(songs, max_size):
    """
    songs: list of tuples, ('song_name', song_len, song_size)
    max_size: float, maximum size of total songs that you can fit

    Start with the song first in the 'songs' list, then pick the next 
    song to be the one with the lowest file size not already picked, repeat

    Returns: a list of a subset of songs fitting in 'max_size' in the order 
             in which they were chosen.
    """
    
    songsCopy = songs.copy()
    finalList = []
    
    current_size = 0
   
    if max_size > current_size+songsCopy[0][2]:
        finalList.append(songsCopy[0][0])
        current_size = current_size+songsCopy[0][2]
        songsCopy.remove(songsCopy[0])
    else:
        return []
    
    #songsCopy = songsCopy[::-1]
    songsCopy.sort(key=lambda tup: tup[2])

    
    for song in songsCopy:
        if max_size > current_size+song[2]:
            finalList.append(song[0])
            current_size = current_size+song[2]

    return finalList
    
    
        
        
songs = [('Roar',4.4, 4.0),('Sail',3.5, 7.7),('Timber', 5.1, 6.9),('Wannabe',2.7, 1.2)]
max_size = 12.2
t1 = song_playlist(songs, max_size) #['Roar','Wannabe','Timber']

songs = [('Roar',4.4, 4.0),('Sail',3.5, 7.7),('Timber', 5.1, 6.9),('Wannabe',2.7, 1.2)]
max_size = 11
t2 = song_playlist(songs, max_size) #['Roar','Wannabe']

t3 = song_playlist([('a', 4.4, 4.0), ('b', 3.5, 7.7), ('c', 5.1, 6.9), ('d', 2.7, 1.2)], 20)
t4 = song_playlist([('a', 4.0, 4.4), ('b', 7.7, 3.5), ('c', 6.9, 5.1), ('d', 1.2, 2.7)], 20)