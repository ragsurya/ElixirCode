defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "create_deck_makes 20 cards" do
    deck_length = length(Cards.create_deck)
    assert deck_length == 52
  end

  test "shuffle actually randomizes it" do
    deck = Cards.create_deck
    assert deck != Cards.shuffle(deck)
  end

  test "shuffle actually randomizes it `using refute`" do
    deck = Cards.create_deck
    refute deck == Cards.shuffle(deck)
  end
end
