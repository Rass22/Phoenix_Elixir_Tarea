defmodule TareaPetHealthExpert.PetHealthExpertTest do
  use TareaPetHealthExpert.DataCase

  alias TareaPetHealthExpert.PetHealthExpert

  describe "veterinarios" do
    alias TareaPetHealthExpert.PetHealthExpert.Veterinario

    import TareaPetHealthExpert.PetHealthExpertFixtures

    @invalid_attrs %{age: nil, email: nil, especialidad: nil, name: nil, sex: nil}

    test "list_veterinarios/0 returns all veterinarios" do
      veterinario = veterinario_fixture()
      assert PetHealthExpert.list_veterinarios() == [veterinario]
    end

    test "get_veterinario!/1 returns the veterinario with given id" do
      veterinario = veterinario_fixture()
      assert PetHealthExpert.get_veterinario!(veterinario.id) == veterinario
    end

    test "create_veterinario/1 with valid data creates a veterinario" do
      valid_attrs = %{age: 42, email: "some email", especialidad: "some especialidad", name: "some name", sex: "some sex"}

      assert {:ok, %Veterinario{} = veterinario} = PetHealthExpert.create_veterinario(valid_attrs)
      assert veterinario.age == 42
      assert veterinario.email == "some email"
      assert veterinario.especialidad == "some especialidad"
      assert veterinario.name == "some name"
      assert veterinario.sex == "some sex"
    end

    test "create_veterinario/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = PetHealthExpert.create_veterinario(@invalid_attrs)
    end

    test "update_veterinario/2 with valid data updates the veterinario" do
      veterinario = veterinario_fixture()
      update_attrs = %{age: 43, email: "some updated email", especialidad: "some updated especialidad", name: "some updated name", sex: "some updated sex"}

      assert {:ok, %Veterinario{} = veterinario} = PetHealthExpert.update_veterinario(veterinario, update_attrs)
      assert veterinario.age == 43
      assert veterinario.email == "some updated email"
      assert veterinario.especialidad == "some updated especialidad"
      assert veterinario.name == "some updated name"
      assert veterinario.sex == "some updated sex"
    end

    test "update_veterinario/2 with invalid data returns error changeset" do
      veterinario = veterinario_fixture()
      assert {:error, %Ecto.Changeset{}} = PetHealthExpert.update_veterinario(veterinario, @invalid_attrs)
      assert veterinario == PetHealthExpert.get_veterinario!(veterinario.id)
    end

    test "delete_veterinario/1 deletes the veterinario" do
      veterinario = veterinario_fixture()
      assert {:ok, %Veterinario{}} = PetHealthExpert.delete_veterinario(veterinario)
      assert_raise Ecto.NoResultsError, fn -> PetHealthExpert.get_veterinario!(veterinario.id) end
    end

    test "change_veterinario/1 returns a veterinario changeset" do
      veterinario = veterinario_fixture()
      assert %Ecto.Changeset{} = PetHealthExpert.change_veterinario(veterinario)
    end
  end
end
