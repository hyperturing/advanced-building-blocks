def bubble_sort_by(array)
    # Algo:
    # keep track of the number of passes
    # loop until we haven't performed a swap this pass:
    #    no swaps performed yet
    #    loop through the array:
    #       yield to the block
    #       if the block's condition is met:
    #            swap the elements
    #            mark that we've performed a swap
    #   increment the number of passes
    num_passes = 0

    loop do
        swapped = false

        for i in 0..array.size - 2 - num_passes

            # Yield to the block to determine which element is "larger"
            swap_decision = yield(array[i], array[i + 1])
            
            if swap_decision > 0
                array[i], array[i + 1] = array[i + 1], array[i]
                swapped = true
            end
        end

        break if !swapped
        num_passes += 1
    end

    array
end

array = bubble_sort_by(["hi","hello","hey"]) do |left,right|
    left.length - right.length
end

print array.to_s + "\n"