require_relative './hand'

class Round
  attr_reader :player_1, :player_2

  def initialize(hand_one, hand_two)
    @player_1 = Hand.new(hand_one)
    @player_2 = Hand.new(hand_two)
  end

  def player_1_wins?
    case player_1.rank <=> player_2.rank
    when 1
      true
    when 0
      tiebreaker
    else
      false
    end
  end

  def tiebreaker
    # sort the groups by frequency first then value
    # in a full house 2H 2S 2C 10D 10H the three 2s will sort higher than two 10s
    sorter = lambda { |a,b| [b.last.length, b.first] <=> [a.last.length, a.first] }
    vals_1 = player_1.grouped.sort(&sorter).map(&:first)
    vals_2 = player_2.grouped.sort(&sorter).map(&:first)

    # find the index of our first non-duplicate value
    index = vals_1.index(vals_1.detect { |x| vals_2.rindex(x).nil? })

    # compare card value based on that index
    vals_1[index] > vals_2[index]
  end
end
