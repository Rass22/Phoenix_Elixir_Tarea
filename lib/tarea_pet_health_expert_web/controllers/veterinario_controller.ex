defmodule TareaPetHealthExpertWeb.VeterinarioController do
  use TareaPetHealthExpertWeb, :controller

  alias TareaPetHealthExpert.PetHealthExpert
  alias TareaPetHealthExpert.PetHealthExpert.Veterinario

  def index(conn, _params) do
    veterinarios = PetHealthExpert.list_veterinarios()
    render(conn, "index.html", veterinarios: veterinarios)
  end

  def new(conn, _params) do
    changeset = PetHealthExpert.change_veterinario(%Veterinario{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"veterinario" => veterinario_params}) do
    case PetHealthExpert.create_veterinario(veterinario_params) do
      {:ok, veterinario} ->
        conn
        |> put_flash(:info, "Veterinario created successfully.")
        |> redirect(to: Routes.veterinario_path(conn, :show, veterinario))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    veterinario = PetHealthExpert.get_veterinario!(id)
    render(conn, "show.html", veterinario: veterinario)
  end

  def edit(conn, %{"id" => id}) do
    veterinario = PetHealthExpert.get_veterinario!(id)
    changeset = PetHealthExpert.change_veterinario(veterinario)
    render(conn, "edit.html", veterinario: veterinario, changeset: changeset)
  end

  def update(conn, %{"id" => id, "veterinario" => veterinario_params}) do
    veterinario = PetHealthExpert.get_veterinario!(id)

    case PetHealthExpert.update_veterinario(veterinario, veterinario_params) do
      {:ok, veterinario} ->
        conn
        |> put_flash(:info, "Veterinario updated successfully.")
        |> redirect(to: Routes.veterinario_path(conn, :show, veterinario))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", veterinario: veterinario, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    veterinario = PetHealthExpert.get_veterinario!(id)
    {:ok, _veterinario} = PetHealthExpert.delete_veterinario(veterinario)

    conn
    |> put_flash(:info, "Veterinario deleted successfully.")
    |> redirect(to: Routes.veterinario_path(conn, :index))
  end
end
