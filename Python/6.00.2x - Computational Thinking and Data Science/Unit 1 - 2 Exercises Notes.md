Exercise 1

6/6 points (graded)

As a burgler robs a house, she finds the following items:

- Dirt -     Weight: 4, Value: 0
- Computer     - Weight: 10, Value: 30
- Fork -     Weight: 5, Value: 1
- Problem Set - Weight: 0, Value: -10

This time, she can only carry a weight of 14, and wishes to maximize the value to weight ratio of the things she carries. She employs three different metrics in an attempt to do this, and writes an algorithm in Python to determine which loot to take.

The algorithm works as follows:

1. Evaluate     the metric of each item. Each metric returns a numerical value for each     item.
2. For each item, from highest metric value to     lowest, add the item if there is room in the bag.

Describe the heuristic that each of the following 3 metrics uses, and choose the result of running the algorithm with each metric.

1. Metric 1:

```
def metric1(item):
return item.getValue() / item.getWeight()
```



Which heuristic does Metric 1 employ?

​	Choose the lightest object first.

​	Choose the most valuable object first.

​	**Choose the item with the best value to weight ratio first.**



What will be the result of running the burgler's algorithm with Metric 1?

​	The algorithm runs and returns the optimal solution.

​	The algorithm runs and returns a non-optimal solution.

​	**The algorithm does not run.**



Metric 2:

```
def metric2(item):
return -item.getWeight()
```



Which heuristic does Metric 2 employ?

​	**Choose the lightest object first.**

​	Choose the most valuable object first.

​	Choose the item with the best value to weight ratio first.



What will be the result of running the burgler's algorithm with Metric 2?

​	The algorithm runs and returns the optimal solution.

​	**The algorithm runs and returns a non-optimal solution.**

​	The algorithm does not run.



Metric 3:

```
def metric3(item):
return item.getValue()
```



Which heuristic does Metric 3 employ?

​	Choose the lightest object first.

​	**Choose the most valuable object first.**

​	Choose the item with the best value to weight ratio first.



What will be the result of running the burgler's algorithm with Metric 3?

​	The algorithm runs and returns the optimal solution.

​	**The algorithm runs and returns a non-optimal solution.**

​	The algorithm does not run.



For Metric 1, the Problem Set will give a ZeroDivisionError.
For Metric 2, the negative sign indicates that we pick lighter objects.
For Metric 3, it will take the computer, the problem set, and the dirt because it has room for these three. However, taking the problem set will decrease the value.

-------------------------------

Exercise 2

6/6 points (graded)

Please help the burglar out! For each of the following greedy metrics, what should be the burglar's first two choices of items? Here's a table of the items from the slides:

| **item** | **$** | **kg** | **$/kg** |
| -------- | ----- | ------ | -------- |
|          |       |        |          |
| clock    | 175   | 10     | 17.5     |
| picture  | 90    | 9      | 10       |
| radio    | 20    | 4      | 5        |
| vase     | 50    | 2      | 25       |
| book     | 10    | 1      | 10       |
| computer | 200   | 20     | 10       |

For this problem, assume that the maximum weight the burglar can carry is 20.

**1.  Metric: max value

The burglar should first pick:

​	**computer**

and should next pick:

​	**no more space**



**2.  Metric: min weight

The burglar should first pick:

​	**book**

and should next pick:

​	**vase**



**3.  Metric: max value/weight ratio

The burglar should first pick:

​	**vase**

and should next pick:

​	**clock**

----------------

Exercise 3

3/3 points (graded)

For these questions, you'll be asked to give the big-O upper bound runtime for some Python functions. In your answer, please omit the "O( )" portion of the answer and simply write a mathematical expression.

Use +, -, / signs to indicate addition, subtraction, and division. Explicitly indicate multiplication with a * (ie say "6*n" rather than "6n"). Indicate exponentiation with a caret (^) (ie "n^4" for n4). Indicate base-2 logarithms with the word log2 followed by parenthesis (ie "log2(n)").

What this all means is if an answer is, for example, O(n4), please simply write "n^4" in the box.

1. What is the big-O upper bound     runtime for the function look_for_things, where *n* is defined as the     number of elements in myList?

```
NUMBER = 3
def look_for_things(myList):
    """Looks at all elements"""
    for n in myList:
        if n == NUMBER:
            return True
    return False
```

​	**n**

2. What is the big-O upper bound runtime for the function `look_for_other_things`, where *n* is defined as the number of elements in `myList`?

```
NUMBER = 3
def look_for_other_things(myList):
    """Looks at all pairs of elements"""
    for n in myList:
        for m in myList:
            if n - m == NUMBER or m - n == NUMBER:
                return True
    return False
```

​	**n^2**

3. What is the big-O upper bound runtime for the function `look_for_all_the_things`, where *n* is defined as the number of elements in `myList`?

   You do not need to account for the runtime of `get_all_subsets`; the code is provided so you can see how many subsets it generates, as that **will** be a factor in your answer.

```
def get_all_subsets(some_list):
    """Returns all subsets of size 0 - len(some_list) for some_list"""
    if len(some_list) == 0:
        # If the list is empty, return the empty list
        return [[]]
    subsets = []
    first_elt = some_list[0]
    rest_list = some_list[1:]
    # Strategy: Get all the subsets of rest_list; for each
    # of those subsets, a full subset list will contain both
    # the original subset as well as a version of the subset
    # that contains first_elt
    for partial_subset in get_all_subsets(rest_list):
        subsets.append(partial_subset)
        next_subset = partial_subset[:] + [first_elt]
        subsets.append(next_subset)
    return subsets

NUMBER = 3
def look_for_all_the_things(myList):
    """Looks at all subsets of this list"""
    # Make subsets
    all_subsets = get_all_subsets(myList)
    for subset in all_subsets:
        if sum(subset) == NUMBER:
            return True
    return False
```

​	**2^n**

**Explanation:**

The point of this exercise was to get you thinking about the complexity of functions, specifically the complexity of different ways to enumerate items. Keep these complexities in mind as you continue throughout this lecture sequence. It might sound great to always get the very best solution by enumerating all possible choices - but the downside to this approach is the terribly high complexity!

