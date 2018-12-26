#!/usr/bin/env python
# coding: utf-8

# In[1]:


import os

TITANIC_PATH = os.path.join("datasets", "titanic")


# In[2]:


# To support both python 2 and python 3

# Common imports
import numpy as np
import os

# to make this notebook's output stable across runs
def reset_graph(seed=42):
    tf.reset_default_graph()
    tf.set_random_seed(seed)
    np.random.seed(seed)

# To plot pretty figures
get_ipython().run_line_magic('matplotlib', 'inline')
import matplotlib
import matplotlib.pyplot as plt
plt.rcParams['axes.labelsize'] = 14
plt.rcParams['xtick.labelsize'] = 12
plt.rcParams['ytick.labelsize'] = 12

# Where to save the figures
PROJECT_ROOT_DIR = "."
CHAPTER_ID = "ann"

def save_fig(fig_id, tight_layout=True):
    path = os.path.join(PROJECT_ROOT_DIR, "images", CHAPTER_ID, fig_id + ".png")
    print("Saving figure", fig_id)
    if tight_layout:
        plt.tight_layout()
    plt.savefig(path, format='png', dpi=300)


# In[3]:


import pandas as pd
import seaborn as sns

def load_titanic_data(filename, titanic_path=TITANIC_PATH):
    csv_path = os.path.join(titanic_path, filename)
    return pd.read_csv(csv_path)


# In[4]:


train_data = load_titanic_data("train.csv")
test_data = load_titanic_data("test.csv")


# In[5]:


train_data.head()


# In[6]:


train_data.describe()


# In[7]:


train_data["Survived"].value_counts()


# In[8]:


train_data["Pclass"].value_counts()


# In[9]:


train_data["Sex"].value_counts()


# In[10]:


train_data["Embarked"].value_counts()


# In[11]:


train_data["Parch"].value_counts()


# In[12]:


train_data['Age'].value_counts()


# In[13]:


sns.set(style="darkgrid")
ax = sns.countplot(x="Age", data=train_data)


# In[14]:


train_data['Title'] = train_data['Name'].str.split(", ", expand=True)[1].str.split(".", expand=True)[0]


# In[15]:


test_data['Title'] = test_data['Name'].str.split(", ", expand=True)[1].str.split(".", expand=True)[0]


# In[16]:


train_data["Title"].value_counts()


# In[17]:


from sklearn.base import BaseEstimator, TransformerMixin

# A class to select numerical or categorical columns 
# since Scikit-Learn doesn't handle DataFrames yet
class DataFrameSelector(BaseEstimator, TransformerMixin):
    def __init__(self, attribute_names):
        self.attribute_names = attribute_names
    def fit(self, X, y=None):
        return self
    def transform(self, X):
        return X[self.attribute_names]


# In[18]:


from sklearn.pipeline import Pipeline
from sklearn.preprocessing import Imputer

imputer = Imputer(strategy="median")

num_pipeline = Pipeline([
        ("select_numeric", DataFrameSelector(["Age", "SibSp", "Parch", "Fare"])),
        ("imputer", Imputer(strategy="median")),
    ])


# In[19]:


num_pipeline.fit_transform(train_data)


# In[20]:


num_pipeline.fit_transform(test_data)


# In[21]:


# Inspired from stackoverflow.com/questions/25239958
class MostFrequentImputer(BaseEstimator, TransformerMixin):
    def fit(self, X, y=None):
        self.most_frequent_ = pd.Series([X[c].value_counts().index[0] for c in X],
                                        index=X.columns)
        return self
    def transform(self, X, y=None):
        return X.fillna(self.most_frequent_)


# In[22]:


from sklearn.preprocessing import OneHotEncoder


# In[23]:


cat_pipeline = Pipeline([
        ("select_cat", DataFrameSelector(["Pclass", "Sex", "Embarked"])),
        ("imputer", MostFrequentImputer()),
        ("cat_encoder", OneHotEncoder(sparse=False)),
    ])


# In[24]:


