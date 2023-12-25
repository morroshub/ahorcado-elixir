defmodule Hangman.Logic do
  @moduledoc """
  Main logic of game
  """

  @doc"""
  Return the game state after the user takes a guess
  """

  def guess(letter, state) do
    %{goal: goal,  matches: matches, misses: misses, limit: limit} = state

    # Verificar si ya hemos ganado o perdido
    if MapSet.member?(goal, letter) do
     matches = MapSet.put(matches, letter)
     completed? = MapSet.put(matches, letter)
      %{state | matches: matches, completed?: completed?}
    else
      %{state | misses: MapSet.put(misses, letter), limit: limit - 1 }
    end
  end
end
