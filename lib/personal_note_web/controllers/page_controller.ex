defmodule PersonalNoteWeb.PageController do
  use PersonalNoteWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
