defmodule TareaPetHealthExpert.PetHealthExpert do
  @moduledoc """
  The PetHealthExpert context.
  """

  import Ecto.Query, warn: false
  alias TareaPetHealthExpert.Repo

  alias TareaPetHealthExpert.PetHealthExpert.Veterinario

  @doc """
  Returns the list of veterinarios.

  ## Examples

      iex> list_veterinarios()
      [%Veterinario{}, ...]

  """
  def list_veterinarios do
    Repo.all(Veterinario)
  end

  @doc """
  Gets a single veterinario.

  Raises `Ecto.NoResultsError` if the Veterinario does not exist.

  ## Examples

      iex> get_veterinario!(123)
      %Veterinario{}

      iex> get_veterinario!(456)
      ** (Ecto.NoResultsError)

  """
  def get_veterinario!(id), do: Repo.get!(Veterinario, id)

  @doc """
  Creates a veterinario.

  ## Examples

      iex> create_veterinario(%{field: value})
      {:ok, %Veterinario{}}

      iex> create_veterinario(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_veterinario(attrs \\ %{}) do
    %Veterinario{}
    |> Veterinario.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a veterinario.

  ## Examples

      iex> update_veterinario(veterinario, %{field: new_value})
      {:ok, %Veterinario{}}

      iex> update_veterinario(veterinario, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_veterinario(%Veterinario{} = veterinario, attrs) do
    veterinario
    |> Veterinario.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a veterinario.

  ## Examples

      iex> delete_veterinario(veterinario)
      {:ok, %Veterinario{}}

      iex> delete_veterinario(veterinario)
      {:error, %Ecto.Changeset{}}

  """
  def delete_veterinario(%Veterinario{} = veterinario) do
    Repo.delete(veterinario)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking veterinario changes.

  ## Examples

      iex> change_veterinario(veterinario)
      %Ecto.Changeset{data: %Veterinario{}}

  """
  def change_veterinario(%Veterinario{} = veterinario, attrs \\ %{}) do
    Veterinario.changeset(veterinario, attrs)
  end
end
