class Card
  attr_reader :face_value

  def initialize(face)
    @face_value = face
  end

  def suit
    face_value.chars.last
  end

  def value
    face_value.chars.first
  end
end
