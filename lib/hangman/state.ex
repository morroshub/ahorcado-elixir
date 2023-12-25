defmodule Hangman.State do

  def new(word) do
    word = String.downcase(word)

    state = %{word: word, misses: [], matches: [], limit: 4, mask: "_", completed?: false}
  end

end
