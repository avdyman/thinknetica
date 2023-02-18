# frozen_string_literal: true

abc = ('a'..'z')
abca = abc.to_a
aoy = %w[a e i o u y]

aoy_hash = {}

aoy.each { |i| aoy_hash[i] = abca.index(i) + 1 }
puts aoy_hash
