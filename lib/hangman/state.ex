defmodule Hangman.State do

  def new(word) do
    word = String.downcase(word)
    goal = word |> String.graphemes() |> MapSet.new

    %{word: word, goal: goal, misses: Mapset.new(), matches: Mapset.new(), limit: 4, mask: "_", completed?: false}
  end

end
