ExUnit.start

defmodule TestServer do
  def start_server do
    MarkdownServer.Router.start
  end

  def stop_server do
    Plug.Adapters.Cowboy.shutdown MarkdownServer.Router.HTTP 
  end
end


