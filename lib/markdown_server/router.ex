defmodule MarkdownServer.Router do
  use Phoenix.Router, port: 4000

  get "/pages/:page", MarkdownServer.PagesController, :show, as: :page

end

defmodule MarkdownServer.PagesController do
   use Phoenix.Controller
   alias MarkdownServer.Renderer

   def show(conn) do
     document = Renderer.render_string("this is a doc")
     html(conn, html_for(document)) 
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
