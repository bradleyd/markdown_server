defrecord MarkdownServer.RenderedDocument, body: nil, title: "untitled"

defmodule MarkdownServer.Renderer do
  def render_string(str) do
    body = str |> Markdown.to_html 
    MarkdownServer.RenderedDocument[body: body]    
  end
end

defmodule MarkdownServer.RendererTest do
  use ExUnit.Case

  test "renders document from string" do
    rendered_document = MarkdownServer.Renderer.render_string("this document has no title") 
    expected_body = "<p>this document has no title</p>\n"
    expected_title = "untitled"
    assert MarkdownServer.RenderedDocument[title: expected_title, body: expected_body] == rendered_document
  end
  
end
