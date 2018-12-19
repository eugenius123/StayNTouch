class Fibonacci
  # Implement a method that will calculate the Nth number of the Fibonacci
  # sequence (http://en.wikipedia.org/wiki/Fibonacci_number)
  
  # in order to calculate fibonacci in the most time and space efficient way,
  # use an iterative solution that only keeps track of the current and previous values
  # time complexity: O(n), space complexity O(1)

  def self.calculate(n)
    prev = 0
    curr = 1

    if n == 0
      prev
    elsif n == 1
      curr
    else
      (2..n).each do |fib|
        mid = prev + curr
        prev = curr
        curr = mid
      end
      return curr
    end

  end
end