O(2n) is the complexity for the final question because we are enumerating all possible subsets of a set, known as the "power set" of a set. We will talk about power sets more in the next videos. Technically, the complexity is actually O(n⋅2n) because the sum() is O(n), but 2n is already large enough that we can ignore the n multiplier.

----------------

Exercise 1

10.0/10.0 points (graded)

Here is the [lecture from 6.00.1x on generators](https://www.youtube.com/watch?v=BLWn90kEYMk). Additionally, you can also take a look at Chapter 8.3 in the textbook.

For the following problem, consider the following way to write a power set generator. The number of possible combinations to put n items into one bag is 2n. Here, items is a Python list. If need be, also check out the [docs on bitwise operators](https://wiki.python.org/moin/BitwiseOperators) (<<, >>, &, |, ~, ^).

```
# generate all combinations of N items
def powerSet(items):
    N = len(items)
    # enumerate the 2**N possible combinations
    for i in range(2**N):
        combo = []
        for j in range(N):
            # test bit jth of integer i
            if (i >> j) % 2 == 1:
                combo.append(items[j])
        yield combo
```

As above, suppose we have a generator that returns every combination of objects in one bag. We can represent this as a list of 1s and 0s denoting whether each item is in the bag or not.

Write a generator that returns every arrangement of items such that each is in one or none of two different bags. Each combination should be given as a tuple of two lists, the first being the items in bag1, and the second being the items in bag2.

```
def yieldAllCombos(items):
    """
      Generates all combinations of N items into two bags, whereby each 
      item is in one or zero bags.

      Yields a tuple, (bag1, bag2), where each bag is represented as 
      a list of which item(s) are in each bag.
    """
```

Note this generator should be pretty similar to the powerSet generator above.

We mentioned that the number of possible combinations for N items into one bag is 2n. How many possible combinations exist when there are two bags? Think about this for a few minutes, then click the following hint to confirm if your guess is correct. Remember that a given item can only be in bag1, bag2, or neither bag -- it is not possible for an item to be present in both bags!

def yieldAllCombos(items):
    """
        Generates all combinations of N items into two bags, whereby each 
        item is in one or zero bags.

        Yields a tuple, (bag1, bag2), where each bag is represented as a list 
        of which item(s) are in each bag.
    """
    N = len(items)
    # enumerate the 3**N possible combinations
    for i in range(3**N):
        bag_one = []
        bag_two = []
        for j in range(N):
            # test bit jth of integer i
            if (i // (3 ** j)) % 3 == 1:
                bag_one.append(items[j])
            if (i // (3 ** j)) % 3 == 2:
                bag_two.append(items[j])
        yield bag_one, bag_two
-----------------

Exercise 2

4/4 points (graded)

1. Dynamic     programming can be used to solve optimization problems where the size of     the space of possible solutions is exponentially large.

   **True**

   False

2. Dynamic     programming can be used to find an approximate solution to an optimization     problem, but cannot be used to find a solution that is guaranteed to be     optimal.

   True

   **False**

3. Recall     that sorting a list of integers can take O(nlogn) using an algorithm     like merge sort. Dynamic programming can be used to reduce the order of     algorithmic complexity of sorting a list of integers to something below     nlogn, where n is the length of the list to be sorted.

   True

   **False**

4. Problem:     I need to go up a flight of N stairs. I can either go     up 1 or 2 steps every time. How many different ways are there for me to     traverse these steps? For example:

```
3 steps -> could be 1,1,1 or 1,2 or 2,1
4 steps -> could be 1,1,1,1 or 1,1,2 or 1,2,1 or 2,1,1 or 2,2
5 steps -> could be 1,1,1,1,1 or 1,1,1,2 or 1,1,2,1 or 1,2,1,1 or 2,1,1,1 or 2,2,1 or 1,2,2 or 2,1,2
```

Does this problem have optimal substructure and overlapping subproblems?

​	**It has optimal substructure and overlapping subproblems**

​	It doe not have optimal substructure and does not have overlapping subproblems

​	It has optimal substructure and does not have overlapping subproblems

​	It does not have optimal substructure and it has overlapping subproblems

**Explanation to #4:**

​	Optimal substructure: "Optimal solution" in this case is the number of possible ways of traversing k steps -- it’s a somewhat trivial sense of “optimal”, with one good (correct) answer and infinite bad (incorrect) answers. But we can indeed figure out the solution for k+1 or k+2 steps using the solution to k.

​	Overlapping subproblems: Say there are 8 steps. The solution for 5 steps is required at least three times, as you can do [1,1,1] or [1,2] or [2,1] to reduce the solution to 5 steps.

Exercise 1

2/2 points (graded)

We often use graphs to simplify optimization problems, as they are easy implement on a computer.

The following concepts can be illustrated with a graph. Determine which variables should be represented by edges and vertices in this graph.

​	**1.**  **A school's course catalog**

Some classes must occur at least one semester before certain other classes (e.g., Calculus I must be taken before Calculus II), but not all classes have prerequisites.

If we want to represent the catalog as a graph, which variables should be represented as edges and vertices?

​	A) Each edge is a class, while different vertices indicate the semester the class is taken.

​	**B) Each vertex is a class, while a directional edge indicates that one class must come before another.**

​	C) Each vertex is a class, while edges between two vertices indicate that the classes may be taken at the same time.

**Explanation:**

A) does not make sense in general. An edge connecting two vertices would indicate that a class is taken in two semesters.

B) is correct. An edge pointing from one class to another implies that the source of the edge is a prerequisite.

C) does not offer any indication of which class is required before another.

**2.**  **Students in a line**

Second graders are lining up to go to their next class, but must be ordered alphabetically before they can leave. The teacher only swaps the positions of two students that are next to each other in line.

If we want to represent this situation as a graph, which variables should be represented as edges and vertices?

​	**A) Vertices represent permutations of the students in line. Edges connect two permutations if one can be made into the other by swapping two adjacent students.**

​	B) Vertices represent students. Edges connect two students if they are next to each other in line.

