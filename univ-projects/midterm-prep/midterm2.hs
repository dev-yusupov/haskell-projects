-- Problem 1: Implement a function `myGroup` that takes a list and groups consecutive duplicates into sublists.
-- Example:
-- myGroup [1, 1, 2, 3, 3, 3, 4, 4] == [[1, 1], [2], [3, 3, 3], [4, 4]]

-- Problem 2: Write a function `subsequencesOfLength` that returns all subsequences of a list with a given length.
-- Example:
-- subsequencesOfLength 2 [1, 2, 3] == [[1, 2], [1, 3], [2, 3]]

-- Problem 3: Create a function `isBinarySearchTree` that checks if a given binary tree is a valid binary search tree.
-- The binary tree can be represented as:
-- data Tree a = Empty | Node a (Tree a) (Tree a)
-- Example:
-- isBinarySearchTree (Node 2 (Node 1 Empty Empty) (Node 3 Empty Empty)) == True
-- isBinarySearchTree (Node 2 (Node 3 Empty Empty) (Node 1 Empty Empty)) == False

-- Problem 4: Define a function `kthPermutation` that generates the k-th permutation of a given list.
-- The k-th permutation is based on lexicographical ordering.
-- Example:
-- kthPermutation [1, 2, 3] 3 == [1, 3, 2]

-- Problem 5: Implement a function `maxPathSum` that computes the maximum path sum in a binary tree.
-- A path in a binary tree is a sequence of nodes where each node is connected to the next by an edge.
-- Example:
-- maxPathSum (Node 10 (Node 2 (Node 20 Empty Empty) (Node 1 Empty Empty)) (Node 10 Empty (Node -25 (Node 3 Empty Empty) (Node 4 Empty Empty)))) == 42

-- Problem 6: Write a function `balancedParens` that generates all balanced parentheses combinations for a given number of pairs.
-- Example:
-- balancedParens 3 == ["((()))", "(()())", "(())()", "()(())", "()()()"]

-- Problem 7: Write a function `knapsack` that solves the 0/1 knapsack problem.
-- The function takes a maximum weight, a list of item weights, and a list of item values.
-- Example:
-- knapsack 50 [10, 20, 30] [60, 100, 120] == 220

-- Problem 8: Define a function `transposeMatrix` that transposes a given matrix.
-- A matrix is represented as a list of lists.
-- Example:
-- transposeMatrix [[1, 2, 3], [4, 5, 6], [7, 8, 9]] == [[1, 4, 7], [2, 5, 8], [3, 6, 9]]

-- Problem 9: Create a function `longestCommonSubsequence` that finds the longest common subsequence between two lists.
-- Example:
-- longestCommonSubsequence "abcdef" "acf" == "acf"

-- Problem 10: Implement a function `monteCarloPi` that approximates the value of π using a Monte Carlo method.
-- The function should take the number of random points to generate and return an approximation of π.
-- Example:
-- monteCarloPi 100000 == (approximately 3.14)

-- Problem 11: Define a function `rotateList` that rotates a list to the left by a given number of positions.
-- Example:
-- rotateList 2 [1, 2, 3, 4, 5] == [3, 4, 5, 1, 2]

-- Problem 12: Write a function `sudokuSolver` that solves a given Sudoku puzzle.
-- The puzzle should be represented as a 9x9 grid with 0s for empty cells.
-- Example:
-- sudokuSolver [[5, 3, 0, 0, 7, 0, 0, 0, 0], [6, 0, 0, 1, 9, 5, 0, 0, 0], ...] == (a solved grid)

-- Problem 13: Write a function `wordLadder` that finds the shortest transformation sequence from one word to another.
-- Each transformation can change only one letter, and all intermediate words must be in a given dictionary.
-- Example:
-- wordLadder "hit" "cog" ["hot", "dot", "dog", "lot", "log", "cog"] == 5

-- Problem 14: Implement a function `mergeIntervals` that merges overlapping intervals in a list of intervals.
-- Example:
-- mergeIntervals [(1, 3), (2, 6), (8, 10), (15, 18)] == [(1, 6), (8, 10), (15, 18)]

-- Problem 15: Create a function `minimumSpanningTree` that finds the minimum spanning tree of a graph using Kruskal's or Prim's algorithm.
-- The graph should be represented as an adjacency list or edge list.
-- Example:
-- minimumSpanningTree [(1, 2, 1), (2, 3, 2), (1, 3, 3)] == [(1, 2, 1), (2, 3, 2)]
