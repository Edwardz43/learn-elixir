defmodule ElixirLearning.MixProject do
  use Mix.Project

  def project do
    [
      apps_path: ".",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases()
    ]
  end

  # Specifies which apps to start for umbrella.
  def application do
    [
      subapps: [
        :elixir_basics,
        :elixir_pattern_matching,
        :elixir_functional,
        :elixir_recursion,
        :elixir_data_structures,
        :elixir_concurrency,
        :elixir_otp
      ]
    ]
  end

  defp deps do
    []
  end

  defp aliases do
    []
  end
end
