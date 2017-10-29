defmodule AlMandadoWeb.Router do
  use AlMandadoWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", AlMandadoWeb do
    pipe_through :browser # Use the default browser stack

    resources "/listas", ListaController
    resources "/usuarios", UsuarioController
    resources "/items", ItemController
    resources "/sessions", SessionController, only: [:new, :create]
    
    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", AlMandadoWeb do
  #   pipe_through :api
  # end
end
