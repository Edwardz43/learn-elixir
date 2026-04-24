defmodule BasicsTest do
  use ExUnit.Case
  doctest Basics

  # ============================================================================
  # hello/0
  # ============================================================================

  describe "hello/0" do
    test "returns :world" do
      assert Basics.hello() == :world
    end
  end

  # ============================================================================
  # add/2
  # ============================================================================

  describe "add/2" do
    test "adds two positive numbers" do
      assert Basics.add(2, 3) == 5
    end

    test "handles negative numbers" do
      assert Basics.add(-1, 1) == 0
    end

    test "handles zero" do
      assert Basics.add(0, 0) == 0
    end
  end

  # ============================================================================
  # divide/2
  # ============================================================================

  describe "divide/2" do
    test "divides two numbers" do
      assert Basics.divide(10, 2) == 5
    end

    test "returns :error when dividing by zero" do
      assert Basics.divide(10, 0) == :error
    end
  end

  # ============================================================================
  # greet/1
  # ============================================================================

  describe "greet/1" do
    test "greets by name" do
      assert Basics.greet("Elixir") == "Hello, Elixir!"
    end

    test "greets 'World' when name is empty" do
      assert Basics.greet("") == "Hello, World!"
    end

    test "trims whitespace from name" do
      assert Basics.greet("  ") == "Hello, World!"
    end
  end

  # ============================================================================
  # string_length/1
  # ============================================================================

  describe "string_length/1" do
    test "returns length of string" do
      assert Basics.string_length("elixir") == 6
    end

    test "handles empty string" do
      assert Basics.string_length("") == 0
    end
  end

  # ============================================================================
  # convert_to_atom/1
  # ============================================================================

  describe "convert_to_atom/1" do
    test "converts lowercase string to atom" do
      assert Basics.convert_to_atom("hello") == :hello
    end

    test "converts uppercase string to lowercase atom" do
      assert Basics.convert_to_atom("WORLD") == :world
    end
  end

  # ============================================================================
  # is_it_an_atom/1
  # ============================================================================

  describe "is_it_an_atom/1" do
    test "returns true for atom" do
      assert Basics.is_it_an_atom(:hello) == true
    end

    test "returns false for string" do
      assert Basics.is_it_an_atom("hello") == false
    end
  end

  # ============================================================================
  # concat_lists/2
  # ============================================================================

  describe "concat_lists/2" do
    test "concatenates two lists" do
      assert Basics.concat_lists([1, 2], [3, 4]) == [1, 2, 3, 4]
    end

    test "handles empty list" do
      assert Basics.concat_lists([], [1, 2]) == [1, 2]
    end
  end

  # ============================================================================
  # prepend/2
  # ============================================================================

  describe "prepend/2" do
    test "prepends element to list" do
      assert Basics.prepend(0, [1, 2, 3]) == [0, 1, 2, 3]
    end

    test "prepends to empty list" do
      assert Basics.prepend(1, []) == [1]
    end
  end

  # ============================================================================
  # head_tail/1
  # ============================================================================

  describe "head_tail/1" do
    test "returns {head, tail} for non-empty list" do
      assert Basics.head_tail([1, 2, 3]) == {1, [2, 3]}
    end

    test "returns :empty for empty list" do
      assert Basics.head_tail([]) == :empty
    end
  end

  # ============================================================================
  # tuple_example/0
  # ============================================================================

  describe "tuple_example/0" do
    test "returns tuple" do
      assert Basics.tuple_example() == {:ok, "elixir"}
    end
  end

  # ============================================================================
  # create_tuple/2
  # ============================================================================

  describe "create_tuple/2" do
    test "creates tuple with pipe" do
      assert Basics.create_tuple(1, 2) == {:created, 1, 2}
    end
  end

  # ============================================================================
  # map_example/0
  # ============================================================================

  describe "map_example/0" do
    test "returns map" do
      assert Basics.map_example() == %{name: "elixir", version: "1.19"}
    end
  end

  # ============================================================================
  # map_operations/0
  # ============================================================================

  describe "map_operations/0" do
    test "performs map operations" do
      result = Basics.map_operations()
      assert result[:a] == 1
      assert result[:b] == 100
      assert result[:c] == 3
    end
  end

  # ============================================================================
  # map_get_with_default/2
  # ============================================================================

  describe "map_get_with_default/2" do
    test "gets existing key" do
      assert Basics.map_get_with_default(%{name: "elixir"}, :name) == "elixir"
    end

    test "returns default for missing key" do
      assert Basics.map_get_with_default(%{name: "elixir"}, :missing) == "default"
    end
  end

  # ============================================================================
  # keyword_list_example/0
  # ============================================================================

  describe "keyword_list_example/0" do
    test "returns keyword list" do
      result = Basics.keyword_list_example()
      assert result == [{:host, "localhost"}, {:port, 4000}, {:ssl, true}]
    end
  end

  # ============================================================================
  # conditionals/1
  # ============================================================================

  describe "conditionals/1" do
    test "returns :active for :active" do
      assert Basics.conditionals(:active) == :active
    end

    test "returns input for other values" do
      assert Basics.conditionals(:inactive) == :inactive
    end
  end

  # ============================================================================
  # case_example/1
  # ============================================================================

  describe "case_example/1" do
    test "matches hello" do
      assert Basics.case_example("hello") == "greeting"
    end

    test "matches goodbye" do
      assert Basics.case_example("goodbye") == "farewell"
    end

    test "uses wildcard for unknown" do
      assert Basics.case_example("unknown") == "unknown"
    end
  end

  # ============================================================================
  # default_param/2
  # ============================================================================

  describe "default_param/2" do
    test "uses default greeting" do
      assert Basics.default_param("Alice") == "Hello, Alice! hello"
    end

    test "uses provided greeting" do
      assert Basics.default_param("Alice", "Hi") == "Hello, Alice! Hi"
    end
  end

  # ============================================================================
  # private_function_example/1
  # ============================================================================

  describe "private_function_example/1" do
    test "doubles the input" do
      assert Basics.private_function_example(5) == 10
    end

    test "handles zero" do
      assert Basics.private_function_example(0) == 0
    end
  end

  # ============================================================================
  # module_attributes/0
  # ============================================================================

  describe "module_attributes/0" do
    test "returns module attributes" do
      result = Basics.module_attributes()
      assert result.greeting == "你好"
      assert result.version == "0.1.0"
    end
  end

  # ============================================================================
  # pipe_example/1
  # ============================================================================

  describe "pipe_example/1" do
    test "trims and downcases string" do
      assert Basics.pipe_example("  Hello World  ") == "hello world"
    end
  end

  # ============================================================================
  # data_pipeline/1
  # ============================================================================

  describe "data_pipeline/1" do
    test "filters evens, squares, and sums" do
      assert Basics.data_pipeline([1, 2, 3, 4, 5]) == 20
    end

    test "handles empty list" do
      assert Basics.data_pipeline([]) == 0
    end
  end

  # ============================================================================
  # truthy_values/0
  # ============================================================================

  describe "truthy_values/0" do
    test "returns truthy values" do
      result = Basics.truthy_values()
      assert result.true_value == true
      assert result.false_value == false
      assert result.nil_value == nil
    end
  end

  # ============================================================================
  # and_operator/2
  # ============================================================================

  describe "and_operator/2" do
    test "returns true when both are true" do
      assert Basics.and_operator(true, true) == true
    end

    test "returns false when one is false" do
      assert Basics.and_operator(true, false) == false
    end
  end

  # ============================================================================
  # or_operator/2
  # ============================================================================

  describe "or_operator/2" do
    test "returns true when at least one is true" do
      assert Basics.or_operator(false, true) == true
    end

    test "returns false when both are false" do
      assert Basics.or_operator(false, false) == false
    end
  end

  # ============================================================================
  # type_check/1
  # ============================================================================

  describe "type_check/1" do
    test "identifies integer" do
      assert Basics.type_check(42) == :integer
    end

    test "identifies float" do
      assert Basics.type_check(3.14) == :float
    end

    test "identifies string" do
      assert Basics.type_check("hello") == :string
    end

    test "identifies boolean" do
      assert Basics.type_check(true) == :boolean
    end

    test "identifies atom" do
      assert Basics.type_check(:atom) == :atom
    end

    test "identifies list" do
      assert Basics.type_check([1, 2]) == :list
    end

    test "identifies tuple" do
      assert Basics.type_check({:a, :b}) == :tuple
    end

    test "returns :unknown for unrecognized" do
      assert Basics.type_check(%{}) == :unknown
    end
  end
end
