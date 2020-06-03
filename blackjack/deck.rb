module Deck
  SUITS = %w[♠ ♥ ♣ ♦].freeze
  VALUES = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A'].freeze

  module_function

  def generate
    SUITS.map { |suits| VALUES.map { |values| values.to_s + suits } }.flatten
  end
end
