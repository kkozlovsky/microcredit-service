defmodule MicrocreditService.LoanController do
  use MicrocreditService.Web, :controller

  alias MicrocreditService.Loan

  def index(conn, _params) do
    loans = Repo.all(Loan)
    render conn, "index.html", loans: loans
  end

end  