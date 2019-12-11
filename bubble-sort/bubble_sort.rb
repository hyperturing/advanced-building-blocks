require 'benchmark'

def bubble_sort(array)
    # Algo:
    # keep track of the number of passes
    # loop until we haven't performed a swap this pass:
    #    no swaps performed yet
    #    loop through the array:
    #       if the elements we're checking are not in order
    #            swap the elements
    #            mark that we've performed a swap
    #   increment the number of passes
    num_passes = 0

    loop do
        swapped = false

        for i in 0..array.size - 2 - num_passes
            if array[i] > array[i + 1]
                array[i], array[i + 1] = array[i + 1], array[i]
                swapped = true
            end
        end

        break if !swapped
        num_passes += 1
    end

    array
end

def random_array(size)
    array = []
    size.times do
        array.push((rand * 1000).floor - 1)
    end
    return array
end

test_array1 = random_array(1000)
test_array2 = random_array(1000)
test_array3 = random_array(2000)
test_array4 = random_array(4000)
test_array5 = random_array(8000)

print "#{bubble_sort(test_array1)} \n"

puts
puts "Benchmarking Bubble Sort (value in column 5 is elapsed time in seconds)"
puts "Sorting array of 1000 values:" + (Benchmark.measure{ bubble_sort(test_array2)}).to_s
puts "Sorting array of 2000 values:" + (Benchmark.measure{ bubble_sort(test_array3)}).to_s
puts "Sorting array of 4000 values:" + (Benchmark.measure{ bubble_sort(test_array4)}).to_s
puts "Sorting array of 8000 values:" + (Benchmark.measure{ bubble_sort(test_array5)}).to_s
