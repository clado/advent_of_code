memory_banks s = map (\i -> read i :: Int) (lines s)

loop mems = continue [] mems 0
  where redistribute memories =
        continue previous mems count = if any (\prev -> prev == mems) previous
                                   then count
                                   else (mems:previous) (redistribute mems) (count + 1)

main = do
  s <- readFile "input.txt"
  putStr $ show $ loop $ memory_banks s
