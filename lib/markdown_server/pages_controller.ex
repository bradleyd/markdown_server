defmodule MarkdownServer.PagesController do
   use Phoenix.Controller
   use Eml
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
   
   defp markdown_files, do: File.ls!(base_dir)
   
   def index(conn) do
     html(conn, index_html) 
   end

   defp index_html do
     markup = eml do
       html do
         head do
           title "Index"
         end
         body do
           h1("Index of markdown files")
           ul do
             Enum.map markdown_files, fn(file) ->
               li do
                 a [href: "/pages/#{file}"], file
               end
             end
           end
         end
       end
     end
     Eml.write!(markup)
   end
   
   defp html_for(rendered_document) do
     markup = eml do
       html do
         head do
           title rendered_document.title
         end
         body do
           rendered_document.body
         end
       end
     end
    Eml.write!(markup, escape: false)
   end
end
