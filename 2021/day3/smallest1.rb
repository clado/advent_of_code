# warning: cursed.

lines = IO.readlines('input.txt', chomp: true)

ones = (0..11).map { |bit| lines.sum { |number| number[bit].to_i } }

gamma = ones.map { |bit|  bit > lines.size / 2 ? '1' : '0' }.join
epsilon = ones.map { |bit| bit > lines.size / 2 ? '0' : '1' }.join

puts(gamma.to_i(2) * epsilon.to_i(2))
