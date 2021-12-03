# part 1
# gamma 000100011100 and 284
# epsilon 111011100011 and 3811
# answer 1082324

lines = IO.readlines('input.txt', chomp: true)

ones = [0] * 12
lines.each do |number|
  number.split('').each_index do |bit|
    ones[bit] += 1 if number[bit] == '1'
  end
end

gamma = ones.map { |bit|  bit > lines.size / 2 ? '1' : '0' }.join
epsilon = ones.map { |bit| bit > lines.size / 2 ? '0' : '1' }.join

puts("gamma #{gamma} and #{gamma.to_i(2)}")
puts("epsilon #{epsilon} and #{epsilon.to_i(2)}")

puts("answer #{gamma.to_i(2) * epsilon.to_i(2)}")
