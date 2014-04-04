defmodule MarkdownServer.Mixfile do
  use Mix.Project

  def project do
    [ app: :markdown_server,
      version: "0.0.1",
      elixir: "~> 0.12.4",
      deps: deps ]
  end

  # Configuration for the OTP application
  def application do
    [mod: { MarkdownServer, [] }]
  end

  # Returns the list of dependencies in the format:
  # { :foobar, git: "https://github.com/elixir-lang/foobar.git", tag: "0.1" }
  #
  # To specify particular versions, regardless of the tag, do:
  # { :barbat, "~> 0.1", github: "elixir-lang/barbat" }
  defp deps do
    [
      { :ex_doc, github: "elixir-lang/ex_doc" },
      { :phoenix, github: "chrismccord/phoenix" },
      {:hackney, github: "benoitc/hackney"},
      {:eml,     github: "zambal/eml"}
    ]
  end
end
