defmodule Hangman do
  use Agent

  alias Hangman.View
  alias Hangman.Logic
  alias Hangman.State
  alias Hangman.Goal # Nuestro adaptador

  @moduledoc """
  Classic game for play with friends in party time.

  This game was made in Platzi course dictated for Milton Mazzari and was made
  by Morros.
  """

  @doc """
  Word is the goal to discover for win
  Misses are the wrong letters of player told, and these will be accumulated in a list
  Matches are the right letters of player told, and these will be accumulated in a list
  Limit is like a life or the number of times the player can make a wrong letter
  Mask hides letters of Word.

  Starts the game and lets have fun
  """
  def start_link(name) when is_atom(name) do
    Agent.start_link(fn ->
      Goal.generate() # Aquí generamos la palabra
      |> State.new() # Por medio de la palabra, se genera el estado.
    end, name: name)
  end

  @doc """
  Lets the user take a guess

  ## Examples

    iex> {_word, state} = Hangman.start_game()
    iex> Hangman.take_guess("x", state) |> elem(0)
    "___x__"
  """
  def take_guess(player, letter) do
    new_state =
      Agent.get_and_update(player, fn state ->
        new_state =
          letter
          |> String.downcase()
          |> Logic.guess(state)

        {new_state, new_state}
      end)
    View.format_response(new_state)
  end

  def stop(player) when is_atom(player), do: Agent.stop(player)
end
