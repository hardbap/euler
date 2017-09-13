#!/usr/bin/env ruby

require_relative('./lib/round')
require 'csv'

player_1_wins = 0
game_number = 0

CSV.foreach('./resources/poker.txt', col_sep: " ") do |row|
  game_number += 1

  hands = row.each_slice(5).to_a
  round = Round.new(hands.first, hands.last)
  puts "Game #{game_number}: P1 #{hands.first}, P2 #{hands.last}"

  if round.player_1_wins?
    player_1_wins += 1
    puts 'Player 1 wins!'
  end
end

puts "\nTotal wins for Player 1: #{player_1_wins}"
