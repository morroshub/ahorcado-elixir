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

  def new(word) do
    word = String.downcase(word)
    goal = word |> String.graphemes() |> MapSet.new

    %{word: word, goal: goal, misses: MapSet.new(), matches: MapSet.new(), limit: 4, mask: "_", completed?: false}
  end

end
