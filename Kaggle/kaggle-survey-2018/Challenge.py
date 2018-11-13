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


plt.subplots(figsize=(6,6))
sns.countplot(y=main_survey['What is the highest level of formal education that you have attained or plan to attain within the next 2 years?'],order=main_survey['What is the highest level of formal education that you have attained or plan to attain within the next 2 years?'].value_counts().index)
plt.show()


plt.subplots(figsize=(6,6))
sns.countplot(y=main_survey["How do you perceive the quality of online learning platforms and in-person bootcamps as compared to the quality of the education provided by traditional brick and mortar institutions? - In-person bootcamps:"],order=main_survey["How do you perceive the quality of online learning platforms and in-person bootcamps as compared to the quality of the education provided by traditional brick and mortar institutions? - In-person bootcamps:"].value_counts().index)
plt.show()

plt.subplots(figsize=(6,6))
sns.countplot(y=main_survey['How do you perceive the quality of online learning platforms and in-person bootcamps as compared to the quality of the education provided by traditional brick and mortar institutions? - Online learning platforms and MOOCs:'],order=main_survey['How do you perceive the quality of online learning platforms and in-person bootcamps as compared to the quality of the education provided by traditional brick and mortar institutions? - Online learning platforms and MOOCs:'].value_counts().index)
plt.show()

plt.subplots(figsize=(6,6))
sns.countplot(y=main_survey['On which online platform have you spent the most amount of time? - Selected Choice'],order=main_survey['On which online platform have you spent the most amount of time? - Selected Choice'].value_counts().index)
plt.show()

plt.subplots(figsize=(6,6))
sns.countplot(y=main_survey['Do you consider yourself to be a data scientist?'],order=main_survey['Do you consider yourself to be a data scientist?'].value_counts().index)
plt.show()

plt.subplots(figsize=(6,6))
sns.countplot(y=main_survey['What programming language would you recommend an aspiring data scientist to learn first? - Selected Choice'],order=main_survey['What programming language would you recommend an aspiring data scientist to learn first? - Selected Choice'].value_counts().index)
plt.show()

plt.subplots(figsize=(6,6))
sns.countplot(y=main_survey[],order=main_survey[].value_counts().index)
plt.show()

plt.subplots(figsize=(6,6))
sns.countplot(y=main_survey['What specific programming language do you use most often? - Selected Choice'],order=main_survey['What specific programming language do you use most often? - Selected Choice'].value_counts().index)
plt.show()

plt.subplots(figsize=(6,6))
sns.countplot(y=main_survey['What is the primary tool that you use at work or school to analyze data? (include text response) - Selected Choice'],order=main_survey['What is the primary tool that you use at work or school to analyze data? (include text response) - Selected Choice'].value_counts().index)
plt.show()

plt.subplots(figsize=(6,6))
sns.countplot(y=main_survey['What is your current yearly compensation (approximate $USD)?'],order=main_survey['What is your current yearly compensation (approximate $USD)?'].value_counts().index)
plt.show()

plt.subplots(figsize=(6,6))
sns.countplot(y=main_survey['Select the title most similar to your current role (or most recent title if retired): - Selected Choice'],order=main_survey['Select the title most similar to your current role (or most recent title if retired): - Selected Choice'].value_counts().index)
plt.show()

plt.subplots(figsize=(6,6))
sns.countplot(y=main_survey['What is the highest level of formal education that you have attained or plan to attain within the next 2 years?'],order=main_survey['What is the highest level of formal education that you have attained or plan to attain within the next 2 years?'].value_counts().index)
plt.show()

plt.subplots(figsize=(6,6))
sns.countplot(y=main_survey['In what industry is your current employer/contract (or your most recent employer if retired)? - Selected Choice'],order=main_survey['In what industry is your current employer/contract (or your most recent employer if retired)? - Selected Choice'].value_counts().index)
plt.show()

plt.subplots(figsize=(6,6))
sns.countplot(y=main_survey['Does your current employer incorporate machine learning methods into their business?'],order=main_survey['Does your current employer incorporate machine learning methods into their business?'].value_counts().index)
plt.show()

main_survey.columns