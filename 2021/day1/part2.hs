
ints s = map (\ln -> read ln :: Int) (lines s)

count :: [Int] -> Int
count (first:second:third:fourth:rest) =
  if (second + third + fourth) > (first + second + third)
    then 1 + count (second:third:fourth:rest)
    else count (second:third:fourth:rest)
count (_) = 0

main = do
  s <- readFile "input.txt"
  putStr $ show $ count $ ints s
