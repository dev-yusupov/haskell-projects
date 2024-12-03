module TreeSample where

data Tree a = Node a (Tree a) (Tree a)
        | Leaf
        deriving (Show)

tree1 :: Tree Int
tree1 = Node 0
            (Node 1
                (Node 2 Leaf Leaf)
                (Node 3 Leaf Leaf))
            (Node 4
                (Node 5 Leaf Leaf)
                (Node 6 Leaf Leaf))

inorder :: Tree a -> [a]
inorder Leaf = []
inorder (Node x left right) = inorder left ++ [x] ++ inorder right

preorder :: Tree a -> [a]
preorder Leaf = []
preorder (Node x left right) = [x] ++ preorder left ++ preorder right

postorder :: Tree a -> [a]
postorder Leaf = []
postorder (Node x left right) = preorder left ++ preorder right ++ [x]

isEmpty :: Tree a -> Bool
isEmpty tree = null (inorder tree)

tree2 :: Tree Int
tree2 = Leaf


main = do
    print $ isEmpty tree2