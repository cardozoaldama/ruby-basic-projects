def stock_picker(prices)
  return [] if prices.length < 2

  min_price = prices[0]
  min_index = 0
  
  max_profit = 0
  best_days = [0, 0]

  prices.each_with_index do |price, current_day|
    # Update the lowest price seen so far
    if price < min_price
      min_price = price
      min_index = current_day
    end

    # Calculate potential profit if selling today
    potential_profit = price - min_price

    # If this profit is better than what we've seen, save the days
    if potential_profit > max_profit
      max_profit = potential_profit
      best_days = [min_index, current_day]
    end
  end

  best_days
end

p stock_picker([17, 3, 6, 9, 15, 8, 6, 1, 10])
