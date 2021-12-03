# warning: cursed.

def solve(set, func)
  bit = 0
  while set.size > 1 do
    most_common = set.sum { |num| num[bit].to_i } >= set.size / 2.0 ? '1' : '0'
    set.send(func) { |n| n[bit] == most_common }
    bit += 1
  end
  set
end

oxygen_set = IO.readlines('input.txt', chomp: true)
co2_set = oxygen_set.dup

puts(solve(oxygen_set, :select!).first.to_i(2) * solve(co2_set, :reject!).first.to_i(2))
