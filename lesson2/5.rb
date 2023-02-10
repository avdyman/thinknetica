# frozen_string_literal: true

puts 'Введите день, месяц и год'
day = gets.chomp.to_i
month = gets.chomp.to_i
year = gets.chomp.to_i

def wyear(year)
  if year % 4 != 0
    28
  elsif year % 100 != 0
    29
  elsif (year % 400).zero? || (year % 100).zero?
    29
  else
    28
  end
end

months_in_year = [31, wyear(year), 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

pos = day + months_in_year.take(month - 1).sum

puts pos
