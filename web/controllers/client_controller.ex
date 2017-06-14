defmodule MicrocreditService.ClientController do
  use MicrocreditService.Web, :controller

  import Ecto.Query
  alias MicrocreditService.Client

  def index(conn, _params) do
    clients = Repo.all(Client)
    render conn, "index.html", clients: clients
  end

  def new(conn, _params) do
    changeset = Client.changeset(%Client{}, %{})

    render conn, "new.html", changeset: changeset
  end

  def create(conn, %{"client" => client}) do
    changeset = Client.changeset(%Client{}, client)

    case Repo.insert(changeset) do
      {:ok, _client} ->
        conn
        |> redirect(to: client_path(conn, :index))
      {:error, changeset} ->
        render conn, "new.html", changeset: changeset
    end
  end

  def edit(conn, %{"id" => client_id}) do
    client = Repo.get(Client, client_id)
    changeset = Client.changeset(client)

    render conn, "edit.html", changeset: changeset, client: client
  end

  def update(conn, %{"id" => client_id, "client" => client}) do
    changeset = Repo.get(Client, client_id) |> Client.changeset(client)

    case Repo.update(changeset) do
      {:ok, _client} ->
        conn
        |> redirect(to: client_path(conn, :index))
      {:error, changeset} ->
        render conn, "edit.html", changeset: changeset
    end
  end

  def delete(conn, %{"id" => client_id}) do
    Repo.get!(Client, client_id) |> Repo.delete!

    conn
    |> redirect(to: client_path(conn, :index))
  end

  def show_blacklist(conn, _params) do
    query = from u in Client, where: [blacklist: true], select: u
    black_clients = Repo.all(query)
    render conn, "blacklist.html", clients: black_clients
  end
end
