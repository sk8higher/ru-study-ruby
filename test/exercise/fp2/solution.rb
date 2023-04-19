module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each(&block)
        return self if empty?

        block.call(first)
        init(drop(1)).my_each(&block)

        self
      end

      # Написать свою функцию my_map
      def my_map(&block)
        result = init(self).my_reduce([]) { |acc, el| acc << block.call(el) }

        init(result)
      end

      # Написать свою функцию my_compact
      def my_compact
        result = init(self).my_reduce([]) { |acc, el| el.nil? ? acc : acc << el }

        init(result)
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil, &block)
        return acc if empty?

        head, *tail = self

        acc.nil? ? init(tail).my_reduce(head, &block) : init(tail).my_reduce(block.call(acc, head), &block)
      end

      private

      def init(array)
        MyArray.new(array)
      end
    end
  end
end
