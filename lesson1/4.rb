# frozen_string_literal: true

puts 'Введите три коэффициента'
a = gets.chomp.to_f
b = gets.chomp.to_f
c = gets.chomp.to_f

dis = b**2 - 4 * a * c

if dis.negative?
  puts "Дискириминант #{dis}, Корней нет"
elsif dis.zero?
  puts "Дискириминант #{dis}, корень #{-b / (2 * a)}"
else
  puts "Дискриминант #{dis}, корень1 = #{-b + Math.sqrt(dis) / (2 * a)}, корень2 = #{-b - Math.sqrt(dis) / (2 * a)}"
end
