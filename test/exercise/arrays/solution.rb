module Exercise
  module Arrays
    class << self
      def replace(array)
        max = array.first

        array.each { |el| max = el if el > max }

        array.map { |el| el.positive? ? max : el }
      end

      def search(array, query, low = 0, high = array.size - 1)
        return -1 if low > high || (query < array[low] || query > array[high])

        mid = low + ((high - low) / 2)

        return mid if array[mid] == query

        if array[mid] > query
          search(array, query, low, mid - 1)
        else
          search(array, query, mid + 1, high)
        end
      end
    end
  end
end
