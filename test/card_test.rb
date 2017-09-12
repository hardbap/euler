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

  def test_it_will_know_its_value
    card = Card.new('QH')

    assert_equal 'Q', card.value
  end
end
