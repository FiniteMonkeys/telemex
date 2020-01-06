defmodule Telemex.MixProject do
  @moduledoc false

  use Mix.Project

  def project do
    [
      app: :telemex,
      version: "0.1.0",
      name: "Telemex",
      description: description(),
      source_url: "http://github.com/FiniteMonkeys/telemex",
      homepage_url: "http://github.com/FiniteMonkeys/telemex",
      package: package(),
      elixir: "~> 1.9",
      elixirc_options: [warnings_as_errors: true],
      elixirc_paths: elixirc_paths(Mix.env()),
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      preferred_cli_env: [espec: :test],
      aliases: aliases(),
      deps: deps()
    ]
  end

  defp aliases do
    [
      credo: ["credo --strict"],
      test: ["format", "credo --strict", "dialyzer", "espec"]
    ]
  end

  def application do
    [
      mod: {Telemex.Application, []},
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:credo, "~> 1.1", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.0.0-rc.7", only: [:dev, :test], runtime: false},
      {:espec, "~> 1.8", only: :test},
      {:ex_doc, "~> 0.21.2", only: [:dev, :test], runtime: false},
      {:space_ex, "~> 0.8.0"}
    ]
  end

  defp description, do: "Telemetry for Kerbal Space Program using Elixir and the kRPC mod."

  defp elixirc_paths(:test), do: ["lib"]
  defp elixirc_paths(_), do: ["lib"]

  defp package do
    [
      licenses: ["Apache-2.0"],
      links: %{"GitHub" => "https://github.com/FiniteMonkeys/telemex"}
    ]
  end
end
