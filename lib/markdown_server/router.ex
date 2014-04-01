defmodule MarkdownServer.Router do
  use Phoenix.Router, port: 4000

  get "/pages/:page", MarkdownServer.PagesController, :show, as: :page

end

defmodule MarkdownServer.PagesController do
   use Phoenix.Controller
   alias MarkdownServer.Renderer

   def show(conn) do
     document = conn |> requested_file |> Renderer.render 
     html(conn, html_for(document)) 
   end

   defp requested_file(conn) do
     "./test/support/sample_files/#{conn.params["page"]}" 
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
