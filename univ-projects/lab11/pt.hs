-- Write a function which takes a tree and two integers a and b 
-- and returns the number of subtrees where all the node values are in the range [a, b].
-- Note that the range is inclusive and a leaf should not be considered as a subtree.

--- Bobur Yusupov YTAJDI

data Tree a = Node a (Tree a) (Tree a) 
            | Leaf deriving (Show)

tree1 = Leaf
tree2 = Node 5 Leaf Leaf
tree3 = Node 5
            (Node 3 Leaf Leaf)
            (Node 8 Leaf Leaf)
tree4 = Node 10
            (Node 5
                (Node 3 Leaf Leaf)
                (Node 7 Leaf Leaf))
            (Node 15
                (Node 12 Leaf Leaf)
                (Node 18 Leaf Leaf))
tree5 = Node 10
            (Node 5
                    (Node 3 Leaf Leaf)
                    (Node 7
                        (Node 6 Leaf Leaf)
                        Leaf))
            (Node 15
                    (Node 12 Leaf Leaf)
                    (Node 18
                        Leaf
                        (Node 20 Leaf Leaf)))
{--
    For example:
    countSubTreeInRange tree2 2 6 = 1

    tree3:
         5
       /   \
      3     8
     / \   / \
    L   L L   L

    Range: [2, 6]
    Subtree rooted at 5 (entire tree) is not good since 8 is not in the range.
    Subtree rooted at 3 is good since every node is in the range.
    Subtree rooted at 8 is not good since 8 is not in the range.
    => So the number of subtree in the range is 1
--}

isSubTreeInRange :: Tree Int -> Int -> Int -> Bool
isSubTreeInRange Leaf _ _ = True
isSubTreeInRange (Node x l r) a b = (x >= a && x <= b) && isSubTreeInRange l a b && isSubTreeInRange r a b 

countSubTreeInRange :: Tree Int -> Int -> Int -> Int
countSubTreeInRange Leaf _ _ = 0
countSubTreeInRange (Node x l r) a b
    | isSubTreeInRange (Node x l r) a b = 1 + countSubTreeInRange l a b + countSubTreeInRange r a b
    | otherwise = countSubTreeInRange l a b + countSubTreeInRange r a b

-- main = print $ countSubTreeInRange tree1 5 10 -- 0
-- main = print $ countSubTreeInRange tree2 2 6 -- 1
-- main = print $ countSubTreeInRange tree3 2 6 -- 1
-- main = print $ countSubTreeInRange tree4 3 10 -- 3
-- main = print $ countSubTreeInRange tree5 3 12 -- 5

