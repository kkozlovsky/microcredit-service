defmodule MicrocreditService.Repo.Migrations.AddLoans do
  use Ecto.Migration

  def change do
    create table(:loans) do
      add :start_date, :timestamp, null: false
      add :due_date, :timestamp, null: false
      add :closed, :boolean, default: false
      add :paid_amount, :integer, default: 0, null: false
      add :total_amount, :integer, null: false
      add :client_id, references(:clients, on_delete: :delete_all, on_update: :update_all), null: false
      timestamps()
    end 
  end
end
