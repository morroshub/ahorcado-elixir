check = fn attempts ->
  {_, state} = Hangman.start_game()

  Enum.reduce(attempts, state, fn letter, state ->
    {word, state} = Hangman.take_guess(letter, state)
    IO.puts word
    state
  end)
end

IO.puts "WIN"
check.(["e", "l", "i", "x", "r"])

IO.puts "Game Over"
check.(["n", "o", "m", "a", "t"])
