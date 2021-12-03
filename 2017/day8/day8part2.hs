import Debug.Trace

type State = [(String, Int)]

ops = [("inc", (+)), ("dec", (-))]

comps :: [(String, Int -> Int -> Bool)]
comps = [("==", (==)), ("!=", (/=)), ("<", (<)), (">", (>)), ("<=", (<=)), (">=", (>=))]

cast i = read i :: Int

instructions s = map (words) (lines s)

access state var = case (lookup var state) of
  Nothing -> 0
  Just i -> i

update :: (String, Int) -> State -> State
update (var, i) [] = [(var, i)]
update (var, i) ((tst, j):lst) = if var == tst then (var, i):lst else (tst, j):(update (var, i) lst)

evaluate :: State -> [String] -> State
evaluate state [assign_var, op, inc, _, test_var, comp, cnst] =
  if thing then (update new_var state) else state
  where thing = (comparison) (access state test_var) (cast cnst)
        Just operate = lookup op ops
        Just comparison = lookup comp comps
        new_var = (assign_var, operate (access state assign_var) (cast inc))
evaluate _ _ = []

final_state lst = foldl (combine) ([], 0) lst
  where combine (state, m) inst = let new_state = evaluate state inst in (new_state, maxim new_state m) 
        maxim [] i = i
        maxim ((var, i):rest) itest = if i > itest then maxim rest i else maxim rest itest

answer lst = (final_state lst)

main = do
  s <- readFile "input.txt"
  putStr $ show $ answer $ instructions s






