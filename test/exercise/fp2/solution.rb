module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each
        return unless block_given?

        i = 0

        while i < size
          yield self[i]

          i += 1
        end

        self
      end

      # Написать свою функцию my_map
      def my_map
        return unless block_given?

        result = MyArray.new
        i = 0

        while i < size
          element = yield self[i]
          result << element

          i += 1
        end

        result
      end

      # Написать свою функцию my_compact
      def my_compact
        result = MyArray.new
        i = 0

        while i < size
          element = self[i]

          result << element unless element.nil?

          i += 1
        end

        result
      end

      # Написать свою функцию my_reduce
      def my_reduce(initial_value = nil)
        accumulator = initial_value || self[0]
        i = initial_value.nil? ? 1 : 0

        while i < size
          accumulator = yield(accumulator, self[i])
          i += 1
        end

        accumulator
      end
    end
  end
end
