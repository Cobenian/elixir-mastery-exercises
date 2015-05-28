defmodule Java do

  @default_class_file "Hello.class"

  def main(args) do
    args |> read_java_class_file |> class_file |> another_class_file(args)
  end

  def class_file(<<0xCA, 0xFE, 0xBA, 0xBE, # magic word
                  minor_version :: bytes-size(2),
                  major_version :: bytes-size(2),
                  constant_pool_count :: unsigned-integer-size(16),
                  rest :: binary >>) do
    IO.puts "magic word matched, this is a Java class file"
    print_java_version(major_version, minor_version)
    IO.puts "there are #{constant_pool_count} entries in the constant pool"
    {remaining, new_constant_pool} = constant_pool_entry(rest, constant_pool_count)

    <<>>
    <> <<0xCA, 0xFE, 0xBA, 0xBE>>
    <> minor_version
    <> major_version
    <> integer_to_two_bytes(constant_pool_count)
    <> new_constant_pool
    <> remaining
  end

  def print_java_version(<<0x00, 0x34>>, minor_version) do
    IO.write "Java 8 minor version: "
    IO.inspect minor_version
  end

  def print_java_version(<<0x00, 0x33>>, minor_version) do
    IO.write "Java 7 minor version: "
    IO.inspect minor_version
  end

  def print_java_version(<<0x00, 0x32>>, minor_version) do
    IO.write "Java 6 minor version: "
    IO.inspect minor_version
  end

  def print_java_version(v, minor_version) do
    IO.puts "Some really old java version..."
    IO.write "major version: "
    IO.inspect v
    IO.write "minor version: "
    IO.inspect minor_version
  end

  @default_transformation &Java.transformation/1

  def transformation(<<70, 111, 111>>) do
    <<66, 97, 114>>
  end

  def transformation(anything), do: anything

  def constant_pool_entry(bytes, count) do
    constant_pool_entry(bytes, count - 1, <<>>)
  end

  def constant_pool_entry(rest, 0, acc ) do
    {rest, acc}
  end

  def constant_pool_entry(<<1, string_length :: unsigned-integer-size(16), str :: bytes-size(string_length), rest :: binary>>, constant_pool_count, acc ) do
    constant_pool_entry(rest, constant_pool_count - 1, acc <> <<1>> <> integer_to_two_bytes(string_length) <> @default_transformation.(str))
  end

  def constant_pool_entry(<<3, value :: bytes-size(4), rest :: binary>>, constant_pool_count, acc ) do
    constant_pool_entry(rest, constant_pool_count - 1, acc <> <<3>> <> value)
  end

  def constant_pool_entry(<<4, value :: bytes-size(4), rest :: binary>>, constant_pool_count, acc ) do
    constant_pool_entry(rest, constant_pool_count - 1, acc <> <<4>> <> value)
  end

  def constant_pool_entry(<<5, value :: bytes-size(8), rest :: binary>>, constant_pool_count, acc ) do
    constant_pool_entry(rest, constant_pool_count - 1, acc <> <<5>> <> value)
  end

  def constant_pool_entry(<<6, value :: bytes-size(8), rest :: binary>>, constant_pool_count, acc ) do
    constant_pool_entry(rest, constant_pool_count - 1, acc <> <<6>> <> value)
  end

  def constant_pool_entry(<<7, value :: bytes-size(2), rest :: binary>>, constant_pool_count, acc) do
    constant_pool_entry(rest, constant_pool_count - 1, acc <> <<7>> <> value)
  end

  def constant_pool_entry(<<8, value :: bytes-size(2), rest :: binary>>, constant_pool_count, acc ) do
    constant_pool_entry(rest, constant_pool_count - 1, acc <> <<8>> <> value)
  end

  def constant_pool_entry(<<9, value :: bytes-size(4), rest :: binary>>, constant_pool_count, acc ) do
    constant_pool_entry(rest, constant_pool_count - 1, acc <> <<9>> <> value)
  end

  def constant_pool_entry(<< <<10>>, value :: bytes-size(4), rest :: binary>>, constant_pool_count, acc ) do
    constant_pool_entry(rest, constant_pool_count - 1, acc <> <<10>> <> value)
  end

  def constant_pool_entry(<<11, value :: bytes-size(4), rest :: binary>>, constant_pool_count, acc ) do
    constant_pool_entry(rest, constant_pool_count - 1, acc <> <<11>> <> value)
  end

  def constant_pool_entry(<<12, value :: bytes-size(4), rest :: binary>>, constant_pool_count, acc ) do
    constant_pool_entry(rest, constant_pool_count - 1, acc <> <<12>> <> value)
  end

  def constant_pool_entry(<<15, value :: bytes-size(3), rest :: binary>>, constant_pool_count, acc ) do
    constant_pool_entry(rest, constant_pool_count - 1, acc <> <<15>> <> value)
  end

  def constant_pool_entry(<<16, value :: bytes-size(2), rest :: binary>>, constant_pool_count, acc ) do
    constant_pool_entry(rest, constant_pool_count - 1, acc <> <<16>> <> value)
  end

  def constant_pool_entry(<<18, value :: bytes-size(2), rest :: binary>>, constant_pool_count, acc ) do
    constant_pool_entry(rest, constant_pool_count - 1, acc <> <<18>> <> value)
  end

  def read_java_class_file([]) do
    read_java_class_file([@default_class_file])
  end

  def read_java_class_file([f]) do
    File.read! f
  end

  def another_class_file(bytes, []) do
    another_class_file(bytes, [@default_class_file])
  end

  def another_class_file(bytes, [f]) do
    File.write!(f, bytes)
  end

  def integer_to_two_bytes(i) do
    if i < 255 do
      <<0x00, i>>
    else
      <<i>>
    end
  end

end
