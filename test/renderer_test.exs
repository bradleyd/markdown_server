defmodule MarkdownServer.RendererTest do
  use ExUnit.Case

  test "renders document from string" do
    rendered_document = MarkdownServer.Renderer.render_string("this document has no title") 
    expected_body = "<p>this document has no title</p>\n"
    expected_title = "untitled"
    assert MarkdownServer.RenderedDocument[title: expected_title, body: expected_body] == rendered_document
  end

  test "extracts title from document" do
    rendered_document = MarkdownServer.Renderer.render_string("# This is a title\n\n this document has a title")
   expected_title = "This is a title"
   assert expected_title == rendered_document.title 
  end
  
end
