defmodule OTPTest do
  use ExUnit.Case
  doctest OTP

  test "greets the world" do
    assert OTP.hello() == :world
  end
end
