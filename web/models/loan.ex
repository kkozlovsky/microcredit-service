defmodule MicrocreditService.Loan do
    use MicrocreditService.Web, :model

    schema "loans" do
      field :start_date, :date, default: Date.utc_today()
      field :due_date, :date
      field :closed, :boolean, default: false
      field :paid_amount, :integer, default: 0
      field :total_amount, :integer
      belongs_to :client, MicrocreditService.Client
      timestamps()
    end

    def changeset(struct, params \\ %{}) do
        struct
        |> cast(params, [:start_date, :due_date, :closed, :paid_amount, :total_amount])
        |> validate_required([:start_date, :due_date, :closed, :paid_amount, :total_amount])
    end
    
end