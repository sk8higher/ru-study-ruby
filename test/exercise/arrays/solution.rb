module Exercise
  module Arrays
    class << self
      def replace(array)
        max = array[0]

        array.each { |el| max = el if el > max }

        array.map { |el| el.positive? ? max : el }
      end

      def search(array, query)
        low = 0
        high = array.size - 1

        while low <= high
          mid = low + ((high - low) / 2)

          if array[mid] < query
            low = mid + 1
          elsif array[mid] > query
            high = mid - 1
          end

          return mid if array[mid] == query
        end

        -1
      end
    end
  end
end
