
ints = map (\s -> read [s] :: Int)

calc :: [Int] -> Int
calc nums = foldl (\acc (a, b) -> if a == b then a + acc else acc) 0 (tuples nums)
  where tuples (x:lst) = (x, (halfway lst)):(tuples (lst))
        tuples _ = []
        halfway lst = head $ drop (totake) (lst ++ nums)
        totake = ((length nums) `div` 2) - 1

silver lst = calc lst

main = do
  s <- readFile "input.txt"
  putStr $ show $ silver $ ints s
