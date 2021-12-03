
-- from stack overflow
is_int x = x == fromInteger (round x)

is_div a b = (x / y) == fromInteger (round (x / y))
  where x = fromIntegral a
        y = fromIntegral b

all_pairs [] = []
all_pairs (x:lst) = (map (\y -> (x, y)) lst) ++ (all_pairs lst)

lst_calc fun lst = foldl fun (head lst) lst

spreadsheet s = map (\ln -> map (\i -> read i :: Int) (words ln)) (lines s)

checksum lsts = foldl (\acc row -> acc + (row_checksum row)) 0 lsts
  where row_checksum lst = let (a, b) = (answer lst) in a `div` b
        answer lst = head $ dropWhile (\(a, b) -> not $ is_div a b) (all_pairs lst ++ all_pairs (reverse lst))

main = do
  s <- readFile "input.txt"
  putStr $ show $ checksum $ spreadsheet s
