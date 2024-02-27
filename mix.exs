defmodule Repeatex.Mixfile do
  use Mix.Project

  def project do
    [app: :repeatex,
     version: "0.0.1",
     elixir: "~> 1.0",
     elixirc_paths: elixirc_paths(Mix.env),
     compilers: compilers(Mix.env),
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  def application do
    [applications: [:logger, :poison, :edate]]
  end

  def compilers(env \\ nil)
  def compilers(:test), do: [:phoenix] ++ compilers()
  def compilers(_), do: Mix.compilers

  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_),     do: ["lib", "web"]

  defp deps do
    [
      {:phoenix, "~> 1.1.1", optional: true},
      {:cowboy, "~> 1.0", optional: true},
      {:poison, ">= 1.5.0"},
      {:edate, github: "dweldon/edate"},
      {:apex, "~> 0.6.0", only: [:dev, :test]}
    ]
  end
end
