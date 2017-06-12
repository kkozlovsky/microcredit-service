defmodule MicrocreditService.Repo.Migrations.AddClients do
  use Ecto.Migration

  def change do
    create table(:clients) do
      add :last_name, :string
      add :first_name, :string
      add :path_name, :string
      add :gender, :string
      add :date, :string
      add :postcode, :string
      add :city, :string
      add :house, :integer
      add :apartment, :integer
      add :phone, :string
      add :login, :string
      add :password, :string
      add :userpic, :string
      timestamps()
    end
  end
end
