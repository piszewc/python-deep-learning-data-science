# -*- coding: utf-8 -*-
"""
Created on Thu Aug  1 18:08:14 2019

@author: piotr
"""

import datetime

class Person(object):
    def __init__(self, name):
        """Create a person called name"""
        
        self.name = name
        self.birthday = None
        self.lastName = name.split(" ")[-1]
        
    def getLastName(self):
        """ return self's last name """
        return self.lastName
    
    def __str__(self):
        """ return self's name"""
        return self.name
    
    def setBirthday(self,month,day,year):
        """ sets self's birthday to birthDate """
        self.birthday = datetime.date(year,month,day)
        
    def getAge(self):
        """ return self's current age in days"""
        if self.birthday==None:
            raise ValueError
        return(datetime.date.today() - self.birthday).days
        
    def __lt__(self,other):
        """
        return True if self's name is lexicographically less than other's name, False otherwise
        """
        if self.lastName == other.lastName:
            return self.name < other.name
        return self.lastName < other.lastName
    
    
p1 = Person("Lukasz Szewc")
p1.setBirthday(5,14,94)

p2 = Person("Piotr Szewc")
p2.setBirthday(3,4,83)

p3 = Person("Wioletta Swiatlon")
p3.setBirthday(10,28,55)

personList = [p1,p2,p3]

for e in personList:
    print(e)
    
personList.sort()

print()

for e in personList:
    print(e)
    
class MITPerson(Person):
    nextIdNum = 0
    
    def __init__(self, name):
        Person.__init__(self,name)
        self.idNum =MITPerson.nextIdNum
        MITPerson.nextIdNum += 1
        
    def getIdNum(self):
        return self.idNum
    
    def __lt__(self, other):
        return self.idNum < other.idNum
    
    def speak(self, utterance):
        return (self.getLastName() + " says: "+ utterance)
    
    