defmodule MicrocreditService.LoanController do
  use MicrocreditService.Web, :controller

  alias MicrocreditService.Loan
  import Plug.Conn

  def index(conn, _params) do
    loans = Repo.all(Loan)
    render conn, "index.html", loans: loans
  end


  def show_open_loans(conn, _params) do
    query = from u in Loan, where: [closed: false], select: u
    loans = Repo.all(query)
    render conn, "open.html", loans: loans
  end


  def show_closed_loans(conn, _params) do
    query = from u in Loan, where: [closed: true], select: u
    loans = Repo.all(query)
    render conn, "closed.html", loans: loans
  end


  def edit(conn, %{"id" => loan_id}) do
    loan = Repo.get(Loan, loan_id)
    changeset = Loan.changeset(loan)

    render conn, "edit.html", changeset: changeset, loan: loan
  end


  def update(conn, %{"id" => loan_id, "loan" => loan}) do
    changeset = Repo.get(Loan, loan_id) |> Loan.changeset(loan)

    case Repo.update(changeset) do
      {:ok, _loan} ->
        conn
        |> put_flash(:info, "Займ обновлён")
        |> redirect(to: loan_path(conn, :index))
      {:error, changeset} ->
        conn
        |> put_flash(:error, "Не удалось обновить займ")
        render conn, "edit.html", changeset: changeset
    end
  end


  def delete(conn, %{"id" => loan_id}) do
    Repo.get!(Loan, loan_id) |> Repo.delete!

    conn
    |> put_flash(:info, "Займ удалён")
    |> redirect(to: loan_path(conn, :index))
  end


  def new(conn, _params) do
    changeset = Loan.changeset(%Loan{}, %{})

    render conn, "new.html", changeset: changeset
  end


  def create(conn, %{"loan" => loan}) do
    ip = get_loan_ip()
    is_throttle_need = get_last_loan_ip(ip) |> minute_from_last_loan?

    if is_throttle_need do
      conn
        |> put_flash(:error, "Прошло меньше минуты")
        |> redirect(to: loan_path(conn, :index))
        |> halt()
    else
      loan_with_ip = Map.put(loan, "ip", ip)
      changeset = Loan.changeset(%Loan{}, loan_with_ip)

      case Repo.insert(changeset) do
        {:ok, _loan} ->
          conn
          |> put_flash(:info, "Займ добавлен")
          |> redirect(to: loan_path(conn, :index))
        {:error, changeset} ->
          conn
          |> put_flash(:info, "Не удалось создать займ")
          render conn, "new.html", changeset: changeset
      end
    end

  end


  defp get_loan_ip() do
    HTTPotion.get("http://api.sypexgeo.net")
      |> handle_json
      |> extract_from_body_to_ip
  end


  defp handle_json(%HTTPotion.Response{status_code: 200, body: body}) do
    Poison.Parser.parse!(body)
  end


  defp extract_from_body_to_ip(%{"ip" => ip}) do
    ip
  end


  defp get_last_loan_ip(ip) do
    query = from l in Loan, 
            where: l.ip == ^ip,
            order_by: [desc: l.inserted_at], 
            limit: 1,
            select: l.inserted_at

    Repo.one(query)
  end
  

  defp minute_from_last_loan?(last_ip_time) do
    cond do
      is_nil(last_ip_time) -> false
      Timex.Comparable.diff(DateTime.utc_now(), last_ip_time, :seconds ) < 60 -> true
      true -> false
    end      
  end

end  