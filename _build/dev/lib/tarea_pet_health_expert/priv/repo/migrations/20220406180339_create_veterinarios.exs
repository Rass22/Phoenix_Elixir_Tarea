defmodule TareaPetHealthExpert.Repo.Migrations.CreateVeterinarios do
  use Ecto.Migration

  def change do
    create table(:veterinarios) do
      add :name, :string
      add :age, :integer
      add :email, :string
      add :especialidad, :string
      add :sex, :string

      timestamps()
    end
  end
end
