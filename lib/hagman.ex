defmodule Hangman do

  @moduledoc """
  Classic game for play with friends in party time.

  This game was made in Platzi course dictated for Milton Mazzari and was madre
     by Morros.
  """


  @doc """

  Word is the goal to discover for win
  Misses is the wrong letters of player told, and this will be acumulated in a list
  Matches is the right letters of player told, and this will be acumulated in a list
  Limit is like a life or the times in numbers the player can make a wrong letter
  Mask hide letters of Word. 


  Starts the game and lets fun

  """


  def start_game  do
    state = %{word: "elixir", misses: [], matches: [], limit: 4, mask: "_"}
    format_response(state)
  end


  @doc """
  Lets the user to take a guess
  """


  def take_guess(letter, %{limit: limit, completed?: false} = state) when limit > 0  do
    letter
    |> String.downcase()
    |> guess(state)
    |> format_response()
  end
  

  def take_guess(_, state), do: format_response(state)
 
  ## Helpers

  defp format_response(%{limit: limit, completed?: false} = state) when limit > 0 do
    {mask_word(state), state}
  end

   defp format_response(%{limit: limit, word: word }= state) when  limit > 0 do
    {"You won, word was: #{word}", state} 
  end

  defp format_response(%{word: word} = state) do
    {"Game Over, word was: #{word}", state}
  end

  defp format_response(state, :err) do
    {"Please don't use repeated letters", state}
  end

  defp mask_word(%{matches: [], word: word, mask: mask} = _state) do
    String.replace(word, ~r/./, mask) # Se remplaza cada caracter por mask
  end

  defp mask_word(%{matches: matches, word: word, mask: mask} = _state) do
  matches = Enum.join(matches)
  String.replace(word, ~r/[^#{matches}]/, mask) # Oculta/Remplaza los caracteres que no estan en matches.
  end

  defp guess(letter, state) do
    %{word: word, matches: matches, misses: misses, limit: limit} = state

# Usamos pilas para matchear las letras en la palabra objetivo

    if String.contains?(word, letter) do   # Devuelve un boolean por "?"
      matches = [letter | matches] 
      completed? = word |> String.graphemes() |> Enum.all?(&(&1 in matches))
      %{state | matches: matches, completed?: completed?}
    else
      %{state | misses: [letter | misses], limit: limit - 1} 
    end
  end
end
