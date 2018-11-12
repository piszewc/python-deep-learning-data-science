# -*- coding: utf-8 -*-
"""
Created on Mon Nov 12 17:48:53 2018

@author: piotr
"""

%matplotlib inline
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
import numpy as np

main_survey = pd.read_csv('multipleChoiceResponses.csv')

main_survey.columns = main_survey.iloc[0]

main_survey.head(5)