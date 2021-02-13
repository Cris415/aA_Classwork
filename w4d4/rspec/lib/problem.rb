class Array

  def my_uniq
    return self if self.empty? 
    elements = Hash.new(0)
    self.each {|el| elements[el] += 1 }
    elements.keys
  end

  def two_sum
    return self if self.empty?
    raise ("Array should contain numeric elements only") if self.any? { |el| !el.is_a?(Numeric) }
    results = []
    (0...self.length).each do |i|
      (i+1...self.length).each do |j|
        results << [i,j] if (self[i] + self[j]) == 0
      end
    end
    results
  end

  def my_transpose
    return self if self.empty?
    raise "Array should be two-dimensional" unless self.all? {|el| el.is_a?(Array)}
    raise "Matrix must be square" unless self.all? { |row| row.length == self.length }

    transposed = []

    (0...self.length).each do |i|
      new_row = []
      (0...self.length).each  { |j|  new_row << self[j][i] }
      transposed << new_row
    end
    transposed
  end

end

def stock_picker(prices)
  raise "Array should contain at least two stock prices" if prices.length < 2
  max = { gain: 0.0, days: [] }
  
  (0...prices.length).each do |i|
    (i+1...prices.length).each do |j|
      diff = prices[j] - prices[i]
      if diff > max[:gain] 
        max[:gain] = diff
        max[:days] = [i, j]
      end
    end
  end
  raise "***DO NOT BUY***" if max[:gain] == 0
  max[:days]
end

# gme = [82.77, 72.41, 59.96, 50.77, 50.01] # ***actual GME stock prices from this week***
# p stock_picker(gme)

class TowersGame

end