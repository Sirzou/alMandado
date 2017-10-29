defmodule AlMandadoWeb.SessionController do
  use AlMandadoWeb, :controller
  import Comeonin.Bcrypt, only: [checkpw: 2]
  alias AlMandado.User

  plug :scrub_params, "user" when action in [:create]

  def new(conn, _params) do
  	render conn, "new.html", changeset: User.changeset(%User{})
  end

  def create(conn, %{"user" => user_params}) do
  	Repo.get_by(User, username: user_params["username"])
  	|> sign_in(user_params["password"], conn)
  end

  defp sign_in(user, password, conn) when is_nil(user) do
  	conn
  	|> put_flash(:error, "Usuario o combinacion invalida")
  	|> redirect(to: page_path(conn, :index))
  end

  defp sign_in(user, password, conn) do
  	if checkpwd(password,user.password) do
  	  conn
  	  |> put_session(:current_user, %{id: user.id, username: user.username})
  	  |> put_flash(:info, "identificado correctamente")
  	  |> redirect(to: page_path(conn, :index))
  	else
  	  conn
  	  |> put_session(:current_user, nil)
  	  |> put_flash(:error, "Usuario o combinacion invalida")
  	  |> recirect(to: page_path(conn, :index))
  	end
  end
end