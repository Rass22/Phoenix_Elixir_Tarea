defmodule TareaPetHealthExpert.PetHealthExpertFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `TareaPetHealthExpert.PetHealthExpert` context.
  """

  @doc """
  Generate a veterinario.
  """
  def veterinario_fixture(attrs \\ %{}) do
    {:ok, veterinario} =
      attrs
      |> Enum.into(%{
        age: 42,
        email: "some email",
        especialidad: "some especialidad",
        name: "some name",
        sex: "some sex"
      })
      |> TareaPetHealthExpert.PetHealthExpert.create_veterinario()

    veterinario
  end
end
