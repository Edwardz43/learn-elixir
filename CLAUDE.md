# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

Elixir self-study journey from a backend developer (JS/TS, PHP, Go, Java). 7 foundation projects + 1 Phoenix web project.

```
elixir/
├── 01_basics/          # Variables, basic types, modules
├── 02_patterns/        # Pattern matching, guards, deconstruction
├── 03_functions/       # Named functions, anonymous functions, modules
├── 04_recursion/       # Recursion, higher-order functions
├── 05_data_structures/# List, Tuple, Map, Keyword List, MapSet
├── 06_concurrency/     # Processes, send/receive, agents
├── 07_otp/             # GenServer, Gen, Task
├── 08_phoenix_demo/    # Phoenix web project (placeholder)
└── CLAUDE.md           # This file
```

## Key Commands

```bash
# Run any project
cd elixir_<project> && mix test        # Run tests
cd elixir_<project> && iex -S mix      # Interactive shell
cd elixir_<project> && mix compile      # Compile only

# Phoenix (when ready)
cd elixir_phoenix_demo && mix phx.server   # Start Phoenix server
```

## Learning Plan & Project Descriptions

### 01_basics — First Steps in Elixir

**Topics:** Modules, named functions, `def`/`defp`, atoms, strings, booleans, nil, basic data types.

**Key difference from OOP languages:** Elixir has no classes, no objects, no instance methods. Everything is a function in a module. Data is immutable.

**Why this matters:** Coming from Java/Go/PHP, the most jarring shift is that there is no `this`, no `new`, no mutable state. Functions are first-class, and data never changes once created.

**What to do here:**
- Write functions that take data and return new data
- Practice module organization (one .ex file per module)
- Explore `iex -S mix` to test code interactively

### 02_patterns — Pattern Matching

**Topics:** Pattern matching in assignments (`=` is a match, not an assignment), pin operator (`^`), destructuring, `_` wildcard, `fn` clauses with patterns.

**Core concept:** The `=` operator in Elixir is a **match operator**, not assignment. `x = 5` means "match 5 against x and bind x to 5." This is the single most important concept in Elixir.

**Why this matters:** Pattern matching replaces if/else chains, switch statements, and type checking. It's how Elixir does control flow.

**What to do here:**
- Match tuples: `{a, b, c} = {1, 2, 3}`
- Match lists: `[head | tail] = [1, 2, 3]`
- Use `_` to ignore values you don't need
- Try pin operator to match against existing values

### 03_functions — Functions & Modules

**Topics:** Named functions vs anonymous functions (`fn -> ... end`), default arguments, private functions (`defp`), function overloading by arity, guards (`when` clauses), function capture (`&`).

**Key differences from your background:**

| Concept | Go | Elixir |
|---------|----|--------|
| Multiple functions with same name | Redefine (compile error) | Different arity (valid) |
| Default parameters | None | `def foo(x, y \\ 10)` |
| Pattern-match return | n/a | `case` expressions |
| Guards | n/a | `when is_integer(x) and x > 0` |

**What to do here:**
- Practice function overloading: `def sum([]), do: 0` vs `def sum([head | tail]), do: head + sum(tail)`
- Write anonymous functions and pass them around
- Use `&` syntax to capture functions

### 04_recursion — Recursion & Higher-Order Functions

**Topics:** Tail call optimization, accumulator pattern, list processing without loops, Enum module vs manual recursion.

