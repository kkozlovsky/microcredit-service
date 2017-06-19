defmodule MicrocreditService.LoanController do
  use MicrocreditService.Web, :controller

  alias MicrocreditService.Loan

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
    changeset = Loan.changeset(%Loan{}, loan)

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