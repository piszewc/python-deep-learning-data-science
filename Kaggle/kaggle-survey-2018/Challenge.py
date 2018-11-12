# -*- coding: utf-8 -*-
"""
Created on Mon Nov 12 17:48:53 2018

@author: piotr
"""

import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
import numpy as np
#%matplotlib inline

main_survey = pd.read_csv('multipleChoiceResponses.csv')

main_survey.columns = main_survey.iloc[0]

main_survey = main_survey.iloc[1:]

main_survey.head()

plt.style.use('fivethirtyeight')


plt.subplots(figsize=(8,6))
sns.countplot(x=main_survey['What is your gender? - Selected Choice'],order=main_survey['What is your gender? - Selected Choice'].value_counts().index)
plt.show()


plt.subplots(figsize=(5,10))
sns.countplot(y=main_survey['In which country do you currently reside?'],order=main_survey['In which country do you currently reside?'].value_counts().index)
plt.show()

plt.subplots(figsize=(8,6))
sns.countplot(y=main_survey['What is your age (# years)?'],order=main_survey['What is your age (# years)?'].value_counts().index)
plt.show()


plt.subplots(figsize=(8,6))
sns.countplot(x=main_survey['What is the highest level of formal education that you have attained or plan to attain within the next 2 years?'],order=main_survey['What is the highest level of formal education that you have attained or plan to attain within the next 2 years?'].value_counts().index)
plt.show()

main_survey.columns