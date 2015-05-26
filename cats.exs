defmodule Cats do

  @prefix "/tmp"

  def make do
    cats |> mk
  end

  def cats do

    [
      [state: "Virginia",
        cats: [[name: "Felix", age: 7],
               [name: "Angel", age: 1],
               [name: "Midnight", age: 9]]],
      [state: "Maryland",
        cats: [[name: "Pepper", age: 4],
               [name: "Oreo", age: 6]]],
      [state: "DC",
        cats: [[name: "Tiger", age: 3],
               [name: "Garfield", age: 3],
               [name: "Misty", age: 8]]],
    ]
  end

  def mk_state(state) do
    [@prefix, "cats", String.downcase(state)] |> Path.join |> File.mkdir_p!
  end

  def mk_cat(state, cat = [name: name, age: _age]) do
    [@prefix, "cats", String.downcase(state), String.downcase(name) <> ".cat"]
    |> Path.join
    |> File.write!(Macro.to_string(cat) <> "\n")
  end

  def mk([]) do
    # all done
  end

  def mk([[state: state, cats: cats] | t]) do
    state |> mk_state
    cats |> Enum.map(&(mk_cat(state, &1)))
    mk(t)
  end

end

Cats.make
