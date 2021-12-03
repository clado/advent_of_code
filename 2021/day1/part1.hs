
ints s = map (\ln -> read ln :: Int) (lines s)

count :: [Int] -> Int
count (first:second:rest) = if second > first then 1 + count (second:rest) else count (second:rest)
count (_) = 0

main = do
  s <- readFile "input.txt"
  putStr $ show $ count $ ints s
