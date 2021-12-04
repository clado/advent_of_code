# warning: cursed.

def solve(set, func, bit = 0)
  return set.first if set.size == 1
  most_common = set.sum { |num| num[bit].to_i } >= set.size / 2.0 ? '1' : '0'
  solve(set.send(func) { |n| n[bit] == most_common }, func, bit + 1)
end

oxygen_set = IO.readlines('input.txt', chomp: true)

puts(solve(oxygen_set, :select).to_i(2) * solve(oxygen_set.dup, :reject).to_i(2))
