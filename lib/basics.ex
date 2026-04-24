defmodule Basics do
  @moduledoc """
  Elixir 基礎學習專案 — 從零開始认识 Elixir。

  適合有 JS/TS、PHP、Go、Java 經驗的開發者。

  ## 學習項目

  - `Basics.hello/0` — 基本函數定義
  - `Basics.add/2` — 基本運算
  - `Basics.greet/1` — String 與插值
  - `Basics.convert_to_atom/1` — Atom 類型
  - `Basics.concat_lists/2` — List 基本操作
  - `Basics.tuple_example/0` — Tuple 基本操作
  - `Basics.map_example/0` — Map 基本操作
  - `Basics.keyword_list_example/0` — KeywordList 基本操作
  - `Basics.conditionals/1` — 條件判斷 (if/unless/case)
  - `Basics.default_param/2` — 預設參數
  - `Basics.private_function_example/1` — 私有函數
  - `Basics.module_attributes/0` — 模組屬性
  """

  # ============================================================================
  # 1. Hello World — 最基本的函數定義
  # ============================================================================

  @doc """
  最基本的 Elixir 函數。

  注意：Elixir 的函數回傳值就是最後一個表達式，不需要 `return`。
  """
  def hello do
    :world
  end

  # ============================================================================
  # 2. 基本運算
  # ============================================================================

  @doc """
  基本加法。

  ## Examples

      iex> Basics.add(2, 3)
      5

      iex> Basics.add(-1, 1)
      0
  """
  def add(a, b) do
    a + b
  end

  @doc """
  基本除法，包含除零保護。

  ## Examples

      iex> Basics.divide(10, 2)
      5

      iex> Basics.divide(10, 0)
      :error
  """
  def divide(a, b) do
    if b == 0 do
      :error
    else
      div(a, b)
    end
  end

  # ============================================================================
  # 3. 字串 (String)
  # ============================================================================

  @doc """
  字串與插值 (interpolation)。

  Elixir 的字串是 UTF-8 編碼。插值使用 `#{}` 語法。

  ## Examples

      iex> Basics.greet("Elixir")
      "Hello, Elixir!"

      iex> Basics.greet("")
      "Hello, World!"
  """
  def greet(name) do
    greeting = if String.trim(name) == "" do
      "World"
    else
      name
    end
    "Hello, #{greeting}!"
  end

  @doc """
  字串長度。

  ## Examples

      iex> Basics.string_length("elixir")
      6
  """
  def string_length(str) do
    String.length(str)
  end

  # ============================================================================
  # 4. Atom — 專為匹配而生的類型
  # ============================================================================

  @doc """
  Atom 是一個常量，它的值就是它的名稱。

  與 Go/Java/PHP 不同，Elixir 的 atom 不像是枚舉 (enum)。
  它們是用來做「標記」和「模式匹配」的。

  ## Examples

      iex> Basics.convert_to_atom("hello")
      :hello

      iex> Basics.convert_to_atom("WORLD")
      :world
  """
  def convert_to_atom(str) do
    str
    |> String.downcase()
    |> String.to_atom()
  end

  @doc """
  檢查一個值是否是 atom。

  ## Examples

      iex> Basics.is_it_an_atom(:hello)
      true

      iex> Basics.is_it_an_atom("hello")
      false
  """
  def is_it_an_atom(x) do
    is_atom(x)
  end

  # ============================================================================
  # 5. List — 鏈結串列
  # ============================================================================

  @doc """
  List 基本操作。

  Elixir 的 List 是鏈結串列 (linked list)。
  開頭新增元素是 O(1)，但隨機存取是 O(n)。

  ## Examples

      iex> Basics.concat_lists([1, 2], [3, 4])
      [1, 2, 3, 4]
  """
  def concat_lists(a, b) do
    a ++ b
  end

  @doc """
  使用 `|` 符號將元素新增到串列開頭 (cons cell)。

  這是 Elixir 最核心的操作之一。

  ## Examples

      iex> Basics.prepend(0, [1, 2, 3])
      [0, 1, 2, 3]
  """
  def prepend(element, list) do
    [element | list]
  end

  @doc """
  取出串列的頭部和尾部。

  ## Examples

      iex> Basics.head_tail([1, 2, 3])
      {1, [2, 3]}

      iex> Basics.head_tail([])
      :empty
  """
  def head_tail([]), do: :empty
  def head_tail([head | tail]), do: {head, tail}

  # ============================================================================
  # 6. Tuple — 固定大小的集合
  # ============================================================================

  @doc """
  Tuple 與 List 的差別：

  - List: 鏈結串列，適合大量元素，O(1) 從頭新增
  - Tuple: 連續記憶體，適合固定大小，O(1) 依索引存取

  ## Examples

      iex> Basics.tuple_example()
      {:ok, "elixir"}
  """
  def tuple_example do
    {:ok, "elixir"}
  end

  @doc """
  使用 `|>` (pipe) 建立元組並取得其中元素。

  ## Examples

      iex> Basics.create_tuple(1, 2)
      {:created, 1, 2}
  """
  def create_tuple(a, b) do
    {a, b}
    |> then(fn t -> {:created, elem(t, 0), elem(t, 1)} end)
  end

  # ============================================================================
  # 7. Map — 鍵值對 (最常用!)
  # ============================================================================

  @doc """
  Map 是 Elixir 最常用的資料結構。

  鍵可以是任何值，但使用 atom 作為鍵是最常見的。

  ## Examples

      iex> Basics.map_example()
      %{name: "elixir", version: "1.19"}
  """
  def map_example do
    %{name: "elixir", version: "1.19"}
  end

  @doc """
  Map 的基本操作：建立、讀取、更新。

  ## Examples

      iex> Basics.map_operations()
      %{a: 1, b: 100, c: 3, d: 4}
  """
  def map_operations do
    map = %{a: 1, b: 2, c: 3}

    # 讀取
    b_value = map.b  # map[:b] 也可以

    # 更新 (產生新的 map，不可變!)
    updated_map = Map.put(map, :b, 100)

    # 合併
    merged = Map.merge(updated_map, %{d: 4})

    # 返回結果
    merged
  end

  @doc """
  安全的 Map 取值 (當鍵不存在時回傳預設值)。

  ## Examples

      iex> Basics.map_get_with_default(%{name: "elixir"}, :name)
      "elixir"

      iex> Basics.map_get_with_default(%{name: "elixir"}, :missing)
      "default"
  """
  def map_get_with_default(map, key) do
    Map.get(map, key, "default")
  end

  # ============================================================================
  # 8. KeywordList — 選項列表
  # ============================================================================

  @doc """
  KeywordList 是 [(key, value)] 的列表。

  主要用途：傳遞可選參數。不建議用來存大量資料。

  ## Examples

      iex> Basics.keyword_list_example()
      [host: "localhost", port: 4000, ssl: true]
  """
  def keyword_list_example do
    [
      {:host, "localhost"},
      {:port, 4000},
      {:ssl, true}
    ]
  end

  # ============================================================================
  # 9. 條件判斷
  # ============================================================================

  @doc """
  使用 `if` / `unless` 做條件判斷。

  ## Examples

      iex> Basics.conditionals(:active)
      :active

      iex> Basics.conditionals(:inactive)
      :inactive

      iex> Basics.conditionals(:unknown)
      :unknown
  """
  def conditionals(status) do
    if status == :active do
      :active
    else
      status
    end
  end

  @doc """
  使用 `case` 做模式匹配的條件判斷。

  這是 Elixir 最核心的控制流程語法。

  ## Examples

      iex> Basics.case_example("hello")
      "greeting"

      iex> Basics.case_example("goodbye")
      "farewell"

      iex> Basics.case_example("unknown")
      "unknown"
  """
  def case_example(phrase) do
    case phrase do
      "hello" -> "greeting"
      "goodbye" -> "farewell"
      _ -> "unknown"  # _ 是萬用字元 (wildcard)
    end
  end

  # ============================================================================
  # 10. 預設參數
  # ============================================================================

  @doc """
  函數可以使用 `\\` 設定預設參數。

  與 Go/Java 的 default parameters 類似，但 Elixir 支援
  多個簽名 (overloading by arity)。

  ## Examples

      iex> Basics.default_param("hello")
      "Hello, hello! hello"

      iex> Basics.default_param("hello", "world")
      "Hello, hello! world"

      iex> Basics.default_param("hi", "everyone")
      "Hello, hi! everyone"
  """
  def default_param(name, greeting \\ "hello") do
    "Hello, #{name}! #{greeting}"
  end

  # ============================================================================
  # 11. 私有函數 (defp)
  # ============================================================================

  @doc """
  呼叫私有函數的範例。

  私有函數只能在定義它的模組內使用。
  """
  def private_function_example(x) do
    # 呼叫私有函數
    result = _double(x)
    _log(result)
    result
  end

  # 私有函數 (defp) — 外部無法呼叫
  defp _double(n), do: n * 2

  # 私有函數 — 回傳 :ok 表示記錄成功
  defp _log(value) do
    # 在 iex 中會顯示，在正式環境可以改用 Logger
    IO.puts("[LOG] #{value}")
    :ok
  end

  # ============================================================================
  # 12. 模組屬性 (Module Attributes)
  # ============================================================================

  @greeting "你好"  # 模組屬性 (編譯期常量)
  @version "0.1.0"

  @doc """
  展示模組屬性。

  模組屬性在編譯期評估，是常量。

  ## Examples

      iex> Basics.module_attributes()
      %{greeting: "你好", version: "0.1.0"}
  """
  def module_attributes do
    %{greeting: @greeting, version: @version}
  end

  # ============================================================================
  # 13. 管道操作符 (Pipe Operator |> )
  # ============================================================================

  @doc """
  管道操作符 `|>` 將左側的結果傳遞給右側函數的第一个參數。

  這讓程式碼從右到左讀，非常直觀。

  這是 Elixir 最標誌性的語法之一。

  ## Examples

      iex> Basics.pipe_example("  Hello World  ")
      "hello world"
  """
  def pipe_example(str) do
    str
    |> String.trim()
    |> String.downcase()
  end

  @doc """
  用管道操作符寫一個資料處理流水線。

  ## Examples

      iex> Basics.data_pipeline([1, 2, 3, 4, 5])
      20
  """
  def data_pipeline(numbers) do
    numbers
    |> Enum.filter(fn n -> rem(n, 2) == 0 end)  # 只保留偶數: [2, 4]
    |> Enum.map(fn n -> n * n end)                # 平方: [4, 16]
    |> Enum.sum()                                  # 總和: 20
  end

  # ============================================================================
  # 14. 布林值與 Nil
  # ============================================================================

  @doc """
  布林值與 Nil。

  Elixir 的布林值就是 atom :true 和 :false。
  Nil 是 :nil atom。

  ## Examples

      iex> Basics.truthy_values()
      %{true_value: true, false_value: false, nil_value: nil}
  """
  def truthy_values do
    %{
      true_value: true,   # 等同於 :true
      false_value: false, # 等同於 :false
      nil_value: nil      # 等同於 :nil
    }
  end

  @doc """
  布林運算子。

  ## Examples

      iex> Basics.and_operator(true, false)
      false

      iex> Basics.or_operator(false, true)
      true
  """
  def and_operator(a, b) do
    a and b
  end

  def or_operator(a, b) do
    a or b
  end

  # ============================================================================
  # 15. 基本類型檢查
  # ============================================================================

  @doc """
  類型檢查函數。

  ## Examples

      iex> Basics.type_check(42)
      :integer

      iex> Basics.type_check(3.14)
      :float

      iex> Basics.type_check("hello")
      :string

      iex> Basics.type_check(true)
      :boolean

      iex> Basics.type_check(:atom)
      :atom
  """
  def type_check(x) do
    cond do
      is_integer(x) -> :integer
      is_float(x) -> :float
      is_binary(x) -> :string
      is_boolean(x) -> :boolean
      is_atom(x) -> :atom
      is_list(x) -> :list
      is_tuple(x) -> :tuple
      true -> :unknown
    end
  end
end
