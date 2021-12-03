
ints = map (\s -> read [s] :: Int)

calc :: [Int] -> Int
calc nums = foldl (\acc (a, b) -> if a == b then a + acc else acc) 0 (tuples nums)
  where tuples (x:y:lst) = (x, y):(tuples (y:lst))
        tuples _ = []

silver lst = if (head lst) == (last lst)
             then (head lst) + (calc lst)
             else calc lst

main = do
  s <- readFile "input.txt"
  putStr $ show $ silver $ ints s
