defmodule Cards do
  def hello do
    :world
  end

  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Jack", "Queen", "King"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

      for suit <- suits, value <- values do
        #"#{value} of #{suit}"
        {value, suit}
      end
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  def deal(deck, hand) do
    Enum.split(deck, hand)
  end
end
