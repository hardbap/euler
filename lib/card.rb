class Card
  attr_reader :face_value

  def initialize(face)
    @face_value = face
  end

  def suit
    face_value.chars.last
  end

  def value
    case face_value.chars.first
    when 'T'
      10
    when 'J'
      11
    when 'Q'
      12
    when 'K'
      13
    when 'A'
      14
    else
      Integer(face_value.chars.first)
    end
  end

  def <=>(other)
    value <=> other.value
  end
end
