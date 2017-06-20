defmodule MicrocreditService.Repo.Migrations.PutLoans do
  use Ecto.Migration
  alias MicrocreditService.Repo
  alias MicrocreditService.Loan

  def change do
    %Loan{
      start_date: Ecto.DateTime.from_erl({{2017, 6, 10}, {0, 0, 0}}),
      due_date: Ecto.DateTime.from_erl({{2017, 6, 20}, {0, 0, 0}}),
      closed: false,
      paid_amount: 0,
      total_amount: 10000,
      client_id: 1,
      ip: "192.89.6.255"
    } |> Repo.insert!

    %Loan{
      start_date: Ecto.DateTime.from_erl({{2017, 6, 11}, {0, 0, 0}}),
      due_date: Ecto.DateTime.from_erl({{2017, 6, 23}, {0, 0, 0}}),
      closed: false,
      paid_amount: 0,
      total_amount: 11000,
      client_id: 2,
      ip: "194.154.95.255"
    } |> Repo.insert!

    %Loan{
      start_date: Ecto.DateTime.from_erl({{2017, 5, 9}, {0, 0, 0}}),
      due_date: Ecto.DateTime.from_erl({{2017, 5, 23}, {0, 0, 0}}),
      closed: true,
      paid_amount: 13000,
      total_amount: 13000,
      client_id: 3,
      ip: "195.79.83.95"
    } |> Repo.insert!

    %Loan{
      start_date: Ecto.DateTime.from_erl({{2017, 6, 9}, {0, 0, 0}}),
      due_date: Ecto.DateTime.from_erl({{2017, 6, 23}, {0, 0, 0}}),
      closed: false,
      paid_amount: 0,
      total_amount: 3000,
      client_id: 3,
      ip: "195.182.159.255"
    } |> Repo.insert!

    %Loan{
      start_date: Ecto.DateTime.from_erl({{2017, 6, 14}, {0, 0, 0}}),
      due_date: Ecto.DateTime.from_erl({{2017, 6, 30}, {0, 0, 0}}),
      closed: false,
      paid_amount: 0,
      total_amount: 30000,
      client_id: 4,
      ip: "212.13.96.0"
    } |> Repo.insert!

    %Loan{
      start_date: Ecto.DateTime.from_erl({{2017, 6, 4}, {0, 0, 0}}),
      due_date: Ecto.DateTime.from_erl({{2017, 6, 30}, {0, 0, 0}}),
      closed: false,
      paid_amount: 0,
      total_amount: 24000,
      client_id: 5,
      ip: "212.13.96.0"
    } |> Repo.insert!

    %Loan{
      start_date: Ecto.DateTime.from_erl({{2017, 6, 7}, {0, 0, 0}}),
      due_date: Ecto.DateTime.from_erl({{2017, 6, 28}, {0, 0, 0}}),
      closed: false,
      paid_amount: 0,
      total_amount: 22000,
      client_id: 6,
      ip: "212.20.63.255"
    } |> Repo.insert!

    %Loan{
      start_date: Ecto.DateTime.from_erl({{2017, 3, 7}, {0, 0, 0}}),
      due_date: Ecto.DateTime.from_erl({{2017, 3, 28}, {0, 0, 0}}),
      closed: true,
      paid_amount: 22000,
      total_amount: 22000,
      client_id: 7,
      ip: "217.67.3.14"
    } |> Repo.insert!

    %Loan{
      start_date: Ecto.DateTime.from_erl({{2017, 2, 7}, {0, 0, 0}}),
      due_date: Ecto.DateTime.from_erl({{2017, 2, 22}, {0, 0, 0}}),
      closed: true,
      paid_amount: 9000,
      total_amount: 9000,
      client_id: 7,
      ip: "217.67.0.0"
    } |> Repo.insert!

    %Loan{
      start_date: Ecto.DateTime.from_erl({{2017, 6, 7}, {0, 0, 0}}),
      due_date: Ecto.DateTime.from_erl({{2017, 6, 22}, {0, 0, 0}}),
      closed: false,
      paid_amount: 0,
      total_amount: 19000,
      client_id: 7,
      ip: "212.91.192.0"
    } |> Repo.insert!

    %Loan{
      start_date: Ecto.DateTime.from_erl({{2017, 6, 16}, {0, 0, 0}}),
      due_date: Ecto.DateTime.from_erl({{2017, 6, 26}, {0, 0, 0}}),
      closed: false,
      paid_amount: 0,
      total_amount: 25500,
      client_id: 8,
      ip: "62.185.176.128"
    } |> Repo.insert!

    %Loan{
      start_date: Ecto.DateTime.from_erl({{2017, 6, 11}, {0, 0, 0}}),
      due_date: Ecto.DateTime.from_erl({{2017, 7, 11}, {0, 0, 0}}),
      closed: false,
      paid_amount: 0,
      total_amount: 35500,
      client_id: 9,
      ip: "212.63.174.27"
    } |> Repo.insert!


  end
end
