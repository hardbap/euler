require_relative './card'

class Hand
  attr_reader :cards

  def initialize(raw_cards)
    @raw_cards = raw_cards

    @cards = raw_cards.map { |c| Card.new(c) }
  end

  def royal_straight?
    @royal_straight ||= straight? && cards.min.value == 10
  end

  def royal_flush?
    @royal_flush ||= royal_straight? && flush?
  end

  def straight_flush?
    @straight_flush ||= straight? && flush?
  end

  def four_of_a_kind?
    @four_of_a_kind ||= !x_of_something(4).empty?
  end

  def full_house?
    @full_house ||= three_of_a_kind? && one_pair?
  end

  def flush?
    @flush ||= cards.all? {|c| c.suit == cards.first.suit }
  end

  def straight?
    @straight ||= cards.map(&:value) == Array(cards.min.value..cards.max.value)
  end

  def three_of_a_kind?
    @three_of_a_kind ||= !x_of_something(3).empty?
  end

  def two_pairs?
    @two_pairs ||= x_of_something(2).length == 2
  end

  def one_pair?
    @one_pair ||= !x_of_something(2).empty?
  end

  def rank
    case
    when royal_flush?
      9
    when straight_flush?
      8
    when four_of_a_kind?
      7
    when full_house?
      6
    when flush?
      5
    when straight?
      4
    when three_of_a_kind?
      3
    when two_pairs?
      2
    when one_pair?
      1
    else
      0
    end
  end

  def x_of_something(x)
     grouped.values.select { |v| v.size == x }
  end

  def grouped
    @grouped ||= cards.group_by(&:value)
  end
end
