# TEST CODE FOR ENUMERABLE METHODS BELOW
require './enumerable/enumerable_methods.rb'

array1 = [1,2,3,4,2,5,2]
array2 = [2,2,2,2,2,2]
hash1 = {:smerp => 2, :derp => 3, :lerp => 1, :berp => 2}

puts 
puts "Testing my_each "
puts "Testing my_each with an array"
print "#{array1.my_each{|value| puts "#{value}"}}\n"
puts "Testing my_each with a hash"
print "#{hash1.my_each{|key, value| puts "key: #{key} => value:#{value}"}}\n"

puts 
puts "Testing my_each_with_index"
puts array1.my_each_with_index{|value, index| puts "#{value} is at #{index}"}
puts hash1.my_each_with_index{|(key, value),index| puts "#{key} is at index #{index}" }

puts
puts "Testing my_select"
puts "Searching #{array1} and #{array2} for a 2"
print "#{array1.my_select{|value| value == 2}}\n"
print "#{array2.my_select{|value| value == 2}}\n"
puts "Searching #{hash1} for a 2"
print "#{hash1.my_select{|key, value| value == 2 } }\n"

puts
puts "Testing my_all?:"
puts "Searching #{array1} and #{array2} for all 2s"
puts array1.my_all?{|value| value == 2}
puts array2.my_all?{|value| value == 2}

puts
puts "Testing my_any?:"
puts "Searching #{array1} for any 1 and for any 6"
puts array1.my_any?{|value| value == 1}
puts array1.my_any?{|value| value == 6}

puts
puts "Testing my_none?:"
puts "Searching #{array1} for no 1s and for no 6s"
puts array1.my_none?{|value| value == 1}
puts array1.my_none?{|value| value == 6}

puts
puts "Testing my_count:"
puts "Searching #{array1} for number of 2s and for the number of 6s"
puts array1.my_count{|value| value == 2}
puts array1.my_count{|value| value == 6}

puts
puts "Testing my_map:"
puts "Multiplying #{array1} by 2"
puts array1.my_map{|value| value * 2}
puts "Multiplying #{hash1} values by 2"
puts hash1.my_map{|key, value| value * 2}

puts
puts "Testing my_inject"
puts "Summing elements in array:"
puts array1.my_inject{|result, element| result + element}
puts "Summing elements in hash:"
puts hash1.my_inject{|result, (key, value)| result + value}

puts
puts "Testing multiply_els"
puts "Multiplying all of the elements in the array:"
puts Enumerable.multiply_els(array1)

puts
puts "Testing my_map with a proc and with a block:"
puts "Multiplying #{array1} by 2 using a block"
puts array1.my_map{|value| value * 2}
puts "Multiplying #{array1} by 2 using a proc"
map_proc = Proc.new{|value| value * 2 }
puts array1.my_map(map_proc)
puts "Multiplying #{array1} by 2 using a proc and a block"
puts array1.my_map(map_proc){|value| value * 3}

puts "Selecting values in #{array1} by index:"
#puts array1.my_select.with_index{|value, index| index.even?}