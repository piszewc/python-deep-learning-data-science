
# coding: utf-8

# TED Conferences, LLC (Technology, Entertainment, Design) is a media organization that posts talks online for free distribution, under the slogan "ideas worth spreading". TED was founded in February 1984 as a conference, which has been held annually since 1990. TED's early emphasis was technology and design, consistent with its Silicon Valley origins, but it has since broadened its focus to include talks on many scientific, cultural, and academic topics.
# 
# The main TED conference is held annually in Vancouver, British Columbia, Canada at the Vancouver Convention Centre. Prior to 2014, the conference was held in Long Beach, California, United States. TED events are also held throughout North America and in Europe and Asia, offering live streaming of the talks. They address a wide range of topics within the research and practice of science and culture, often through storytelling. The speakers are given a maximum of 18 minutes to present their ideas in the most innovative and engaging ways they can. Past speakers include Bill Clinton, Sean M. Carroll, Elon Musk, Ray Dalio, Cédric Villani, Stephen Hawking, Jane Goodall, Al Gore, Temple Grandin, Gordon Brown, David Cameron, Billy Graham, Richard Dawkins, Bill Gates, Dolph Lundgren, Bono, Google founders Larry Page and Sergey Brin, and many Nobel Prize winners. TED's current curator is the British former computer journalist and magazine publisher Chris Anderson.
# 
# External video
# Jimbo at Fosdem cropped.jpg
#  Jimmy Wales: The birth of Wikipedia, TED (conference), 2005
#  Chris Anderson: A vision for TED, TED (conference), 2002
# Since June 2006, TED Talks have been offered for free viewing online, under an Attribution-NonCommercial-NoDerivatives Creative Commons license, through TED.com. As of January 2018, over 2,600 TED Talks are freely available on the website. In June 2011, TED Talks' combined viewing figure stood at more than 500 million, and by November 2012, TED Talks had been watched over one billion times worldwide. Not all TED Talks are equally popular, however. Those given by academics tend to be watched more online while art and design videos tend to be watched less than average.

# In[22]:

from IPython.display import HTML, display
import numpy as np # linear algebra
import pandas as pd # data processing, CSV file I/O (e.g. pd.read_csv)
import glob
import datetime
import matplotlib.pyplot as plt
import seaborn as sns


# In[2]:

month_order = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
day_order = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']


# In[3]:

df = pd.read_csv('input/ted_main.csv')
df.columns


# In[4]:

df['film_date'] = df['film_date'].apply(lambda x: datetime.datetime.fromtimestamp( int(x)).strftime('%d-%m-%Y'))
df['published_date'] = df['published_date'].apply(lambda x: datetime.datetime.fromtimestamp( int(x)).strftime('%d-%m-%Y'))


# In[5]:

df = df[['name', 'title', 'description', 'main_speaker', 'speaker_occupation', 'num_speaker', 'duration', 'event', 'film_date', 'published_date', 'comments', 'tags', 'languages', 'ratings', 'related_talks', 'url', 'views']]


# In[6]:

df.head(n=10)


# In[7]:

df.columns = df.columns.str.upper().str.replace('_', ' ')


# In[8]:

df.head()


# Most viewed Talks

# In[10]:

pop_talks = df[['TITLE', 'MAIN SPEAKER', 'VIEWS', 'COMMENTS', 'FILM DATE']].sort_values('VIEWS', ascending=False)[:10]
pop_talks


# In[11]:

pop_talks = df[['TITLE', 'MAIN SPEAKER', 'VIEWS', 'COMMENTS', 'FILM DATE']].sort_values('COMMENTS', ascending=False)[:10]
pop_talks


# In[ ]:

def visualize_most(df, column, num=10): # getting the top 10 videos by default
    sorted_df = df.sort_values(column, ascending=False).iloc[:num]
    
    ax = sorted_df[column].plot.bar()
    
    # customizes the video titles, for asthetic purposes for the bar chart
    labels = []
    for item in sorted_df['TITLE']:
        labels.append(item[:10] + '...')
    ax.set_xticklabels(labels, rotation=45, fontsize=10)
    
    plt.show()

visualize_most(df, 'VIEWS')