​	C) Vertices represent permutations of the students, and each edge represents an individual student. An edge connects two vertices if that student is involved in swap between the two permutations.

**Explanation:**

A) is correct. Travelling from one vertex to another through an edge represents a legal move.

B) only offers information relevant to the current state of the line. There is no information regarding how the line can change.

C) does not make sense to implement. Multiple edges would have to connect every vertex, and many edges would be needed to fully represent a single child.

----------------

Exercise 2

10.0/10.0 points (graded)

Consider our representation of permutations of students in a line from Exercise 1. (The teacher only swaps the positions of two students that are next to each other in line.) Let's consider a line of three students, Alice, Bob, and Carol (denoted A, B, and C). Using the Graph class created in the lecture, we can create a graph with the design chosen in Exercise 1: vertices represent permutations of the students in line; edges connect two permutations if one can be made into the other by swapping two adjacent students.

We construct our graph by first adding the following nodes:

```
nodes = []
nodes.append(Node("ABC")) # nodes[0]
nodes.append(Node("ACB")) # nodes[1]
nodes.append(Node("BAC")) # nodes[2]
nodes.append(Node("BCA")) # nodes[3]
nodes.append(Node("CAB")) # nodes[4]
nodes.append(Node("CBA")) # nodes[5]

g = Graph()
for n in nodes:
    g.addNode(n)
```

Add the appropriate edges to the graph.

```
# Write the code that adds the appropriate edges to the graph
# in this box.
nodes = []
nodes.append(Node("ABC")) # nodes[0]
nodes.append(Node("ACB")) # nodes[1]
nodes.append(Node("BAC")) # nodes[2]
nodes.append(Node("BCA")) # nodes[3]
nodes.append(Node("CAB")) # nodes[4]
nodes.append(Node("CBA")) # nodes[5]

g = Graph()
for n in nodes:
    g.addNode(n)
    
g.addEdge(Edge(g.getNode('ABC'), g.getNode('ACB')))
g.addEdge(Edge(g.getNode('ABC'), g.getNode('BAC')))
g.addEdge(Edge(g.getNode('ACB'), g.getNode('CAB')))
g.addEdge(Edge(g.getNode('BAC'), g.getNode('BCA')))
g.addEdge(Edge(g.getNode('BCA'), g.getNode('CBA')))
g.addEdge(Edge(g.getNode('CAB'), g.getNode('CBA')))
```

 

----------------

Exercise 3

4/4 points (graded)

1. For questions 1 and 2, consider our previous problem (permutations of 3 students in a line).

   When represented as a tree, each node will have how many children?

   **2** 

   **Explanation:**

   From each permutation, there are two possible swaps (Students 1st and 2nd in line, and Students 2nd and 3rd in line).

2. Given two permutations, what is     the maximum number of swaps it will take to reach one from the other?

    **3** 

   **Explanation:**

   We can label the permutations a through f and construct a graph as such:

   ```
   a <--> b <--> c <--> d <--> e <--> f <--> a
   ```

   Clearly, it takes a maximum of 3 movements along edges to get from any node to another.
   The maximum number of permutations happens when we go from ABC to CBA. We have to go ABC -> BAC -> BCA -> CBA.

3. For questions 3 and 4, consider the general case of our previous problem (permutations of *n* students in a line). Give your answer in terms of *n*.

   When represented as a tree, each node will have how many children?

   **n-1**

   **Explanation:**

   In any given permutation, *n* students are lined up. Since one may only swap the positions of two adjacent students, there are exactly n−1 pairs we are able to swap. Each of these swaps will create a distinct ordering, so there are exactly n−1 childern of each node.

   

4. Given two permutations, what is the maximum number of swaps it will take to reach one from the other?

​	**n* ((n-1)/2)**

​	**Explanation:**

​	Answer: n⋅n−12

​	Consider the case where the two permutations whose exchange would take the maximum number of swaps. Clearly these are two whose orders are opposite. It takes n−1 swaps to move the last person in line to the first position. This leaves the rest of the line's old order intact.

​	Next it takes n−2 swaps to move the last person in line to the second position. We continue until only one more swap is needed (switching the last two people in line). This takes (n−1)+(n−2)+...+2+1=n⋅n−12 swaps.

​	Reminder: You do not lose points for trying a problem multiple times, nor do you lose points if you hit "Show Answer". If this problem has you stumped after you've tried it a few times, feel free to reveal the solution.

--------------------

Exercise 4

7/7 points (graded)

Consider our continuing problem of permutations of three students in a line. Use the enumeration we established when adding the nodes to our graph. That is,

```
nodes = []
nodes.append(Node("ABC")) # nodes[0]
nodes.append(Node("ACB")) # nodes[1]
nodes.append(Node("BAC")) # nodes[2]
nodes.append(Node("BCA")) # nodes[3]
nodes.append(Node("CAB")) # nodes[4]
nodes.append(Node("CBA")) # nodes[5]
```

so that ABC is Node 0, BCA is Node 3, etc.

Using Depth First Search, and beginning at the listed source nodes, give the first path found to the listed destination nodes. For the purpose of this exercise, assume DFS prioritizes lower numbered nodes. For example, if Node 2 is connected to Nodes 3 and 4, the first path checked will be 23. Additionally, DFS will never return to a node already in its path.

To denote a path, simply list the numbers of the nodes exactly as done in the lecture.

You can never go wrong with drawing a picture of the problem. Here is one possible visualization. The possible permutations are denoted in the graph below. From each node, you can choose to go in either direction. In this particular depth-first-search problem, you will choose the lower numbered node over the higher numbered one, even if it will lead to a longer path from the source to the destination.

