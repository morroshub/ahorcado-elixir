defmodule Hangman.Logic do
  @moduledoc """
  Main logic of game
  """

  @doc"""
  Return the game state after the user takes a guess
  """

  def guess(letter, state) do
    %{word: word, matches: matches, misses: misses, limit: limit, completed?: completed?} = state

    # Verificar si ya hemos ganado o perdido
    if completed? || limit == 0 do
      IO.puts "Game already over"
      state
    else
      # Verificar si la letra ya ha sido adivinada
      if letter in matches || letter in misses do
        IO.puts "Letter #{letter} already guessed"
        state
      else
        if String.contains?(word, letter) do
          matches = [letter | matches]
          completed? = word |> String.graphemes() |> Enum.all?(&(&1 in matches))
          %{state | matches: matches, completed?: completed?}
        else
          %{state | misses: [letter | misses], limit: limit - 1}
        end
      end
    end
  end
end
