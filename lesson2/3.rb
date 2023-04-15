# frozen_string_literal: true

# Заполни массив числами фибоначчи до 100
fib = []

f1 = 1
f2 = 2
f = 0

while f <= 100
  f3 = f2
  f2 += f1
  f1 = f3
  f += 1
  fib << f2
end

puts fib