**Why no loops:** Elixir has no `for` or `while` loops (well, `for` exists but it's a macro wrapping Enum). The paradigm is: **recursion + higher-order functions**.

**Key insight:** In OOP languages you mutate state. In Elixir you transform data through a pipeline of functions.

**What to do here:**
- Implement map, filter, reduce by hand (no Enum!)
- Practice tail-recursive vs naive recursion
- Then rewrite using Enum.map/filter/reduce
- Explore `Stream` for lazy evaluation

### 05_data_structures — Core Data Structures

**Topics:** List (linked list), Tuple (contiguous memory), Map (hash map), KeywordList (list of 2-tuples), MapSet.

**Memory model differences:**

| Structure | Memory | Lookup | Use when |
|-----------|--------|--------|----------|
| `[]` List | Linked list | O(n) | Small lists, head/tail access |
| `{}` Tuple | Contiguous | O(1) by index | Fixed-size, known count |
| `%{}` Map | Hash map | O(1) | Key-value lookup |
| `[{}]` Keyword | Linked list | O(n) | Options/optional keys |
| `%MapSet{}` | Hash set | O(1) | Unique collection |

**What to do here:**
- Compare performance of List vs Map for different operations
- Learn when to use KeywordList vs Map (options vs data)
- Practice with Map functions: `Map.get`, `Map.put`, `Map.merge`, etc.

### 06_concurrency — Processes & Concurrency

**Topics:** Lightweight processes (not OS threads!), `spawn`, `send`/`receive`, `whereis`, process dictionary, heartbeats.

**Key insight:** Elixir processes are **lightweight** (~2000 bytes vs ~1MB for OS threads). You can have millions of them. They share no memory (unlike Go goroutines which share memory via channels).

**Mental model shift:**

| Go | Elixir |
|----|--------|
| Goroutine (~KB) | Process (~2KB) |
| Channels for messages | `send`/`receive` |
| `sync.Mutex` | GenServer state |
| `panic` | Exit propagation |

**What to do here:**
- Create processes with `spawn`
- Send messages and receive them
- Handle messages with pattern matching in receive clauses
- Explore `Agent` for simple stateful processes

### 07_otp — OTP Behaviors

**Topics:** GenServer, Gen, Supervisor, Application, supervision trees, OTP design principles.

**Why OTP matters:** OTP provides the building blocks for **concurrent, fault-tolerant** systems. The philosophy: "let it crash" and recover via supervision trees.

**What to do here:**
- Create a GenServer (stateful server process)
- Set up a Supervisor to restart it on failure
- Understand the supervision tree concept
- Explore `Task` for concurrent computation

### 08_phoenix_demo — Phoenix Web Framework

**When ready:** `mix phx.new elixir_phoenix_demo`

Phoenix is Elixir's web framework. It provides:
- HTTP server (Plug + Cowboy)
- Routing
- Controller/View layer
- Ecto (ORM)
- LiveView (real-time web)

**What to do here:**
- Create RESTful resources
- Explore Phoenix LiveView
- Try Channels for WebSocket
- Set up a simple CRUD API

## Learning Notes

### Coming from Go/Java/PHP — Key Mental Shifts

1. **No mutation** — Data is immutable. You create new data, you don't change old data.
2. **Pattern matching** — Replaces if/else, switch, type assertions.
3. **Functions first** — No methods on objects. Data and behavior are separate.
4. **Processes over threads** — Millions of lightweight processes, each with its own state.
5. **Let it crash** — Supervision trees handle errors, don't catch them everywhere.
6. **Erlang ecosystem** — Elixir runs on BEAM VM (Erlang). You get decades of production-tested concurrency and fault tolerance.

### Common Patterns

- **List processing:** `[head | tail] = list` → process head, recurse on tail
- **Map transformation:** `Enum.map(list, fn x -> ... end)` → `[...]`
- **Pipeline:** `value |> func1 |> func2 |> func3` → readable data flow
- **Default params:** `def foo(x, y \\ default_value), do: ...`
- **Private helper:** `defp helper(x), do: ...`
- **Guard clauses:** `def guard_fn(x) when is_integer(x) and x > 0, do: ...`

## Architecture Notes

- Each project is a standalone Mix project with its own `mix.exs`
- Tests use `ExUnit` — `mix test` to run, `mix test test/file_test.exs` for a single file
- `iex -S mix` launches an interactive shell with your project loaded
- All code uses `defmodule` keyword, not OOP-style class declarations
- Convention: snake_case for function/module names, camelCase for variables (rare)
- Files: `lib/` for source code, `test/` for tests
