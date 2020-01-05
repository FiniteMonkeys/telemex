defmodule TelemexTest do
  use ExUnit.Case
  doctest Telemex

  test "greets the world" do
    assert Telemex.hello() == :world
  end
end
