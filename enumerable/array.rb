class Array
    def select_value(next_value, isSelectedValue)
        if isSelectedValue
            self << next_value[0]
        else
        end
    end
    
    def map_value (value, mapped_value)
        self << mapped_value
    end
    
    def first_value()
        return self.first
    end
end