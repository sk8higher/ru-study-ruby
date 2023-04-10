module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each(&block)
        return self if empty?

        block.call(first)
        MyArray.new(self[1..]).my_each(&block)

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
      # def my_reduce(initial_value = nil)
      #   accumulator = initial_value || self[0]
      #   i = initial_value.nil? ? 1 : 0

      #   while i < size
      #     accumulator = yield(accumulator, self[i])
      #     i += 1
      #   end

      #   accumulator
      # end

      def my_reduce(acc = nil, &block)
        return acc if empty?

        acc.nil? ? MyArray.new(self[1..]).my_reduce(first, &block) : MyArray.new(self[1..]).my_reduce(block.call(acc, first), &block)
      end
    end
  end
end
