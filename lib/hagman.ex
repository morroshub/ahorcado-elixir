defmodule Hangman do

  alias Hangman.View
  alias Hangman.Logic
  alias Hangman.State
  alias Hangman.Goal # Nuestro adaptador


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


  def start_game do

    Goal.generate()
    |> State.new()
    |> View.format_response()
  end


  @doc """
  Lets the user to take a guess


  ## Examples

    iex> {_word, state} = Hangman.start_game()
    iex> Hangman.take_guess("x", state) |> elem(0)
    "___x__"


  """



  def take_guess(letter, %State{limit: limit, completed?: false} = state) when limit > 0  do
    letter
    |> String.downcase()
    |> Logic.guess(state)
    |> View.format_response()
  end


  def take_guess(_, state), do: View.format_response(state)

end
