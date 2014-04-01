ExUnit.start
:hackney.start()

defmodule TestServer do
  def start_server do
    MarkdownServer.Router.start
  end

  def stop_server do
    Plug.Adapters.Cowboy.shutdown MarkdownServer.Router.HTTP 
  end
end


defmodule IntegrationTest.Case do
  defmacro __using__(_options) do
    quote do 
      use ExUnit.Case
      import TestServer
      import IntegrationTest.Case.Helpers
    end
  end
end

defmodule IntegrationTest.Case.Helpers do
  def get(path) do
    url = "http://localhost:4000#{path}"
    {:ok, 200, _headers, client} = :hackney.get(url)
    {:ok, body} = :hackney.body(client)
    body 
  end
  
end
