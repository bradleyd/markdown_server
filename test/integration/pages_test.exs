defmodule IntegrationTest.PageTest do
  use IntegrationTest.Case
  
  setup do
   start_server
   :ok
  end

   test "renders index of available files" do
     body = get("/pages")
     assert Regex.match?(~r/Index of markdown/, body) 
     assert Regex.match?(~r/basic/, body)
     assert Regex.match?(~r/middling/, body)
   end
   
   teardown do
     stop_server
   end
end

