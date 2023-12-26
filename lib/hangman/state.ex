defmodule Hangman.State do
  @enforce_keys [:word, :goal] #requisitos obligatorios al compilar

  defstruct [
    :word,
    :goal,
    misses: MapSet.new(),
    matches: MapSet.new(),
    limit: 5,
    mask: "_",
    completed?: false
  ]

  @spec new(String.t())  :: %Hangman.State{}
  def new(word) do
    word = String.downcase(word)
    goal = word |> String.graphemes() |> MapSet.new

    struct!(__MODULE__, word: word, goal: goal)

  end
end
