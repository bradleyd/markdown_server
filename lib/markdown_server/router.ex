defmodule MarkdownServer.Router do
  use Phoenix.Router, port: 4000

  get "/pages/:page", MarkdownServer.PagesController, :show, as: :page
  get "/pages", MarkdownServer.PagesController, :index, as: :pages
end

defmodule MarkdownServer.PagesController do
   use Phoenix.Controller
   alias MarkdownServer.Renderer

   def show(conn) do
     document = conn |> requested_file |> Renderer.render 
     html(conn, html_for(document)) 
   end

   defp requested_file(conn) do
     "#{base_dir}#{conn.params["page"]}" 
   end

   defp base_dir do
     "./test/support/sample_files/" 
   end
   
   defp li(element), do: "<li>#{element}</li>"
   defp a(element),  do: "<a href='/pages/#{element}'>#{element}</a>"
   defp ul(list) do
     elements = list
                |> Enum.map(&a/1)
                |> Enum.map(&li/1)
     "<ul>#{elements}</ul>" 
   end

   defp markdown_files, do: File.ls!(base_dir)
   
   def index(conn) do
     html(conn, index_html) 
   end

   defp index_html do
     """
     <html>
       <head>
         <title>Index</title>
       </head>
       <body>
         <h1>Index of markdown files</h1>
         #{ul(markdown_files)}
       </body>
     </html>
     """
   end
   
   defp html_for(rendered_document) do
     """
     <html>
       <head>
       <title>#{rendered_document.title}</title>
       </head>
       <body>
         #{rendered_document.body}
       </body>
     </html>
     """ 
   end
end
