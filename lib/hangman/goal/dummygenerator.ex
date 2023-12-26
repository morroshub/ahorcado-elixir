defmodule Hangman.Goal.DummyGenerator do
  @behaviour Hangman.Goal.Api

  def generate do
    Enum.random(["hangman", "fortune", "elixir"])
  end
end
