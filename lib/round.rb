require_relative './hand'

class Round
  attr_reader :player_1, :player_2

  def initialize(hand_one, hand_two)
    @player_1 = Hand.new(hand_one)
    @player_2 = Hand.new(hand_two)
  end

  def player_1_wins?
    case @player_1.rank <=> @player_2.rank
    when 1
      true
    when 0
      tiebreaker
    else
      false
    end
  end

  def tiebreaker
#    return vals_1.first > vals_2.first if @player_1.rank.zero?

    sorter = lambda { |a,b| [b.last.length, b.first] <=> [a.last.length, a.first] }
    vals_1 = player_1.grouped.sort(&sorter).map(&:first)
    vals_2 = player_2.grouped.sort(&sorter).map(&:first)

    if vals_1.first == vals_2.first
      vals_1[1] > vals_2[1]
    else
      vals_1.first > vals_2.first
    end
  end
end
