# part 2 (47 lines)
# oxygen 000111100110 and 486
# co2 101011100000 and 2784
# answer 1353024

def most_common(set, bit)
  half = set.size / 2.0
  ones = set.sum { |num| num[bit].to_i }
  ones >= half ? '1' : '0'
end

def solve(set, func)
  bit = 0
  while set.size > 1 do
    common = most_common(set, bit)
    set.send(func) { |n| n[bit] == common }
    bit += 1
  end
  set
end

oxygen_set = IO.readlines('input.txt', chomp: true)
co2_set = oxygen_set.dup

oxygen = solve(oxygen_set, :select!).first
co2 = solve(co2_set, :reject!).first

puts("oxygen #{oxygen} and #{oxygen.to_i(2)}")
puts("co2 #{co2} and #{co2.to_i(2)}")

puts("answer #{oxygen.to_i(2) * co2.to_i(2)}")
