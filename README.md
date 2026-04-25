# Elixir Learning Monorepo

Elixir 基礎學習專案集。適合有 JS/TS、PHP、Go、Java 經驗的開發者。

## 專案總覽

| # | 專案 | 說明 | 入口 |
|---|---|------|------|
| 1 | `elixir_basics` | 函數定義、類型、List/Map/Tuple/Keyword、條件判斷 | [Basics](elixir_basics/lib/basics.ex) |
| 2 | `elixir_pattern_matching` | 模式匹配、變數綁定、匹配斷言 | [PatternMatching](elixir_pattern_matching/lib/pattern_matching.ex) |
| 3 | `elixir_functional` | 高階函數、匿名函數、閉包、函數模組化 | [Functional](elixir_functional/lib/functional.ex) |
| 4 | `elixir_recursion` | 遞迴、基底情況、遞迴模式 | [Recursion](elixir_recursion/lib/recursion.ex) |
| 5 | `elixir_data_structures` | Map/Set/KeywordList 的進階操作 | [DataStructures](elixir_data_structures/lib/data_structures.ex) |
| 6 | `elixir_concurrency` | Process、生滅器、訊息傳遞、Agent | [Concurrency](elixir_concurrency/lib/concurrency.ex) |
| 7 | `elixir_otp` | GenServer、Supervisor、OTP 原則 | [OTP](elixir_otp/lib/otp.ex) |

## 學習順序

```
Basics → Pattern Matching → Functional → Recursion → Data Structures → Concurrency → OTP
```

## 使用方式

每個子專案是獨立的 Mix 專案，可單獨運作：

```bash
cd elixir_basics
mix test
```

## 技術棧

- **語言**: Elixir
- **建置工具**: Mix
- **測試**: ExUnit
