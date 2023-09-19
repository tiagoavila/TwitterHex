defmodule TwitterhexWeb.ErrorJSONTest do
  use TwitterhexWeb.ConnCase, async: true

  test "renders 404" do
    assert TwitterhexWeb.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert TwitterhexWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
