# part 1
ones = [0] * 12

f = File.open('input.txt', 'r')

number_of_lines = 0

f.each_line do |number|
  number_of_lines += 1
  number.strip.split('').each_index do |i|
    if number[i] == '1'
      ones[i] += 1
    end
  end
end
f.close

puts("hi #{ones}")

gamma = ones.map do |i|
  i > number_of_lines / 2 ? '1' : '0'
end.join

epsilon = ones.map do |i|
  i > number_of_lines / 2 ? '0' : '1'
end.join

number = ones.join.to_i(2)
puts("gamma #{gamma} and #{gamma.to_i(2)}")
puts("epsilon #{epsilon} and #{epsilon.to_i(2)}")

puts("answer #{ gamma.to_i(2) * epsilon.to_i(2)}")
