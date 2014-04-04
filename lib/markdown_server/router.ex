defmodule MarkdownServer.Router do
  use Phoenix.Router, port: 4000

  get "/pages/:page", MarkdownServer.PagesController, :show, as: :page
  get "/pages", MarkdownServer.PagesController, :index, as: :pages
end


