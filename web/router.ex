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
    delete "/clients/:id", ClientController, :delete
    get "/blacklist", ClientController, :show_blacklist
  end

  scope "/loans", MicrocreditService do
    pipe_through :browser # Use the default browser stack

    get "/", LoanController, :index
    get "/open", LoanController, :show_open_loans
    get "/closed", LoanController, :show_closed_loans
    get "/new", LoanController, :new
    post "/", LoanController, :create
    get "/:id/edit", LoanController, :edit
    put "/:id", LoanController, :update
    delete "/:id", LoanController, :delete
  end

  # Other scopes may use custom stacks.
  # scope "/api", MicrocreditService do
  #   pipe_through :api
  # end
end
