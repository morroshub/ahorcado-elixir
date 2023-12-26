defmodule Hangman.Goal.Api do
  @moduledoc """
  Word Generator API
  """

  @doc """
  Generates a word, phrase, or sentence
  """
@callback generate() :: String.t()

end
