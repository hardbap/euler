require_relative './test_helper'
require_relative '../lib/card.rb'

class CardTest < Minitest::Test

  def test_it_will_initialize_correctly
    card = Card.new('QH')

    assert_equal 'QH', card.face_value
  end

  def test_it_will_know_its_suit
    card = Card.new('QH')

    assert_equal 'H', card.suit
  end

  def test_it_will_know_its_value_for_face_cards

    cards = {
      'TH' => 10,
      'JH' => 11,
      'QH' => 12,
      'KH' => 13,
      'AH' => 14,
    }

    cards.each do |card, expected|
      assert_equal expected, Card.new(card).value, "#{card} expected to have value #{expected}"
    end

  end

  def test_it_will_know_its_value_for_nonface_cards

    (1..9).each do |expected|
      assert_equal expected, Card.new("#{expected}H").value, "#{expected}H expected to have value #{expected}"
    end
    
  end
end
