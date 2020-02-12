require './enumerable/enumerable_methods.rb'
require './enumerable/array.rb'
require './enumerable/hash.rb'

RSpec.describe Enumerable do
  describe '#my_select' do
    it 'filters an array by value' do
      array1 = [1, 2, 3, 4, 2, 5, 2]
      expect(array1.my_select { |value| value == 2 }).to eql([2, 2, 2])
    end

    it 'filters a hash by value' do
      hash1 = { smerp: 2, derp: 3, lerp: 1, berp: 2 }
      expect(hash1.my_select { |key, value| value == 2 }). to eql({ smerp:2, berp:2 })
    end
  end

  describe '#my_map' do
    it 'transforms an array with a block as input' do
      array1 = [1, 2, 3, 4, 2, 5, 2]
      expect(array1.my_map { |value| value * 2 }).to eql([2, 4, 6, 8, 4, 10, 4])
    end

    it 'transforms an array with a proc as input' do
      array1 = [1, 2, 3, 4, 2, 5, 2]
      map_proc = proc { |value| value * 2 }
      expect(array1.my_map(map_proc)).to eql([2, 4, 6, 8, 4, 10, 4])
    end

    it 'transforms an array with a block and proc as input' do
      array1 = [1, 2, 3, 4, 2, 5, 2]
      map_proc = proc { |value| value * 2 }
      expect(array1.my_map(map_proc) { |value| value * 3 }).to eql([2, 4, 6, 8, 4, 10, 4])
    end
  end

  describe '#my_inject' do
    it 'reduces an array to to a sum' do
      array1 = [1, 2, 3, 4, 2, 5, 2]
      expect(array1.my_inject { |result, element| result + element }).to eql(19)
    end

    it 'reduces a hash to to a sum' do
      hash1 = { smerp: 2, derp: 3, lerp: 1, berp: 2 }
      expect(hash1.my_inject{ |result, (key, value)| result + value }).to eql(8)
    end
  end

  describe '#my_any?' do
    it 'returns true if any item in array meets condition' do
      array1 = [1, 2, 3, 4, 2, 5, 2]
      expect(array1.my_any? { |value| value == 1 }).to eql(true)
    end
    it 'returns fals if no items in array meets condition' do
      array1 = [1, 2, 3, 4, 2, 5, 2]
      expect(array1.my_any? { |value| value == 6 }).to eql(false)
    end
  end

  describe '#my_all?' do
    it 'returns true if all items in array meet condition' do
        array2 = [2, 2, 2, 2, 2, 2]
        expect(array2.my_all? { |value| value == 2 }).to eql(true)
      end
    it 'returns false if not all items in array meet condition' do
      array1 = [1, 2, 3, 4, 2, 5, 2]
      expect(array1.my_all? { |value| value == 2 }).to eql(false)
    end
  end

  describe '#my_count' do
    it 'counts the number of elements' do
      array1 = [1, 2, 3, 4, 2, 5, 2]
      expect(array1.my_count{ |value| value == 2 }).to eql(3)
    end
    it 'returns 0 if no values meet condition' do
        array1 = [1, 2, 3, 4, 2, 5, 2]
        expect(array1.my_count{ |value| value == 6 }).to eql(0)
      end
  end
end
