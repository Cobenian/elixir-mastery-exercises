defmodule Cats do

  @prefix "/tmp"

  def make do
    prep |> cats |> make_cats
  end

  def prep do

    [@prefix, "cats", "virginia"] |> Path.join |> File.mkdir_p!
    [@prefix, "cats", "maryland"] |> Path.join |> File.mkdir_p!
    [@prefix, "cats", "dc"]       |> Path.join |> File.mkdir_p!

  end

  def cats(_) do

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

  def mk_cat(state, cat = [name: name, age: _age]) do
    [@prefix, "cats", String.downcase(state), String.downcase(name) <> ".cat"]
    |> Path.join
    |> File.write!(Macro.to_string(cat) <> "\n")
  end

  def make_cats([]) do

  end

  def make_cats([[state: state, cats: cats] |t]) do
    cats |> Enum.map(&(mk_cat(state, &1)))
    make_cats(t)
  end

end

Cats.make
