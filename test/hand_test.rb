require_relative './test_helper'
require_relative '../lib/hand'

class HandTest < Minitest::Test

  def test_it_will_know_when_it_has_a_flush
    assert Hand.new(%w(2H 4H 6H 8H TH)).flush?, 'hand is a flush'

    refute Hand.new(%w(2H 4H 6H 8H TC)).flush?, 'hand is not a flush'
  end

  def test_it_will_know_when_it_has_a_straight
    assert Hand.new(%w(2H 3H 4D 5H 6C)).straight?, 'hand is a straight'

    refute Hand.new(%w(2H 4H 6H 8H TH)).straight?, 'hand is not a straight'
  end

  def test_it_will_know_when_it_has_a_royal_straight
    assert Hand.new(%w(TH JC QH KH AD)).royal_straight?, 'hand is a royal straight'

    refute Hand.new(%w(TH JH QH KH 2D)).royal_straight?, 'hand is not a royal straight'
  end

  def test_it_will_know_when_it_has_a_royal_flush
    assert Hand.new(%w(TH JH QH KH AH)).royal_flush?, 'hand is a royal flush'

    refute Hand.new(%w(TH JH QH KH AD)).royal_flush?, 'hand is not a royal flush'
  end

  def it_will_know_when_it_has_staight_flush
    assert Hand.new(%w(2H 3H 4H 5H 6H)).straight_flush?, 'hand is a straight flush'

    refute Hand.new(%w(2H 3H 4H 5H 6D)).straight_flush?, 'hand is not a straight flush'
  end

  def it_will_know_when_it_has_four_of_a_kind
    assert Hand.new(%w(2H 3H 2D 2S 2C)).four_of_a_kind?, 'hand is four of a kind'

    refute Hand.new(%w(2H 3H 2D 2S 3C)).four_of_a_kind?, 'hand is not four of a kind'
  end

  def it_will_know_when_it_has_three_of_a_kind
    assert Hand.new(%w(2H 3H 2D 4S 2C)).three_of_a_kind?, 'hand is four of a kind'

    refute Hand.new(%w(2H 3H 3D 2S 3C)).three_of_a_kind?, 'hand is not four of a kind'
  end

  def it_will_know_when_it_has_one_pair
    assert Hand.new(%w(2H 3H JD 4S 2C)).one_pair?, 'hand has one pair'

    refute Hand.new(%w(QH 3H 5D 2S AC)).one_pair?, 'hand does not have one pair'
  end

  def it_will_know_when_it_has_full_house
    assert Hand.new(%w(2H 2D 4D 4S 2C)).full_house?, 'hand has a full house'

    refute Hand.new(%w(2H 2D 4D 5S 2C)).one_pair?, 'hand does not have a full house'
  end

  def test_it_will_know_when_it_has_two_pairs
    assert Hand.new(%w(2H 2D 4D 4S 5C)).two_pairs?, 'hand has two pairs'

    refute Hand.new(%w(2H 2D 4D 5S 2C)).two_pairs?, 'hand does not have two pairs'
  end

  def test_it_will_know_its_rank
    assert_equal 9, Hand.new(%w(TH JH QH KH AH)).rank, 'wrong rank for Royal Flush'
    assert_equal 8, Hand.new(%w(2H 3H 4H 5H 6H)).rank, 'wrong rank for Straight Flush'
    assert_equal 7, Hand.new(%w(2H 3H 2D 2S 2C)).rank, 'wrong rank for 4 of a kind'
    assert_equal 6, Hand.new(%w(2H 2D 4D 4S 2C)).rank, 'wrong rank for Full House'
    assert_equal 5, Hand.new(%w(2H 4H 6H 8H TH)).rank, 'wrong rank for Flush'
    assert_equal 4, Hand.new(%w(2H 3H 4D 5H 6C)).rank, 'wrong rank for Straight'
    assert_equal 3, Hand.new(%w(2H 3H 2D 4S 2C)).rank, 'wrong rank for 3 of a kind'
    assert_equal 2, Hand.new(%w(2H 2D 4D 4S 5C)).rank, 'wrong rank for 2 pairs'
    assert_equal 1, Hand.new(%w(2H 3H JD 4S 2C)).rank, 'wrong rank for 1 pair'
    assert_equal 0, Hand.new(%w(5D 8C 9S JS AC)).rank, 'wrong rank for High Card'
  end
end