![img](https://courses.edx.org/assets/courseware/v1/0cc1a7fc9161594df8ae57529a09849b/asset-v1:MITx+6.00.2x+1T2020+type@asset+block/l9p4.png)

1. Source: 0

Destination: 4

 **014**

2. Source: 4

Destination: 1

 **41**

3. Source: 1

Destination: 1

 **1**

4. Source: 2

Destination: 4

 **2014**

5. Source: 2

Destination: 3

 **201453**

6. Source: 3

Destination: 1

 **3201**

We saw before that for permutations of 3 people in line, any two nodes are at most three edges, or four nodes, away. But DFS has yielded paths longer than three edges! In this graph, given a random source and a random destination, what is the probability of DFS finding a path of the shortest possible length?

 **4/6**

**Explanation:**

First, realize that the structure of this graph is a set of six nodes, all connected in a circle. Each node has two edges that connect it to adjacent nodes.

Given any node, we know that DFS will prioritize the lower-numbered neighbor. Thus, for any destination, we first check for paths along this side. If our destination is our source, we terminate the DFS, and return a path of length zero, which is clearly the shortest. Otherwise, we continue in a circle in one direction. We cannot change direction once we have begun to traverse the circle, as the path may not include any node more than once. It will have found the shortest path for the nodes that are 0, 1, 2, or 3 edges away, but will yield paths of length 4 and 5 for the last two nodes that are, in reality, 2 and 1 edges away, respectively. As it has found the shortest path for 4 nodes, but not for 2, the probability is 4 in 6, or 2/3.

----------------

Exercise 5

5/5 points (graded)

**Challenge Problem!** This problem is difficult and may stump you, but we include it because it is very interesting, especially for those who are more mathematically inclined.

Don't worry if you can't get all the math behind it, and don't get discouraged. Remember that you do not lose points for trying a problem multiple times, nor do you lose points if you hit "Show Answer". If this problem has you stumped after you've tried it, feel free to reveal the solution and read our explanations.

In the following examples, assume all graphs are undirected. That is, an edge from A to B is the same as an edge from B to A and counts as exactly one edge.

A **clique** is an unweighted graph where each node connects to all other nodes. We denote the clique with n nodes as **KN**. Answer the following questions in terms of n.

1. How many edges are in **KN**?

   **n* ((n-1)/2)**

**Explanation:**

Answer: n⋅(n−1)/2

In a directed graph, each node would connect to all other nodes, yielding n⋅(n−1) edges. In our undirected graph, an edge from A to B and from B to A are the same edge, so there are, in fact, half as many.

Alternatively - if you are familiar with the [binomial coefficient](http://en.wikipedia.org/wiki/Binomial_coefficient) - see that for each edge, you must choose two nodes to connect. Thus there are

(n2)=n⋅(n−1)/2

edges.

2. Consider the new version of DFS. This traverses paths until all non-circular paths from the source to the destination have been found, and returns the shortest one.

   Let A be the source node, and B be the destination in **KN**. How many paths of length 2 exist from A to B?

   **n-2**

**Explanation:**

Answer: n−2

We have a source A and a destination B. Paths of length 2 contain exactly three three nodes. We must select one more node to place in the middle of our path. As we cannot select the A or B, we are left with N - 2 choices to construct a path.

3. How many paths of length 3 exist from A to B?

   **(n - 2) * (n - 3)**

**Explanation:**

Answer: (n−2)⋅(n−3)

Use the same reasoning as used for the previous problem. After knowing our source and destination, we must travel through 2 additional nodes without touching any node twice. For the first node, we have n−2 choices, and for the second, we have n−3 choices.

Note that this is equivalent to (n−2)!(n−4)!

4. Continuing the logic used above, calculate the number of paths of length m from A to B, where 1≤m≤(n−1), and write this number as a ratio of factorials.

   To indicate a factorial, please enter `fact(n)` to mean n!; `fact(n+2)` to mean (n+2)!, etc.

   **fact(n - 2)/fact(n - m - 1)**

**Explanation:**

Answer: (n−2)!(n−m−1)!

Following the previous problems, it is clear that in choosing our first node between A and B, we have (n−2) choices. Similarly, in choosing the second, we have (n−3) choices.

In fact, in choosing the *j*th node, we have (n−j−1) choices. Taking the product from *j* = 1 to *m* - 1 (since *m - 1* nodes exist between A and B in a path of length *m*), we get (n−2)!(n−m−1)!

5. Using the fact that for any *n*, ◀+▶≤efor alln, where e is some constant, determine the asymptotic bound on the number of paths explored by DFS. For simplicity, write O(n) as just n, O(n2) as n^2, etc.

   **fact(n - 2)**

**Explanation:**

Answer: O((n−2)!)

Note that DFS will traverse every path from A to B. To calculate the number of paths, we must sum the paths of every length (from 1 to n−1). This sum can be written as:

(n−2)!(n−2)!+(n−2)!(n−3)!+(n−2)!(n−4)!+…+(n−2)!0!

This is equal to (n−2)!⋅(10!+11!+12!+13!+...+1(n−2)!).

Since (10!+11!+12!+13!+...+1(n−2)!)≤e, which is a constant, the number of paths is O((n−2)!).

-------

Exercise 6

5/5 points (graded)

In the following examples, assume all graphs are undirected. That is, an edge from A to B is the same as an edge from B to A and counts as exactly one edge.

A **clique** is an unweighted graph where each node connects to all other nodes. We denote the clique with n nodes as **KN**. Answer the following questions in terms of n.

1. What is the asymptotic worst-case runtime of a Breadth First Search on KN? For simplicity, write O(n) as just n, O(n2) as n^2, etc.

   **n**

**Explanation:**

Answer: O(n)

BFS begins by checking all the paths of length 1. In its worst case, it must check the paths to every node from the source to find the destination. This is at most, n−1 checks.

2. BFS will always run faster than DFS.

   **False**

**Explanation:**

Consider a graph of two nodes, A and B, connected by an edge. You wish to search for a path from A to B. As there is exactly one edge in the graph, and exactly one path from A to B, both run in an equal number of steps.

3. If a BFS and DFS prioritize the same nodes (e.g., both always choose to explore the lower numbered node first), BFS will always run at least as fast as DFS when run on two nodes in KN.

   **TRUE**

**Explanation:**

As seen in our previous problems in this lecture sequence, BFS checks at most n−1 paths in KN, and DFS always checks O((n−2)!) paths. If given the same node prioritization, both will first find the desired node in the same number of steps.

5. If a BFS and Shortest Path DFS prioritize the same nodes (e.g., both always choose to explore the lower numbered node first), BFS will always run at least as fast as Shortest Path DFS when run on two nodes in any connected unweighted graph.

   **TRUE**

**Explanation:**

While Shortest Path DFS may find the desired node first in this case, it still must explore all other paths before it has determined which path is the fastest. BFS will explore only a fraction of the paths.

5. Regardless of node priority, BFS will always run at least as fast as Shortest Path DFS on two nodes in any connected unweighted graph.

   **TRUE**

**Explanation:**

Shortest Path DFS must always explore every path from the source to the destination to ensure that it has found the shortest path. Once BFS has found a path, it knows that it is the shortest, and does not have to explore any other paths.

-------------------

### Exercise 7

10.0/10.0 points (graded)

Consider once again our permutations of students in a line. Recall the nodes in the graph represent permutations, and that the edges represent swaps of adjacent students. We want to design a weighted graph, weighting edges higher for moves that are harder to make. Which of these could be easily implemented by simply assigning weights to the edges already in the graph?

​	**A) A large student who is difficult to move around in line.**

​	**B) A sticky spot on the floor which is difficult to move onto and off of.**

