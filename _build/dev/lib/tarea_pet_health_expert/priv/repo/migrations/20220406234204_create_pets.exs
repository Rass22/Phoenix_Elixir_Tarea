defmodule TareaPetHealthExpert.Repo.Migrations.CreatePets do
  use Ecto.Migration

  def change do
    create table(:pets) do
      add :name, :string
      add :age, :integer
      add :sex, :string
      add :type, :string

      timestamps()
    end
  end
end
