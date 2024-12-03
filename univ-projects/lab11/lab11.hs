data Person = Person {
    name :: String,
    age :: Int
}

instance Show Person where
    show (Person n a) = "Name: " ++ n ++ ", Age: " ++ show a

data BTree a = BLeaf a | BNode (BTree a) (BTree a)

instance Show (BTree a) where
    show (BNode a left right) = "Node"
