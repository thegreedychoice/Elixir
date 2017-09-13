defmodule SchizoTest do
  use ExUnit.Case
  doctest Schizo

  test "greets the world" do
    assert Schizo.hello() == :world
  end
  test "uppercase doesn't change the first word" do
  	assert Schizo.uppercase("abc") == "abc"
  end

  test "uppercase changes the second word" do
  	assert Schizo.uppercase("abc def") == "abc DEF"
  end

  test "uppercase changes every other word" do
  	assert Schizo.uppercase("abc def ghi jkl") == "abc DEF ghi JKL"
  end

  test "unwovel doesn't change our first word" do
  	assert Schizo.unvowel("abc") == "abc"
  end

  test "unwovel changes only secondword" do
  	assert Schizo.unvowel("abc def") == "abc df"
  end

  test "unwovel changes every other word" do
  	assert Schizo.unvowel("abc def ghi jkl") == "abc df ghi jkl"
  end
end
