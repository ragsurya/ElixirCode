defmodule Cards do
  @moduledoc """
    Provides methods for creating and handling a deck of cards
  """
  def hello do
    :world
  end

  @doc """
    Returns a list of string representing a list of cards
  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Jack", "Queen", "King"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

      for suit <- suits, value <- values do
        #"#{value} of #{suit}"
        {value, suit}
      end
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
    Determines whether a deck contains a given card

  ## Examples

      iex> deck = Cards.create_deck
      iex> Cards.contains?(deck, {"Ace","Spades"})
      true
      
  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end


  @doc """
    Divides a deck into a hand and the remainder of the deck. 
    The `head_size` argument indicates how many cards should
    be in the hand

  ## Examples

      iex> deck = Cards.create_deck
      iex> {hand, deck} = Cards.deal(deck, 1)
      iex> hand
      [{"Ace", "Spades"}]

  """
  def deal(deck, hand) do
    Enum.split(deck, hand)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def readFileFromDisk(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term binary
      {:error, _} -> "That file does not exist"
    end
    
  end

  def allInOne(hand_size) do
    create_deck() |> shuffle() |> deal(hand_size)
  end

end
