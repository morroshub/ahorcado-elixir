defmodule HangmanTest do
  use ExUnit.Case
  doctest Hangman

  defmodule TestGenerator do # Este sera nuestro adaptador en tiempo de ejecucion | Config realizada tambien en "test_helper"
    @behaviour Hangman.Goal.Api

    def generate, do: "Elixir"
  end

  describe "take_guess/2" do
    setup do
      {"______", state} = Hangman.start_game()

      %{state: state}
    end

    test "announces when the user wins", %{state: state} do
      assert {"e_____", state} = Hangman.take_guess("e", state)
      {result, state} = check(["l", "i", "x","r"], state)
      assert "You won, word was: elixir" == result
      assert state.completed?
    end

    test "announces when the user loses", %{state: state} do
      assert {"______", state} = Hangman.take_guess("n", %{state | limit: 2})
      assert {"Game Over, word was: elixir", state} = Hangman.take_guess("n", state)
      refute state.completed?
    end
  end

  defp check(attempts, state) do
    Enum.reduce(attempts,
    {"", state}, fn letter, {_, state} ->
      Hangman.take_guess(letter, state)
    end)
  end

end
