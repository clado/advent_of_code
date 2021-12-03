
lst_calc fun lst = foldl fun (head lst) lst

spreadsheet s = map (\ln -> map (\i -> read i :: Int) (words ln)) (lines s)

checksum lsts = foldl (\acc row -> acc + (row_checksum row)) 0 lsts
  where row_checksum lst = abs $ (lst_calc max lst) - (lst_calc min lst)

main = do
  s <- readFile "input.txt"
  putStr $ show $ checksum $ spreadsheet s
