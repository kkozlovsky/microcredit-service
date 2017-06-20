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
        |> put_flash(:info, "Клиент добавлен")
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
        |> put_flash(:info, "Данные клиента обновлены")
        |> redirect(to: client_path(conn, :index))
      {:error, changeset} ->
        render conn, "edit.html", changeset: changeset
    end
  end

  def delete(conn, %{"id" => client_id}) do
    Repo.get!(Client, client_id) |> Repo.delete!

    conn
    |> put_flash(:info, "Клиент удалён")
    |> redirect(to: client_path(conn, :index))
  end

  def show_blacklist(conn, _params) do
    query = from u in Client, where: [blacklist: true], select: u
    black_clients = Repo.all(query)
    render conn, "blacklist.html", clients: black_clients
  end

  def generate(conn, _params) do
    client = HTTPotion.get("http://randus.ru/api.php")
      |> handle_json
      |> extract_from_body_to_client
      
      create(conn, client)
  end

  defp handle_json(%HTTPotion.Response{status_code: 200, body: body}) do
    Poison.Parser.parse!(body)
  end

  defp extract_from_body_to_client(parsed_map) do

    %{"apartment" => apartment, 
      "city" => city,
      "date" => date, 
      "fname" => firstname,
      "lname" => lastname,
      "patronymic" => pathname,
      "gender" => gender, 
      "house" => house, 
      "login" => login,
      "password" => password,
      "phone" => phone,
      "postcode" => postcode,
      "street" => street,
      "userpic" => userpic} = parsed_map

      %{"client" => %{ first_name: firstname, last_name: lastname, path_name: pathname, date: date, gender: gender, blacklist: false,
                       city: city, postcode: postcode, street: street, house: house, apartment: apartment, phone: phone,
                       login: login, password: password, userpic: userpic }}
  end

end
