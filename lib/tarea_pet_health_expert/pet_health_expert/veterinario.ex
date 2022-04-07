defmodule TareaPetHealthExpert.PetHealthExpert.Veterinario do
  use Ecto.Schema
  import Ecto.Changeset

  schema "veterinarios" do
    field :age, :integer
    field :email, :string
    field :especialidad, :string
    field :name, :string
    field :sex, :string

    timestamps()
  end

  @doc false
  def changeset(veterinario, attrs) do
    veterinario
    |> cast(attrs, [:name, :age, :email, :especialidad, :sex])
    |> validate_required([:name, :age, :email, :especialidad, :sex])
  end
end
