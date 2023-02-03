# frozen_string_literal: true

# require 'pry'

puts 'Как тебя зовут?'
name = gets.chomp

puts 'Какой у тебя рост?'
height = gets.chomp.to_f

b = (height - 110) * 1.15
puts "#{name}, доброго дня! Твой идеальный вес #{b} кг."

puts 'Какой твой вес?'
weight = gets.chomp.to_f

# binding.pry
puts 'Ваш вес уже оптимальный' if weight < b
