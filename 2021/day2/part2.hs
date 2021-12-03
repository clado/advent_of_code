
data Direction = Forward Int | Down Int | Up Int

parse s = map (\ln -> dataify (words ln)) (lines s)

dataify :: [String] -> Direction
dataify ["forward", x] = Forward (read x :: Int)
dataify ["down", x] = Down (read x :: Int)
dataify ["up", x] = Up (read x :: Int)

move :: (Int, Int, Int) -> [Direction] -> (Int, Int, Int)
move coors [] = coors
move (hor, depth, aim) ((Forward x):rest) = move (hor + x, depth + (aim * x), aim) rest
move (hor, depth, aim) ((Down x):rest) = move (hor, depth, aim + x) rest
move (hor, depth, aim) ((Up x):rest) = move (hor, depth, aim - x) rest

main = do
  s <- readFile "input.txt"
  putStr $ show $ move (0, 0, 0) (parse s)
