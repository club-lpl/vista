defmodule Vista.Router do
  use Vista.Web, :router

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

  scope "/", Vista do
    pipe_through :browser # Use the default browser stack

    resources "/", PageController
    # resources "/"
    # get "/", PageController, :index
    # get "/show/:id", PageController, :show
  end

  # Other scopes may use custom stacks.
  scope "/api", Vista do
    pipe_through :api

    resources "/chores", ChoreController
  end
end
