# part 2

def most_common(set, bit)
  half = set.size / 2.0
  ones = set.count { |num| num[bit] == '1' }
  ones >= half ? '1' : '0'
end

def solve(set, type)
  bit = 0
  while set.size > 1 do
    common = most_common(set, bit)
    if type == 'oxygen'
      set.reject! { |n| n[bit] != common }
    else
      set.reject! { |n| n[bit] == common }
    end
    bit += 1
  end
  set
end


oxygen_set = []
co2_set = []

f = File.open('input.txt', 'r')
f.each_line do |number|
  oxygen_set += [number.strip]
  co2_set += [number.strip]
end
f.close

oxygen = solve(oxygen_set, 'oxygen').first
co2 = solve(co2_set, 'co2').first

puts co2.inspect

puts("oxygen #{oxygen} and #{oxygen.to_i(2)}")
puts("co2 #{co2} and #{co2.to_i(2)}")

puts("answer #{oxygen.to_i(2) * co2.to_i(2)}")
