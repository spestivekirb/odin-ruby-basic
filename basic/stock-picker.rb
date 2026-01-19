# Idea: Greedy approach.
# Keep track of the cheapest buy up to this point
# Calculate the profit from selling at this time.

def stock_picker(prices)
  min_price = prices[0]
  min_index = 0

  cur_min = 0
  
  max_profit = 0
  max_index = 0

  prices.each_with_index do |price, index|
    if price < min_price 
      min_price = price
      min_index = index 
    end
    if price - min_price > max_profit
      max_profit = price - min_price
      max_index = index
      cur_min = min_index
      
    end
  end
  [cur_min, max_index]
end

print stock_picker([17,3,6,9,15,8,6,1,10])