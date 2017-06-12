defmodule MicrocreditService.Router do
  use MicrocreditService.Web, :router

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

  scope "/", MicrocreditService do
    pipe_through :browser # Use the default browser stack

    get "/", ClientController, :index
    get "/clients/new", ClientController, :new
    post "/clients", ClientController, :create
    get "/clients/:id/edit", ClientController, :edit
    put "/clients/:id", ClientController, :update
    delete "clients/:id", ClientController, :delete
  end

  # Other scopes may use custom stacks.
  # scope "/api", MicrocreditService do
  #   pipe_through :api
  # end
end
