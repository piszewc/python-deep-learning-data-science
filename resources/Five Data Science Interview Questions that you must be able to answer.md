# Five Data Science Interview Questions that you must be able to answer

In the interest of not failing twice in the same spot and making yourself useful to others, this post of mine is dedicated to people who want to follow their passion of becoming/improving as a Data Scientist. I strongly believe that you must keep giving interviews even if you are not looking for a career change, just because your learn a great deal when you give interviews. There is no faster way of learning. Data Science is a field that requires constant improvement in your skills set, while developing basic concepts in Machine Learning algorithms on a daily basis. So without further ado, let us dive straight into some questions and answers that you might useful in your next interview.

------

Q**uestion 1**: **Can you explain cost function of decision trees?**

**Answer:** Before we answer this question, it is important to note that Decision Trees are versatile Machine Learning algorithms that can perform both classification and regression tasks. Hence their cost functions are also different.

> Cost function for classification type problems:

Gini impurity is an important concept before we can understand cost function, so let me first explain that.

![img](https://miro.medium.com/max/414/1*uskofIdESQhoUNSKGu2tvQ.png)

Equation I: Gini Impurity

where “*p”* is the ratio of class k instances among the training instances at the i*th* node. What does that mean? Let’s understand from an example below. Figure I displays a simple visualization of Iris Decision Tree of depth 2. Top level is the root node. The concept of dividing a training set into a set of decisions is fairly simple in the algorithm. Here, for instance, Iris data set is divided into two subsets based on a single feature called “petal width” at the root node. If petal width is less than or equal to 0.8, then the algorithm goes to depth 1, left. If not, it goes to depth 1, right. Where it further divides instances based on an additional feature of “petal width”. Depth 1, right node has a sample of 100 instances and applies 0 instances to Iris-Setosa, 50 instances to Iris-Versicolor and remaining 50 to Iris-Virginica.

![img](https://miro.medium.com/max/359/1*0LxmW9Q48UEhBm8RWpvaoQ.png)

Figure I: Iris Decision Tree, [Source](http://shop.oreilly.com/product/0636920142874.do)

So this node’s gini impurity is 0.5:

![img](https://miro.medium.com/max/640/1*Apg5HwUghvDsLvfjX5m0PA.png)

Figure II: Gini impurity calculation

Similarly, at depth 1, left node, Gini impurity is zero because all training instances apply to the same class. The node is essentially “pure”.

Now that understand what is Gini impurity, let’s get into the meat of the answer. Decision Trees use Classification and Regression Tree (CART) algorithm for training purposes based on a simple concept that the data set will be split into two subsets using a single feature (k) and threshold (t) . In Iris data set the feature was “petal width” and threshold was 0.8. How does it choose k and t? It searches for the pair (k, t) that produces the purest subsets. So the cost function that the algorithm tries to minimize is given by below equation:

![img](https://miro.medium.com/max/652/1*Ffh3XnDhmzGTth9LsrC2xQ.png)

Equation II: Cost function of a classification type decision tree.

where G left or right represent gini impurity of subsets while m represents instances of the subsets.

> Cost function for regression type problems:

For regression trees, cost function is fairly intuitive. We use Residual Sum of Squares (RSS). Equation III displays cost function of regression type trees, where “y” is ground truth and “y-hat” is the predicted value.

![img](https://miro.medium.com/max/402/1*ID5twl6r5ifyfBzlL-e9DQ.png)

Equation III: Residual Sum of Squares (RSS)

------

Q**uestion II:** **How does collinearity affect your models?**

**Answer:** Collinearity refers to a situation where two or more predictor variables are closely related to one another. Figure 2 below shows as example of collinear variables. Variable 2 strictly follows variable 1 with a Pearson correlation coefficient of 1. So obviously one of these variables will behave like noise when fed into machine learning models.

![img](https://miro.medium.com/max/392/1*x-HaQbqXfi7h3jtLdIgkdA.png)

Figure 2: Example of collinear variables.

The presence of collinearity can become problematic in regression type questions, since it becomes difficult to separate out the individual effects of collinear variables on the response. Or in other words collinearity reduces the accuracy of the estimates of the regression coefficients and results in increase in errors. This will ultimately lead to decline in the *t*-statistic, as a result, in the presence of collinearity we may fail to reject the null hypothesis.

A simple way to detect collinearity is to look at the correlation matrix of the predictor variables. An element of this matrix that is large in absolute value indicates a pair of highly correlated variables, and therefore collinearity problem with the data. Unfortunately not all collinearity problems can be detected by inspection of the correlation matrix: it is possible for the collinearity to exist between three or more variables even if no pair of variables has a particularly high correlation. Such a situation is called *multi-collinearity.* For such cases, instead of inspecting the correlation matrix, a better way to assess multicollinearity is to compute the *variance inflation factor* (VIF). The VIF for each variable can be computed using the formula:

![img](https://miro.medium.com/max/420/1*Zf56hzbPokEvGpgyRm14rQ.png)

Equation IV: The Variance Inflation Factor (VIF)

Where R-square term is the regression of variable *X,* onto all of the other predictors. If VIF is close to or more than one then collinearity is present. When faced with the problem of collinearity there are two possible solutions. One is to drop the redundant variable. This can be done without compromising the regression fit. The second solution is to combine the collinear variables together into a single predictor.

------

Q**uestion III:** **How will you explain deep neural network to a layman?**

**Answer:** The idea of Neural Network (NN) originally stemmed from human brain that is designed to identify patterns. NN is a set of algorithms that interpret sensory data through machine perception, labeling and clustering raw input data. Any type of real world data, be it images, text, sound or even time series data must be converted into a vector space containing numbers.

The word “deep” in deep neural network means that the neural network consists of multiple layers. These layers are made of nodes where computation takes place. An analogy of node is a neuron in human brain which fires when it encounters sufficient stimuli. A node combines data from the raw input with their coefficients or weights that either dampen or amplify that input based on the weight. The product of input and weight is then summed at the summation node shown below in Fig. 3, which is then passed on to the activation function which determines whether and to what extend that signal should progress further through the network to affect the ultimate outcome. A node layer is a row of such neuron-like switches that turn on or off as the input is fed through the network.

![img](https://miro.medium.com/max/1770/1*Tyc7UJGctvaLBQ-nKcMR9Q.png)

Figure 3: An example of node visualization in neural network.

Deep neural networks differs from earlier version of neural networks such as perceptrons because they were shallow and simply consisted of input and output layer along with one hidden layer.

![img](https://miro.medium.com/max/278/1*Bd5fdZLyP4o3E4hM4hii4g.png)

Figure 4: Deep neural network consists of more than one hidden layer.

------

Q**uestion IV:** **What would be a 3-minute pitch for your data science take home project?**

**Answer:** A typical data science interview process starts with a take home data analysis project. I have taken two of those and time span may vary depending on the complexity of the take home project. First time, I was given two days to solve a problem using machine learning along with an executive summary. While the second time I was given two weeks to solve a problem. It is needless to point out that second time it was a much harder problem where I was dealing with class imbalanced data set. So 3-minutes sales pitch type interview question allows you to showcase your grasp of the problem at hand. Please be sure to start with what is your interpretation of the problem; your brief approach to solving the problem; what types of machine learning models did you use in your approach and why? And close this by boasting about the accuracy of your models.

I believe that this is a very important question during your interview that enables you to prove that you are a leader in Data Science field and can solve a complex problem with the latest and greatest tools at your disposal.

------

Q**uestion V: What do you mean by model regularization and how will you achieve regularization in linear models?**

**Answer:** Regularization is a term used for constraining your machine learning model. One good way to constrain or reduce overfitting in machine learning models is to have fewer degrees of freedom. With fewer degrees of freedom, it gets harder for the model to overfit the data. For example, a simple way to regularize a polynomial model is to reduce the number of polynomial degrees of freedom. However, for linear models, regularization is typically achieved by constraining the weights of the model. So, instead of linear regression, Ridge regression, Lasso Regression and Elastic Net models have three different ways to constraint the weights. For the sake of completeness, lets start with the definition of linear regression first:

![img](https://miro.medium.com/max/610/1*0b0PW5cFtOWKJrNRWrZsQA.png)

Equation V: Linear regression and model prediction

- y-hat is the predicted value.
- *n* is the number of features.
- x_i is the nth feature value.
- Theta is the model parameter or also known as feature weights.

Mean Square Error cost function for a Linear Regression model is defined as:

![img](https://miro.medium.com/max/710/1*eNtVMd_ME7Q--g012lAcLA.png)

Equation VI: Linear regression cost function.

Where thetaT is the transpose of theta (a row vector instead of column vector).

**Ridge Regression:** Is a regularized version of Linear Regression, i.e., an additional regularization term is added to the cost function. This forces the learning algorithms to not only fit the data but also keep the model weights as small as possible. Note that the regularization term should only be added to the cost function during training. Once the model is trained, you want to evaluate the model’s performance using the unregularized performance measure.

![img](https://miro.medium.com/max/566/1*F-DXkJ6ckGv1m2r6CHf5bg.png)

Equation VII: Ridge regression cost function.

The hyperparameter alpha controls how much you want to regularize the model. If alpha is zero, then ridge regression is just linear regression.

**Lasso Regression:** Least Absolute Shrinkage and Selection Operator Regression (simple called Lasso Regression) is another regularized version of Linear Regression: Just like the Ridge Regression, it adds a regularization term to the cost function, but it uses the L1 norm of the weight vector instead of half the square of the L2 norm .

![img](https://miro.medium.com/max/516/1*avZ_-GmJQL2CHRIHH0ujOw.png)

Equation VIII: Lasso Regression cost function.

An important characteristic of Lasso Regression is that it tends to completely eliminate the weights of the least important features (i.e., set them to zero). In other words, Lasso Regression automatically performs feature selection and outputs a sparse model (i.e., with a few non-zero feature weights).

**Elastic Net Regression:** This is a middle ground between Ridge and Lasso regression. The regularization term is a simple mix of both Ridge and Lasso’s regularization term and can be controlled with “r”. When r=0, Elastic Net is equivalent to Ridge Regression, and when r=1, it is equivalent to Lasso Regression.

![img](https://miro.medium.com/max/820/1*ba2eE3xfNPbFmUYwpz8hsw.png)

Equation IX: Elastic Net cost function.

It is always preferable to have at least a little bit of regularization and generally plain linear regression should always be avoided. Ridge is a good default, but if only a few features are useful in a particular data set, then Lasso should be used. In general, Elastic Net is preferred over Lasso since Lasso may behave erratically when the number of features is greater than the number of instances or when several features are strongly correlated.

------

In this article I have discussed five questions that I personally faced during a technical data science interview, which I thought could have been better. I highly recommend the following resources to read to hone your basic concepts on a daily basis. Believe me, I must have read these concepts over and over again, and yet I fumbled upon them during my interview.

If you enjoyed reading the article please don’t forget to upvote it!