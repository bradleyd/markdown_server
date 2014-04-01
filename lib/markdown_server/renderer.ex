defrecord MarkdownServer.RenderedDocument, body: nil, title: "untitled"

defmodule MarkdownServer.Renderer do
  def render_string(str) do
    body = str |> Markdown.to_html 
    MarkdownServer.RenderedDocument[body: body, title: title_for(body)]    
  end

  def render(file_path) do
    {:ok, string} = File.read(file_path)
    string |> render_string 
  end

  defp title_matcher do
    %r/<h1>(?<title>.*)<\/h1>/g
  end

  defp title_for(body) do
    case Regex.named_captures(title_matcher, body) do
      [title: title] -> title
      nil -> "untitled" 
    end
  end

end

