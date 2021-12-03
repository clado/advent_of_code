
data Direction = Forward Int | Down Int | Up Int

parse s = map (\ln -> dataify (words ln)) (lines s)

dataify :: [String] -> Direction
dataify ["forward", x] = Forward (read x :: Int)
dataify ["down", x] = Down (read x :: Int)
dataify ["up", x] = Up (read x :: Int)

move :: (Int, Int) -> [Direction] -> (Int, Int)
move coors [] = coors
move (hor, depth) ((Forward x):rest) = move (hor + x, depth) rest
move (hor, depth) ((Down x):rest) = move (hor, depth + x) rest
move (hor, depth) ((Up x):rest) = move (hor, depth - x) rest

main = do
  s <- readFile "input.txt"
  putStr $ show $ move (0, 0) (parse s)
