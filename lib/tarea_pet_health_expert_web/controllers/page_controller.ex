defmodule TareaPetHealthExpertWeb.PageController do
  use TareaPetHealthExpertWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
