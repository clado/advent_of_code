-- copied from Haskell source because it's not loaded????
permutations xs0        =  xs0 : perms xs0 []
  where
    perms []     _  = []
    perms (t:ts) is = foldr interleave (perms ts (t:is)) (permutations is)
      where interleave    xs     r = let (_,zs) = interleave' id xs r in zs
            interleave' _ []     r = (ts, r)
            interleave' f (y:ys) r = let (us,zs) = interleave' (f . (y:)) ys r
                                     in  (y:us, f (t:y:us) : zs)

passphrases s = map (words) (lines s)

valid_passphrase_part_1 lst = all (\f -> length (filter (\l -> l == f) lst) == 1) lst

valid_passphrase_part_2 lst = all (\f -> length (filter (\l -> (any (\perm -> perm == f) (permutations l))) lst) == 1) lst

how_many lsts = length $ filter valid_passphrase_part_2 lsts

main = do
  s <- readFile "input.txt"
  putStr $ show $ how_many $ passphrases s
