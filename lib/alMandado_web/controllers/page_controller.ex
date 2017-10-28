defmodule AlMandadoWeb.PageController do
  use AlMandadoWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
