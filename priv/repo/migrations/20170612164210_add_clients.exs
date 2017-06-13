defmodule MicrocreditService.Repo.Migrations.AddClients do
  use Ecto.Migration

  def change do
    create table(:clients) do
      add :last_name, :string, null: false
      add :first_name, :string, null: false
      add :path_name, :string, null: false
      add :gender, :string, null: false
      add :date, :string, null: false
      add :postcode, :string, null: false
      add :city, :string, null: false
      add :street, :string, null: false
      add :house, :integer, null: false
      add :apartment, :integer, null: false
      add :phone, :string, null: false
      add :login, :string, unique: true
      add :password, :string, null: false
      add :blacklist, :boolean, default: false
      add :userpic, :string, null: false
      timestamps()
    end
  end
end
