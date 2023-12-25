defmodule HagmanTest do
  use ExUnit.Case
  doctest Hagman

  test "greets the world" do
    assert Hagman.hello() == :world
  end
end
