module Enumerable
    require './enumerable/array.rb'
    require './enumerable/hash.rb'

    def my_each
        enumerated_object = self.to_enum
        while true
            begin
                next_value = enumerated_object.next
                yield(next_value)
            rescue StopIteration
                return self
            rescue LocalJumpError
                return enumerated_object
            end
        end
    end

    def my_each_with_index
        enumerated_object = self.to_enum
        index = 0
        while true
            begin
                next_value = enumerated_object.next
                yield(next_value, index)
            rescue StopIteration
                return self
            end
            index += 1
        end
    end

    def my_select
        found_values = self.class.new;
        enumerated_object = self.to_enum
        while true
            begin
                next_value = enumerated_object.next_values
                found_values.select_value(next_value, yield(*next_value))
            rescue StopIteration
                return found_values
            rescue LocalJumpError
                return enumerated_object
            end
        end
    end

    def my_all?
        return (self.my_select{|value| yield(value)} == self)
    end

    def my_any?
        return (self.my_select{|value| yield(value)}.size > 0)
    end

    def my_none?
        return (self.my_select{|value| yield(value)}.size == 0)
    end

    def my_count
        return (self.my_select{|value| yield(value)}.size)
    end

    def my_map(*proc1)
        mapped_object = self.class.new()
        self.my_each do |value|
            if proc1.size > 0
                mapped_object.map_value(value, proc1[0].call(value))
            else
                mapped_object.map_value(value, yield(*value))
            end
        end
        return mapped_object
    end

    def my_inject(result=nil)
        self.my_each_with_index do |*value, index|
            if index == 0
                result  = self.first_value()
            else
                result = yield(result, *value)
            end
        end
        return result
    end

    def Enumerable.multiply_els(array)
        return array.inject{|result, value| result*value}
    end
end

