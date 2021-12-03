import Debug.Trace

instructions s = map (\i -> read i :: Int) (lines s)

follow instrs = continue 0 instrs 0
  where new_instr_2 instr
          | instr >= 3 = instr - 1
          | otherwise = instr + 1
        new_instr_1 instr = instr + 1
        jump n lst =
          let (hds, tl) = splitAt n lst
              instruction = head (tl)
          in (n + instruction, hds ++ [new_instr_2 instruction] ++ (tail tl))
        continue i lst count = if i < 0 || i >= length lst
                               then count
                               else let (newi, newlst) = (jump i lst) in continue newi newlst (count + 1)

main = do
  s <- readFile "input.txt"
  putStr $ show $ follow $ instructions s
