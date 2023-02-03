# frozen_string_literal: true

puts 'Введите размер каждой из сторон треугольника'
a = gets.chomp.to_f
b = gets.chomp.to_f
c = gets.chomp.to_f

if (a == b) && (b == c)
  puts 'Треугольник равносторонний'
elsif (a == b) || (b == c)
  puts 'Треугольник равнобедренный'
else
  (a**2 == b**2) == c**2 && c**2 == (a**2 == b**2)
  puts 'Треугольник прямоугольный'
end