​	C) A student who resists movement to the back of the line, but accepts movement toward the front.

Write a `WeightedEdge` class that extends `Edge`. Its constructor requires a weight parameter, as well as the parameters from Edge. You should additionally include a `getWeight` method. The string value of a `WeightedEdge` from node A to B with a weight of 3 should be "A->B (3)".

```
class WeightedEdge(Edge):
    def __init__(self, src, dest, weight):
        # Your code here
        pass
    def getWeight(self):
        # Your code here
        pass
    def __str__(self):
        # Your code here
        pass
```

```
class WeightedEdge(Edge):
    def __init__(self, src, dest, weight):
        Edge.__init__(self, src, dest)
        self.weight = weight
    def getWeight(self):
        return self.weight
    def __str__(self):
        return str(self.src) +"->"+ str(self.dest) + " ("+str(self.weight)+")"
```

----------------------

Exercise 1-1

6/6 points (graded)

For the following explanations of different types of programmatic models, fill in the blank with the appropriate model the definition describes.

1. A ______ model is one whose behavior is entirely predictable. Every set of variable states is uniquely determined by parameters in the model and by sets of previous states of these variables. Therefore, these models perform the same way for a given set of initial conditions, and it is possible to predict precisely what will happen.

 **deterministic**

1. A ________ model is one in which randomness is present, and variable states are not described by unique values, but rather by probability distributions. The behavior of this model cannot be entirely predicted.

 **stochastic**

1. A _______ model does not account for the element of time. In this type of model, a simulation will give us a snapshot at a single point in time.

 **static**

1. A _______ model does account for the element of time. This type of model often contains state variables that change over time.

 **dynamic**

1. A _______ model does not take into account the function of time. The state variables change only at a countable number of points in time, abruptly from one state to another.

 **discrete**

1. A ______ model does take into account the function of time, typically by modelling a function f(t) and the changes reflected over time intervals. The state variables change in an unbroken way through an infinite number of states.

 **continuous**

Exercise 1-2

3/3 points (graded)

If you are using differential equations to model a simulation, are you more likely to be doing a discrete or continuous model?

​	Discrete

​	**Continuous**

Let's say you run a stochastic simulation 100 times. How many times do you need to run the simulation again to get the same result?

​	1 time

​	99 times

​	100 times

​	101 times

​	All of the above will give you the same result.

​	**None will necessarily give you the same result.**

Which modelling system would be best to model a bank account?

​	Discrete

​	Continuous

​	**Either discrete or continuous would work, depending on the specifics of the model you wish to use.**

--------

### Exercise 2

5.0/5.0 points (graded)

