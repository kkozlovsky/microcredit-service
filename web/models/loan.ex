defmodule MicrocreditService.Loan do
    use MicrocreditService.Web, :model

    schema "loans" do
      field :start_date, Ecto.DateTime, null: false
      field :due_date, Ecto.DateTime, null: false
      field :closed, :boolean, default: false
      field :paid_amount, :integer, default: 0, null: false
      field :total_amount, :integer, null: false
      belongs_to :client, MicrocreditService.Client
      timestamps()
    end

    def changeset(struct, params \\ %{}) do
        struct
        |> cast(params, [:start_date, :due_date, :closed, :paid_amount, :total_amount, :client_id])
        |> validate_required([:start_date, :due_date, :closed, :paid_amount, :total_amount, :client_id])
    end
    
end