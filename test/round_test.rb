require_relative './test_helper'
require_relative '../lib/round'

class RoundTest < Minitest::Test

  def test_hand_1
    p1 = %w(5H 5C 6S 7S KD) # pair of 5s
    p2 = %w(2C 3S 8S 8D TD) # pair of 8s

    round = Round.new(p1, p2)

    refute round.player_1_wins?
  end

  def test_hand_2
    p1 = %w(5D 8C 9S JS AC) # A high
    p2 = %w(2C 5C 7D 8S QH) # Q high

    round = Round.new(p1, p2)

    assert round.player_1_wins?
  end

  def test_hand_3
    p1 = %w(2D 9C AS AH AC) # three A
    p2 = %w(3D 6D 7D TD QD) # diamond flush

    round = Round.new(p1, p2)



    refute round.player_1_wins?
  end

  def test_hand_4
    p1 = %w(4D 6S 9H QH QC) # pair of Qs, 9 high
    p2 = %w(3D 6D 7H QD QS) # pair of Qs, 7 high

    round = Round.new(p1, p2)

    assert round.player_1_wins?
  end

  def test_hand_5
    p1 = %w(2H 2D 4C 4D 4S) # full house, 4s
    p2 = %w(3C 3D 3S 9S 9D) # full house, 3s

    round = Round.new(p1, p2)

    assert round.player_1_wins?
  end
end
