module Exercise
  module Arrays
    class << self
      def replace(array)
        # We take first element of an array as base for comparing
        max = array[0]

        # Finding max element from the array
        array.each { |el| max = el if el > max }

        # Returning an array with replaced positive elements
        array.map { |el| el.positive? ? max : el }
      end

      def search(array, query)
        # Getting indices of left and right elements
        low = 0
        high = array.size - 1

        while low <= high
          # Getting element in the middle
          mid = low + ((high - low) / 2)

          if array[mid] < query
            low = mid + 1
          elsif array[mid] > query
            high = mid - 1
          end

          return mid if array[mid] == query
        end

        # Return -1 if element is not found
        -1
      end
    end
  end
end
