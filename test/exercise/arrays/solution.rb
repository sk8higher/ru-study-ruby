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

      def search(_array, _query)
        0
      end
    end
  end
end
