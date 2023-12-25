defmodule Hangman.View do
  @moduledoc """
  Presentation layer of app Hangman
  """
  @doc """
  Returns response
  """

  def format_response(%{completed?: false} = state) do
    {mask_word(state), state}
  end

  def format_response(%{word: word, matches: _matches} = state) do
    if state.limit > 0 do
      if state.completed? do
        {"You won, word was: #{word}", state}
      else
        {"Please don't use repeated letters", state}
      end
    else
      {"Game Over, word was: #{word}", state}
    end
  end


  defp mask_word(%{matches: matches, word: word, mask: mask} = _state) do
    if MapSet.size(matches) > 0 do
      matches = Enum.join(matches)
      String.replace(word, ~r/[^#{matches}]/, mask)
    else
      String.replace(word, ~r/./, mask)
    end
  end
end
