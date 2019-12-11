class Hash
    def select_value(next_value, isSelectedValue)
        if isSelectedValue
            self[next_value[0][0]] = next_value[0][1]
        else
        end
    end
    
    def map_value(value, mapped_value)
        self[value[0]] = mapped_value
    end
    
    def first_value()
        return self.values[0]
    end
end