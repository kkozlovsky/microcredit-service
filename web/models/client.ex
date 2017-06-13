defmodule MicrocreditService.Client do
    use MicrocreditService.Web, :model

    schema "clients" do
      field :last_name, :string
      field :first_name, :string
      field :path_name, :string
      field :gender, :string
      field :date, :string
      field :postcode, :string
      field :city, :string
      field :street, :string
      field :house, :integer
      field :apartment, :integer
      field :phone, :string
      field :login, :string
      field :password, :string
      field :blacklist, :boolean, default: false
      field :userpic, :string
      timestamps()
    end

    def changeset(struct, params \\ %{}) do
        struct
        |> cast(params, [:last_name, :first_name, :path_name, :gender, :date, :postcode, :city, :street, :house, :apartment, :phone, :login, :password, :blacklist, :userpic])
        |> validate_required([:last_name, :first_name, :path_name, :gender, :date, :postcode, :city, :street, :house, :apartment, :phone, :login, :password, :blacklist, :userpic])
    end
    
end