# frozen_string_literal: true

cart = {}
total_sum = 0

loop do
  puts 'Название товара или слово стоп'
  goods = gets.chomp.to_s
  break if %w[стоп stop].include?(goods)

  puts 'Укажите цену за единицу'
  price = gets.chomp.to_f
  puts 'Укажите количество товара'
  quantity = gets.chomp.to_f
  cart[goods.to_sym] = { "price": price, "quantity": quantity }
end

cart.each do |key, value|
  sum = value[:price] * value[:quantity]
  p "Товар: #{key} На сумму: #{sum} "
  total_sum += sum
end

puts cart
puts "Итого куплено на сумму: #{total_sum}"