cat_pipeline.fit_transform(train_data)


# In[25]:


cat_pipeline.fit_transform(test_data)


# In[26]:


from sklearn.pipeline import FeatureUnion
preprocess_pipeline = FeatureUnion(transformer_list=[
        ("num_pipeline", num_pipeline),
        ("cat_pipeline", cat_pipeline),
    ])


# In[27]:


X_train = preprocess_pipeline.fit_transform(train_data)
X_train


# In[28]:


Y_test = preprocess_pipeline.fit_transform(test_data)
Y_test


# In[29]:


y_train = train_data["Survived"]



# In[32]:


import tensorflow as tf

n_inputs = 12
n_hidden1 = 300
n_hidden2 = 100
n_outputs = 2


# In[33]:


reset_graph()

X = tf.placeholder(tf.float32, shape=(None, n_inputs), name="X")
y = tf.placeholder(tf.int32, shape=(None), name="y")
training = tf.placeholder_with_default(False, shape=(), name = "traning")
dropout_rate = 0.5
X_drop = tf.layers.dropout(X, dropout_rate,training=training)


# In[34]:


def neuron_layer(X, n_neurons, name, activation=None):
    with tf.name_scope(name):
        n_inputs = int(X.get_shape()[1])
        stddev = 2 / np.sqrt(n_inputs)
        init = tf.truncated_normal((n_inputs, n_neurons), stddev=stddev)
        W = tf.Variable(init, name="kernel")
        b = tf.Variable(tf.zeros([n_neurons]), name="bias")
        Z = tf.matmul(X, W) + b
        
        
        if activation is not None:
            return activation(Z)
        else:
            return Z


# In[36]:


with tf.name_scope("dnn"):
    #hidden1 = neuron_layer(X, n_hidden1, name="hidden1", activation=tf.nn.relu)
    hidden1 = tf.layers.dense(X_drop, n_hidden1, activation=tf.nn.relu, name="hidden1")
    hidden1_drop = tf.layers.dropout(hidden1,dropout_rate, traning=training)
    hidden2 = neuron_layer(hidden1, n_hidden2, name="hidden2",
                           activation=tf.nn.relu)
    
    logits = neuron_layer(hidden2, n_outputs, name="outputs")


# In[37]:


with tf.name_scope("loss"):
    xentropy = tf.nn.sparse_softmax_cross_entropy_with_logits(labels=y,
                                                              logits=logits)
    loss = tf.reduce_mean(xentropy, name="loss")


# In[38]:


learning_rate = 0.01

with tf.name_scope("train"):
    optimizer = tf.train.GradientDescentOptimizer(learning_rate)
    training_op = optimizer.minimize(loss)


# In[39]:


with tf.name_scope("eval"):
    correct = tf.nn.in_top_k(logits, y, 1)
    accuracy = tf.reduce_mean(tf.cast(correct, tf.float32))


# In[40]:


init = tf.global_variables_initializer()
saver = tf.train.Saver()


# In[41]:


n_epochs = 40
batch_size = 50


# In[42]:


def shuffle_batch(X, y, batch_size):
    rnd_idx = np.random.permutation(len(X))
    n_batches = len(X) // batch_size
    for batch_idx in np.array_split(rnd_idx, n_batches):
        X_batch, y_batch = X[batch_idx], y[batch_idx]
        yield X_batch, y_batch


# In[45]:


with tf.Session() as sess:
    init.run()
    for epoch in range(n_epochs):
        for X_batch, y_batch in shuffle_batch(X_train, y_train, batch_size):
            sess.run(training_op, feed_dict={X: X_batch, y: y_batch})
        acc_batch = accuracy.eval(feed_dict={X: X_batch, y: y_batch})
        acc_val = accuracy.eval(feed_dict={X: X_train, y: y_train})
        print(epoch, "Batch accuracy:", acc_batch, "Val accuracy:", acc_val)

    save_path = saver.save(sess, "./my_model_final.ckpt")


# In[ ]:





# In[ ]:




