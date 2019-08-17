defmodule Cards do

  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten"]
    suits = ["Spades", "Clubs", "Hearts", "Diamond"]

    for suit <- suits, value <- values do
        ("#{value} of #{suit}")
    end

  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def contain?(deck, card) do
    Enum.member?(deck, card)
  end

  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do
    #Evitar usar IF, tentar sempre usar 'case'
    case File.read(filename) do
      {:ok, binary_deck} -> :erlang.binary_to_term(binary_deck)
      {:error, _reason} -> "The file don't exists"
    end

  end

  def create_hand(hand_size) do
    deck = Cards.create_deck
    deck = Cards.shuffle(deck)
    hand = Cards.deal(deck, hand_size)
  end

end
