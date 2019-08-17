defmodule Cards do
  @moduledoc """
    Methods for a deck game
  """

  @doc """
    Create a new Deck
  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten"]
    suits = ["Spades", "Clubs", "Hearts", "Diamond"]

    for suit <- suits, value <- values do
        ("#{value} of #{suit}")
    end

  end

  @doc """
    Shuffle the deck
  """
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
    Does this card exist in deck?

    ##Examples

      iex> deck = Cards.create_deck
      iex> Cards.contain?(deck, "Ace of Spades")
      true
  """
  def contain?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
    Separating the deck
  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  @doc """
    Saving the deck
  """
  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  @doc """
    Loading the deck
  """
  def load(filename) do
    #Evitar usar IF, tentar sempre usar 'case'
    case File.read(filename) do
      {:ok, binary_deck} -> :erlang.binary_to_term(binary_deck)
      {:error, _reason} -> "The file don't exists"
    end

  end

  @doc """
    Create, shuffle and separate the cards
  """
  def create_hand(hand_size) do
    Cards.create_deck
    |> Cards.shuffle()
    |> Cards.deal(hand_size)
  end

end
