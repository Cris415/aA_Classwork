class Integer
  # Integer#hash already implemented for you

end

class Array
  
  def hash
    hashed = 0 #[1 2 3]
    self.each.with_index do |el,i| # 1 # 2 # 3 
      hashed  += el.hash * i #hashed => 0 += (1.hash => 712381289) 
    end
    hashed
  end

end

class String # ["i", "u"] [i, u]  "a".ord => 97 #.chr 
  def hash
    hashed = 0 #[1 2 3]
    self.each_char.with_index do |char,i| # 1 # 2 # 3 
      hashed  += char.ord.hash * i #hashed => 0 += (1.hash => 712381289) 
    end
    hashed
    
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
       hashed = 0 #[1 2 3]
    self.each do |k,v| # 1 # 2 # 3 
      hashed  += k.to_s.ord.hash #hashed => 0 += (1.hash => 712381289) 
      hashed  += v.to_s.ord.hash
    end
    hashed
  end
end
