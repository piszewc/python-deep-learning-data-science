### Problem 1-1

The ONLY thing we are interested in when designing programs is that it returns the correct answer.

​	False correct

### Problem 1-2

When determining asymptotic complexity, we discard all terms except for the one with the largest growth rate.

​	True correct

### Problem 1-3

Bisection search is an example of linear time complexity

​	False correct

### Problem 1-4

For large values of `n`, an algorithm that takes `20000n^2` steps has better time complexity (takes less time) than one that takes `0.001n^5` steps

​	True correct

### Problem 2-1

Indirection, as talked about in lecture, means you have to traverse the list more than once.

​	False correct

### Problem 2-2

The complexity of binary search on a sorted list of *n* items is O(logn).

​	True correct

### Problem 2-3

The worst case time complexity for selection sort is O(n2).

​	True correct

### Problem 2-4

The base case for the recursive version of merge sort from lecture is checking ONLY for the list being empty.

​	False correct

### Problem 3


For each of the following expressions, select the order of growth class that best describes it from the following list: O(1),O(log(n)),O(n),O(nlog(n)),O(nc) or O(cn). Assume c is some constant.

Clicking Check will grade ALL the sub-problems. You have 2 attempts for this problem.

1. 0.0000001n+1000000

   **O(n)** correct

2. 0.0001n2+20000n−90000

   **O(n^c)** correct

3. 20n+900log(n)+100000

   **O(n)** correct

4. (log(n))2+5n7

   **O(n^c)** correct

5. n200−2n30

   **O(n^c)** correct

6. 30n2+nlog(n)

   **O(n^c)** correct

7. nlog(n)−3000n

   **O(n log(n))** correct

8. 3

   **O(1)**  correct

9. 5n+n5+n+5

   **O(c^n)** correct

10. nlog(n)+n2+n+logn+1+2n

    **O(c^n)** correct

### Problem 4-1

Consider the following Python procedure. Specify its order of growth.

**O(1)**  

### Problem 4-2

Consider the following Python procedure. Specify its order of growth.

**O(len(n))**

### Problem 4-3

Consider the following Python procedure. Specify its order of growth.

**??  O(len(n))**

### Problem 4-4

Consider the following Python procedure. Specify its order of growth.

O(n)

### Problem 4-5

Consider the following Python procedure. Specify its order of growth.

O(n^2)

### Problem 5

You have 2 attempts for this problem.

Here is code for linear search that uses the fact that a set of elements is sorted in increasing order:

```
def search(L, e):
    for i in range(len(L)):
        if L[i] == e:
            return True
        if L[i] > e:
            return False
    return False
 
    
```

Consider the following code, which is an alternative version of `search`.

```
def newsearch(L, e):
    size = len(L)
    for i in range(size):
        if L[size-i-1] == e:
            return True
        if L[i] < e:
            return False
    return False

    
```

Which of the following statements is correct? You may assume that each function is tested with a list `L` whose elements are sorted in increasing order; for simplicity, assume `L` is a list of positive integers.

**- search and `newsearch` return the same answers for lists `L` of length 0, 1, or 2. correct**

### Problem 6-1

Answer the questions below based on the following sorting function. If it helps, you may paste the code in your programming environment. Study the output to make sure you understand the way it sorts.

```
def swapSort(L): 
    """ L is a list on integers """
    print("Original L: ", L)
    for i in range(len(L)):
        for j in range(i+1, len(L)):
            if L[j] < L[i]:
                # the next line is a short 
                # form for swap L[i] and L[j]
                L[j], L[i] = L[i], L[j] 
                print(L)
    print("Final L: ", L)
    
```

Does this function sort the list in increasing or decreasing order? (items at lower indices being smaller means it sorts in increasing order, and vice versa)

**Increasing correct**  