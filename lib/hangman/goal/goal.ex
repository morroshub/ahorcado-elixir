defmodule Hangman.Goal do
    @behaviour Hangman.Goal.Api

    @client Application.compile_env(:hangman,  __MODULE__, Hangman.Goal.DummyGenerator)

    defdelegate generate, to: @client
end