This problem asks you to write a short function that uses the the [random module](http://docs.python.org/3/library/random.html). Click on the above link to be taken to the Python docs on the random module, where you can see all sorts of cool functions the module provides.

The random module has many useful functions - play around with them in your interpreter to see how much you can do! To test this code yourself, put the line `import random` at the top of your code file, to import all of the functions in the random module. To call random module methods, preface them with `random.`, as in this sample interpreter session:

```
>>> import random
>>> random.randint(1, 5)
4
>>> random.choice(['apple', 'banana', 'cat'])
'cat'
```

How would you randomly generate an even number `x, 0 <= x < 100`? Fill out the definition for the function `genEven()`. Please generate a uniform distribution over the even numbers between 0 and 100 (not including 100).

import random
def genEven():
    '''
    Returns a random even number x, where 0 <= x < 100
    '''
    return random.randrange(0,100,2)

### Exercise 3-1

5.0/5.0 points (graded)

Write a deterministic program, `deterministicNumber`, that returns an even number between 9 and 21.

```
import random
def deterministicNumber():
    '''
    Deterministically generates and returns an even number between 9 and 21
    '''
    
    return 16
```

### Exercise 3-2

5.0/5.0 points (graded)

Write a uniformly distributed stochastic program, `stochasticNumber`, that returns an even number between 9 and 21.

```
import random
def stochasticNumber():
    '''
    Stochastically generates and returns a uniformly distributed even number between 9 and 21
    '''
    return random.randrange(10,22,2)
```

--------

Exercise 4

3/3 points (graded)

1. Are the following two distributions equivalent?

```
import random
def dist1():
    return random.random() * 2 - 1

def dist2():
    if random.random() > 0.5:
        return random.random()
    else:
        return random.random() - 1 
```

​	**Yes**

​	No

2. Are the following two distributions equivalent?

```
import random
def dist3():
    return int(random.random() * 10)

def dist4():
    return random.randrange(0, 10)
```

​	**Yes**

​	No

3. Are the following two distributions equivalent?

```
import random
def dist5():
    return int(random.random() * 10)

def dist6():
    return random.randint(0, 10)
```

​	Yes

​	**No**

### Exercise 5

10/10 points (graded)

In this problem, we're going to calculate some probabilities of dice rolls. Imagine you have two fair four-sided dice (if you've never seen one, [here's a picture](https://courses.edx.org/assets/courseware/v1/fb089d94485d7a3adc6951358b07f90f/asset-v1:MITx+6.00.2x+1T2020+type@asset+block/files_finger_exercises_d4-translucent-red.jpg). The result, a number between 1 and 4, is displayed at the top of the die on each of the 3 visible sides). 'Fair' here means that there is equal probability of rolling any of the four numbers.

You can answer the following questions in one of two ways - you can calculate the probability directly, or, if you're having trouble, you can simply write out the entire [sample space](http://en.wikipedia.org/wiki/Sample_space) for the problem. A sample space is defined as a listing of all possible outcomes of a problem, and it can be written in many ways - a tree or a grid are popular options. For example, here is a diagram of the [sample space for 3 coin tosses](https://courses.edx.org/assets/courseware/v1/b6e4ea1e4183e95cfbce003ee9675ab1/asset-v1:MITx+6.00.2x+1T2020+type@asset+block/files_finger_exercises_coinTossSampleSpace.png).

Some vocabulary before we begin: an **event** is a subset of the sample space, or, a collection of possible outcomes. A **probability function** assigns an event, *A*, a probability *P(A)* that represents the likelihood of event *A* occuring.

As an example, let's say we flip a coin. Define the event *H* as the event that the coin comes up heads. We can assign the probability *P(H)* = 1/2; the likelihood that event *H* occurs.

The following problems will ask for the probability that a given event occurs.

1. What is the size of the sample space for one roll of a four sided die?

   **4**

2. What is the size of the sample space for two rolls of a four sided die?

   **16**

3. Assume we roll 2 four sided dice. What is P({sum of the rolls is even})? Answer in reduced fraction form - eg 1/5 instead of 2/10.

   **1/2**

4. Assume we roll 2 four sided dice. What is P({rolling a 2 followed by a 3})? Answer in reduced fraction form - eg 1/5 instead of 2/10.

   **1/16**

5. Assume we roll 2 four sided dice. What is P({rolling a 2 and a 3, in any order})? Answer in reduced fraction form - eg 1/5 instead of 2/10.

   **1/8**

6. Assume we roll 2 four sided dice. What is P({sum of the rolls is odd})? Answer in reduced fraction form - eg 1/5 instead of 2/10.

   **1/2**

7. Assume we roll 2 four sided dice. What is P({first roll equal to second roll})? Answer in reduced fraction form - eg 1/5 instead of 2/10. 

   **1/4**

8. Assume we roll 2 four sided dice. What is P({first roll larger than second roll})? Answer in reduced fraction form - eg 1/5 instead of 2/10.

   **3/8**

9. Assume we roll 2 four sided dice. What is P({at least one roll is equal to 4})? Answer in reduced fraction form - eg 1/5 instead of 2/10.

   **7/16**

10. Assume we roll 2 four sided dice. What is P({neither roll is equal to 4})? Answer in reduced fraction form - eg 1/5 instead of 2/10.

    **9/16**

**Explanation:**

Here is a visual representation of the sample space for 2 rolls of a four sided die. The left represents the 16 outcomes as a 2D grid; the right represents the outcomes as a tree, where each tree path represents one possible outcome.

![img](https://courses.edx.org/assets/courseware/v1/509c41efec17e61b1ff9f9c7693a99f0/asset-v1:MITx+6.00.2x+1T2020+type@asset+block/files_finger_exercises_diceSampleSpace.png)

Each of the 16 outcomes in the sample space has equal probability (1/16) of occuring. So, for all of the above questions, you could simply use the visual representations to count up your answers. However, for large sample spaces this isn't feasible and it is instead better to be able to calculate the answers directly. So let's take a look at how to do that.

1. What is the size of the sample space for one roll of a four sided die? 4
2. What is the size of the sample space for two rolls of a four sided die? 4**2 = 16
3. P({sum of the rolls is even}) = 8/16 = 1/2
4. P({rolling a 2 followed by a 3}) = P({2, 3}) = 1/16
5. P({rolling a 2 and a 3}) = P({2, 3}) + P({3, 2}) = 1/16 + 1/16 = 2/16 = 1/8
6. P({sum of the rolls is odd}) = 8/16 = 1/2
7. P({first roll equal to second roll}) = P({both 1}) + P({both 2}) + P({both 3}) + P({both 4}) = 1/16 + 1/16 + 1/16 + 1/16 = 4/16 = 1/4. Another way of thinking about this is that it doesn't matter what the first roll is, just that the second roll matches it. So, the probability of that event is (4/4) * (1/4) = 1/4: 4/4 for the first roll (we don't care what it is), times 1/4 chance that the second roll matches the first roll.
8. P({first roll larger than second}) = P({4, <1, 2, 3>}) + P({3, <1, 2>}) + P({2, 1}) = 3/16 + 2/16 + 1/16 = 6/16 = 3/8
9. P({at least one roll equal to 4}) = P({4, <1, 2, 3>}) + P({<1, 2, 3>, 4}) + P({4, 4}) = 3/16 + 3/16 + 1/16= 7/16
10. P({nether roll is equal to 4}) = 1 - P({at least one roll equal to 4}) = 1 - 7/16 = 9/16

### Exercise 6

13/13 points (graded)

In this problem, we're going to calculate some various probabilities.

1. What is the size of the sample space for two rolls of a ten sided die?

   **100**

2. What is the size of the sample space for three rolls of an eight sided die?

   **512**

3. What is the size of the sample space for drawing one card from a deck of 52 cards?

   **52**

4. What is the size of the sample space for drawing one card from each of two decks of 52 cards? That is, drawing one card from one deck of cards, then a second card from a second deck of cards. 

   **2704**

5. Assume we roll 2 ten sided dice. What is P({rolling a 2 followed by a 3})? Answer in reduced fraction form - eg 1/5 instead of 2/10.

   **1/100**

6. Assume we roll 2 ten sided dice. What is P({first roll larger than second roll})? Answer in reduced fraction form - eg 1/5 instead of 2/10.

   **9/20**

7. Assume we roll 3 eight sided dice. What is P({all three rolls are equal})? Answer in reduced fraction form - eg 1/5 instead of 2/10.

   **1/64**

8. A [standard deck of cards](http://en.wikipedia.org/wiki/Standard_52-card_deck) contains 52 cards, 13 each of four suits - diamonds, clubs, hearts, and spades. Each suit contains one of 13 cards: A (ace), 2, 3, 4, 5, 6, 7, 8, 9, 10, J (jack), Q (queen), K (king). Given one deck of 52 playing cards, you flip one over. Assuming a fair deck,what is P({ace of hearts})? Answer in reduced fraction form - eg 1/5 instead of 2/10.

   **1/52**

9. Given one deck of 52 playing cards, you flip one over. Assuming a fair deck, what is P({drawing a card with suit spades})? Answer in reduced fraction form - eg 1/5 instead of 2/10.

   **1/4**

10. Given one deck of 52 playing cards, you flip one over. Assuming a fair deck, what is P({ace of any suit})? Answer in reduced fraction form - eg 1/5 instead of 2/10.

    **1/13**

11. Given one deck of 52 playing cards, you flip one over. Assuming a fair deck, what is P({any card except an ace})? Answer in reduced fraction form - eg 1/5 instead of 2/10.

    **12/13**

12. Given one deck of 52 playing cards, you draw two random cards. (The cards are drawn at the same time, so the selection is considered without replacement) Assuming a fair deck, what is P({both cards are aces})? Answer in reduced fraction form - eg 1/5 instead of 2/10.

    **1/221**

13. Given two decks of 52 playing cards, you flip one over from each deck. Assuming fair decks, what is P({the two cards are the same suit})? Answer in reduced fraction form - eg 1/5 instead of 2/10.

    **1/4**

**Explanation:**

1. What is the size of the sample space for two rolls of a ten sided die? 10**2 = 100
2. What is the size of the sample space for three rolls of an eight sided die? 8**3 = 512
3. What is the size of the sample space drawing from a deck of 52 cards? 52
4. What is the size of the sample space drawing from two decks of 52 cards? 52**2 = 2704
5. P({rolling a 2 followed by a 3}) = P({2, 3}) = 1/100
6. P({first roll larger than second roll}) = P({10, <1, 2, 3, 4, 5, 6, 7, 8, 9>}) + P({9, <1, 2, 3, 4, 5, 6, 7, 8>}) + ... + P({2, 1}) = 9/100 + 8/100 + 7/100 + 6/100 + 5/100 + 4/100 + 3/100 + 2/100 + 1/100 = 45/100 = 9/20
7. P({all three rolls are equal}) = P({all 1}) + P({all 2}) + ... + P({all 8}) = 1/512 + 1/512 + 1/512 + 1/512 + 1/512 + 1/512 + 1/512 + 1/512 = 8/512 = 1/64. Another way to think of it: it doesn't matter what the first roll is, but the second and third rolls must match the first roll. So the probability can be expressed as (8/8) * (1/8) * (1/8) = 1/64.
8. P({ace of hearts}) = P({one card}) = 1/52
9. P({drawing a card with suite spades}) = 13/52 = 1/4
10. P({ace of any suit}) = P({ace of hearts}) + P({ace of clubs}) + P({ace of spaces}) P({ace of diamonds}) = 1/52 + 1/52 + 1/52 + 1/52 = 4/52 = 1/13
11. P({any card except an ace}) = 1 - P({ace of any suit}) = 1 - 1/13 = 12/13
12. P({both cards are aces}) = 4/52 * 3/51 = 12/2652 = 1/221. The probability of an ace is 4/52. On the second draw, if an ace was drawn the first time, there are only 3 aces left and only 51 cards remaining. Thus the probability that the second card is also an ace is 3/51.
13. P({two cards are the same suit}) = This is an interesting problem. There are a few ways of calculating this, but a very simple way is to note that it doesn't matter what suit the first card is; what matters is that the second card's suit matches the suit of the first card. If the first card is a spade, there is a 13/52 = 1/4 chance the second card will also be a spade. Following this logic, you'll find that there's always a 1/4 chance the second card's suit will match the first card's suit, thus P({two cards are the same suit}) = 1/4.

### Exercise 7

5/5 points (graded)

You pick three balls in succession out of a bucket of 3 red balls and 3 green balls. Assume replacement after picking out each ball. What is the probability of each of the following events?

1. Three red balls: A : {R,R,R}. Answer in reduced fraction form - eg 1/5 instead of 2/10.

   **1/8**

2. The sequence red, green, red: A : {R,G,R}. Answer in reduced fraction form - eg 1/5 instead of 2/10.

   **1/8**

3. Any sequence with 2 reds and 1 green. Answer in reduced fraction form - eg 1/5 instead of 2/10.

   **3/8**

4. Any sequence where the number of reds is greater than or equal to the number of greens. Answer in reduced fraction form - eg 1/5 instead of 2/10.

   **1/2**

5. You have a bucket with 3 red balls and 3 green balls. This time, assume you **don't** replace the ball after taking it out. What is the probability of drawing 3 balls of the same color? Answer in reduced fraction form - eg 1/5 instead of 2/10.

   **1/10**

**Explanation:**

1. The probability of drawing a red ball is 1/2, so the probability of drawing 3 is (1/2)**3 = 1/8.

2. P({R, G, R}) = 1/2 * 1/2 * 1/2 = 1/8

3. P({R, R, G}) + P({R, G, R}) + P({G, R, R}) = 1/8 + 1/8 + 1/8 = 3/8

4. P({R, R, G}) + P({R, G, R}) + P({G, R, R}) + P({R, R, R}) = 1/8 + 1/8 + 1/8 + 1/8 = 4/8 = 1/2

5. In this problem, we don't assume the balls are replaced after being drawn. This changes the probability because with every draw, there is one less ball to pick from. The probability of drawing three red balls is 3/6 * 2/5 * 1/4 -- for the first pick, there are three red balls available and six balls total. For the second pick, if we picked a red ball first, there are now two red balls available and five balls total. For the third pick, if both the first and second picks were red balls, there is now one red ball available and four balls total. Multiply together to get P({R, R, R}) = 1/20.

   However the problem asked to find the probability of drawing 3 balls of the same color. Thus this probability is P({R, R, R}) + P({G, G, G}). The above analysis works for green balls as well, thus P({R, R, R}) + P({G, G, G}) = 1/20 + 1/20 = 2/20 = 1/10.

### Exercise 1

3/3 points (graded)

1. Would placing the drunk's starting location not at the origin change the distances returned?

   Yes

   **No**

**Explanation:**

No, `walk` uses the starting location of where the drunk is at the start, not the actual origin.

If so, what line would you modify to compensate? Enter the line number (eg 17). If not, just type None.

```
1. def simWalks(numSteps, numTrials, dClass):
2.     homer = UsualDrunk()
3.     notOrigin = Location(1, 0)
4.     distances = []
5.     for t in range(numTrials):
6.         f = Field()
7.         f.addDrunk(homer, notOrigin)
8.         distances.append(round(walk(f, homer, numSteps), 1))
9.     return distances
```

**None**

2. If you were going to use `random.seed` in a real-life simulation instead of just when you are debugging a simulation, would you want to seed it with 0?

   **No**

**Explanation:**

No; by using `random.seed`, you create a deterministic simulation rather than a stochastic simulation. You should never use `random.seed` in a real-life situation, regardless of the seed value!

### Exercise 2

2/2 points (graded)

1. Is the following code deterministic or stochastic?

```
import random
mylist = []

for i in range(random.randint(1, 10)):
    random.seed(0)
    if random.randint(1, 10) > 3:
        number = random.randint(1, 10)
        mylist.append(number)
print(mylist)
```

​	**Stochastic**

**Explanation:**

Answer: Stochastic

This code sample returns a list of 7s. The length of the list is determined by a stochastic variable (the first call to `randint`). If you are using Canopy, you will notice that the very first time you run the program, the length of the array varies. If you keep clicking the green run button to re-run the program, the length of the array will always be 3. This is because we have set the seed. To completely reset, you will have to restart the kernel via the menu option (Run -> Restart Kernel) or via the keyboard (Ctrl with the period key).

2. Which of the following alterations (Code Sample A or Code Sample B) would result in a deterministic process?

```
import random

# Code Sample A
mylist = []

for i in range(random.randint(1, 10)):
    random.seed(0)
    if random.randint(1, 10) > 3:
        number = random.randint(1, 10)
        if number not in mylist:
            mylist.append(number)
print(mylist)

    
    
# Code Sample B
mylist = []

random.seed(0)
for i in range(random.randint(1, 10)):
    if random.randint(1, 10) > 3:
        number = random.randint(1, 10)
        mylist.append(number)
    print(mylist)
```

​	**Code Sample A**

​	**Code Sample B**

**Explanation:**

Answer: Both! Code Sample A will always return [7]. Code Sample B will always return [1,9,7,8,10,9]. Therefore both of these versions of the original code are deterministic.

### Exercise 3

3/3 points (graded)

The output of `random.randint(1, 10)` after a specific seed is shown below.

```
>>> import random
>>> random.seed(9001)
>>> random.randint(1, 10)
1
>>> random.randint(1, 10)
3
>>> random.randint(1, 10)
6
>>> random.randint(1, 10)
6
>>> random.randint(1, 10)
7
```

We would like you to solve this problem using just the above output, without using the interpreter. (Note that the actual output you get when you run the above commands is actually going to be 1, 5, 5, 2, 10) What is printed in the following programs? Separate new lines with commas - so the above output would be 1, 3, 6, 6, 7.

**Note!** Try it out!

```
random.seed(9001)
for i in range(random.randint(1, 10)):
    print(random.randint(1, 10))
```

3

```
random.seed(9001)
d = random.randint(1, 10)
for i in range(random.randint(1, 10)):
    print(d)
```

1, 1, 1

```
random.seed(9001)
d = random.randint(1, 10)
for i in range(random.randint(1, 10)):
    if random.randint(1, 10) < 7:
        print(d)
    else:
        random.seed(9001)
        d = random.randint(1, 10)
        print(random.randint(1, 10))
```

1, 1, 3

### Exercise 4

1/1 point (graded)

Suppose we wanted to create a class `PolarBearDrunk`, a drunk polar bear who moves randomly along the x and y axes taking large steps when moving South, and small steps when moving North.

```
class PolarBearDrunk(Drunk):
    def takeStep(self):
        # code for takeStep()
```

Which of the following would be an appropriate implementation of `takeStep()`?

1. Option A)

   ```
   directionList = [(0.0, 1.0), (1.0, 0.0), (-1.0, 0.0), (0.0, -1.0)]
   myDirection = random.choice(directionList)
   if myDirection[0] == 0.0:
       return myDirection + (0.0, -0.5)
   return myDirection
   ```

2. Option B)

   ```
   directionList = [(0.0, 0.5), (1.0, -0.5), (-1.0, -0.5), (0.0, -1.5)]
   return random.choice(directionList)
   ```

3. Option C)

   ```
   directionList = [(0.0, 0.5), (1.0, 0.0), (-1.0, 0.0), (0.0, -1.5)]
   return random.choice(directionList)
   ```

4. Option D)

   ```
   directionList = [(0.0, 1.0), (1.0, 0.0), (-1.0, 0.0), (0.0, -1.0), (0.0, -1.0)]
   return random.choice(directionList)
   ```

**Option C)**

**Explanation:**

Option A) is incorrect because it produces tuples of length 4. The logic is otherwise correct, but it should be written as:

```
directionList = [(0.0, 1.0), (1.0, 0.0), (-1.0, 0.0), (0.0, -1.0)]
myDirection = random.choice(directionList)
if myDirection[0] == 0.0:
    return (myDirection[0], myDirection[1] - 0.5) 
return myDirection
```

Option B) is incorrect because it produces directions not along axes.

Option D) is incorrect because it produces a bias toward moving South, but does not alter step size.